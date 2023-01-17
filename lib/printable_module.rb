module Printable

  def print_to_txt_file(translated_phrase, file) 
    new_file = File.new(file, "w")
    new_file.puts translated_phrase
    new_file.close
  end

  def count(file) 
    lines = File.readlines(file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    joined_lines.length
  end

  def print(length, file_name) 
    p "Created #{file_name} containing #{length} characters"
  end

  def print_to_console(file, file_name = file)
    length = count(file)
    print(length, file_name)
  end 
end