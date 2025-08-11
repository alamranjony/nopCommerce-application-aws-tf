output "nat_gateway_ids" {
  description = "IDs of the created NAT Gateways"
  value       = aws_nat_gateway.natgw[*].id
}
