class SaveResource
  ATTR_PARSERS = {
    int: IntConverter,
    decimal: DecimalConverter,
    string: StringConverter,
    date: DateConverter,
    datetime: TimeConverter
  }
  attr_reader :api_resource, :attributes

  def initialize(api_resource, attributes)
    @api_resource = api_resource
    @attributes = attributes
  end

  def call
    definition_attributes.each(&method(:set_attribute))
    api_resource.save unless api_resource.errors.any?
    api_resource
  end

  private

  def definition_attributes
    @definition_attributes ||= api_resource.definition_model.definition_attributes
  end

  def set_attribute(def_attr)
    attr_value = attributes[def_attr.name]
    ATTR_PARSERS[def_attr.kind].new(api_resource, def_attr.name, attr_value).call
  end
end
