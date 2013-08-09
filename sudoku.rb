class Sudoku
  def initialize(board_string)
    @board = board_string
    @master = %w(1 2 3 4 5 6 7 8 9)
    @possible_row = []
    @possible_col = []
    @possible_box = []
    @row = {'row_1' => (0..8).to_a,
            "row_2" => (9..17).to_a,
            "row_3" => (18..26).to_a,
            "row_4" => (27..35).to_a,
            "row_5" => (36..44).to_a,
            "row_6" => (45..53).to_a,
            "row_7" => (54..62).to_a,
            "row_8" => (63..71).to_a,
            "row_9" => (72..80).to_a}

    @col = {"col_1" => [0, 9, 18, 27, 36, 45, 54, 63, 72],
            "col_2" => [1, 10, 19, 28, 37, 46, 55, 64, 73],
            "col_3" => [2, 11, 20, 29, 38, 47, 56, 65, 74],
            "col_4" => [3, 12, 21, 30, 39, 48, 57, 66, 75],
            "col_5" => [4, 13, 22, 31, 40, 49, 58, 67, 76],
            "col_6" => [5, 14, 23, 32, 41, 50, 59, 68, 77],
            "col_7" => [6, 15, 24, 33, 42, 51, 60, 69, 78],
            "col_8" => [7, 16, 25, 34, 43, 52, 61, 70, 79],
            "col_9" => [8, 17, 26, 35, 44, 53, 62, 71, 80]}

    @box = {:box_1 => %w(0 1 2 9 10 11 18 19 20),
            :box_2 => %w(3 4 5 12 13 14 21 22 23),
            :box_3 => %w(6 7 8 15 16 17 24 25 26),
            :box_4 => %w(27 28 29 36 37 38 45 46 47),
            :box_5 => %w(30 31 32 39 40 41 48 49 50),
            :box_6 => %w(33 34 35 42 43 44 51 52 53),
            :box_7 => %w(54 55 56 63 64 65 72 73 74),
            :box_8 => %w(57 58 59 66 67 68 75 76 77),
            :box_9 => %w(60 61 62 69 70 71 78 79 80)} 
  end

  def solve!

  end

  def check_row(indx)
    row = (indx / 9) + 1
    array = @row["row_#{row}"]
    array.each do |x|
     p @possible_row << @board[x] if @board[x] != "0"
    end
  end

  def check_col(indx)
    col = (indx % 9) + 1
    array = @col["col_#{col}"]
    array.each do |x|
    p  @possible_col << @board[x] if @board[x] != "0"
    end
  end

  def check_box(indx)
      
  end

  # def board

  # end
end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')

# Remember: this will just fill out what it can and not "guess"
game.check_row(8)
game.check_col(8)


