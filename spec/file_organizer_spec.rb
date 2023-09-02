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

  it 'returns true for a file with a valid format' do
    file = 'english-100.txt'
    expect(validate_file(file)).to be_truthy
  end
end

describe 'File parser' do
  it 'returns name, number and extension for a file' do
    file = 'english-42.txt'
    language, number, extension = parse_file_name(file)
    expect(language).to be_a String
    expect(language).to eq('english')
    expect(number).to be_a Integer
    expect(number).to eq(42)
    expect(extension).to be_a String
    expect(extension).to eq('txt')
  end
end
