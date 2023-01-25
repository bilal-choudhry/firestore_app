import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products List"),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_outlined), label: Text("0"))
        ],
      ),
    );
  }
}
