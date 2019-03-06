class Enumerator
  def and(obj)
    (to_a + obj.to_a).to_enum
  end
end