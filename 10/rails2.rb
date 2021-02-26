module SecondLevelModule
  def self.included(base)
    base.extend(ClassMethods)
  end

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
  include(SecondLevelModule)

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def first_method
      'first method'
    end
  end
end

class MyClass
  include(FirstLevelModule)
end