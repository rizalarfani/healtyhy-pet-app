import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthypet/providers/beranda_provider.dart';
import 'package:healthypet/utils/color_themes.dart';
import 'package:healthypet/widgets/bottom_widget.dart';
import 'package:healthypet/widgets/card_service_widget.dart';
import 'package:healthypet/widgets/item_category_service_widget.dart';
import 'package:provider/provider.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark));
    final TextEditingController searchControler = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGreetings(),
              const SizedBox(height: 17),
              _buildBannerCard(),
              const SizedBox(height: 18),
              _buildInputSearch(searchControler),
              const SizedBox(height: 20),
              _buildListCategoryService(),
              Consumer<BerandaProvider>(
                builder: (context, state, _) {
                  return ListView.builder(
                    itemCount: state.listServices.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> service = state.listServices[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: CardServiceWidget(
                          name: service['name'],
                          categoryService: service['category'],
                          distance: service['distance'],
                          image: service['image'],
                          isReadyCat: service['isCat'],
                          isReadyDog: service['isDog'],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListCategoryService() {
    return SizedBox(
      height: 40,
      child: Consumer<BerandaProvider>(
        builder: (context, state, _) {
          return ListView.builder(
            itemCount: state.listCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String name = state.listCategory[index];
              return Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: ItemCategoryServiceWidget(
                  name: name,
                  index: index,
                  currentIndex: state.selectedCategory,
                  onPressed: () => state.selectedCategory = index,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInputSearch(TextEditingController searchControler) {
    return SizedBox(
      height: 52,
      child: TextField(
        controller: searchControler,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(246, 246, 246, 1),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'manrope',
            color: Color.fromRGBO(202, 202, 202, 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(173, 172, 173, 1),
          ),
          prefixIconColor: Color.fromRGBO(173, 172, 173, 1),
        ),
      ),
    );
  }

  Widget _buildBannerCard() {
    return Container(
      height: 184,
      decoration: BoxDecoration(
        color: ColorsThemes.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 12.52),
            color: Color.fromRGBO(97, 84, 70, 0.10),
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            child: Image.asset(
              'assets/images/bg_card.png',
              fit: BoxFit.cover,
              height: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 34,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'manrope',
                      height: 150 / 100,
                    ),
                    children: [
                      TextSpan(text: "Your "),
                      TextSpan(
                        text: "Catrine ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'will get \n vaccination ',
                      ),
                      TextSpan(
                        text: "tomorrow \n at 07.00 am! ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 85,
                  height: 36,
                  child: BottomWidget(
                    title: 'See details',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGreetings() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Human!',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              color: ColorsThemes.primaryTextColor,
              fontWeight: FontWeight.w900,
              fontFamily: 'papins',
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'assets/icons/shopping-bag.svg',
                height: 24,
                width: 24,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(239, 100, 151, 1),
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
