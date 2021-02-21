class ValidationError < StandardError
end

module CheckedAttributes
  def self.included(klass)
    klass.extend(ClassMethod)
  end

  module ClassMethod
    def attr_checked(attr_name, &block)
      define_method(attr_name) do
        instance_variable_get("@#{attr_name}")
      end

      define_method("#{attr_name}=") do |value|
        raise(ValidationError) unless block.call(value)
        instance_variable_set("@#{attr_name}", value)
      end
    end
  end
end