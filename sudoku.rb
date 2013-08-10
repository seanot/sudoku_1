require 'debugger'

class Sudoku

  def initialize(board_string)
    @board = board_string.split('')
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

    @box = { "box_1" => [0, 1, 2, 9, 10, 11, 18, 19, 20],
             "box_2" => [3, 4, 5, 12, 13, 14, 21, 22, 23],
             "box_3" => [6, 7, 8, 15, 16, 17, 24, 25, 26],
             "box_4" => [27, 28, 29, 36, 37, 38, 45, 46, 47],
             "box_5" => [30, 31, 32, 39, 40, 41, 48, 49, 50],
             "box_6" => [33, 34, 35, 42, 43, 44, 51, 52, 53],
             "box_7" => [54, 55, 56, 63, 64, 65, 72, 73, 74],
             "box_8" => [57, 58, 59, 66, 67, 68, 75, 76, 77],
             "box_9" => [60, 61, 62, 69, 70, 71, 78, 79, 80]} 

   # puts  <<-DOC
   #  #{board_string[0,9]}
   #  #{board_string[9,9]}
   #  #{board_string[18,9]}
   #  #{board_string[27,9]}
   #  #{board_string[36,9]}
   #  #{board_string[45,9]}
   #  #{board_string[54,9]}
   #  #{board_string[63,9]}
   #  #{board_string[72,9]}
   #  DOC

  end

  def solve!
    checker
  end

  def solved?
    @board.count('0') == 0
  end


  def checker
    1.times do |index|
        if @board[index] == "0"
          check_row(index)
          @possible_row = @master - @possible_row
          check_col(index)
          @possible_col = @master - @possible_col
          check_box(index)
          @possible_box = @master - @possible_box
          results = (@possible_col & @possible_row & @possible_box).join
          @board[index] = results if results.length == 1 
        end
    end
    @board
  end

  def check_row(indx)
    row = (indx / 9) + 1
    array = @row["row_#{row}"]
    array.each do |x|
      @possible_row << @board[x.to_i] if @board[x.to_i] != "0"
    end
    p @possible_row
  end

  def check_col(indx)
    col = (indx % 9) + 1
    array = @col["col_#{col}"]
    array.each do |x|
      @possible_col<< @board[x.to_i] if @board[x.to_i] != "0"
    end
     p @possible_col
  end

  def check_box(indx)
    array = []
    1.upto(9) do |x|
       debugger
      if @box["box_#{x}"].include?("#{indx}")   
       array = @box["box_#{x}"]
      end
    end  
    array.each do |x|
      @possible_box << @board[x.to_i] if @board[x.to_i] != "0"
    end
    p @possible_box
  end

end

board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')

game.check_row(0)
game.check_col(0)
game.check_box(0)



