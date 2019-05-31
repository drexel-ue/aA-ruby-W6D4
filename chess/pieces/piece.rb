require 'colorize'

class Piece
    attr_accessor :color, :board, :pos
    def initialize(color, board, pos)
        @board, @color, @pos = board, color, pos
    end

    def to_s
        ' ♞ '.colorize(@color)
    end

    
end

