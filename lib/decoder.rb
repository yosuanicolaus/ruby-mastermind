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

  def broke?
    @signals[@turn] == [2, 2, 2, 2]
  end

  def end?
    if @turn == 12
      puts "the code was #{@key.inspect}"
      true
    end
    false
  end

  def debug_key
    p "key: #{@key}"
  end

  private

  def create_signal(code)
    signal_arr = [0, 0, 0, 0]
    temp_key = [*@key]
    # check for all '2'
    4.times do |i|
      next unless code[i] == @key[i]

      signal_arr[i] = 2
      temp_key[i] = -1
    end
    # check for '1' / '0'
    4.times do |i|
      next if signal_arr[i] == 2

      if temp_key.include? code[i]
        signal_arr[i] = 1
        temp_key[temp_key.index code[i]] = -1
      end
    end
    @signals[@turn] = signal_arr.shuffle
  end
end
