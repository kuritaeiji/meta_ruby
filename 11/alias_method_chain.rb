class Module
  def alias_method_chain(target, feature)
    target, code = target.to_s.sub(/\w+(!=?)$/, ''), $1

    with_name = "#{target}_with_#{feature}#{code}"
    without_name = "#{target}_without_#{feature}#{code}"

    alias_method(without_name, target)
    alias_method(target, with_name)

    if public_instance_methods.include?(with_name.to_sym)
      public(target)
    elsif protected_instance_methods.include(with_name.to_sym)
      protected(target)
    else
      private(target)
    end
  end
end