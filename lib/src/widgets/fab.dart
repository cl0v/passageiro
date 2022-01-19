import 'package:flutter/material.dart';
import 'package:passageiro/design_system/colors.dart';

class CustomFabExtended extends StatelessWidget {
  const CustomFabExtended({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          // decoration:  BoxDecoration(
          //   borderRadius: BorderRadius.circular(30),
          //   gradient: const LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       colorButtonStart,
          //       colorButtonEnd,
          //     ],
          //   ),
          // ),
          width: MediaQuery.of(context).size.width * .85,
          height: 42,
          child: ElevatedButton(
            child: Text(label),
            onPressed: onPressed,
          ),
        )

        // child: FloatingActionButton.extended(
        //   backgroundColor: onPressed != null ? Colors.blue : Colors.grey ,
        //   onPressed: onPressed,
        //   label: Center(child: SizedBox(width: 300, child: Text(label, textAlign: TextAlign.center,),),),
        // ),
        );
  }
}
