class CodeMaster
  def initialize(bot: false)
    @bot = bot
    @key = []
  end

  def generate_random_code
    @key = [rand(6), rand(6), rand(6), rand(6)]
    @key
  end

  def celebrate
    puts 'CodeMaster win!'
    puts "The code was #{@key.inspect}"
  end
end
