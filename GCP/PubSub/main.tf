# lecture 56:

# google_pubsub_topic: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic
# google_pubsub_subscription: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription

# creating topics
resource "google_pubsub_topic" "topic_from_tf" {
  name = "topic_from_tf"
}

# creating subscription
resource "google_pubsub_subscription" "sub_from_tf" {
  name = "sub_from_tf"
  topic = google_pubsub_topic.topic_from_tf.name
}