import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Axel Arigoto',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$245.00',
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            const SizedBox(height: 16),
            const Text(
              'Available in size',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Wrap(
              spacing: 8,
              children: [
                '39',
                '40',
                '53.5',
                '4.0.5',
              ].map((size) => Chip(label: Text(size))).toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('For previews to create any movement-based methods...'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Content',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: ['Jackets', 'Ajoras', 'Shoots']
                  .map(
                    (item) => ListTile(
                      leading: const Icon(Icons.check),
                      title: Text(item),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Related Products',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard('Voice Guide Dome', '\$998.00'),
                  _buildProductCard('Herschel Supply Co.', '\$40.00'),
                  _buildProductCard('Soldides', '\$150.00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg',
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(price, style: const TextStyle(color: Colors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
