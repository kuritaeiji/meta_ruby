class Book
  def title
    'title'
  end

  def subtitle
    'subtitle'
  end

  def lend_to(user)
    "lending to #{user}"
  end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      puts("Warning: #{old_method}() is deprecated. user #{new_method}()")
      send(new_method, *args, &block)
    end
  end

  deprecate(:GetTitle, :title)
  deprecate(:title2, :subtitle)
  deprecate(:lend_to_user, :lend_to)
end