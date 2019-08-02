class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    puts input.to_i.class
    return input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)

    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (!position_taken?(index) && index.between?(0,8))
      true
    else
      false
    end
  end

  def turn_count()
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def turn()
    puts "Please enter 1-9:"
    number = gets.strip
    number = input_to_index(number)
    if valid_move?(number)
      move(number, current_player())
    else
      while !valid_move?(number) do
        puts "Please enter 1-9:"
        number = gets.strip
        number = input_to_index(number)
      end
      move(number, current_player())
    end
    display_board()
  end

end
