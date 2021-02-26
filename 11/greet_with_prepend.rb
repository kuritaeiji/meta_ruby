module Greeting
  def greet
    "Hey, #{super}"
  end
end

class MyClass
  def greet
    'hello'
  end

  prepend(Greeting)
end

puts(MyClass.new.greet)