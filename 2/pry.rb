class Pry
  def refresh(options = {})
    options.each do |key, value|
      send("#{key}=", value) if respond_to?("#{key}=")
    end
  end
end