import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_response.freezed.dart';
part 'product_response.g.dart';


@immutable
@freezed
class ProductResponse with _$ProductResponse {
  @JsonSerializable()
  const factory ProductResponse({
    @Default(0)
    @JsonKey(name: 'current_page')
    int currentPage,
    @Default([])
    List<Data> data,
    @JsonKey(name: 'first_page_url')
    String? firstPageUrl,
    @Default(0)
    int from,
    @Default(0)
    @JsonKey(name: 'last_page')
    int lastPage,
    @JsonKey(name: 'last_page_url')
    String? lastPageUrl, 
    @JsonKey(name: 'next_page_url')   
    String? nextPageUrl,    
    @Default(0)
    @JsonKey(name: 'per_page')
    int perPage,
    @JsonKey(name: 'prev_page_url')
    String? prevPageUrl,
    @Default(0)
    int to,
    @Default(0)
    int total,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
}

@immutable
@freezed
class Data with _$Data {  
  @JsonSerializable()
  const factory Data({
    required  int id,
    @JsonKey(name: 'category_id')
    required  String categoryId,
    @JsonKey(name: 'brand_id')
    required  String brandId,
    required  String sku,
    required  String name,
    @JsonKey(name: 'short_description')
    required  String shortDescription,
    @JsonKey(name: 'long_description')
    required  String longDescription,
    required  String thumbnail,
    required  String images,
    @JsonKey(name: 'is_active')
    required  String isActive,
    @JsonKey(name: 'deleted_at')
    DateTime? deletedAt,
    @JsonKey(name: 'created_at')
    required  DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required  DateTime updatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

