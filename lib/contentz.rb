module Contentz
  require 'zlib'

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def contentz(*methods)
      methods.each do |name|
        define_method name do
          begin
            data = read_attribute(name)
            Zlib::Inflate.inflate(data.to_s)
          rescue Zlib::BufError
            ''
          end
        end

        define_method "#{name}=" do |value|
          data = Zlib::Deflate.deflate(value.to_s, Zlib::BEST_COMPRESSION)
          write_attribute(name, data)
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Contentz
