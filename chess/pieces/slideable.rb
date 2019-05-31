require_relative 'board.rb'

module Slideable

    def possible_move?(start_pos, end_pos, board)
        x1, y1 = start_pos
        x2, y2 = end_pos
        dx = x2 - x1
        dy = y2 - y1

        diag_check = (dx == dy) || (dx == -dy)
        horiz_check = (dy == 0)
        vert_check = (dx == 0)

        if diag_check == true
            return path_clear(start_pos, end_pos, board, :diag)
        elsif horiz_check 
            return path_clear(start_pos, end_pos, board, :horiz)
        elsif vert_check
            return path_clear?(start_pos, end_pos, board, :vert)
        end
        false
    end

    def path_clear?(start_pos, end_pos, board, dir)
        
        x1, y1 = start_pos
        x2, y2 = end_pos 
        dx = x2 - x1

        case dir
            when :diag
                (y1..y2).each do |y|
                    return false if !board[x1,y].is_a?(NullPiece) 
                    dx > 0 ? x1 += 1 : x1 -= 1
                end
            when :horiz
                (x1..x2).each do |x|
                    return false if !board[x,y1].is_a?(NullPiece) 
                end
            when :vert
                (y1..y2).each do |y|
                    return false if !board[x1,y].is_a?(NullPiece) 
                end
            end
        true
    end

end