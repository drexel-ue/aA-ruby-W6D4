require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        @board.grid.each_with_index do |row, idx|
            temp =[]
                row.each_with_index do |ele, jdx|
                    if [idx, jdx] == @cursor.cursor_pos
                        temp << ele.to_s.on_red  
                    elsif (idx + jdx).odd?
                        temp << ele.to_s.on_light_blue
                    elsif (idx + jdx).even?
                        temp << ele.to_s.on_blue
                    else
                        temp << ele.to_s 
                    end
                end
            puts temp.join("")
        end
    end

    def cursor_loop
        loop do
            system("clear")
            render
            @cursor.get_input
        end
    end
    
end

board = Board.new
disp = Display.new(board)
# disp.render
disp.cursor_loop