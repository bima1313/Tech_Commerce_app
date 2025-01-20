import 'package:e_commerce/data/models/orders.dart';
import 'package:e_commerce/data/models/products.dart';

Iterable<Products> getProducts({
  required Orders getData,
  required Iterable<Products> fromData,
}) {
  final lengthData = getData.orders.length;
  List<Products> productList = [];
  for (var i = 0; i < lengthData; i++) {
    final name = getData.orders.keys.elementAt(i);
    final getProducts = fromData.where((element) {
      return element.name == name;
    }).first;
    productList.add(getProducts);
  }

  return productList;
}
