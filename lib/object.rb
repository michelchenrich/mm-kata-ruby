class Object
  def as(type)
    type.new_from(self)
  end
end
