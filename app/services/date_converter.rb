class DateConverter < TypeConverter
  DATE_REGEX = /(\d{4})-(\d{2})-(\d{2})/

  private

  def convert
    if DATE_REGEX =~ attr_value
      self.attrib = Date.parse(attr_value)
    else
      api_resource.errors.add(attr_name, "#{attr_name} is not a date value")
    end
  end
end
