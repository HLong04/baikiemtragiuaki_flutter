import 'package:labtonghop/model/product.dart';

class Cart{
  final int id;
  final int userId;
  final Product product;
  Cart({required this.id,required this.userId,required this.product});
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] ?? 0,
      product: json['produts'],
      userId: json['userid']
    );
  }
}