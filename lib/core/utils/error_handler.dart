class CustomError {
  /// Descrição do erro.
  final String message;

  /// Código do erro.
  final int? code;

  CustomError({
    required this.message,
    this.code,
  });

  @override
  String toString() {
    return '$message ($code)';
  }
}
