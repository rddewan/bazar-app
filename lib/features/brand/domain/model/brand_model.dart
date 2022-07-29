
import 'package:freezed_annotation/freezed_annotation.dart';


part 'brand_model.freezed.dart';

@freezed
@immutable
class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    required bool isActive,

  }) = _BrandModel;

}