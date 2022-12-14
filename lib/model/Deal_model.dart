class DealModel{
  String ?name;
  int ?availableQuantity;
  int?id;
  String ?address;
  int ? currentPrice;
  int ? oldPrice;
  bool? isFavourite;
  bool? inCart;
  int?quantityInCart;
  DealModel(
      {this.name,
      this.availableQuantity,
      this.address,
      this.currentPrice,
      this.oldPrice,
      this.isFavourite,
        this.quantityInCart,
        this.id,
      this.inCart});

}