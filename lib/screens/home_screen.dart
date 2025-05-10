import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  static const List<Product> products = [
    Product(
      id: '1',
      title: 'Wireless Headphones',
      price: 99.99,
      imageUrl:
          'https://images.pexels.com/photos/1649771/pexels-photo-1649771.jpeg',
    ),
    Product(
      id: '2',
      title: 'Smart Watch Series 5',
      price: 199.99,
      imageUrl:
          'https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg',
    ),
  ];

  static const List<String> bannerImages = [
    'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg',
    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg',
  ];

  static const List<String> categories = [
    'Electronics',
    'Fashion',
    'Home',
    'Sports',
    'Books',
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Commerce'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Welcome!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Account'),
              onTap: () => Navigator.pushNamed(context, '/account'),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Order History'),
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Wishlist'),
              onTap: () => Navigator.pushNamed(context, '/wishlist'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () => Navigator.pushNamed(context, '/categories'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                authProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onSubmitted: (value) {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: bannerImages.map((url) {
                  return CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ActionChip(
                              label: Text(categories[index]),
                              backgroundColor: Colors.orange[100],
                              onPressed: () {
                                // Navigate to category-specific screen
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (ctx, i) => ProductCard(product: products[i]),
                  childCount: products.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
