import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Food Delivery',

        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // Categories
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryItem('Pizza', Icons.local_pizza),
                _buildCategoryItem('Burgers', Icons.fastfood),
                _buildCategoryItem('Desserts', Icons.cake),
              ],
            ),
          ),
          // Popular Items
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of items
              itemBuilder: (context, index) {
                return _buildFoodItem('Food Item $index', 4, 15);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String name, double rating, double price) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.fastfood, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
            ),
            SizedBox(width: 10),
            Text('\$$price'),
          ],
        ),
        trailing: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
