require 'test_helper'

class ContentzTest < Test::Unit::TestCase
  context 'contextz method defined' do
    test 'on ActiveRecord::Base' do
      assert_respond_to ActiveRecord::Base, :contentz
    end
  end

  context 'read/write data:' do
    setup do
      Article.contentz :body
      @article = Article.new
    end

    test 'read non-binary (or unset/nil/empty) content as a blank string' do
      assert_equal '', @article.body
    end

    test 'store content as binary data' do
      @article.body = 'True or false, yes or no, the choice is yours.'
      assert @article.read_attribute(:body).is_binary_data?
    end

    test 'store nil as a empty string' do
      @article.body = ''
      assert_equal '', @article.body
      @article.body = nil
      assert_equal '', @article.body
    end

    test 'write/read correctly' do
      [
        'Lorem ipsum',
        '!@£$%^&*()œ∑†¥¨πåß∂ƒ©˙∆˚¬Ω≈ç√∫',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ' * 666
      ].each do |string|
        @article.body = string
        assert_equal string, @article.body
      end
    end
  end
end
