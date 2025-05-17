import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductsModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsModel.fromJson(JSON json) => _$ProductsModelFromJson(json);

  JSON toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? rating;
  String? thumbnail;
  List<String>? images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(JSON json) => _$ProductFromJson(json);

  JSON toJson() => _$ProductToJson(this);
}

typedef JSON = Map<String, dynamic>;
