class LanguageFileMover < FileMover
  attr_reader :from, :to

  def initialize(file_path, parsed_file) 
    @from = file_path
    validate_file
    @folder_path = "#{file_path.split('/')[0..-2].join('/')}/#{parsed_file.language}"
    @to = "#{@folder_path}/#{parsed_file.file_name}"
  end

  def move_file
    handle_destination_folder
    File.rename(@from, @to)
  end

  def validate_file
    raise "File #{@from} does not exist" unless File.exist?(@from)
  end

  def handle_destination_folder
    # TODO this handler should also be injected as different handling can be required (clean folder and start new, adding where missing etc ..)
    if File.exist?(@folder_path)
      raise "#{@folder_path} is not a directory!" unless File.directory?(@folder_path)
    else
      # Create directory
      Dir.mkdir(@folder_path)
    end
  end

  def handle_destination_file
    # TODO this handler should also be injected as different handling can be required (clean file, skip, stop)
    raise "File already exist #{@to}" if File.exist?(@to)
  end
end
