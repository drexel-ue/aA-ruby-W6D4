require 'byebug'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/pawn'
require_relative 'pieces/null_piece'
require_relative 'pieces/king'
require_relative 'pieces/knight'


class Board

    attr_accessor :grid
    
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        populate
    end

    def populate
        # debugger
        (0..7).each do |row|
            if row == 0 || row == 7
                [0,7].each do |col|  
                    @grid[row][col] = Rook.new(row == 0 ? :black : :white, self, [row, col])
                end
                [1,6].each do |col|  
                    @grid[row][col] = Knight.new(row == 0 ? :black : :white, self, [row, col])
                end
                [2,5].each do |col|  
                    @grid[row][col] = Bishop.new(row == 0 ? :black : :white, self, [row, col])
                end
                
                @grid[row][row == 0 ? 4 : 3] = King.new(row == 0 ? :black : :white, self, [row, row == 0 ? 4 : 3])
                @grid[row][row == 0 ? 3 : 4] = Queen.new(row == 0 ? :black : :white, self, [row, row == 0 ? 3 : 4])
                
            elsif row == 1 || row == 6
                (0..7).each do |col|
                    @grid[row][col] =  Pawn.new(row == 1 ? :black : :white, self, [row, col])
                end
            else
                (0..7).each do |col|
                    @grid[row][col] = NullPiece.instance
                end
            end  
        end
    end

    def move_piece(start_pos, end_pos)
        x, y = end_pos
        i, j = start_pos 
        raise "There's no piece at this square" if self[start_pos].is_a?(NullPiece)
        raise "No friendly fire" if self[start_pos].color == self[end_pos].color
        raise "Stay on the battfield" if [x, y, i, j].any? { |index| !(0..7).include?(index) }
        
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos] 
        self[start_pos].pos, self[end_pos].pos = end_pos, start_pos
    end
        
    end   
    def [](pos)  
        i, j = pos
        @grid[i][j]
    end
    
    def []=(pos, val)
        i, j = pos
        @grid[i][j] = val
    end

    def valid_pos?(pos)
         x, y = pos
        [x, y].all? { |index| (0..7).include?(index) }
    end
    

end

b = Board.new
k = Knight.new(:black, b, [0,0])
k.to_s
# p b.valid_pos?([8,0])
# print b.grid[0][5]
# p b[[0,5]].color
#  b.move_piece([3,6],[1,5])
