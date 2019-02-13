
require 'number_to_lcd'

describe Number_to_lcd do
  describe '#display' do
    it 'converts number 1 to "  \n |\n |\n"' do
      expect(Number_to_lcd.display(1)).to eq("  \n |\n |\n")
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
      expect(Number_to_lcd.display(10)).to eq("   _ \n || |\n ||_|\n")
    end

    it 'converts number 123456789 to " _ \n|_|\n _|\n"' do
      expect(Number_to_lcd.display(123_456_789)).to eq("   _  _     _  _  _  _  _ \n | _| _||_||_ |_   ||_||_|\n ||_  _|  | _||_|  ||_| _|\n")
    end
  end
end
