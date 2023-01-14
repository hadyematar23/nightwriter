class NightWriterRunner
        attr_accessor :message_file, 
                      :new_file
        attr_reader :read_file
  def initialize(files)
    @files = files 
    @message_file = File.open(files[0], "r")
    @new_file = File.new(files[1], "w")
  end

  def run 
    copy_file
    characters = count_number
    string = create_string(characters)
  end

  def copy_file
    @new_file.write(message_file.read.downcase)
    @read_file = File.open(@new_file) 
    @new_file.close
  end 

  def count_number  
    lines = File.readlines(@message_file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    length = joined_lines.length
  end 
  
  def create_string(characters)
    p "Created #{@files[1]} containing #{characters} characters"
  end 


if $PROGRAM_NAME == __FILE__ 
  NightWriterRunner.new(ARGV).run
end 

end





  
 
  


