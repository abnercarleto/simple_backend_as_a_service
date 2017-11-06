class TypeConverter
  attr_reader :api_resource, :attr_value, :attr_name

  def initialize(api_resource, attr_name, attr_value)
    @api_resource = api_resource
    @attr_name = attr_name
    @attr_value = attr_value
  end

  def call
    convert
    api_resource
  end

  private

  def convert
    raise NotImplementedError
  end

  def attrib=(value)
    api_resource.content ||= {}
    api_resource.content[attr_name] = value
  end
end
