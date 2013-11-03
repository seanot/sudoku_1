class NewSudoku

  def initialize(numbers)
    @numbers = numbers.split('')
    @candidates = %w[1 2 3 4 5 6 7 8 9]
    solve
  end

  def solve
    until solved?
      @numbers.each_with_index do |number, index|
        if number == '0'
          @index = index
          @numbers[index] = uniqueness if uniqueness != nil
        end
      end
      @numbers = @numbers.flatten
    end
  end

  def solved?
    true unless @numbers.include? "0"
  end

  def uniqueness
    cell = (check_row + check_column + check_box).uniq
    possibilities = @candidates.map do |candidate|
      candidate unless cell.include? candidate
    end
    possibilities.compact!
    possibilities if possibilities.length == 1
  end

  def check_row
    @candidates.map { |candidate| candidate if row.include? candidate }
  end

  def row
    row_number = @index / 9
    @numbers.select.with_index { |number, i| number if i/9 == row_number }
  end

  def check_column
    @candidates.map { |candidate| candidate if column.include? candidate }
  end

  def column
    column_number = @index % 9
    @numbers.select.with_index { |number, i| number if i%9 == column_number }
  end

  def check_box
    @candidates.map { |candidate| candidate if box.include? candidate }
  end

  def box
    box_number = (((@index / 9) / 3) * 3) + ((@index % 9) / 3)
    @numbers.select.with_index { |number, i|
      number if (((i/9) / 3) * 3) + ((i%9) / 3) == box_number
    }
  end
end

# numbers ='105802000090076405200400819019007306762083090000061050007600030430020501600308900'
# p sudoku = NewSudoku.new(numbers)
