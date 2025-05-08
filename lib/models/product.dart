class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.description = 'Premium quality product with 1-year warranty',
    this.rating = 4.5,
  });
}
