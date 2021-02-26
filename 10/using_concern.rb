require('active_support')

module SecondLevelModule
  extend(ActiveSupport::Concern)

  def second_method
    'second method'
  end

  module ClassMethods
    def second_method
      'second method'
    end
  end
end

module FirstLevelModule
  extend(ActiveSupport::Concern)

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

puts(MyClass.first_method)
puts(MyClass.second_method)