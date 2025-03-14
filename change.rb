require 'base64'

# Function to encode a binary file in Base64 and save it with a .64 extension
def base64_encode_file(file_path)
  unless File.exist?(file_path)
    puts "Error: File not found!"
    return
  end

  # Read the binary file
  binary_content = File.binread(file_path)

  # Encode it in Base64
  base64_content = Base64.strict_encode64(binary_content)

  # Generate new file name with .64 extension
  new_file_path = "#{file_path}.64"

  # Save encoded content
  File.write(new_file_path, base64_content)

  puts "Base64 encoded file saved as: #{new_file_path}"
end

# Function to decode a Base64 file back to its original binary form
def base64_decode_file(encoded_file_path)
  unless File.exist?(encoded_file_path)
    puts "Error: File not found!"
    return
  end


  puts "Encoded file: #{encoded_file_path}"
  # Read the Base64-encoded content
  base64_content = File.read(encoded_file_path)

  puts "Base64 content: #{base64_content.length}"

  # Decode it back to binary
  binary_content = Base64.decode64(base64_content)

  # Generate original file name (remove .64 extension)
  original_file_path = encoded_file_path.sub(/\.64$/, '')

  # Save decoded binary content
  File.binwrite(original_file_path+".decode", binary_content)

  puts "Decoded binary file saved as: #{original_file_path}"
end

# Example usage
if ARGV.length < 2
  puts "Usage: ruby script.rb encode|decode <file_path>"
else
  action = ARGV[0].downcase
  file_path = ARGV[1]

  case action
  when "encode"
    base64_encode_file(file_path)
  when "decode"
    base64_decode_file(file_path)
  else
    puts "Invalid action. Use 'encode' or 'decode'."
  end
end