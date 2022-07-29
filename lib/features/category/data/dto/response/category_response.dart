
import 'package:freezed_annotation/freezed_annotation.dart';


part 'category_response.freezed.dart';
part 'category_response.g.dart';


@freezed
@immutable
abstract class CategoryResponse with _$CategoryResponse {
    @JsonSerializable()
    const factory CategoryResponse({
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
    }) = _CategoryResponse;

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
}