import 'package:test/test.dart';
import '../square.dart';
import '../position_exception.dart';

void main() {
  test('Position with int file creates valid position', () {
    var square = Square.intFile(1, 1);
    expect(square.file, 'a');
    expect(square.rank, 1);
  });

  test('Position compares with other positions correctly', () {
    var square = Square('c', 3);
    expect(square, equals(Square('c', 3)));
    expect(square, isNot(Square('c', 4)));
    expect(square, isNot(Square('b', 3)));
    expect('c3', equals(square));
    expect('c4', isNot(square));
  });

  test('Position throws exception when invalid file is given', () {
    expect(() => Square('i', 1), throwsA(isA<PositionException>()));
    expect(() => Square('', 1), throwsA(isA<PositionException>()));
  });

  test('Position throws exception when invalid rank is given', () {
    expect(() => Square('a', 9), throwsA(isA<PositionException>()));
    expect(() => Square('a', 0), throwsA(isA<PositionException>()));
  });
}
