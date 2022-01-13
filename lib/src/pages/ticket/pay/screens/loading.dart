import 'package:flutter/material.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:shimmer/shimmer.dart';

class TicketPaymentLoadingScreen extends StatelessWidget {
  const TicketPaymentLoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingLogoWidget(),
      ),
    );
  }
}



class LoadingLogoWidget extends StatelessWidget {
  const LoadingLogoWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        // baseColor: Colors.red,
        // highlightColor: Colors.yellow,
        baseColor: colorPrimary, //TODO: Remover as cores daqui
        highlightColor: colorSecundary,
        child: const Text(
          'Buzzão',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }
}