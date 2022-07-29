

import 'package:bazar/features/category/application/category_service.dart';
import 'package:bazar/features/category/application/category_service_impl.dart';
import 'package:bazar/features/category/presentation/state/category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryControllerProvider = StateNotifierProvider<CategoryController,CategoryState>((ref) {
  final brandService = ref.watch(categoryServiceProvider);
  
  return CategoryController(brandService, const CategoryState());
});

class CategoryController extends StateNotifier<CategoryState> {
  final CategoryService _categoryService;

  CategoryController(this._categoryService, super.state);

  void getCategories() async {
    final result = await _categoryService.getCategories();
    result.when(
      (error) => state = state.copyWith(categories: AsyncValue.error(error)), 
      (success) {
        state = state.copyWith(
          categoryList: success,
          categories: AsyncValue.data(success),
        );

      } 
    );

  }
  
}