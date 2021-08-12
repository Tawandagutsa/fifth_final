import 'package:fifth/data/data.dart';
import 'package:fifth/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/category.dart';
import '../models/promotion.dart';

class Products with ChangeNotifier {
  final authToken;
  // List<Category> categories = [];
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Lasagna',
    //   description: 'Lasagna is good!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://www.jessicagavin.com/wp-content/uploads/2017/07/meat-lasagna-1200.jpg',
    // ),
    // Product(
    //     id: 'p2',
    //     title: 'Rice',
    //     description: 'Rice is good!',
    //     price: 59.99,
    //     imageUrl:
    //         'https://www.jessicagavin.com/wp-content/uploads/2020/03/how-to-cook-rice-16-1200.jpg'),
    // Product(
    //   id: 'p3',
    //   title: 'Mac&cheese',
    //   description: 'Mac & cheese is good!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://www.willcookforsmiles.com/wp-content/uploads/2019/01/mac-and-cheese-5.jpg',
    // ),
  ];
  Products(this.authToken, this._items);
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetEverything(BuildContext context) async {
    await fetchAndSetCategories(context);
    await fetchAndSetPromo(context);
  }

  Future<void> fetchAndSetCategories(BuildContext context) async {
    Data.categories.clear();
    final url =
        'https://fifth-api.herokuapp.com/api/v1/restaurant1/products/categories';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.body == null) {
        return;
      }
      // print(response.body);
      var categories = json.decode(response.body) as Map<String, dynamic>;
      // print(categories);
      categories.forEach((catId, catData) {
        Data.categories.add(Category(
          catData['imagePath'],
          catData['category'],
        ));
      });
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchAndSetPromo(BuildContext context) async {
    Data.promotions.clear();
    final url =
        'https://fifth-api.herokuapp.com/api/v1/restaurant1/promotions/';

    try {
      final response = await http.get(Uri.parse(url));
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((promoId, promoData) {
        Data.promotions.add(Promotion(
          backgroundImagePath: promoData['backImagePath'],
          reverseGradient: promoData['reverseGradient'],
          title: promoData['title'],
          subtitle: promoData['subtitle'],
          tag: promoData['tag'],
          imagePath: promoData['imagePath'],
        ));
      });
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchAndSetProduct(BuildContext context) async {
    final _signInMode = Provider.of<Auth>(context, listen: false).signInMode;
    final url =
        'https://projectdemo1-53590-default-rtdb.firebaseio.com/products.json?${_signInMode == SignInMode.Email ? "auth" : "access_token"}=$authToken';

    try {
      final response = await http.get(Uri.parse(url));
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['Description'],
          imageUrl: prodData['imageUrl'],
          price: prodData['Price'],
          isFavourite: prodData['isFavorite'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
