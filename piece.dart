class Piece {
  final PieceColor color;
  final PieceType type;
  final int worth;
  bool hasMoved;

  Piece(this.color, this.worth, this.type, {bool this.hasMoved = false});

  @override
  String toString() {
    return '${this.runtimeType.toString()}{color: $color, type: $type, worth: $worth, hasMoved: $hasMoved}';
  }
}

class Movement {}

enum PieceColor { white, black }

enum PieceType { bishop, king, knight, pawn, rook, queen }
