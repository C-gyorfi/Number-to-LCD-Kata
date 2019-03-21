# frozen_string_literal: false

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

  def self.display(integer, size = 1)
    result = ''
    numbers_as_char_array = integer.to_s.chars

    resised_numbers_array = []
    numbers_as_char_array.each do |number|
      resised_numbers_array << resize(LCD_NUMBERS[number], size)
    end

    height_of_digits = resised_numbers_array.first.count("\n") - 1

    (0..height_of_digits).each do |index|
      resised_numbers_array.each do |number|
        result << number.split("\n")[index]
      end
      result << "\n"
    end
    result
  end

  def self.resize(lcd_number, size)
    return lcd_number if size == 1

    extended_width = resize_width(lcd_number, size)
    resize_height(extended_width, size)
  end

  def self.resize_width(lcd_number, size)
    lcd_copy = lcd_number.gsub '_', '_' + '_' * size
    lcd_copy.gsub! ' |', ' ' * size + ' |'
    lcd_copy
  end

  def self.resize_height(lcd_number, size)
    resized = ''
    lines = lcd_number.split("\n")
    endline = ' ' * size + "\n"

    lines.each do |line|
      if line.include?('|')
        line_with_pipes = line.tr '_', ' '
        line_with_underscores = line.tr '|', ' '
        size.times { resized << line_with_pipes + endline }
        resized << line_with_underscores + endline
      else
        resized << if line.include?('_')
                     line + endline
                   else
                     line + (' ' * size) + endline
                   end
      end
    end
    resized
  end

  #some changes here
end
