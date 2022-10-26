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

  void populateSquares(Map<String, Piece> pieceMapping) {
    for (var square in squares) {
      if (pieceMapping.containsKey(square)) {
        square.occupyWith(pieceMapping[square]!);
      }
    }
  }
}
