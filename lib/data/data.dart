import '../models/category.dart';
import '../models/item.dart';
import '../models/promotion.dart';

class Data {
  static int numberOfItemsInCart = 1;

  static List<Category> categories = [];

  static List<Promotion> promotions = [
    // Promotion(
    //   backgroundImagePath: 'assets/images/splash1.png',
    //   reverseGradient: false,
    //   title: 'For all your burgers \nDiscount Up to',
    //   subtitle: '50%',
    //   tag: '30 September 2021',
    //   imagePath: 'assets/images/furniture/burger_promo.png',
    // ),
    // Promotion(
    //   backgroundImagePath: 'assets/images/splash2.png',
    //   reverseGradient: true,
    //   title: 'Get voucher gift',
    //   subtitle: '\$50.00',
    //   caption: '*for new member\'s\nof Furniture Shop',
    // ),
    // Promotion(
    //   backgroundImagePath: 'assets/images/splash1.png',
    //   reverseGradient: false,
    //   title: 'For all your fries\nDiscount Up to',
    //   subtitle: '50%',
    //   tag: '30 September 2021',
    //   imagePath: 'assets/images/furniture/fries1.png',
    // ),
    // Promotion(
    //   backgroundImagePath: 'assets/images/splash1.png',
    //   reverseGradient: true,
    //   title: 'For all your Shawarma\nDiscount Up to',
    //   subtitle: '50%',
    //   tag: '30 September 2021',
    //   imagePath: 'assets/images/furniture/shwama.png',
    // ),
    // Promotion(
    //   backgroundImagePath: 'assets/images/splash1.png',
    //   reverseGradient: true,
    //   title: 'For all your Vegetables\nDiscount Up to',
    //   subtitle: '50%',
    //   tag: '30 September 2021',
    //   imagePath: 'assets/images/furniture/vegs.png',
    // ),
  ];

  static List<String> trending = [
    'assets/images/furniture/brewery.jpeg',
    'assets/images/furniture/mexican.jpeg',
  ];

  static List<String> featured = [
    'assets/images/furniture/pizza.jpeg',
    'assets/images/furniture/greenpoint.jpeg',
    'assets/images/furniture/ponte_pizza.jpeg',
    'assets/images/furniture/mexican.jpeg'
  ];

  static List<Item> furniture = [
    Item(
      name: 'Chair Dacey li - Black',
      imagePath: 'assets/images/furniture/items/dacey.png',
      originalPrice: 80,
      rating: 4.5,
      discountPercent: 30,
    ),
    Item(
      name: 'Elly Sofa Patchwork',
      imagePath: 'assets/images/furniture/items/elly.png',
      originalPrice: 140,
      rating: 4.4,
      discountPercent: 30,
    ),
    Item(
      name: 'Dobson Table - White',
      imagePath: 'assets/images/furniture/items/table 2.png',
      originalPrice: 160,
      rating: 4.3,
      discountPercent: 25,
    ),
    Item(
      name: 'Nagano Table - Brown',
      imagePath: 'assets/images/furniture/items/ezgif.com-crop.png',
      originalPrice: 140,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - White',
      imagePath: 'assets/images/furniture/items/CHair 2.png',
      originalPrice: 80,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - Feather Grey',
      imagePath: 'assets/images/furniture/items/chair3.png',
      originalPrice: 80,
      rating: 4.0,
      discountPercent: 20,
    ),
  ];
}
