import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Product> _wishlistItems = [];

  List<Product> get items => _wishlistItems;

  void addToWishlist(Product product) {
    _wishlistItems.add(product);
    notifyListeners();
  }

  void removeFromWishlist(String productId) {
    _wishlistItems.removeWhere((item) => item.id == productId);
    notifyListeners();
  }
}
