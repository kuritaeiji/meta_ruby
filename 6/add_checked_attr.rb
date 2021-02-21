class ValidationError < StandardError
end

# def add_checked_attr(klass, attr_name)
  # eval("
  #   class #{klass}
  #     def #{attr_name}
  #       @#{attr_name}
  #     end

  #     def #{attr_name}=(value)
  #       raise(ValidationError.new('invalid attribute'))  unless value
  #       @#{attr_name} = value
  #     end
  #   end
  #   ")
  # klass.define_method(attr_name) do
  #   instance_variable_get("@#{attr_name}")
  # end

  # klass.define_method("#{attr_name}=") do |value|
  #   raise(ValidationError.new('invalid attribute'))  unless value
  #   instance_variable_set("@#{attr_name}", value)
  # end

#   klass.class_eval do
#     define_method(attr_name) do
#       instance_variable_get("@#{attr_name}")
#     end

#     define_method("#{attr_name}=") do |value|
#       raise(ValidationError.new('invalid attr')) unless value
#       instance_variable_set("@#{attr_name}", value)
#     end
#   end
# end

def add_checked_attr(klass, attr_name, &block)
  klass.define_method(attr_name) do
    instance_variable_get("@#{attr_name}")
  end

  klass.define_method("#{attr_name}=") do |value|
    raise(ValidationError.new('invalid attr'))  unless block.call(value)
    instance_variable_set("@#{attr_name}", value)
  end
end