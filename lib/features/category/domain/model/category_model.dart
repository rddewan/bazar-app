
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';

@freezed
@immutable
class CategoryModel with _$CategoryModel{
  const factory CategoryModel({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,    
    required bool isActive,

  }) = _CategoryModel;

}