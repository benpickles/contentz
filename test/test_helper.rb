require 'rubygems'
require 'test/unit'
require 'activerecord'

begin
  require 'context'
rescue LoadError
  puts 'Context not available. Install it with: sudo gem install jeremymcanally-context -s http://gems.github.com'
  exit
end

require 'setup' # ActiveRecord setup.

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'contentz'
