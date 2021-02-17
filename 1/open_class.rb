class String
  def to_alphanumaric
    gsub(/[^\w\s]/, '')
  end
end

class Array
  def replace(original, replacement)
    map { |e| e == original ? replacement : e }
  end
end