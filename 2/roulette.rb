class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless ['Bob', 'Bill', 'Frank'].include?(person)
    i = rand(1..10)
    "#{person}: #{i}"
  end
end