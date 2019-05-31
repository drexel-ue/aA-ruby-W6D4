
There are many different kinds of pieces in chess, and each moves a specific way. Based on their moves, they can be placed in four categories:

Sliding pieces (Bishop/Rook/Queen)
Stepping pieces (Knight/King)
Null pieces (occupy the 'empty' spaces)
Pawns (we'll do this class last)
Start by writing a Piece parent class that contains the functionality common to all pieces. A key method of Piece is #moves, which should return an array of places a Piece can move to. Of course, every piece will move differently, so you can't write (implement) the #moves method of Piece without subclasses.

NB You will not implement tricky moves like "en passant". Don't implement castling, draws, or pawn promotion either. You will handle check and check mate, however.

You should make modules for Slideable and Stepable. Accessing this on GitHub? Use this link. The Slideable module can implement #moves, but it needs to know what directions a piece can move in (diagonal, horizontally/vertically, both). Classes that include the module Slideable (Bishop/Rook/Queen) will need to implement a method #move_dirs, which #moves will use.

Your Piece will need to (1) track its position and (2) hold a reference to the Board. Classes that include Slideable in particular need the Board so they know to stop sliding when blocked by another piece. Don't allow a piece to move into a square already occupied by the same color piece, or to move a sliding piece past a piece that blocks it.

The NullPiece class should include the singleton module. It will not need a reference to the Board - in fact its initialize method should take no arguments. Make sure you have a way to read its color and symbol.

After completing each piece load the file in pry and make sure it moves properly. Once you have completed all pieces refactor your Board#initialize so that all your pieces are placed in their respective starting positions. Run ruby display.rb to check that they show up in the proper locations.

For now, do not worry if a move leaves a player in check.

Phase IV: Board#in_check?(color) and Board#checkmate?(color)
The Board class should have a method #in_check?(color) that returns whether a player is in check. You can implement this by (1) finding the position of the King on the board then (2) seeing if any of the opposing pieces can move to that position.

Then write a #checkmate?(color) method. If the player is in check, and if none of the player's pieces have any #valid_moves (to be implemented in a moment), then the player is in checkmate.

NB Here's a four-move sequence to get to checkmate from a starting board for your checkmate testing:

f2, f3
e7, e5
g2, g4
d8, h4
