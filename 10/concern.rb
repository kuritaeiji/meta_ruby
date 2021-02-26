module Concern
  def self.extended(base)
    base.instance_variable_set(:@dependencies, [])
  end

  def included(base)
    # concernかどうかは@dependenciesの有無で決める
    if base.instance_variable_defined?(:@dependencies)
      base.instance_variable_get(:@dependencies).push(self)
    else
      @dependencies.each { |dep| base.include(dep) }
      base.extend(const_get(:ClassMethods)) if const_get(:ClassMethods)
    end
  end
end