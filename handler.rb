require "bundler/setup"
require 'json'
require 'aws-sdk'

def hello(event:, context:)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end

def get_todo(event:, context:)
  dynamoDB = Aws::DynamoDB::Resource.new(region: 'ap-northeast-1')
  table = dynamoDB.table('my-vue-calendar-db')
  params = {
    table_name: 'my-vue-calendar-db',
    key: {
      timestamp: event['query']['timestamp']
    }
  }
  response = table.get_item(params)
  unless response.item.nil?
    {
      statusCode: 200,
      body: {
        timestamp: response.item['timestamp'],
        content: response.item['todo']
      }.to_json
    }
  else
    {
      statusCode: 200,
      body: {
        message: 'データがありません'
      }
    }.to_json
  end
end
