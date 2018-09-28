class Decorator
  def initialize decorated
    @decorated = decorated
  end

  def method_missing(method, *arguments)
    @decorated.send(method, *arguments)
  end
end
