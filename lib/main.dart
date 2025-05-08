import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:ecommerce_app/screens/categories_screen.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/orders_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/screens/settings_screen.dart';
import 'package:ecommerce_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/product_screen.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange[800],
          secondary: Colors.orange[600],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[800],
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductScreen(),
        '/cart': (context) => const CartScreen(),
        '/account': (context) => const AccountScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/search': (context) => const SearchScreen(),
        '/categories': (context) => const CategoriesScreen(),
      },
    );
  }
}
