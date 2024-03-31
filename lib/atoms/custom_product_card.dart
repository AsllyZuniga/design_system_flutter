import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_text.dart';

class CustomProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productCode;

  const CustomProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productCode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(productImage, height: 80, width: 80),
            ),
            const SizedBox(height: 5),
            CustomText(text: productName, fontSize:12),
            CustomText(text: 'Cód. $productCode', fontSize:11),
            CustomText(text: '\$ $productPrice', fontSize: 22, fontWeight: FontWeight.w600),
          ],
          ),
          ),
    );
  }
}