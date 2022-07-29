

import 'package:bazar/core/remote/network_service.dart';
import 'package:bazar/features/category/data/dto/response/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';


part 'category_api_service.g.dart';

final categoryApiServiceProvider = Provider<CategoryApiService>((ref) {

  final dio = ref.watch(networkServiceProvider);
  return CategoryApiService(dio);

});

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio) => _CategoryApiService(dio);

  @GET('api/v1/category/getCategories')
  Future<List<CategoryResponse>> getCategory();

}