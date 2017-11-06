class DecimalConverter < TypeConverter
  DECIMAL_REGEX = /^[1-9]\d*(\.\d+)?$/

  private

  def convert
    if DECIMAL_REGEX =~ attr_value
      self.attrib = attr_value.to_f
    else
      api_resource.errors.add(attr_name, "#{attr_name} is not a decimal value")
    end
  end
end
