class ValidationError < StandardError
end

module AddAttr
  refine(Class) do
    def attr_checked(attr_name, &block)
      define_method(attr_name) do
        instance_variable_get("@#{attr_name}")
      end
  
      define_method("#{attr_name}=") do |value|
        raise(ValidationError.new('invalid attr'))  unless block.call(value)
        instance_variable_set("@#{attr_name}", value)
      end
    end
  end
end