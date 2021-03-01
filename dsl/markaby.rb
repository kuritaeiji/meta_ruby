class Markaby
  def initialize(&block)
    instance_eval(&block)
  end

  def title(title)
    puts("<title>#{title}</title>")
  end

  def p(text)
    puts("<p>#{text}</p>")
  end
end

Markaby.new do
  title('markaby dsl')
  p('test text')
end