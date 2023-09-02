# This program is for re-arranging files into subfolders based on their language

FILES_FOLDER_PATH = './files'.freeze
ORGANIZED_FOLDER_PATH = './files_organized'.freeze
VALID_FILE_NUMBER_RANGE = (0..100).freeze
VALID_FILE_EXTENSIONS = ['txt'].freeze
VALID_LANGUAGE_PATTERNS = [/^[a-zA-Z]+$/].freeze
IGNORED_ENTRIES = ['.', '..'].freeze

def parse_file_name(file)
  name, extension = file.split('.')
  language, number = name.split('-')
  return language, number.to_i, extension
end

def validate_file(file)
  language, number, extension = parse_file_name(file)
  raise "Invalid file extension '#{extension}'" unless extension == 'txt'
  
  raise "Invalid language '#{language}'" unless VALID_LANGUAGE_PATTERNS.any? { |pattern| language.match? pattern}

  raise "Invalid file number '#{number}'" unless VALID_FILE_NUMBER_RANGE.include? number.to_i

  true
end

# Check if the files folder exist
raise "Files folder doesn't exist" unless File.directory?(FILES_FOLDER_PATH)

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
