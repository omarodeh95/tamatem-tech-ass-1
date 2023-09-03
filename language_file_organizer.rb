class LanguageFileOrganizer < FileOrganizer
  FILES_FOLDER_PATH = './files'.freeze
  VALID_FILE_EXTENSIONS = ['txt'].freeze
  IGNORED_ENTRIES = ['.', '..'].freeze
  PARSED_FILE_ATTRIBUTES = ['language', 'number', 'extension']

  def initialize(folder_path=FILES_FOLDER_PATH)
    @folder_path = folder_path
    validate_folder_path
    @files = Dir.entries(@folder_path).reject { |entry| IGNORED_ENTRIES.include? entry }
    @file_name_parser = LanguageFileNameParser.new
    @file_name_validator = LanguageFileNameValidator.new(@file_parser)
  end

  def organize
    validate_folder_path
    # Start organizing files
    begin
      @files.each do |file_name|
          puts "file name is"
          puts file_name
          @file_name_validator.validate_file_name(file_name)
          parsed_file = @file_name_parser.parse_file_name(file_name)
          @language_file_mover = LanguageFileMover.new("#{@folder_path}/#{file_name}", parsed_file)
          @language_file_mover.move_file
      end
    rescue => e
      puts "Error: #{e}"
      return
    end
  end

  def validate_folder_path
    raise 'folder does not exist' unless File.directory?(@folder_path)
  end
end

