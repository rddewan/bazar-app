
import 'package:bazar/features/home/domain/models/product/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
@immutable
class HomeState with _$HomeState {

  const factory HomeState({
    @Default(AsyncValue.loading())
    AsyncValue<List<ProductModel>> products,
  }) = _HomeState;
}