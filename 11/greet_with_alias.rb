require_relative('./alias_method_chain')
require('pry-byebug')

module Greeting
  def greet
    'hello'
  end
end

class MyClass
  include(Greeting)

  def greet_with_ensusiasm
    "Hey, #{greet_without_ensusiasm}"
  end

  alias_method_chain(:greet, :ensusiasm)
  binding.pry
end

obj = MyClass.new
puts(obj.greet)