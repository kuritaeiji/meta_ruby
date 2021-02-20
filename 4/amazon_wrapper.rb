module AmazonWrapper
  def reveiews_of(book)
    start = Time.now
    result = super
    time_token = Time.now - start
    puts("reviews_of() took more than #{time_token} seconds") if time_token > 2
    result
  rescue
    puts('reviews_of() failed')
    []
  end
end

Amazon.prepend(AmazonWrapper)