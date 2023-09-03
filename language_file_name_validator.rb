class LanguageFileNameValidator < FileNameValidator
  VALID_FILE_NUMBER_RANGE = (0..100).freeze
  VALID_LANGUAGE_PATTERNS = [/^[a-zA-Z]+$/].freeze

  def initialize(parser)
    @file_parser = parser if parser.instance_of? LanguageFileNameParser
    @file_parser ||= LanguageFileNameParser.new
    @valid_files = {}
  end

  def validate_file_name(file_name)
    return @valid_files[file_name] unless  @valid_files[file_name].nil?

    parsed_file = @file_parser.parse_file_name(file_name)
    raise "Invalid file extension '#{parsed_file.extension}'" unless parsed_file.extension == 'txt'
    
    raise "Invalid language '#{parsed_file.language}'" unless VALID_LANGUAGE_PATTERNS.any? { |pattern| parsed_file.language.match? pattern}

    raise "Invalid file number '#{parsed_file.number}'" unless VALID_FILE_NUMBER_RANGE.include? parsed_file.number

    @valid_files[file_name] = true
  end
end
