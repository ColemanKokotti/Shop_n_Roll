import 'package:flutter/material.dart';

class Item {
  final String nameItem;
  final String iconItem;
  final String descriptionItem;

  Item({
    required this.nameItem,
    required this.iconItem,
    required this.descriptionItem,
  });
}

class IconOrImage {
  final IconData? iconData;
  final String? imagePath;

  const IconOrImage({this.iconData, this.imagePath})
      : assert(iconData != null || imagePath != null);

  bool get isIcon => iconData != null;
  bool get isImage => imagePath != null;

  Widget toWidget({double size = 24.0, Color? color}) {
    if (isIcon) {
      return Icon(iconData, size: size, color: color);
    } else if (isImage) {
      return ImageIcon(AssetImage(imagePath!), size: size, color: color);
    }
    return Icon(Icons.error, size: size, color: Colors.red);
  }
}

final Map<String, IconOrImage> iconMap = {
  'phone': IconOrImage(imagePath: 'assets/icons/smartphone.png'),
  'headphones': IconOrImage(imagePath: 'assets/icons/headphones.png'),
  'ice_cream': IconOrImage(imagePath: 'assets/icons/ice_cream.png'),
  'tomato': IconOrImage(imagePath: 'assets/icons/tomato.png'),
  'eggs': IconOrImage(imagePath: 'assets/icons/eggs.png'),
  'cookie': IconOrImage(imagePath: 'assets/icons/cookie.png'),
  'beer': IconOrImage(imagePath: 'assets/icons/beer.png'),
  'water_bottle': IconOrImage(imagePath: 'assets/icons/water_bottle.png'),
  'pasta': IconOrImage(imagePath: 'assets/icons/pasta.png'),
  'juice': IconOrImage(imagePath: 'assets/icons/juice.png'),
  'milk': IconOrImage(imagePath: 'assets/icons/milk_bottle.png'),
  'beef': IconOrImage(imagePath: 'assets/icons/beef.png'),
  'bread': IconOrImage(imagePath: 'assets/icons/bread.png'),
  'cheese': IconOrImage(imagePath: 'assets/icons/cheese.png'),
  'coffee': IconOrImage(imagePath: 'assets/icons/coffee.png'),
  'fish': IconOrImage(imagePath: 'assets/icons/fish.png'),
  'pet_food': IconOrImage(imagePath: 'assets/icons/pet_food.png'),
  'rice': IconOrImage(imagePath: 'assets/icons/rice.png'),
  'toilet_paper': IconOrImage(imagePath: 'assets/icons/toilet_paper.png'),
};

List<String> get iconNames => iconMap.keys.toList();
List<IconOrImage> get iconImageList => iconMap.values.toList();
List<IconData?> get iconsList => iconMap.values.where((item) => item.isIcon).map((item) => item.iconData).toList();
List<String?> get imagesList => iconMap.values.where((item) => item.isImage).map((item) => item.imagePath).toList();

IconOrImage getIconOrImageFromString(String iconName) {
  return iconMap[iconName] ?? IconOrImage(iconData: Icons.error);
}

Widget getWidgetFromString(String iconName, {double size = 30.0, Color? color}) {
  final item = iconMap[iconName];
  if (item != null) {
    return item.toWidget(size: size, color: color);
  }
  return Icon(Icons.error, size: size, color: Colors.red);
}
