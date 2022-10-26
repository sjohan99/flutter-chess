import 'config.dart' as cfg;
import 'position_exception.dart';

class PositionValidator {
  final String allowedFiles;
  final int minAllowedRank;
  final int maxAllowedRank;
  const PositionValidator({this.allowedFiles = cfg.allowedFiles, this.minAllowedRank = cfg.minRank, this.maxAllowedRank = cfg.maxRank});

  void validate(String file, int rank) {
    if (!RegExp('[$allowedFiles]').hasMatch(file)) {
      throw PositionException('invalid file argument: $file\nExpected one of $allowedFiles');
    }
    if (rank < minAllowedRank || rank > maxAllowedRank) {
      throw PositionException('invalid rank argument: $rank\nExpected rank to be between $minAllowedRank and $maxAllowedRank');
    }
  }
}
