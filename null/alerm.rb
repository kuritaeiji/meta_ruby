class Light
  def change_to_red
    'red'
  end

  def turn_off
    'turn off'
  end
end

class NilLight
  def change_to_red
  end

  def turn_off
  end
end

class Device
  def ring
    'ring'
  end

  def flash
    'flash'
  end

  def light
    Light.new
  end
end

class User
  def device
    # Device.new
  end
end

class Configuration
  def current_user
    User.new
  end
end

CONFIGURATION = Configuration.new

class NullDevice
  def ring
  end

  def flash
  end

  def light
    NilLight.new
  end
end

class Alerm
  def device
    @device ||= CONFIGURATION.current_user.device || NullDevice.new
  end

  def send_default
    10.times { device.ring }
  end

  def send_discreet
    device.ring
  end

  def send_silent
    100.times { device.flash }
  end

  def send_urgent
    device.light.change_to_red
    device.ring
    device.light.turn_off
  end
end