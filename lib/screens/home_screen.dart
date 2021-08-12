import 'package:flutter/material.dart';
import '../data/data.dart';

import '../widgets/category_card.dart';
import '../widgets/header_main.dart';
import '../widgets/image_card.dart';
import '../widgets/promo_card.dart';
import '../widgets/section.dart';
import './category_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (Data.categories.isEmpty && Data.promotions.isEmpty) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context, listen: false)
          .fetchAndSetEverything(context)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
        super.didChangeDependencies();
      });
    }
  }

  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Section(
                      'Categories',
                      Data.categories.map((c) {
                        return CategoryCard(
                          title: c.title,
                          iconPath: c.iconPath,
                          onTap: () {
                            onCategorySelected(c);
                          },
                        );
                      }).toList(),
                    ),
                    Section(
                      'Today\'s Promo',
                      Data.promotions.map((p) {
                        return PromoCard(
                          title: p.title,
                          subtitle: p.subtitle,
                          tag: p.tag,
                          caption: p.caption,
                          imagePath: p.imagePath,
                          backgroundImagePath: p.backgroundImagePath,
                        );
                      }).toList(),
                    ),
                    Section(
                        'Popular Dishes',
                        Data.trending
                            .map((imagePath) => ImageCard(imagePath))
                            .toList()),
                    Section(
                        'Porpular Restaurants',
                        Data.featured
                            .map((imagePath) => ImageCard(imagePath))
                            .toList()),
                  ],
                ),
              ),
      ),
    );
  }
}
