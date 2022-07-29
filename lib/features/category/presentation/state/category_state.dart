
import 'package:bazar/features/category/domain/model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
@immutable
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(AsyncValue.loading())
    AsyncValue<List<CategoryModel>> categories,
    @Default([])
    List<CategoryModel> categoryList,

  }) = _CategoryState;
}