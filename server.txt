locals {
  vpc_id = "vpc-34b00650"
}

resource "aws_security_group" "domain_controllers" {
  name        = "Domain-Controllers"
  description = "Domain Controllers Security Group"
  vpc_id      = local.vpc_id

  ingress {
    description = "Cloud traffic from our GLG owned CIDR ranges"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    description = "All access from office VLANs"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "Allow Cisco VPN"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow Domain Controllers to reach internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Domain-Controllers"
  }
}

module "domain_controller_instance_development" {
  # unique per domain controller:
  region            = "us-east-1"
  availability_zone = "us-east-1b"
  subnet            = "subnet-de8a60a8"
  name              = "glg-prod-domain-controller-devships DC01"
  tags = {
    "Name"              = "glg-prod-domain-controller-devships DC01"
    "Namespace"         = "glg"
    "Stage"             = "prod"
    "ssmManaged"        = "DomainController"
    "ThisDCNetBIOSName" = "AWSUSE1DC01" #TODO: make this unique somehow so we never need to set it...
    "DomainDNSName"     = "glgroup.com"
    "DomainNetBIOSName" = "glgroup"
    "DNSServer"         = "172.27.4.6"
    "BusinessUnit"      = "Core Engineering"
    "Environment"       = "DevShips" # make this EpiPhleet or Primary for the next two
    "ManagedBy"         = "Terraform"
    "Owner"             = "SystemsEngineering"
    "Created"           = "2020-05-18"
    "GitHub"            = "https://github.com/glg/metadevops-issues/issues/341"
    "SpendAllocation"   = "IT"
  }
  root_volume_tags = {
    "Owner"  = "SysEng"
    "backup" = "daily"
  }

  # no need to change these:
  source                        = "git::https://github.com/glg/terraform-aws-ec2-basic.git?ref=v1.0.4-no-null-label-module-volume-tags"
  instance_type                 = "c7i.2xlarge"           #dont change unless consulting Ian - we use reserved instances!
  ami                           = "ami-0f7122ac3de6f22b2" #Windows 2016 Base
  security_groups               = [aws_security_group.domain_controllers.id]
  delete_on_termination         = true
  ssh_key_pair                  = "domain-controllers"
  associate_public_ip_address   = false
  namespace                     = "glg"
  stage                         = "prod"
  root_volume_size              = 100
  root_volume_type              = "gp2"
  root_block_device_encryption  = false
  user_data                     = file("${path.module}/user-data")
  iam_profile_name              = aws_iam_instance_profile.domain_controller.name
  monitoring                    = false
  vpc_id                        = local.vpc_id
  create_default_security_group = false
  assign_eip_address            = false
  disable_api_termination       = true # Enables "Termination Protection" in the GUI
  ebs_optimized                 = true
}

module "domain_controller_instance_epiphleet" {
  # unique per domain controller:
  region            = "us-east-1"
  availability_zone = "us-east-1e"
  subnet            = "subnet-a41dbc99"
  name              = "glg-prod-domain-controller-epiphleet DC02"
  tags = {
    "Name"              = "glg-prod-domain-controller-epiphleet DC02"
    "Namespace"         = "glg"
    "Stage"             = "prod"
    "ssmManaged"        = "DomainController"
    "ThisDCNetBIOSName" = "AWSUSE1DC02" #TODO: make this unique somehow so we never need to set it...
    "DomainDNSName"     = "glgroup.com"
    "DomainNetBIOSName" = "glgroup"
    "DNSServer"         = "172.27.4.6"
    "BusinessUnit"      = "Core Engineering"
    "Environment"       = "Epiphleet" # make this Primary for the next one
    "ManagedBy"         = "Terraform"
    "Owner"             = "SystemsEngineering"
    "Created"           = "2020-05-26"
    "GitHub"            = "https://github.com/glg/metadevops-issues/issues/341"
    "SpendAllocation"   = "IT"
  }
  root_volume_tags = {
    "Owner"  = "SysEng"
    "backup" = "daily"
  }

