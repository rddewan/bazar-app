

import 'package:bazar/features/brand/domain/model/brand_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_state.freezed.dart';

@freezed
@immutable
class BrandState with _$BrandState {
  const factory BrandState({
    @Default(AsyncValue.loading())
    AsyncValue<List<BrandModel>> brands,
    @Default([])
    List<BrandModel> brandList,

  }) = _BrandState;
}