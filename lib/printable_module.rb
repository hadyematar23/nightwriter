module Printable

  def print_to_txt_file(translated_phrase, file) #tested
    new_file = File.new(file, "w")
    new_file.puts translated_phrase
    new_file.close
  end

  def count(file) #test
    lines = File.readlines(file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    joined_lines.length
  end
end