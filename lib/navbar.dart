import 'package:flutter/material.dart';
import 'package:sen_restau/acceuil.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final pages = [
    Acceuil()
  ];

  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                                        
      body: pages[pageindex],

      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        selectedIndex: pageindex,
        onDestinationSelected: (int index) {
          setState(() {
            pageindex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home,color: pageindex==0 ? Colors.green:Colors.black),
            label: "Acceuil"
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart,color: pageindex==1 ? Colors.green:Colors.black),
            label: "Panier",
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_emergency_outlined,color: pageindex==2 ? Colors.green:Colors.black),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}
