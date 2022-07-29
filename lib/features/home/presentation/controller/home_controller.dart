
import 'package:bazar/features/home/application/home_service.dart';
import 'package:bazar/features/home/application/home_service_impl.dart';
import 'package:bazar/features/home/presentation/state/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = StateNotifierProvider<HomeController,HomeState>((ref) {
  
  final homeService = ref.watch(homeServiceProvider);

  return HomeController(homeService, const HomeState());
});

class HomeController extends StateNotifier<HomeState> {
  final HomeService _homeService;
  HomeController(this._homeService, super.state);

  void getProducts() async {

    final  Map<String,dynamic> query = {'perPage':5,'pageNumber':1};

    final result = await _homeService.getProducts(query);
    result.when(
      (error) => state = state.copyWith(products: AsyncValue.error(error)), 
      (success) => state = state.copyWith(products: AsyncValue.data(success)),
    );
  }

}
