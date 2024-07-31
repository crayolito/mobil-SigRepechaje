import 'package:card_swiper/card_swiper.dart';
import 'package:distrito7_mobile/shared/widgets/imageNetworkPersonalized.dart';
import 'package:flutter/material.dart';

// onTap: () {
//         Navigator.pushNamed(context, '/imageVR360', arguments: {
//           'url':
//               "https://res.cloudinary.com/da9xsfose/image/upload/v1710256525/mvgwct3rojmhmh7vslln.jpg"
//         });
//       }

class ImagesSwiper extends StatelessWidget {
  const ImagesSwiper({
    required this.height,
    required this.width,
    required this.images,
    super.key,
    this.margin,
    this.decoration,
  });

  final double height;
  final double width;
  final List<String> images;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration,
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Swiper(
          itemCount: images.length,
          autoplay: true,
          duration: 500,
          autoplayDelay: 4000,
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: const BoxDecoration(),
              child: ImageNetPersonalized(urlImage: images[index]),
            );
          },
        ),
      ),
    );
  }
}
