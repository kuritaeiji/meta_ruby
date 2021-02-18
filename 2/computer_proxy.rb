require_relative('./ds.rb')

class ComputerProxy
  def initialize(workstation_id, data_source)
    @id = workstation_id
    @data_source = data_source
  end

  def method_missing(name)
    super unless @data_source.respond_to?("get_#{name}_price")
    price = @data_source.send("get_#{name}_price", @id)
    info = @data_source.send("get_#{name}_info", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to_missing?(name, include_private = false)
    @data_source.respond_to?("get_#{name}_price") || super
  end
end