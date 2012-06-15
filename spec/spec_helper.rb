require 'rspec'
require 'rtf-templater'

def fixture name
  File.read "fixtures/#{name}"
end

def save_result content, name
  File.open("fixtures/results/#{name}", 'w') { |f| f.write(content) }
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
