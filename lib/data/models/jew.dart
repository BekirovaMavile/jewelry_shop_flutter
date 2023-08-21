enum JewType { all, ring, earring, watch, bracelet, pendant, brooch }

class Jew {
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  JewType type;
  int voter;
  bool cart;


  Jew(
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.isFavorite,
      this.description,
      this.score,
      this.type,
      this.voter,
      this.cart
      );
}