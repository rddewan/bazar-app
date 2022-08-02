

import 'package:bazar/core/base/base_service.dart';
import 'package:bazar/core/base_url_provider.dart';
import 'package:bazar/core/error/failure.dart';
import 'package:bazar/features/home/application/home_service.dart';
import 'package:bazar/features/home/data/dto/response/product/product_response.dart';
import 'package:bazar/features/home/data/repository/home_repository.dart';
import 'package:bazar/features/home/data/repository/home_repository_impl.dart';
import 'package:bazar/features/home/domain/mapper/product_model_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:bazar/features/home/domain/models/product/product_model.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  final baseService = ref.watch(baseServiceProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return HomeServiceImpl(homeRepository, baseService, baseUrl);
  
});

class HomeServiceImpl implements HomeService, ProductModelMapper {
  final HomeRepository _homeRepository;
  final BaseService _baseService;
  final String _baseUrl;

  HomeServiceImpl(this._homeRepository, this._baseService, this._baseUrl);

  @override
  Future<Result<Failure, List<ProductModel>>> getProducts(Map<String, dynamic> query) async {
    
    final result = await _baseService.call<Failure,List<ProductModel>>(() async {

      final data =  await _homeRepository.getProducts(query)
        .then((value) => mapToDeliveryServiceModel(value));

      return Success(data);

    });

    return result;

  }

  @override
  List<ProductModel> mapToDeliveryServiceModel(ProductResponse response) {
    try {
      
      return response.data.map((e) => 
        ProductModel(
          id: e.id, 
          categoryId: int.parse(e.categoryId), 
          brandId: int.parse(e.brandId), 
          sku: e.sku,
          name: e.name, 
          shortDescription: e.shortDescription, 
          longDescription: e.longDescription, 
          thumbnail: '$_baseUrl${e.thumbnail}', 
          images: '$_baseUrl${e.images}', 
          isActive: int.parse(e.isActive), 
          createdAt: e.createdAt, 
          updatedAt: e.updatedAt
        )    
      ).toList();
    } catch (e) {
      rethrow;
    }
  }
  
}