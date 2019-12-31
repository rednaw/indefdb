require 'bundler/setup'
require 'tempfile'
require 'json'
require 'pp'

require 'indefdb/init'

module IndefDB
  # Disable cache when running tests 
  class Cache
    def self.load_or_recompute(refresh, &block)
      block.call
    end
  end
  # Disable logger when running tests 
  class Log
    def self.info(string)
    end
    def self.error(string)
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
