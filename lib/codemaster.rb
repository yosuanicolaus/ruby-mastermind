class CodeMaster
  def initialize(bot = false)
    @bot = bot
  end

  def generate_random_code
    [rand(6), rand(6), rand(6), rand(6)]
  end
end
