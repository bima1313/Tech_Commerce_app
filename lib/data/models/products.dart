import 'package:flutter/foundation.dart' show immutable;

@immutable
class Products {
  final int rank;
  final String id;
  final String name;
  final double price;
  final double starRating;
  final int numRatings;
  final String productUrl;
  final String image;
  final String description;
  final String category;

  const Products({
    required this.rank,
    required this.id,
    required this.name,
    required this.price,
    required this.starRating,
    required this.numRatings,
    required this.productUrl,
    required this.image,
    required this.description,
    required this.category,
  });

  factory Products.fromDatabase(Map<String, dynamic> database) => Products(
      rank: database['rank'],
      id: database['asin'],
      name: database['product_title'],
      price: database['product_price'],
      starRating: database['product_star_rating'],
      numRatings: database['product_num_ratings'],
      productUrl: database['product_url'],
      image: database['product_photo'],
      description: database['description'],
      category: database['category']);
}
