class LanguageFileOrganizer < FileOrganizer
  FILES_FOLDER_PATH = './files'.freeze
  VALID_FILE_EXTENSIONS = ['txt'].freeze
  IGNORED_ENTRIES = ['.', '..'].freeze
  PARSED_FILE_ATTRIBUTES = ['language', 'number', 'extension']

  def initialize(folder_path=FILES_FOLDER_PATH)
    validate_folder_path
    @folder_path = folder_path
    @files = Dir.entries(@folder_path).reject { |entry| IGNORED_ENTRIES.include? entry }
    @file_parser = LanguageFileParser.new
    @file_validator = LanguageFileValidator.new(@file_parser)
  end

  def organize
    # Start organizing files
    @files.each do |file|
      begin
        @file_validator(@file_path)
        parsed_file = @file_parser(@file_path)
        @moving_translation_file = MovingTranslationFile.new(@file_path, parsed_file)
        @moving_translation_file.move_file
      rescue => e
        puts "Error: #{e} for #{file}"
        return
      end
    end
  end
end


def create_folder(folder)
  return if File.directory?(@folder_path)

  begin
    Dir.mkdir(@folder_path)
  rescue => e
    raise e
  end
end

def validate_folder_path
    raise 'files folder does not exist' unless File.directory?(@file_path)
end
