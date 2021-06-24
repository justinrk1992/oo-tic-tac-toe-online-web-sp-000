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

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board 
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(index)
        if index.between?(0,8)
            if position_taken?(index)
                false
            else
                true
            end
        else
            false
        end
    end

    def turn_count
        count = 0
        @board.each do |pos|
            count += 1 if pos == "X" || pos == "O"
        end
        count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            value = current_player
            move(index, value)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |el|
            pos1 = @board[el[0]]
            pos2 = @board[el[1]]
            pos3 = @board[el[2]]
            if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
                return el
            end
        end
        false
    end

    def full?
        @board.all? do |el|
            position_taken?(@board.index(el))
        end
    end

    def draw?
        if full? && won? == false
            true
        else
            false
        end
    end


end