import 'package:flutter/material.dart';

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
      
      child: FloatingActionButton.extended(
        backgroundColor: onPressed != null ? Colors.blue : Colors.grey ,
        onPressed: onPressed,
        label: Center(child: SizedBox(width: 300, child: Text(label, textAlign: TextAlign.center,),),),
      ),
    );
    
  }
}
