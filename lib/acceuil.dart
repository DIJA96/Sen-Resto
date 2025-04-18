import 'package:flutter/material.dart';
import 'details.dart'; // Assure-toi que ce fichier est bien importé

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
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home, color: Colors.green),
              title: Text("Acceuil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.green),
              title: Text("Panier"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency, color: Colors.green),
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
            SizedBox(height: 22),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
                childAspectRatio: 0.75,
                children: products.map((product) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 100,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                    image: product['image'],
                                    name: product['name'],
                                    price: product['Price'],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              product['image'],
                              height: 150,
                              width: 1000,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                    image: product['image'],
                                    name: product['name'],
                                    price: product['Price'],
                                  ),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            child: Text(
                              product['name'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            "${product['Price']} FCFA",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.red,
                                ),
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
