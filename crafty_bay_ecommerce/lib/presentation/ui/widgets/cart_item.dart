import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 115,
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.15),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade200),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 110,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/shoe.png",
                        ),
                        fit: BoxFit.contain,
                        alignment: Alignment.center)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Year Special Offer!",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                              RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      style: smallTextStyle(Colors.black45),
                                      children: const [
                                        TextSpan(text: "Color: Red  "),
                                        TextSpan(text: "Size: XL"),
                                      ]))
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_forever,
                            size: 30,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "\$100",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        const Spacer(),
                        CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue: 1,
                            value: 1,
                            onChange: (newValue) {
                              int quantity = newValue;
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
