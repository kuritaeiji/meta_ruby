require('pry-byebug')

module ActiveRecord
  class Base
    def method_missing(method_id, *args)
      if !self.class.generated_methods?
        self.class.define_attribute_methods
      end
    end

    private
      def read_attribute(attr_name)
        attr_name.to_s
      end

      def write_attribute(attr_name, value)
        attr_name.to_s + value
      end

      def query_attribute(attr_name)
        attr_name.to_s
      end

      def self.attributes_from_column_difinition
        { description: :string, completed: :boolean }
      end

      def self.generated_methods?
        @is_generated_methods ||= false
      end

      def self.define_attribute_methods
        attributes_from_column_difinition.each do |attr_name, type|
          define_read_method(attr_name)
          define_write_method(attr_name)
          define_query_method(attr_name)
        end
        @is_generated_methods = true
      end

      def self.define_read_method(attr_name)
        class_eval("def #{attr_name}; read_attribute(#{attr_name}); end")
      end

      def self.define_write_method(attr_name)
        class_eval("def #{attr_name}=(value); write_attribute(#{attr_name}, value); end")
      end

      def self.define_query_method(attr_name)
        class_eval("def #{attr_name}?; query_attribute(#{attr_name}); end")
      end
  end
end

class Task < ActiveRecord::Base
end

task = Task.new
task.description
task.description