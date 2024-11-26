import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final double loaderSize; 

  const CustomLoader({
    super.key,
    required this.loaderSize, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: loaderSize,
      width: loaderSize,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
