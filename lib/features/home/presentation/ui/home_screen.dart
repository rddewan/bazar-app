import 'package:bazar/core/base/base_async_value_widget.dart';
import 'package:bazar/features/brand/presentation/controller/brand_controller.dart';
import 'package:bazar/features/brand/presentation/ui/brand_screen.dart';
import 'package:bazar/features/category/domain/model/category_model.dart';
import 'package:bazar/features/category/presentation/controller/category_controller.dart';
import 'package:bazar/features/category/presentation/ui/category_screen.dart';
import 'package:bazar/features/home/presentation/controller/home_controller.dart';
import 'package:bazar/features/home/presentation/ui/widget/product_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
 
  @override
  void initState() {    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeControllerProvider.notifier).getProducts(); 
      ref.read(categoryControllerProvider.notifier).getCategories();
      ref.read(brandControllerProvider.notifier).getBrands();  
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:  const Padding(
        padding:  EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ProductScreen(),
            ),
            SliverToBoxAdapter(
              child: CategoryScreen(),
            ),
            SliverToBoxAdapter(
              child: BrandScreen(),
            ),

            
            
            
           
            
          ],

        ),
      ),
    );
  }
}