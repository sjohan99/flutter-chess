import 'config.dart';

import 'piece.dart';
import 'position_exception.dart';
import 'position_validator.dart';

class Square {
  String file;
  int rank;
  Piece? occupiedBy;

  Square(this.file, this.rank, {this.occupiedBy = null, validator = const PositionValidator()}) {
    validator.validate(file, rank);
  }

  Square.intFile(int file, this.rank, {this.occupiedBy = null, validator = const PositionValidator()}) : this.file = 'why does Dart enforce this??' {
    if (fileConverter.containsKey(file)) {
      this.file = fileConverter[file]!;
      validator.validate(this.file, this.rank);
    } else {
      throw PositionException('invalid file argument: $file\nExpected one of ${fileConverter.keys}');
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Square && other.runtimeType == runtimeType) {
      return file == other.file && rank == other.rank;
    } else if (other is String) {
      return toString() == other;
    }
    return false;
  }

  @override
  String toString() {
    return '$file${rank.toString()}';
  }

  @override
  int get hashCode => toString().hashCode;

  bool occupyWith(Piece piece) {
    if (occupiedBy == null) {
      occupiedBy = piece;
      return true;
    }
    return false;
  }

  void releasePiece() => occupiedBy = null;
}
