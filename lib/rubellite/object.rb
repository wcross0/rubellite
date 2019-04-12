# Expands the Object class
class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end

  def false?
    !true?
  end

  def in?(another_object)
    another_object.include?(self)
  rescue NoMethodError
    raise ArgumentError, 'The parameter passed to #in? must respond to #include?'
  end

  def presence
    present? ? self : nil
  end

  def present?
    !blank?
  end

  def true?
    self ? true : false
  end
end
