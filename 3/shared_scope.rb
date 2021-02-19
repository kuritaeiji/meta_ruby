def define_methods
  shared = 0

  Kernel.define_method(:counter) do
    shared
  end

  Kernel.define_method(:inc) do |x|
    shared += x
  end
end

define_methods