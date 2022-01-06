class CustomError {
  /// Descrição do erro.
  final String message;

  /// Código do erro.
  final String? code;

  CustomError({
    required this.message,
    int? code,
  }) : code = code != null ? ' ($code)' : '';

  @override
  String toString() {
    return '$message${code ?? "."}';
  }
}
