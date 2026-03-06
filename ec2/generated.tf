# __generated__ by OpenTofu
# Please review these resources and move them into your main configuration files.

# __generated__ by OpenTofu
resource "aws_instance" "ad_sync_server" {
  ami                                  = "ami-005f8adf84f8c5057"
  associate_public_ip_address          = false
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  enable_primary_ipv6                  = null
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = ""
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "m7i.large"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "ad-sync-server"
  monitoring                           = false
  placement_group                      = ""
  placement_group_id                   = ""
  placement_partition_number           = 0
  private_ip                           = "172.27.4.138"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = "subnet-de8a60a8"
  tags = {
    Name  = "AD-Sync-Server"
    Owner = "SystemsEngineering"
  }
  tags_all = {
    Name  = "AD-Sync-Server"
    Owner = "SystemsEngineering"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-039152718f4420884"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp           = ""
    core_count            = 1
    nested_virtualization = ""
    threads_per_core      = 2
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
  primary_network_interface {
    network_interface_id = "eni-00f57c6910d889723"
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
