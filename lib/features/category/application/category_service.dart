
import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/category/domain/model/category_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class CategoryService {
  Future<Result<Failure,List<CategoryModel>>> getCategories();

}