require('pry-byebug')

module ActiveRecord
  class Base
    def initialize
      @attributes = attributes_from_column_difinition
    end

    def method_missing(method, *args)
      method_name = method.to_s
      if m = method_name.match(/^([a-zA-Z][-_\w]*)([^?=]*)$/)
        attr_name = m[1].to_sym
        read_attribute(attr_name) if @attributes.key?(attr_name)
      elsif m = method_name.match(/^([a-zA-Z][-_\w]*)=/)
        attr_name = m[1].to_sym
        write_attribute(attr_name.to_sym, args[0]) if @attributes.key?(attr_name)
      elsif m = method_name.match(/^([a-zA-Z][-_\w]*)?/)
        attr_name = m[1].to_sym
        query_attribute(attr_name.to_sym) if @attributes.key?(attr_name)
      else
        super
      end
    end

    def read_attribute(attr_name)
      attr_name.to_s
    end

    def write_attribute(attr_name, value)
      attr_name.to_s + value
    end

    def query_attribute(attr_name)
      attr_name.to_s
    end

    private
      def attributes_from_column_difinition
        { description: :string, completed: :boolean }
      end
  end
end

task = ActiveRecord::Base.new
puts(task.description)