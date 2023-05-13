data "aws_secretsmanager_secret" "by-arn" {
  arn = var.SECRET_ARN
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.by-arn.id
}

resource "aws_instance" "bastion" {
  ami                         = var.EC2_AMI
  instance_type               = var.EC2_TYPE
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2.id
  subnet_id                   = module.network.pub_sub_1_id
  vpc_security_group_ids      = [aws_security_group.public-sec.id]

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' > ./inventory"
  }
  user_data = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.pk.private_key_openssh}' > /home/ec2-user/bastion.pem
              chmod 0400 /home/ec2-user/bastion.pem
              curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl
              chmod +x ./kubectl
              mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
              echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
              mkdir /home/ec2-user/.aws
              echo "[eks-creator]" >> /home/ec2-user/.aws/credentials
              echo "aws_access_key_id = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["access_key"]}" >> /home/ec2-user/.aws/credentials
              echo "aws_secret_access_key = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["secret_key"]}" >> /home/ec2-user/.aws/credentials
              aws eks update-kubeconfig --region us-east-1 --name eks-cluster --profile=eks-creator
              EOF

  tags = {
    Name = "bastion"
  }
}
#   aws configure set aws_access_key_id '${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["access_key"]}' --profile=eks-creator
#   aws configure set aws_secret_access_key '${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["secret_key"]}' --profile=eks-creator
#   export AWS_PROFILE=eks-creator
#               aws configure set default.region '${var.REGION}' --profile=eks-creator