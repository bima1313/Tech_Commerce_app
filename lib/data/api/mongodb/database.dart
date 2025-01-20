import 'package:e_commerce/api_key/keys.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db;

Future<Iterable<Products>> fetchDatabase() async {
  final db = await Db.create(mongoDBKey);
  await db.open();
  final userCollection = db.collection('products');
  final data = await userCollection.find().toList();
  await db.close();

  return data.map((product) => Products.fromDatabase(product));
}
