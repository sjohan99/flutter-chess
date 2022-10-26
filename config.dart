import 'piece.dart';

const String allowedFiles = 'abcdefgh';
const int minRank = 1;
const int maxRank = 8;
Map<int, String> fileConverter = {1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 6: 'f', 7: 'g', 8: 'h'};

Map<String, Piece> get pieceMapping {
  var white = _pieceMapping(PieceColor.white);
  var black = _pieceMapping(PieceColor.black);
  white.addAll(black);
  return white;
}

Map<String, Piece> _pieceMapping(PieceColor color) {
  var back = minRank;
  var front = minRank + 1;
  if (color == PieceColor.black) {
    back = maxRank;
    front = maxRank - 1;
  }

  Map<String, Piece> backRow = {
    'a${back}': Piece(color, 0, PieceType.rook),
    'b${back}': Piece(color, 0, PieceType.knight),
    'c${back}': Piece(color, 0, PieceType.bishop),
    'd${back}': Piece(color, 0, PieceType.queen),
    'e${back}': Piece(color, 0, PieceType.king),
    'f${back}': Piece(color, 0, PieceType.bishop),
    'g${back}': Piece(color, 0, PieceType.knight),
    'h${back}': Piece(color, 0, PieceType.rook),
  };

  Map<String, Piece> frontRow = {
    'a${front}': Piece(color, 0, PieceType.pawn),
    'b${front}': Piece(color, 0, PieceType.pawn),
    'c${front}': Piece(color, 0, PieceType.pawn),
    'd${front}': Piece(color, 0, PieceType.pawn),
    'e${front}': Piece(color, 0, PieceType.pawn),
    'f${front}': Piece(color, 0, PieceType.pawn),
    'g${front}': Piece(color, 0, PieceType.pawn),
    'h${front}': Piece(color, 0, PieceType.pawn),
  };

  backRow.addAll(frontRow);
  return backRow;
}
