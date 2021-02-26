module Greeting
  def greet
    'hello'
  end
end

module EnsusiasmGreeting
  include(Greeting)

  def greet
    "Hey, #{super}"
  end
end

class MyClass
  include(EnsusiasmGreeting)
end

puts(MyClass.new.greet)