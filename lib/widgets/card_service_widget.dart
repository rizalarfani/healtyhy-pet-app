import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthypet/utils/color_themes.dart';

class CardServiceWidget extends StatelessWidget {
  final String? name;
  final String? categoryService;
  final String? distance;
  final String? image;
  final bool? isReadyCat;
  final bool? isReadyDog;

  const CardServiceWidget(
      {super.key,
      this.name,
      this.categoryService,
      this.distance,
      this.image,
      this.isReadyCat,
      this.isReadyDog});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 143,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: 0,
            offset: Offset(0, 2),
            color: Color.fromRGBO(53, 56, 90, 0.1),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image ?? '',
              width: 88,
              height: 103,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'manrope',
                  color: ColorsThemes.primaryTextColor,
                ),
              ),
              Text(
                'Service: $categoryService',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'manrope',
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    size: 14,
                    color: Color.fromRGBO(172, 163, 163, 1),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    distance ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'manrope',
                      color: Color.fromRGBO(172, 163, 163, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Available for',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 204, 152, 1),
                      ),
                    ),
                    Row(
                      children: [
                        isReadyCat != null
                            ? SvgPicture.asset(
                                'assets/icons/whh_cat.svg',
                                height: 12,
                                width: 12,
                              )
                            : Container(),
                        const SizedBox(width: 10),
                        isReadyDog != null
                            ? SvgPicture.asset(
                                'assets/icons/whh_dog.svg',
                                height: 12,
                                width: 12,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
