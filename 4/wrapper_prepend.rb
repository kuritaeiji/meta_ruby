module ExplicitString
  def length
    super > 5 ? 'long' : 'short'
  end
end

# String.prepend(ExplicitString)
String.instance_eval { prepend(ExplicitString) }
puts('aaa'.length)