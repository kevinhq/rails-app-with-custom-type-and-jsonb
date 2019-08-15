class Resource
  attr_accessor :from, :to

  def initialize(attributes = {})
    attributes.symbolize_keys!
    self.from = attributes[:from]
    self.to = attributes[:to]
  end

  def from=(v)
    @from = v.try(:to_i)
  end

  def to=(v)
    @to = v.try(:to_i)
  end

  def empty?
    from.blank? || to.blank?
  end

  def as_json
    # puts '****'
    # puts from
    # puts to
    {
      from: from,
      to: to
    }
  end
end
