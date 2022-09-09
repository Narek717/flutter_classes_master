class ProductsModel {
  String? productName;
  int? price;
  String? type;
  bool? isAvailable;
  List<String>? materials;

  ProductsModel({
    this.productName,
    this.price,
    this.type,
    this.isAvailable,
    this.materials,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    type = json['type'];
    isAvailable = json['is_available'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['type'] = this.type;
    data['is_available'] = this.isAvailable;
    data['materials'] = this.materials;
    return data;
  }
}
