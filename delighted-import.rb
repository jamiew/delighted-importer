require 'delighted'
require 'pp'

api_key = ENV['DELIGHTED_API_KEY']
if api_key.nil? || api_key.empty?
  $stderr.puts "DELIGHTED_API_KEY env var is blank/missing"
  exit 1
else
  Delighted.api_key = api_key
end

attributes = {
  email: 'jamie@vhx.tv',
  name: 'Jamie Wilkinson',
  properties: {
    customer_id: 123,
    country: 'USA',
    # question_product_name: 'The London Trench',
    segment: 'Foobars',
  },
  # ...
  # delay: 60,
  send: false,
}
person = Delighted::Person.create(attributes)
pp person

puts "Stats:"
pp Delighted::Metrics.retrieve


exit 0
