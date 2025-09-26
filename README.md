# Terraform ECS Infrastructure

Este projeto provisiona uma infraestrutura completa na AWS usando Terraform para executar aplicações containerizadas com Amazon ECS (Elastic Container Service).

## 🏗️ Arquitetura

A infraestrutura inclui:

- **ECS Cluster** com Auto Scaling Group
- **Application Load Balancer** com Target Groups
- **RDS Database** (MySQL/PostgreSQL)
- **ECR Repository** para imagens Docker
- **CloudWatch Logs** para monitoramento
- **Security Groups** e IAM Roles
- **EC2 Launch Template** com user data personalizado

## 📁 Estrutura dos Arquivos

```
├── 1-provider.tf              # Configuração do provider AWS
├── 2-locals.tf                # Variáveis locais
├── 3-aws_ecs_cluster.tf       # Cluster ECS
├── 3-aws_security_group.tf    # Security Groups
├── 4-aws_ecs_iam_role.tf      # IAM Roles para ECS
├── 5-aws_launch_template.tf   # Template de lançamento EC2
├── 7-aws_capacity_provider.tf # Capacity Provider
├── 8-aws_asg_ecs.tf          # Auto Scaling Group
├── 9-aws_db_instance.tf       # Instância RDS
├── 10-aws_ecr.tf             # Repositório ECR
├── 11-aws_cloudwatch_log_group.tf # CloudWatch Logs
├── 12-aws_ecs_task_definition.tf  # Task Definition
├── 13-aws-secrets-db.tf       # Secrets Manager
├── 14-aws-ecs-task-role.tf    # Task Role
├── 15-1-aws-tg-alb.tf        # Target Group e ALB
├── 15-aws-ecs-service-ecs.tf  # ECS Service
├── 16-userdata_biadev.sh      # Script de inicialização EC2
├── 18-variables.tf            # Variáveis do projeto
├── 19-aws_ec2_instance.tf     # Instâncias EC2
└── import_db.tf               # Importação de recursos existentes
```

## 🚀 Como Usar

### Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciais AWS com permissões adequadas

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/euvanessa-prado/terraform_for_ecs.git
cd terraform_for_ecs
```

2. Inicialize o Terraform:
```bash
terraform init
```

3. Revise e ajuste as variáveis em `18-variables.tf`

4. Planeje a infraestrutura:
```bash
terraform plan
```

5. Aplique as mudanças:
```bash
terraform apply
```

## ⚙️ Configuração

### Variáveis Principais

Edite o arquivo `18-variables.tf` para personalizar:

- **Região AWS**
- **Nome do cluster ECS**
- **Configurações do banco de dados**
- **Configurações de rede (VPC, subnets)**
- **Tamanho das instâncias EC2**

### Secrets

O projeto usa AWS Secrets Manager para armazenar credenciais do banco de dados de forma segura.

## 🔧 Recursos Criados

- **1x ECS Cluster**
- **1x Application Load Balancer**
- **1x RDS Instance**
- **1x ECR Repository**
- **Auto Scaling Group** (configurável)
- **Security Groups** com regras otimizadas
- **IAM Roles e Policies** necessárias
- **CloudWatch Log Groups**

## 🛡️ Segurança

- Security Groups com regras restritivas
- IAM Roles com princípio de menor privilégio
- Credenciais armazenadas no Secrets Manager
- Logs centralizados no CloudWatch

## 🧹 Limpeza

Para destruir toda a infraestrutura:

```bash
terraform destroy
```

## 📝 Notas

- Os arquivos `terraform.tfstate*` contêm informações sensíveis e não devem ser versionados
- Sempre revise o plano antes de aplicar mudanças em produção
- Configure um backend remoto (S3) para ambientes de produção

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request
