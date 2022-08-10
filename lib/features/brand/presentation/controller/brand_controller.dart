

import 'package:bazar/features/brand/application/brand_service.dart';
import 'package:bazar/features/brand/application/brand_service_impl.dart';
import 'package:bazar/features/brand/presentation/state/brand_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brandControllerProvider = StateNotifierProvider<BrandController,BrandState>((ref) {
  final brandService = ref.watch(brandServiceProvider);
  
  return BrandController(brandService, const BrandState());
});

class BrandController extends StateNotifier<BrandState> {
  final BrandService _brandService;

  BrandController(this._brandService, super.state);

  void getBrands() async {
    final result = await _brandService.getBrands();
    result.when(
      (error) {
        state = state.copyWith(
          brands: AsyncValue.error(error),
          errorMsg: error.message,
        );
      },        
      (success) {
        state = state.copyWith(
          brandList: success,
          brands: AsyncValue.data(success),
        );

      } ,
    );

  }
  
}