  # no need to change these:
  source                        = "git::https://github.com/glg/terraform-aws-ec2-basic.git?ref=v1.0.4-no-null-label-module-volume-tags"
  instance_type                 = "c4.2xlarge"             #dont change unless consulting Ian - we use reserved instances!
  ami                           = "ami-0f7122ac3de6f22b2" #Windows 2016 Base
  security_groups               = [aws_security_group.domain_controllers.id]
  delete_on_termination         = true
  ssh_key_pair                  = "domain-controllers"
  associate_public_ip_address   = false
  namespace                     = "glg"
  stage                         = "prod"
  root_volume_size              = 100
  root_volume_type              = "gp2"
  root_block_device_encryption  = false
  user_data                     = file("${path.module}/user-data")
  iam_profile_name              = aws_iam_instance_profile.domain_controller.name
  monitoring                    = false
  vpc_id                        = local.vpc_id
  create_default_security_group = false
  assign_eip_address            = false
  disable_api_termination       = true # Enables "Termination Protection" in the GUI
  ebs_optimized                 = true
}

module "domain_controller_primary" {
  # unique per domain controller:
  region            = "us-east-1"
  availability_zone = "us-east-1b"
  subnet            = "subnet-de8a60a8"
  name              = "glg-prod-domain-controller-primary DC03"
  tags = {
    "Name"              = "glg-prod-domain-controller-primary DC03"
    "Namespace"         = "glg"
    "Stage"             = "prod"
    "ssmManaged"        = "DomainController"
    "ThisDCNetBIOSName" = "AWSUSE1DC03" #TODO: make this unique somehow so we never need to set it...
    "DomainDNSName"     = "glgroup.com"
    "DomainNetBIOSName" = "glgroup"
    "DNSServer"         = "172.27.10.213"
    "BusinessUnit"      = "Core Engineering"
    "Environment"       = "Primary" # make this EpiPhleet or Primary for the next two
    "ManagedBy"         = "Terraform"
    "Owner"             = "SystemsEngineering"
    "Created"           = "2020-06-01"
    "GitHub"            = "https://github.com/glg/metadevops-issues/issues/341"
    "SpendAllocation"   = "IT"
  }
  root_volume_tags = {
    "Owner"  = "SysEng"
    "backup" = "daily"
  }

  # no need to change these:
  source                        = "git::https://github.com/glg/terraform-aws-ec2-basic.git?ref=v1.0.4-no-null-label-module-volume-tags"
  instance_type                 = "c7i.2xlarge"             #dont change unless consulting Ian - we use reserved instances!
  ami                           = "ami-0f7122ac3de6f22b2" #Windows 2016 Base
  security_groups               = [aws_security_group.domain_controllers.id]
  delete_on_termination         = true
  ssh_key_pair                  = "domain-controllers"
  associate_public_ip_address   = false
  namespace                     = "glg"
  stage                         = "prod"
  root_volume_size              = 100
  root_volume_type              = "gp2"
  root_block_device_encryption  = false
  user_data                     = file("${path.module}/user-data")
  iam_profile_name              = aws_iam_instance_profile.domain_controller.name
  monitoring                    = false
  vpc_id                        = local.vpc_id
  create_default_security_group = false
  assign_eip_address            = false
  disable_api_termination       = true # Enables "Termination Protection" in the GUI
  ebs_optimized                 = true
}

# log group for all useful logs
resource "aws_cloudwatch_log_group" "configurations" {
  name_prefix       = "domain-controller-configurations-"
  retention_in_days = 90

  tags = {
    "BusinessUnit"    = "Core Engineering"
    "Environment"     = "Production"
    "ManagedBy"       = "Terraform"
    "Owner"           = "SystemsEngineering"
    "Created"         = "2020-05-18"
    "GitHub"          = "https://github.com/glg/metadevops-issues/issues/341"
    "SpendAllocation" = "IT"
  }
}
