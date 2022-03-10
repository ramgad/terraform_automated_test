require 'awspec'
require 'aws-sdk'
require 'rhcl'

ENV['AWS_REGION'] = 'us-east-1'
state_file = 'test/fixtures/default/terraform.tfstate.d/kitchen-terraform-aws-resources-suite-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)

# Add your rspec style tests here.

s3_name = tf_state['outputs']['aws_s3_bucket.bucket']['value']

describe s3_bucket(s3_name) do
  it { should exist }
end


topic_arn = tf_state['outputs']['aws_sns_topic.topic']['value']

describe sns_topic(topic_arn) do
  it { should exist }
end

describe sns_topic(topic_arn) do
  let(:subscription_arn) do
      subscription_arn: subscribed, # this is required
  end

  describe '#subscribed' do
    it do
      should have_subscription(subscribed)
    end
  end
end
