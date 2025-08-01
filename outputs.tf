output "RDS-Endpoint" {
    value = aws_db_instance.vprofile-rds.address
  
}

output "MemcacheEndpoint" {
  value = aws_elasticache_cluster.vprofile-cache.configuration_endpoint
}

output "RabbitMQEndpoint" {
    value = aws_mq_broker.vprofile-rmq.instances.0.endpoints
  
}