class PositionException implements Exception {
  String cause;
  PositionException(this.cause);

  @override
  String toString() {
    return cause;
  }
}
