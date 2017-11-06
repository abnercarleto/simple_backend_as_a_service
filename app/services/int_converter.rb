class IntConverter < TypeConverter
  INTEGER_REGEX = /(?<=\s|^)\d+(?=\s|$)/

  private

  def convert
    if INTEGER_REGEX =~ attr_value
      self.attrib = attr_value.to_i
    else
      api_resource.errors.add(attr_name, "#{attr_name} is not an int value")
    end
  end
end
