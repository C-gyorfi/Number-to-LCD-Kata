class Number_to_lcd
  LCD_NUMBERS =
    { '1' => "  \n |\n |\n",
      '2' => " _ \n _|\n|_ \n",
      '3' => " _ \n _|\n _|\n",
      '4' => "   \n|_|\n  |\n",
      '5' => " _ \n|_ \n _|\n",
      '6' => " _ \n|_ \n|_|\n",
      '7' => " _ \n  |\n  |\n",
      '8' => " _ \n|_|\n|_|\n",
      '9' => " _ \n|_|\n _|\n",
      '0' => " _ \n| |\n|_|\n" }.freeze

  def self.display(integer)
    result = ''
    numbers_as_string_array = integer.to_s.chars
    (0..2).each do |index|
      numbers_as_string_array.each { |number| result << LCD_NUMBERS[number].split("\n")[index] }
      result << "\n"
    end
    result
  end
end
