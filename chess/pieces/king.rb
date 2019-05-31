require_relative 'piece'

class King < Piece
    
    def initialize(color, board, positon)
        super
    end

    def moves(start_pos, end_pos)
        x1, y1 = start_pos
        x2, y2 = end_pos
        dx = x2 - x1
        dy = y2 - y1
        dx / dy == 2 || dx / dy == (1/2)
    end

end