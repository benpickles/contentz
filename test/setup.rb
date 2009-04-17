require 'config'
require 'logger'

ActiveRecord::Base.configurations = {
  'test' => {
    :adapter  => 'mysql',
    :database => DB_NAME,
    :username => DB_USER
  }
}

ActiveRecord::Base.establish_connection 'test'

require 'schema'

class Article < ActiveRecord::Base; end
