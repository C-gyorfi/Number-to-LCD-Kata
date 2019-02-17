class Number_to_lcd
  LCD_NUMBERS =
    { '1' => "   \n | \n | \n",
      '2' => " _ \n _|\n|_ \n",
      '3' => " _ \n _|\n _|\n",
      '4' => "   \n|_|\n  |\n",
      '5' => " _ \n|_ \n _|\n",
      '6' => " _ \n|_ \n|_|\n",
      '7' => " _ \n  |\n  |\n",
      '8' => " _ \n|_|\n|_|\n",
      '9' => " _ \n|_|\n _|\n",
      '0' => " _ \n| |\n|_|\n" }.freeze

  def self.display(integer, size=1)
    result = ''
    numbers_as_string_array = integer.to_s.chars

    resised_numbers_array = []
    numbers_as_string_array.each{|number| resised_numbers_array << resize(LCD_NUMBERS[number], size) }

    height_of_digits = resised_numbers_array[0].count("\n") - 1
    
    (0..height_of_digits).each do |index|
      resised_numbers_array.each { |number| result << number.split("\n")[index] }
      result << "\n"
    end

    result
  end

  def self.resize(lcd_number, size)
      return lcd_number if size == 1
      resized_lcd_number = ''

      lcd_copy = lcd_number.gsub '_', '_' + '_' * size
      lcd_copy.gsub! ' |', ' ' * size + ' |'
      lcd_to_lines = lcd_copy.split("\n")

      lcd_to_lines.each do |line|
        if line.include?('|')
          line_with_pipes = line.gsub '_', ' '
          line_with_underscores = line.gsub '|', ' '
          size.times {resized_lcd_number << line_with_pipes + "\n"}
          resized_lcd_number << line_with_underscores + "\n"
        else
          if line.include?('_')
            resized_lcd_number << line + "\n"
          else
            resized_lcd_number << line + (' ' * size) + "\n"
          end
        end
      end
    resized_lcd_number
  end
end
