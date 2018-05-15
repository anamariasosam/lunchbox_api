module ToJSON
  include ActiveSupport::Concern
  def as_json(options = {})
    modelSerializer =  "#{self.class.name}Serializer".constantize
    modelSerializer.new(self).as_json
  end
end
