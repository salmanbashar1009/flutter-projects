import 'package:crafty_bay_ecommerce/data/model/product_data.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productData
  });

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to( ProductDetailsScreen(productId: productData.id ?? 0,));
      },
      child: Card(
        surfaceTintColor: Colors.white,
        shadowColor: primeColor.withOpacity(0.2),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: SizedBox(
          width: 130,
          child: Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: primeColor.withOpacity(0.1),
                    image:  DecorationImage(
                      image: NetworkImage(productData.image ?? " "),
                        // image: NetworkImage("https://i.pinimg.com/736x/6a/b8/f7/6ab8f71806bd568e4d229658e7e979f6.jpg"),
                        fit: BoxFit.contain
                    )

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(productData.title ?? " ",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey
                      ) ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("\$${productData.price}",style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: primeColor,
                        ),),
                         Wrap(
                          children: [
                            Icon(Icons.star,size: 15,color: Colors.amber,),
                            Text(productData.star.toString(),style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),),

                          ],
                        ),
                        Card(
                          color: primeColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(Icons.favorite_outline,size: 12,color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}