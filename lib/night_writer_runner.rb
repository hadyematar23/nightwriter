class NightWriterRunner
        attr_accessor :message_file, 
                      :new_file, 
                      :files
  def initialize(files)
    @files = files 
    @message_file = File.open(files[0], "r")
    @new_file = File.new(files[1], "w")
    require 'pry'; binding.pry
    @test = "t"
  end

  def run 

    @new_file.write(message_file.read)
    @new_file.close
    
    lines = File.readlines(@new_file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    length = joined_lines.length
    
    puts "Created #{@files[1]} containing #{length} characters"
  end 


if $PROGRAM_NAME == __FILE__ 
  NightWriterRunner.new(ARGV).run
end 

end





  
 
  


