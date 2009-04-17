ActiveRecord::Schema.define do
  create_table :articles, :force => true do |t|
    t.binary :body
  end
end
