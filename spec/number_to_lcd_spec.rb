# frozen_string_literal: true

require 'number_to_lcd'

describe Number_to_lcd do
  describe '#display' do
    it 'converts number 1 to "  \n |\n |\n"' do
      expect(Number_to_lcd.display(1)).to eq("   \n | \n | \n")
    end

    it 'converts number 2 to " _ \n _|\n|_ \n"' do
      expect(Number_to_lcd.display(2)).to eq(" _ \n _|\n|_ \n")
    end

    it 'converts number 3 to " _ \n _|\n _|\n"' do
      expect(Number_to_lcd.display(3)).to eq(" _ \n _|\n _|\n")
    end

    it 'converts number 9 to " _ \n|_|\n _|\n"' do
      expect(Number_to_lcd.display(9)).to eq(" _ \n|_|\n _|\n")
    end

    it 'converts number 10 to " _ \n|_|\n _|\n"' do
      expect(Number_to_lcd.display(10)).to eq("    _ \n | | |\n | |_|\n")
    end

    it 'converts number 123456789 to " _ \n|_|\n _|\n"' do
      expect(Number_to_lcd.display(123_456_789)).to eq("    _  _     _  _  _  _  _ \n |  _| _||_||_ |_   ||_||_|\n | |_  _|  | _||_|  ||_| _|\n")
    end

    it 'can convert single digits numbers to double size' do
      expect(Number_to_lcd.display(2, size = 2)).to eq(" ___   \n    |  \n    |  \n ___   \n|      \n|      \n ___   \n")
    end

    it 'can convert single digits numbers to double size again' do
      expect(Number_to_lcd.display(3, size = 2)).to eq(" ___   \n    |  \n    |  \n ___   \n    |  \n    |  \n ___   \n")
    end

    it 'can convert single digits 1 to any size double size, single number 2' do
      expect(Number_to_lcd.display(1, size = 3)).to eq("         \n    |    \n    |    \n    |    \n         \n    |    \n    |    \n    |    \n         \n")
    end

    it 'can convert single digits 0 to any size, single number 2' do
      expect(Number_to_lcd.display(0, size = 3)).to eq(
        " ____    \n|    |   \n|    |   \n|    |   \n         \n|    |   \n|    |   \n|    |   \n ____    \n")
    end

    it 'can convert multiple digits to any size' do
      expect(Number_to_lcd.display(12_345_678_910, size = 4)).to eq('')
    end
    # 0, 4, 7,
  end
end
