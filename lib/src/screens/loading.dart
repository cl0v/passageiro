
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
          // baseColor: Colors.red,
          // highlightColor: Colors.yellow,
          baseColor: const Color(0xFF6E46C8),
          highlightColor: const Color(0xFFFFE200),
          child: const Text(
            'Buzzão',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }
}

