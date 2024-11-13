import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductListScreen extends StatefulWidget {
  const NewProductListScreen({super.key});

  @override
  State<NewProductListScreen> createState() => _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {
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
        title:  Text("New",style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w700)),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<NewProductListController>(
          builder: (newProductListController) {
            if(newProductListController.getNewProductsInProgress){
              return const Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor: primeColor,),);
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 16,
              ),
              itemCount: newProductListController.productListModel.data?.length ?? 0,
              itemBuilder: (context,index){
                return  FittedBox(child: ProductCard(productListData: newProductListController.productListModel.data![index],));
              },
            );
          }
        ),
      )
    );
  }
}
