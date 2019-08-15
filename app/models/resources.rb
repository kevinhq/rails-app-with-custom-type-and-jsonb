class Resources
  extend Forwardable

  def_delegators :@collection, *[].public_methods

  def initialize(array_or_hash = [])
    collection = case array_or_hash
      when Hash
        [Resource.new(array_or_hash)]
      else
        Array(array_or_hash).map do |res|
          res.is_a?(Resource) ? res : Resource.new(res)
        end
      end
    @collection = collection.reject(&:empty?)
  end

  def to_a
    @collection
  end
end
