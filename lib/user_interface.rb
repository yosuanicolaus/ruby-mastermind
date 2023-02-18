module UI
  def self.welcome
    puts 'Welcome to Mastermind!'
    puts 'Would you like to be the Codebreaker[b] or the Codemaster[m]? [b/m]'
    gets.chomp[0].downcase
  end

  def self.get_code
    puts 'Enter a 4 digit code: <0-5 - ex: 2450>'
    input = gets.chomp

    if input.length != 4
      puts 'code length has to be exactly 4!'
      return get_code
    elsif input.split('').any? { |ch| !'012345'.include? ch }
      puts 'each code has to be between 0-5!'
      return get_code
    end
    input.split('').map { |ch| ch.to_i }
  end

  # @param [Decoder] decoder
  def self.display_decoder(decoder)
    display = "+---+---+---+---+   +---+---+---+---+\n"
    12.times do |i|
      display += "| #{decoder.codes[i].join(' | ')} |   "
      display += "| #{decoder.signals[i].join(' | ')} |"
      display += "\n+---+---+---+---+   +---+---+---+---+\n"
    end
    puts display
  end
end
