class LanguageFileNameParser < FileNameParser

  def initialize
    @parsed_files = {}
  end

  def parse_file_name(file_name)
    raise 'Cannot process empty file name' if file_name.nil?
    if @parsed_files[file_name].nil?
      add_to_parsed_files(file_name)
    end

    return @parsed_files[file_name]
  end

  def add_to_parsed_files(file_name)
      name, extension = file_name.split('.')
      language, number = name.split('-')
      number = number.to_i
      @parsed_files[file_name] = ParsedLanguageFile.new(language, number, extension, file_name)
  end

  def parsed_files
    @parsed_files
  end
end

