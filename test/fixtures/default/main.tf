module "s3_sns_test" {
  source                    = "../../.."
  aws_region_id             = "us-east-1"
  sns_topic_name            = "ramgad-lyell-candidate-test-sns"
  bucket_name               = "ramgad-lyell-candidate-test-s3-bucket"
  tags                      = []
  emails                    = ["ramgad@idlemailbox.com"]
}
