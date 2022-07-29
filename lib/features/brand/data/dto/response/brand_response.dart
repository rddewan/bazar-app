
import 'package:freezed_annotation/freezed_annotation.dart';


part 'brand_response.freezed.dart';
part 'brand_response.g.dart';

@immutable
@freezed
abstract class BrandResponse with _$BrandResponse {
  @JsonSerializable()
  const factory BrandResponse({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,    
    @JsonKey(name: 'is_active')
    required String isActive,
    @JsonKey(name: 'deleted_at')
    DateTime? deletedAt,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _BrandResponse;

  factory BrandResponse.fromJson(Map<String, dynamic> json) => _$BrandResponseFromJson(json);
}
