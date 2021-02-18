module Hashie
  class Mash < Hashie::Hash
    def method_missing(method_name, *args, &block)
      return self[method_name] if key?(method_name)
      self[m[1]] = *args[0] if m = method_name.match(/(.+)=$/)
    end
  end
end