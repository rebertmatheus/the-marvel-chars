abstract class CharactersException extends Exception {
  factory CharactersException(String errorMessage) => _CharactersException(errorMessage);
}

class _CharactersException implements CharactersException {
  final String errorMessage;

  _CharactersException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
