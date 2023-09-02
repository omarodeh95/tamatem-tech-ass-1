# This program is for re-arranging files into subfolders based on their language

FILES_FOLDER_PATH = './files'.freeze
ORGANIZED_FOLDER_PATH = './files_organized'.freeze
VALID_FILE_NUMBER_RANGE = (0..100).freeze
VALID_FILE_EXTENSIONS = ['txt'].freeze
VALID_LANGUAGE_PATTERNS = [/^[a-zA-Z]+$/].freeze
IGNORED_ENTRIES = ['.', '..'].freeze
PARSED_FILE_ATTRIBUTES = ['language', 'number', 'extension']


def initialize
  @parsed_files = {}
end

def add_to_parsed_files(file)
    name, extension = file.split('.')
    language, number = name.split('-')
    number = number.to_i
    @parsed_files[file] = {}
    PARSED_FILE_ATTRIBUTES.each do |attribute|
      raise "You need to define #{attribute} in parse_file_name method first!" if eval(attribute).nil?
      @parsed_files[file][attribute]   = eval(attribute)
    end
end

def parse_file_name(file)
  if @parsed_files[file].nil?
    add_to_parsed_files(file)
  end

  returned_values = []
  PARSED_FILE_ATTRIBUTES.each do |attribute|
    returned_values << @parsed_files[file][attribute]
  end

  return returned_values
end

def validate_file(file)
  language, number, extension = parse_file_name(file)
  raise "Invalid file extension '#{extension}'" unless extension == 'txt'
  
  raise "Invalid language '#{language}'" unless VALID_LANGUAGE_PATTERNS.any? { |pattern| language.match? pattern}

  raise "Invalid file number '#{number}'" unless VALID_FILE_NUMBER_RANGE.include? number.to_i

  true
end

def run
  # Start organizing files
  Dir.entries(FILES_FOLDER_PATH)
     .reject { |entry| IGNORED_ENTRIES.include? entry }
     .each do |file|
    begin
      validate_file(file)
    rescue => e
      puts "Warning: #{e} for #{file}"
      next
    end
  end
end
