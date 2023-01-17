class Translate

  def initialize(files)
    @dictionary = Dictionary.new
    @message_file = File.open(files[0], "r")
    translate_and_print(files)
  end



end