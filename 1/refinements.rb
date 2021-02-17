module StringExtensions
  refine(String) do # Module#refine
    def to_alphanumaric
      gsub(/[^\w\s]/, '')
    end
  end
end

class MyClass
  def my_method
    'my method'
  end

  def another_method
    my_method
  end

  module MyClassRefinement
    refine(::MyClass) do
      def my_method
        'another method'
      end
    end
  end

  using(MyClassRefinement)
  puts(MyClass.new.my_method)
  puts(MyClass.new.another_method)
end