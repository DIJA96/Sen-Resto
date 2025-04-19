import 'package:flutter/material.dart';
import 'package:sen_restau/cart.dart';
import 'package:sen_restau/cart_manager.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> products = [
      {'image': 'images/burgger.PNG', 'name': 'Burgger', 'Price': 588},
      {'image': 'images/chawarma.PNG', 'name': 'Chawarma', 'Price': 499},
      {'image': 'images/fataya.PNG', 'name': 'Fataya', 'Price': 390},
      {'image': 'images/logo.PNG', 'name': 'Burgger', 'Price': 20},
      {'image': 'images/sandiwich.PNG', 'name': 'Sandiwich', 'Price': 384},
      {'image': 'images/tacos.PNG', 'name': 'Tacos', 'Price': 164},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home, color: Color.fromARGB(255, 49, 203, 54),),
              title: Text("Acceuil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 49, 203, 54),),
              title: Text("Panier"),
              onTap: () {
                // Navigue vers la page Panier en partageant le CartManager
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cart: CartManager().cart),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency, color: Color.fromARGB(255, 49, 203, 54),),
              title: Text("Contact"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 49, 203, 54),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.red),
                      Text("Creer un produits"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: products.map((product) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 70,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.asset(
                            product['image'],
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 3),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            child: Text(
                              product['name'],
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "${product['Price']} FCFA",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              // Ajoute le produit au CartManager
                              CartManager().addItem({
                                'name': product['name'],
                                'image': product['image'],
                                'price': product['Price'],
                              });

                              // Affiche une confirmation
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${product['name']} ajouté au panier !'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 49, 203, 54),
                              foregroundColor: Colors.white,
                              minimumSize: Size(100, 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.shopping_cart, color: Colors.red),
                                Text("Ajouter au panier"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
