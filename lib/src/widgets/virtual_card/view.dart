import 'package:flutter/material.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:passageiro/src/widgets/virtual_card/viewmodel.dart';

class VirtualCardWidget extends StatelessWidget {
  const VirtualCardWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final VirtualCardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container( //TODO: Alterar para AspectRatio
      height: size.height / (640 / 152),
      width: size.width / (360 / 308),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: virtualCardColors,
        ),
      ),
      child: Column(
        children: [
          Text('Olá ${viewModel.name}!'),
          Text('Seu saldo total disponível é de'),
          Text('R\$ ${viewModel.creditToString}'),
          // Text('R\$100,00 + R\$26,00'),
          // Text('Vale transporte + saldo pessoal'),
        ],
      ),
    );
  }
}
