import 'package:flutter/material.dart';

class ProduitFormulaire extends StatefulWidget {
  const ProduitFormulaire({super.key});

  @override
  State<ProduitFormulaire> createState() => _ProduitFormulaireState();
}

class _ProduitFormulaireState extends State<ProduitFormulaire> {
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              Text('Ajouter un Produits', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _nom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Nom du produits",
                  hintText: "Donner le nom du produit",
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Prix du produits",
                  hintText: "Donner le prix du produit",
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                maxLines: 4,
                keyboardType: TextInputType.text,
                controller: _description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Description",
                  hintText: "Donner le description du produit",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed:(){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text("Enregistrer")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
