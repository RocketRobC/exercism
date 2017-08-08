class BeerSong
  def verse(verse)
    return verse_constructor(standard_verse(verse)) if (3..99).include?(verse)
    verse_constructor(send("verse_#{verse}"))
  end

  def verses(first, last)
    first.downto(last).inject('') do |string, v|
      string + verse(v) + "\n"
    end.chomp
  end

  private

  def verse_constructor(phrases)
    "#{phrases[:number]} of beer on the wall, #{phrases[:number].downcase} of beer.\n#{phrases[:text]} of beer on the wall.\n"
  end

  def standard_verse(number)
    { number: "#{number} bottles", text: "Take one down and pass it around, #{number - 1} bottles" }
  end

  def verse_2
    { number: '2 bottles', text: 'Take one down and pass it around, 1 bottle' }
  end

  def verse_1
    { number: '1 bottle', text: 'Take it down and pass it around, no more bottles' }
  end

  def verse_0
    { number: 'No more bottles', text: 'Go to the store and buy some more, 99 bottles' }
  end
end

module BookKeeping
  VERSION = 3
end
