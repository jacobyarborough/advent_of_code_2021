require 'pry'

class Bingo 
  attr_reader :all

  def initialize(board_array)
    @all = board_creator(board_array)
  end 

  def board_creator(board_array)
    bingo_array = []
    bingo_board = []
    row = []
 
    board_array.each do |num|
      if row.length <= 4
        row.push(num)
        if row.length == 5
          bingo_board.push(row)
          row = []
        end 
      end

      if bingo_board.length == 5
        cols = bingo_board.transpose

        cols.each do |col|
          bingo_board.push(col)
        end 
        bingo_array.push(Board.new(bingo_board))
        bingo_board = []
      end
    end 
    bingo_array 
  end 

  def mark(num)
    @all.each do |board|
      board.mark(num)
    end 

  check_winner(num)
  end 

  def check_winner(num)
    winning_score = 0
    @all.each do |board|
      board.winner(num)
      if board.score != 0 && board.won != 1
        board.win
        winning_score = board.score
      end 
    end 
    winning_score
  end
end 

class Board
  attr_reader :board,
              :score,
              :won

  def initialize(board)
    @board = board 
    @score = 0
    @won = 0
  end 

  def mark(num_call)
    @board.each do |row_col|
      if row_col.include? num_call 
        row_col.delete num_call
      end 
    end 
  end 

  def winner(num_call)
    if empty_row == 1
      board_total = @board.flatten.sum / 2
      @score = board_total * num_call
    end 
  end 

  def empty_row
    empty = 0
    @board.each do |row_col|
      if row_col.empty?
        empty = 1
      end
    end 
    empty
  end

  def win 
    @won = 1
  end 
end 

line_count = 0
agg_array = []

File.foreach('day_4/input.txt') do |line|
  if line_count == 0
    line_array = line.chomp.split(',')
    agg_array.push(line_array)
  else 
    line_array = line.chomp.split(" ")
    agg_array.push(line_array)
  end 

  line_count += 1
end 

array_v2 = agg_array.flatten 

guess_counter = 0
bingo_num_array = []
board_array = []

array_v2.each do |element|
  if guess_counter <= 99
    bingo_num_array.push(element.to_i)
  else 
    board_array.push(element.to_i)
  end 

  guess_counter += 1
end 

game_scores = []

game = Bingo.new(board_array)

scores_array = []

bingo_num_array.each do |num|
  final_score = game.mark(num)
  if final_score > 0 
    scores_array.push(final_score)
  end 
end 

puts scores_array[0]