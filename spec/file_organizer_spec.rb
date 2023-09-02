require_relative '../file_organizer.rb'

describe 'File Validation' do
  it 'validates a file with a correct extension' do
    file = 'english-42.txt'
    expect { validate_file(file) }.not_to raise_error
  end

  it 'raises an error for a file with an incorrect extension' do
    file = 'english-42.pdf'
    expect { validate_file(file) }.to raise_error(RuntimeError, "Invalid file extension 'pdf'")
  end

  it 'raises an error for a file with an invalid language' do
    file = 'invalid123-42.txt'
    expect { validate_file(file) }.to raise_error(RuntimeError, "Invalid language 'invalid123'")
  end

  it 'raises an error for a file with an invalid file number' do
    file = 'english-200.txt'
    expect { validate_file(file) }.to raise_error(RuntimeError, "Invalid file number '200'")
  end
end
