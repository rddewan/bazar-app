

import 'package:bazar/features/home/data/dto/response/product/product_response.dart';
import 'package:bazar/features/home/domain/models/product/product_model.dart';

abstract class ProductModelMapper {
  List<ProductModel> mapToDeliveryServiceModel(ProductResponse response);
}