class SQLException implements Exception {
  final String message;

  SQLException(this.message);

  @override
  String toString() {
    return message;
  }
}
