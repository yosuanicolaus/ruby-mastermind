require_relative('codemaster')
require_relative('codebreaker')
require_relative('decoder')
require_relative('user_interface')

class Game
  def initialize
    # pref = UI.welcome
    # case pref
    # when "b"
    #   @player = CodeBreaker.new(false)
    #   @computer = CodeMaster.new(true)
    #   key_code = @computer.generate_random_code
    # when 'm'
    #   @player = CodeMaster.new(false)
    #   @computer = CodeBreaker.new(true)
    #   key_code = UI.get_code
    # else
    #   return initialize
    # end

    # MVP: Player CodeBreaker, Computer CodeMaster
    @player = CodeBreaker.new(false)
    @computer = CodeMaster.new(true)
    key_code = @computer.generate_random_code
    @decoder = Decoder.new(key_code)
    UI.display_decoder(@decoder)
    game_loop
  end

  def game_loop
    # ask player for code
    code = UI.get_code
    # decode the code
    @decoder.decode(code)
    # show the output
    UI.display_decoder(@decoder)
    # TODO: temporary - display key
    @decoder.debug_key
    # check if game is end
    return end_game(@player) if @decoder.broke?
    return end_game(@computer) if @decoder.end?

    game_loop
  end

  def end_game(winner)
    winner.celebrate
  end
end
