import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/data/model/slider_data.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});

  final List<SliderData> sliders;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              height: 94,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: primeColor,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Image.network(sliderData.image ?? " ",fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                      Positioned(
                        left:20,
                        top: 20,
                        child: SizedBox(
                          width: 120,
                          child: Text(
                            sliderData.title ?? " ",
                            style: mediumTextStyle(Colors.black45),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < 5; i++) {
              list.add(Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: primeColor),
                    borderRadius: BorderRadius.circular(25),
                    color: value == i ? primeColor : null),
              ));
            }
            return Row(
                mainAxisAlignment: MainAxisAlignment.center, children: list);
          },
        ),
      ],
    );
  }
}
