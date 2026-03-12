# Azure AD Sync Server Terraform configuration
resource "aws_security_group" "ad_sync_server" {
  description = "Created for the AD Sync Server"
  name                   = "ad-sync-server"
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-34b00650"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ad_sync_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  description       = "Allow all outbound traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_vpc_ipv4" {
  security_group_id = aws_security_group.ad_sync_server.id
  description       = "All traffic from our VPC"
  cidr_ipv4   = "172.27.0.0/16"
  ip_protocol = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "ad_sync_server" {
  ami                                  = "ami-005f8adf84f8c5057"
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = ""
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "m7i.large"
  key_name                             = "ad-sync-server"
  monitoring                           = false
  source_dest_check                    = true
  subnet_id                            = "subnet-de8a60a8"
  tags = {
    Name  = "AD-Sync-Server"
    Owner = "SystemsEngineering"
  }

  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = false
  volume_tags                 = null
  vpc_security_group_ids  = [aws_security_group.ad_sync_server.id]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    iops                  = 3000
    kms_key_id            = "arn:aws:kms:us-east-1:868468680417:key/fe72dbf8-3094-4c9a-980b-bac4c3516816"
    tags = {
      Name   = "glg-prod-ad-sync-server ad-sync-01-root-volume"
      Owner  = "SysEng"
      backup = "daily"
    }
    tags_all = {
      Name   = "glg-prod-ad-sync-server ad-sync-01-root-volume"
      Owner  = "SysEng"
      backup = "daily"
    }
    throughput  = 125
    volume_size = 100
    volume_type = "gp3"
  }
}
