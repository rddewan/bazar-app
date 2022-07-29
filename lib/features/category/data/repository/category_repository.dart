

import 'package:bazar/features/category/data/dto/response/category_response.dart';

abstract class CategoryRepository {
  Future<List<CategoryResponse>> getCategories();
}