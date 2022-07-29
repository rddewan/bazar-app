

import 'package:bazar/core/base/base_repository.dart';
import 'package:bazar/features/home/data/dto/response/product/product_response.dart';
import 'package:bazar/features/home/data/remote_service/home_api_service.dart';
import 'package:bazar/features/home/data/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  
  final homeApiService = ref.watch(homeApiServiceProvider);
  final baseRepository = ref.watch(baseRepositoryProvider);
  
  return HomeRepositoryImpl(homeApiService,baseRepository);

});

class HomeRepositoryImpl extends HomeRepository {
  final HomeApiService _homeApiService;
  final BaseRepository _baseRepository;
  HomeRepositoryImpl(this._homeApiService, this._baseRepository);
  

  @override
  Future<ProductResponse> getProducts(Map<String, dynamic> query) {

    return _baseRepository.call<ProductResponse>(
      () => _homeApiService.getProducts(query),
    );
  }
}