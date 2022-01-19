class VirtualCardViewModel {
  //Ou bloc
  final String name;
  final double credit;

  VirtualCardViewModel(
    this.name,
    this.credit,
  );

  String get creditToString => credit.toString().replaceFirst('.', ',');
}
