require 'pry'


class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],  [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = Array.new(9, " ")
  end  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end  

  def move(index, token = "X")
    @board[index] = token
  end  

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end  

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count {|i| i == "X" || i == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end  

  def turn 
    puts "Enter a number (1-9)"
    user_input = gets.chomp
    user_input = input_to_index(user_input)
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn  
    end  
  end  

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? {|index| @board[index] == "X"} || win_combo.all? {|index| @board[index] == "O"}
    end  
  end  

  def full?
    @board.none? {|pos| pos == ' '}
  end  

  def draw?
    full? && !won? ? true : false
  end  

  def over?
    draw? || won? ? true : false
  end  

  def winner
    @board[won?[1]] if won? != nil
  end  

  def play 
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end  
  end  

end
