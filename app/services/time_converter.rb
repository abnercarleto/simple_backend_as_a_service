class TimeConverter < TypeConverter
  TIME_REGEX = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/

  private

  def convert
    if TIME_REGEX =~ attr_value
      self.attrib = Time.parse(attr_value)
    else
      api_resource.errors.add(attr_name, "#{attr_name} is not a datetime value")
    end
  end
end
