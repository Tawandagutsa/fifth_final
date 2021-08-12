import 'package:flutter/material.dart';
import 'package:fifth/data/data.dart';
import './search_bar.dart';
import './cart.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'QuickBite',
                style: TextStyle(fontSize: 28.0, height: 1),
              ),
              Cart(numberOfItemsInCart: Data.numberOfItemsInCart),
            ],
          ),
          Text(
            'What food would you want..',
            style: TextStyle(fontSize: 15.0, height: 2, color: Colors.black38),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
