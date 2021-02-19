class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  puts(self)
  puts(@v)

  def my_method
    'my method'
  end
end

obj.my_method

puts(obj.singleton_class.public_instance_methods(false))

v2 = 2
obj.instance_eval { @v = v2 }
obj.instance_eval { puts(@v) }