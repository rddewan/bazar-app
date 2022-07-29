

import 'package:bazar/core/base/base_repository.dart';
import 'package:bazar/features/category/data/dto/response/category_response.dart';
import 'package:bazar/features/category/data/remote_service/category_api_service.dart';
import 'package:bazar/features/category/data/repository/category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {

  final categoryApiService = ref.watch(categoryApiServiceProvider);
  final baseRepository = ref.watch(baseRepositoryProvider);

  return CategoryRepositoryImpl(categoryApiService,baseRepository);

});

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryApiService _categoryApiService;
  final BaseRepository _baseRepository;

  CategoryRepositoryImpl(this._categoryApiService, this._baseRepository);
  
  @override
  Future<List<CategoryResponse>> getCategories() {
    return _baseRepository.call(() => _categoryApiService.getCategory());
    
  }
  
}