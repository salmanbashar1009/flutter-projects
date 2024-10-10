import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.logoNav,
            ),
            const Spacer(),
            CircularIconButton(icon: Icons.person, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.phone, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.notifications, onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.search,color: primeColor,),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 16,),
              CarouselSlider(
                options: CarouselOptions(
                  height: 160.0,
                  aspectRatio: 16/9,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (int page,_){
                       _selectedSlider.value = page;
                  }
                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: primeColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          alignment: Alignment.center,
                          child: Center(child: Text('text $i', style: const TextStyle(fontSize: 16.0,color: Colors.white),))
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16,),
              ValueListenableBuilder(
                valueListenable: _selectedSlider,
                builder: (context,value,_){
                  List<Widget> list = [];
                  for(int i = 0; i < 5; i++){
                    list.add(Container(
                      width: 14,
                      height: 14,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: primeColor),
                        borderRadius: BorderRadius.circular(25),
                        color: value == i ? primeColor : null
                      ),
                    ));
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: list
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

