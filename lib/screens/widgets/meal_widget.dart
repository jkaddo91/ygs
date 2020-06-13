

import 'package:flutter/material.dart';
import 'package:you_got_served/models/meal_model.dart';

import '../meal_screen.dart';

class MealWidget extends StatelessWidget {

final Meal meal;
MealWidget({this.meal});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Column(
                  children: <Widget>[
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MealScreen(
                            meal: meal,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.width)*(2/3),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(meal.imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    // leading: Container(
                    //   child: Icon(Icons.local_pizza),
                    // ),
                    trailing: Chip(label: Text('GHC ${meal.price}'),elevation: 6, backgroundColor: Colors.blueGrey[400],),
                    title: Text(
                      meal.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(meal.restaurantName),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}