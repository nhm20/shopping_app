import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 5),
            Center(child: Image(image: AssetImage(image), height: 175)),
          ],
        ),
      ),
    );
  }
}


//navigator widget gets the nearest NavigatorState