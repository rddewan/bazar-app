

import 'package:bazar/core/base/base_service.dart';
import 'package:bazar/core/base_url_provider.dart';
import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/category/application/category_service.dart';
import 'package:bazar/features/category/data/dto/response/category_response.dart';
import 'package:bazar/features/category/data/repository/category_repository.dart';
import 'package:bazar/features/category/data/repository/category_repository_impl.dart';
import 'package:bazar/features/category/domain/mapper/category_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:bazar/features/category/domain/model/category_model.dart';
import 'package:bazar/common/extension/string_to_bool.dart';


final categoryServiceProvider = Provider<CategoryService>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  final baseService = ref.watch(baseServiceProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return CategoryServiceImpl(categoryRepository,baseService,baseUrl);

});
class CategoryServiceImpl implements CategoryService, CategoryModelMapper{
  final CategoryRepository _categoryRepository;
  final BaseService _baseService;
  final String _baseUrl;

  CategoryServiceImpl(this._categoryRepository, this._baseService, this._baseUrl);

  @override
  Future<Result<Failure, List<CategoryModel>>> getCategories() async{
    
    final result = await _baseService.call<Failure,List<CategoryModel>>(() async {

      final data = await _categoryRepository.getCategories()
      .then((value) => mapToCategoryModel(value));

        return Success(data);
    });

    return result;
    
  }

  @override
  List<CategoryModel> mapToCategoryModel(List<CategoryResponse> response) {
    return response.map((e) => CategoryModel(
      id: e.id, 
      name: e.name, 
      description: e.description, 
      thumbnail: '$_baseUrl${e.thumbnail}', 
      image: '$_baseUrl${e.image}', 
      isActive: e.isActive.parseBool(),
    )).toList();
  }
  
}