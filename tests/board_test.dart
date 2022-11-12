import 'package:test/test.dart';

import '../board.dart';
import '../piece.dart';
import '../square.dart';

void main() {
  test('board', () {
    Board b = Board();
    print(b.squares[0].occupiedBy);

    Square s = Square('a', 2);
    Map<Square, Piece?> m = {s: Piece(PieceColor.black, 0, PieceType.bishop)};
    print(m[s]);
    print(m[Square('a', 2)]);
    print(b.getPieceFromSquare(Square('a', 1)));
    print(b.getPieceFromString('a', '2'));
  });

  test('move pawn one step forward should be ok', () {
    Board b = Board();
    var pawn = b.getPieceFromString('a', '2');
    var shouldBeNull = b.getPieceFromString('a', '3');
    expect(shouldBeNull, equals(null));
    expect(pawn, isNot(null));
    expect(pawn!.type, equals(PieceType.pawn));

    b.movePiece(Square('a', 2), Square('a', 3));
    var movedPawn = b.getPieceFromString('a', '3');
    expect(movedPawn, equals(pawn));
    var oldSquarePiece = b.getPieceFromString('a', '2');
    expect(oldSquarePiece, equals(null));
  });
}
