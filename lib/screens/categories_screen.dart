import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Electronics', 'icon': Icons.electrical_services},
    {'title': 'Fashion', 'icon': Icons.shopping_bag},
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Beauty', 'icon': Icons.spa},
    {'title': 'Sports', 'icon': Icons.sports_baseball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categories[index]['icon'], size: 40, color: Colors.orange),
              const SizedBox(height: 10),
              Text(
                categories[index]['title'],
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
