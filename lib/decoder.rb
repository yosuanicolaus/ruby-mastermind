class Decoder
  attr_reader :codes, :signals

  # @param [Array<Integer>] key
  def initialize(key)
    @key = key
    @codes = Array.new(12) { [' ', ' ', ' ', ' '] }
    @signals = Array.new(12) { [' ', ' ', ' ', ' '] }
    @turn = 0
  end

  def decode(code)
    @codes[@turn] = code
    create_signal(code)
    @turn += 1
    code == @key
  end

  private

  # @param [Array<Integer>] code
  def create_signal(code)
    signal_arr = []
    4.times do |i|
      signal_arr << if code[i] == @key[i]
                      2 # full
                    elsif @key.include? code[i]
                      1 # half
                    else
                      0 # empty
                    end
    end
    @signals[@turn] = signal_arr.shuffle
  end
end
