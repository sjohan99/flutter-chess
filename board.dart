import 'piece.dart';
import 'square.dart';
import 'config.dart' as cfg;

class Board {
  List<Square> squares;

  Board() : this.squares = [] {
    this.squares = createSquares(cfg.allowedFiles, cfg.minRank, cfg.maxRank);
    populateSquares(cfg.pieceMapping);
  }
  Board.custom(this.squares);

  // TODO decouple from this class
  List<Square> createSquares(String files, int minRank, int maxRank) {
    List<Square> squares = [];
    files.runes.forEach((charCode) {
      for (var rank = minRank; rank <= maxRank; rank++) {
        var file = new String.fromCharCode(charCode);
        squares.add(Square(file, rank));
      }
    });
    return squares;
  }

  // TODO decouple from this class
  void populateSquares(Map<String, Piece> pieceMapping) {
    for (var square in squares) {
      if (pieceMapping.containsKey(square)) {
        square.occupyWith(pieceMapping[square]!);
      }
    }
  }

  void movePiece(Square from, Square to) {
    var actualFrom = squares[squares.indexOf(from)];
    var actualTo = squares[squares.indexOf(to)];
    Piece? pieceToMove = actualFrom.occupiedBy;
    if (pieceToMove != null) {
      actualFrom.occupiedBy = null;
      actualTo.occupyWith(pieceToMove);
    }
  }

  Piece? getPieceFromSquare(Square square) {
    Piece? piece = squares[squares.indexOf(square)].occupiedBy;
    return piece;
  }

  Piece? getPieceFromString(String file, String rank) {
    return getPieceFromSquare(Square(file, int.parse(rank)));
  }
}
