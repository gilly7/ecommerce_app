import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product}); // Const constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/product', arguments: product),
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 150),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                  // Add other widgets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
