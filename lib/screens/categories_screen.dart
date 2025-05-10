import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  }); // Keep constructor const, as it has no fields

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Electronics', 'icon': Icons.electrical_services},
    {'title': 'Fashion', 'icon': Icons.shopping_bag},
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Beauty', 'icon': Icons.spa},
    {'title': 'Sports', 'icon': Icons.sports_baseball},
  ];

  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'), // This can stay const
        backgroundColor: Colors.orange,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16), // This can stay const
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapDown: (_) {
              setState(() {
                _scale = 0.95;
              });
            },
            onTapUp: (_) {
              setState(() {
                _scale = 1.0;
              });
              Navigator.pushNamed(
                context,
                '/category-products',
                arguments: categories[index]['title'],
              );
            },
            onTapCancel: () {
              setState(() {
                _scale = 1.0;
              });
            },
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(
                milliseconds: 100,
              ), // This can stay const
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categories[index]['icon'],
                      size: 40,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 10), // This can stay const
                    Text(
                      categories[index]['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
