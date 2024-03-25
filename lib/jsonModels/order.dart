class Order {
  final int? orderId;
  final String itemName;
  final double price;
  final String size;
  final int quantity;

  Order({
    this.orderId,
    required this.itemName,
    required this.price,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'price': price,
      'size': size,
      'quantity': quantity,
    };
  }
}