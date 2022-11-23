import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/61jnRJpgZOS._UL1400_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/61MnRVjOZWL._UL1500_.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/616zTSviLpL._UL1100_.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Perfume',
      description: 'Prepare any meal you want.',
      price: 29.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/51DIAGGOkkL._SL1000_.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Mask',
      description: 'Prepare any meal you want.',
      price: 24.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/71zf2KmDHKL._UL1500_.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Begs',
      description: 'Prepare any meal you want.',
      price: 43.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/71cQi9+9KCL._SL1100_.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Watch',
      description: 'Prepare any meal you want.',
      price: 34.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/41QNXmhy9CL.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Goggles',
      description: 'Prepare any meal you want.',
      price: 43.99,
      imageUrl:
      'https://m.media-amazon.com/images/S/stores-image-uploads-eu-prod/3/AmazonStores/A21TJRUUN4KGV/acaaaf7ffaddfb9ca24580c48990bd3b.w1500.h750._CR0%2C0%2C1500%2C750_SX1500_.jpg',
    ),

  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct () {
    // _items.add(value);
    notifyListeners();
  }
}