

import 'package:bazar/features/brand/data/dto/response/brand_response.dart';

abstract class BrandRepository {
  Future<List<BrandResponse>> getBrands();
}