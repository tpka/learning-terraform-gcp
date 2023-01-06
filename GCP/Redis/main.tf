# lecture 63-64:

# google_redis_instance(resources): https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance
# google_redis_instance(data resources): https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/redis_instance
# google_memcache_instance: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance

# creating instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance#argument-reference
resource "google_redis_instance" "redis-from-tf" {
  name = "redis-from-tf"
  memory_size_gb = 1
  tier = "BASIC"

  location_id = "asia-southeast1-a"
  authorized_network = "default"

  redis_version     = "REDIS_5_0"
  display_name = "Redis Instance from terraform"
}
