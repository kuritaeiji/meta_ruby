require_relative('./ds.rb')

class Computer
  def initialize(workstation_id, data_source)
    @id = workstation_id
    @data_source = data_source
    DS.public_instance_methods(false).grep(/^get_(.+)_price/) { Computer.define_component($1) }
  end

  private
    def self.define_component(name)
      define_method(name) do
        price = @data_source.send("get_#{name}_price", @id)
        info = @data_source.send("get_#{name}_info", @id)
        result = "#{name.capitalize}: #{info} ($#{price})"
        return "* #{result}" if price >= 100
        result
      end
    end
end