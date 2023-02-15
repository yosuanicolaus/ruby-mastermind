class Decoder
  attr_reader :codes, :signals

  # @param [Array<Integer>] key
  def initialize(key)
    @key = key
    @codes = Array.new(12) { [nil, nil, nil, nil] }
    @signals = Array.new(12) { [nil, nil, nil, nil] }
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
    signal_half = 0
    signal_full = 1

    4.times do |i|
      if code[i] == @key[i]
        @signals[@turn][i] = signal_full
      elsif @key.include? code[i]
        @signals[@turn][i] = signal_half
      end
    end
  end
end
