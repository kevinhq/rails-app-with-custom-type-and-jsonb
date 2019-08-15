class ResourceType < ActiveModel::Type::Value
  def type
    :jsonb
  end

  def cast(value)
    Resources.new(value)
  end

  def deserialize(value)
    if String === value
      decoded = ::ActiveSupport::JSON.decode(value) rescue nil
      Resources.new(decoded)
    else
      super
    end
  end

  def serialize(value)
    case value
    when Array, Hash, Resources
      # puts '-----'
      # puts value.as_json
      # puts '------'
      ::ActiveSupport::JSON.encode(value.as_json)
    else
      super
    end
  end
end
