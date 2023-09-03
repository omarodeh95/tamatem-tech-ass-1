require_relative('file_mover')
require_relative('file_organizer')
require_relative('file_name_parser')
require_relative('file_name_validator')

require_relative('language_file_mover')
require_relative('language_file_organizer')
require_relative('language_file_name_parser')
require_relative('language_file_name_validator')

require_relative('parsed_language_file')

puts "please enter folder path"
folder_path = gets.chomp
puts folder_path
puts "Hello"
organizer = LanguageFileOrganizer.new(folder_path)
organizer.organize
