
import 'package:you_got_served/models/restaurant_model.dart';
import 'meal_model.dart';

final List<Meal> meals =[
  Meal(
    name: 'Banku with Okro Stew',
    imageUrl: 'assets/images/user0.png',
    price: 15.00,
    restaurantName: restaurants[0].name,
  ),
  Meal(
    name: 'Fufu with Aponkye Nkrakra',
    imageUrl: 'assets/images/user1.png',
    price: 20.00,
    restaurantName: restaurants[1].name
  ),
  Meal(
    name: 'Jollof Rice and Chiken',
    imageUrl: 'assets/images/user3.png',
    price: 10.00,
    restaurantName: restaurants[2].name
  )
];


final List<Restaurant> restaurants =[
  Restaurant(
    name: 'Sag',
    imageUrl: 'assets/images/post1.jpg',
    location:'Tarkwa - Station',
  ),
  Restaurant(
    name: 'Lonji',
    imageUrl: 'assets/images/post1.jpg',
    location: 'Tarkwa - Efuanta',
  ),
  Restaurant(
    name: 'T-Pauls',
    imageUrl: 'assets/images/post1.jpg',
    location: 'Tarkwa - Bankyim',
  )
];