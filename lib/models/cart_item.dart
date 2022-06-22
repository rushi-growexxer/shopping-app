class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  bool addedToCart;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      this.addedToCart = false});
}
