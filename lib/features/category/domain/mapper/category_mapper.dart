

import 'package:bazar/features/category/data/dto/response/category_response.dart';
import 'package:bazar/features/category/domain/model/category_model.dart';

abstract class CategoryModelMapper {
  List<CategoryModel> mapToCategoryModel(List<CategoryResponse> response);
}