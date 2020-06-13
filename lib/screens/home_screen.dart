import 'package:flutter/material.dart';
import 'package:you_got_served/models/static_data.dart';
import 'package:you_got_served/screens/widgets/meal_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    Widget _buildAppBar(){
      return AppBar(
        backgroundColor: Color(0xFFEDF0F6),
        title: Text(
          'You Got Served',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            onPressed: () => print('search Feature'),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            iconSize: 30.0,
            onPressed: () => print('search Feature'),
          ),
        ],
        leading: Icon(Icons.fastfood),
      );
    }

    Widget _buildBottomNavBar(){
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 24.0,
                color: Colors.black,
              ),
              title: SizedBox.shrink()
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
                size: 24.0,
                color: Colors.grey,
              ),
              title: SizedBox.shrink()
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 24.0,
                color: Colors.grey,
              ),
              title: SizedBox.shrink()
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 24.0,
                color: Colors.grey,
              ),
              title: SizedBox.shrink()
            ),
          ],
        );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      appBar: _buildAppBar(),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          MealWidget(meal: meals[0]),
          MealWidget(meal: meals[1]),
          MealWidget(meal: meals[2]),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
