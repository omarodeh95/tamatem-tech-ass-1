class ParsedLanguageFile
  attr_reader :language, :number, :extension, :file_name
  def initialize(language, number, extension, file_name)
    @language = language
    @number = number
    @extension = extension
    @file_name = file_name
  end
end
