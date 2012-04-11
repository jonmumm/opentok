require 'I18n'
require File.dirname(__FILE__) + '/../lib/opentok.rb'

RSpec.configure do |config|
  config.include OpenTok::TestHelpers
end
