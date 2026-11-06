import 'package:flutter/material.dart';
import 'package:untitled/component.dart';

class Details extends StatelessWidget {
  final Product product;
  const Details({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Details page", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Card(
          color: const Color.fromARGB(255, 206, 186, 150),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
              child: Icon(product.icon, color: Colors.deepPurple),
            ),
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 10),
                Text(product.rate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
