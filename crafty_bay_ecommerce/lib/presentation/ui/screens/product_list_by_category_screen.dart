
import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/catergory_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key, this.categoryId, this.productListModel});

  final int? categoryId;
  final ProductListModel? productListModel;

  @override
  State<ProductListByCategoryScreen> createState() => _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState extends State<ProductListByCategoryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(widget.categoryId != null){
        Get.find<CategoryProductListController>().getProductByCategory(widget.categoryId!);
      }else if(widget.productListModel != null){
        Get.find<CategoryProductListController>().setProducts(widget.productListModel!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(onPressed: (){
            Get.find<MainBottomNavBarController>().backToHome();
            Get.back();
          }, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        title:  Text("All Products",style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w700)),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<CategoryProductListController>(
          builder: (categoryProductListController) {
            if(categoryProductListController.categoryProductListInProgress){
              return const Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor: primeColor,),);
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 16,
              ),
              itemCount: categoryProductListController.categoryProductListModel.data?.length ?? 0,
              itemBuilder: (context,index){
                return  FittedBox(child: ProductCard(productData: categoryProductListController.categoryProductListModel.data![index],));
              },
            );
          }
        ),
      )
    );
  }
}
