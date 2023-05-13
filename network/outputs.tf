output vpc_id {
  value = aws_vpc.main.id
}

output vpc_cidr {
  value = aws_vpc.main.cidr_block
}

output pub_sub_1_id {
  value = aws_subnet.public-subnet-1.id
}

output pub_sub_2_id {
  value = aws_subnet.public-subnet-2.id
}

output pub_sub_3_id {
  value = aws_subnet.public-subnet-3.id
}

output priv_sub_1_id {
  value = aws_subnet.private-subnet-1.id
}

output priv_sub_2_id {
  value = aws_subnet.private-subnet-2.id
}

output priv_sub_3_id {
  value = aws_subnet.private-subnet-3.id
}