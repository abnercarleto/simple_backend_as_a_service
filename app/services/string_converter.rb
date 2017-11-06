class StringConverter < TypeConverter
  private

  def convert
    self.attrib = attr_value.to_s
  end
end
