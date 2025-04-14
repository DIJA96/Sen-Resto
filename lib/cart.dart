import 'package:flutter/material.dart';
import 'package:sen_restau/cart_manager.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = CartManager().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
        actions: [Icon(Icons.more_vert)],
      ),
      body: cart.isEmpty
          ? Center(child: Text("Votre panier est vide 😢"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        height: 100,
                        child: Card(
                          child: ListTile(
                            leading: Image.asset(item['image'], width: 50),
                            title: Text(item['name'], style: TextStyle(color: Colors.green),),
                            subtitle: Text('${item['price']} FCFA'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      CartManager().decreaseQuantity(index);
                                    });
                                  },
                                ),
                                Text('${item['quantity']}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      CartManager().increaseQuantity(index);
                                    });
                                  },
                                ),
                                IconButton(
                                icon: Icon(Icons.delete, color: Colors.red), // Ajoute une couleur rouge à l'icône
                                onPressed: () {
                                  setState(() {
                                    CartManager().removeItem(index); // Supprime l'article à l'index donné
                                  });
                                },
                              ),
                        
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      Text(
                        "${CartManager().total.toStringAsFixed(0)} FCFA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
