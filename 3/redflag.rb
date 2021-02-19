-> {
  setups = []
  events = []
  
  Kernel.send(:define_method, :setup) do |&block|
    setups.push(block)
  end

  Kernel.send(:define_method, :event) do |description, &block|
    events.push({ description: description, block: block })
  end

  Kernel.send(:define_method, :do_setup_event) do
    events.each do |event|
      setups.each do |setup|
        setup.call
      end
      puts("alert: #{event[:description]}") if event[:block].call
    end
  end

  Kernel.send(:define_method, :each_event) do |&block|
    events.each do |event|
      block.call(event)
    end
  end

  Kernel.send(:define_method, :each_setup) do |&block|
    setups.each do |setup|
      block.call(setup)
    end
  end
}.call

require_relative('./events.rb')

each_event do |event|
  env = Object.new
  each_setup do |setup|
    env.instance_eval { setup.call }
  end

  puts("alert #{event[:description]}") if env.instance_eval { event[:block].call }
end