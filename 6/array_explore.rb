def explore_array(name, *args)
  puts("Evaluating: #{name}")
  [1, 2, 3].send(name, *args)
end

loop { p(explore_array(gets.chomp)) }

class RestClient
  PossibleVerbs = [:get, :post, :put, :delete]

  PossibleVerbs.each do |name|
    define_method(:name) do |path, *args, &b|
      r[path].send(name, *args, &b)
    end
  end
end