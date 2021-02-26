require_relative('./concern.rb')
require('pry-byebug')

module SecondLevelModule
  extend(Concern)

  module ClassMethods
    def second_method
      'second method'
    end
  end
end

module FirstLevelModule
  extend(Concern)
  include(SecondLevelModule)

  module ClassMethods
    def first_method
      'first method'
    end
  end
end

class MyClass
  include(FirstLevelModule)
end

MyClass.second_method
MyClass.first_method