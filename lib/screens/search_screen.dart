import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary mock data - replace with real search functionality
    final searchResults = [
      Product(
        id: '3',
        title: 'Wireless Keyboard',
        price: 49.99,
        imageUrl:
            'https://images.pexels.com/photos/2115257/pexels-photo-2115257.jpeg',
      ),
      // Add more mock results
    ];

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: searchResults.length,
        itemBuilder: (ctx, i) => ProductCard(product: searchResults[i]),
      ),
    );
  }
}
