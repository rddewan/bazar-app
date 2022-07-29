import 'package:bazar/features/home/data/dto/response/product/product_response.dart';

abstract class HomeRepository {
  Future<ProductResponse> getProducts(Map<String,dynamic>  query);
  
}