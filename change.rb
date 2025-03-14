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

# Example usage

  base64_encode_file("cm.yaml")
