import 'package:flutter/widgets.dart';
import 'package:smart_city_app/utils/resources/image_resource.dart';

class LogoRounded extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double radius;

  const LogoRounded({
    super.key,
    this.width = 250,
    this.height,
    this.fit,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        ImageResource.logo,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
