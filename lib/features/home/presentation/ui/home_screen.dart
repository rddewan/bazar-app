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
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [

            const SliverToBoxAdapter(
              child: Text(
                'Brand',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
           
            Consumer(
              builder: (context, ref, child) {
                final  data = ref.watch(brandControllerProvider.select((value) => value.brandList));
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:((context,index) {
                        final brand = data[index];
                        
                        return Card(
                          child: Column(
                            children: [
                              Image.network(brand.thumbnail),
                              Text(brand.name)
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },            
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16,)),
            const SliverToBoxAdapter(
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),

            Consumer(
              builder: (context, ref, child) {
                final data = ref.watch(categoryControllerProvider.select((value) => value.categoryList));
                return SliverGrid(
                  delegate:SliverChildBuilderDelegate((context,index) {
                    final category = data[index];
                    
                    return Card(
                      child: Column(
                        children: [
                          Image.network(category.thumbnail),
                          Text(category.name)
                        ],
                      ),
                    );
                  },                
                  childCount: data.length,),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8
                  ),
                );
              },            
            ),

          ],

        ),
      ),
    );
  }
}