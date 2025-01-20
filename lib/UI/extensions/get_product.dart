import 'package:e_commerce/data/enums/product_data.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:intl/intl.dart';

extension GetProduct on int {
  dynamic ofProduct(Iterable<Products>? data, ProductData productData) {
    final product = data!.elementAt(this);
    if (productData == ProductData.productName) {
      return product.name;
    } else if (productData == ProductData.price) {
      final currency = NumberFormat.currency(symbol: "\$");
      return currency.format(product.price).toString();
    } else if (productData == ProductData.starRating) {
      return product.starRating.toString();
    } else {
      return product.image;
    }
  }
}
