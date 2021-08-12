import 'package:flutter/material.dart';
import 'package:fifth/screens/category_widget/furniture_grid_item.dart';
import 'package:fifth/screens/category_widget/header_sliver.dart';
import '../data/data.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSliver(
                minExtent: 120,
                maxExtent: 120,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: Data.furniture.asMap().entries.map((f) {
                return FurnitureGridItem(
                    item: f.value,
                    margin: EdgeInsets.only(
                      left: f.key.isEven ? 16 : 0,
                      right: f.key.isOdd ? 16 : 0,
                    ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
