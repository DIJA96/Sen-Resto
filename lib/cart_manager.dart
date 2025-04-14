class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() => _instance;

  CartManager._internal();

  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  double get total {
    return _cart.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  void addItem(Map<String, dynamic> product) {
    final existingIndex = _cart.indexWhere((item) => item['name'] == product['name']);
    if (existingIndex != -1) {
      _cart[existingIndex]['quantity']++;
    } else {
      _cart.add({...product, 'quantity': 1});
    }
  }

  void removeItem(int index) {
    _cart.removeAt(index);
  }

  void increaseQuantity(int index) {
    _cart[index]['quantity']++;
  }

  void decreaseQuantity(int index) {
    if (_cart[index]['quantity'] > 1) {
      _cart[index]['quantity']--;
    }
  }
}
