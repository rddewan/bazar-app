import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@immutable
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required  int id,
    required  int categoryId,
    required  int brandId,
    required  String sku,
    required  String name,
    required  String shortDescription,
    required  String longDescription,
    required  String thumbnail,
    required  String images,
    required  int isActive,
    DateTime? deletedAt,
    required  DateTime createdAt,
    required  DateTime updatedAt,
  }) = _ProductModel;

  
}