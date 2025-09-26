# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_db_instance" "bia" {
  allocated_storage                     = 20
  allow_major_version_upgrade           = null
  apply_immediately                     = null
  auto_minor_version_upgrade            = true
  availability_zone                     = "us-east-1a"
  backup_retention_period               = 1
  backup_target                         = "region"
  backup_window                         = "03:44-04:14"
  ca_cert_identifier                    = "rds-ca-rsa2048-g1"
  character_set_name                    = null
  copy_tags_to_snapshot                 = true
  custom_iam_instance_profile           = null
  customer_owned_ip_enabled             = false
  database_insights_mode                = "standard"
  db_name                               = null
  db_subnet_group_name                  = "bia-subnet-group"
  dedicated_log_volume                  = false
  delete_automated_backups              = true
  deletion_protection                   = false
  domain                                = null
  domain_auth_secret_arn                = null
  #domain_dns_ips                        = []
  domain_fqdn                           = null
  domain_iam_role_name                  = null
  domain_ou                             = null
  enabled_cloudwatch_logs_exports       = []
  engine                                = "postgres"
  engine_lifecycle_support              = "open-source-rds-extended-support-disabled"
  engine_version                        = "17.4"
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = false
  identifier                            = "bia-rds-migration"
  identifier_prefix                     = null
  instance_class                        = "db.t4g.micro"
  iops                                  = 0
  kms_key_id                            = "arn:aws:kms:us-east-1:448522291635:key/0e114575-6be0-4c0c-a1e3-5e61753aca49"
  license_model                         = "postgresql-license"
  maintenance_window                    = "sat:09:18-sat:09:48"
  manage_master_user_password           = true
  master_user_secret_kms_key_id         = null
  max_allocated_storage                 = 1000
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  multi_az                              = false
  nchar_character_set_name              = null
  network_type                          = "IPV4"
  option_group_name                     = "default:postgres-17"
  parameter_group_name                  = "default.postgres17"
  password                              = null # sensitive
  password_wo                           = null # sensitive
  password_wo_version                   = null
  performance_insights_enabled          = false
  performance_insights_kms_key_id       = null
  performance_insights_retention_period = 0
  port                                  = 5432
  publicly_accessible                   = false
  replica_mode                          = null
  replicate_source_db                   = null
  skip_final_snapshot                   = true
  snapshot_identifier                   = null
  storage_encrypted                     = true
  storage_throughput                    = 0
  storage_type                          = "gp2"
  tags                                  = {}
  tags_all                              = {}
  timezone                              = null
  upgrade_storage_config                = null
  username                              = "postgres"
  vpc_security_group_ids                = [aws_security_group.bia_db.id]
}

 resource "aws_db_subnet_group" "bia" {
   name = "bia-subnet-group"
   subnet_ids = [local.subnet_zona_a,local.subnet_zona_b]

   tags = {
     name="bia-subnet-group"
   }
 }