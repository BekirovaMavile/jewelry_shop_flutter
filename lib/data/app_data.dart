import 'package:flutter/material.dart';

import '../ui_kit/_ui_kit.dart';
import 'models/_models.dart';

class AppData {
  const AppData._();

  static const dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting "
      "industry. Lorem Ipsum has been the industry's standard dummy text ever "
      "since the 1500s, when an unknown printer took a galley of type and "
      "scrambled it to make a type specimen book. It has survived not only five "
      "centuries, but also the leap into electronic typesetting, remaining "
      "essentially unchanged. It was popularised in the 1960s with the release "
      "of Letraset sheets containing Lorem Ipsum passages, and more recently "
      "with desktop publishing software like Aldus PageMaker including versions "
      "of Lorem Ipsum.";

  static List<Jew> jewItems = [
    Jew(
      1,
      AppAsset.ring1,
      "Silver ring",
      12.0,
      1,
      false,
      "Experience timeless elegance with our exquisite sterling silver ring. "
      "Meticulously crafted, its unique design exudes sophistication and style. "
      "The lustrous sterling silver showcases its nobility, "
      "while the intricate details and exquisite craftsmanship add a touch of luxury. "
      "Elevate your ensemble and make a statement with this ring "
      "– a perfect companion for cherished moments and refined aesthetics.",
      5.0,
      JewType.ring,
      150,
      false,
    ),
    Jew(
      2,
      AppAsset.ring2,
      "Silver ring",
      15.0,
      1,
      false,
      "Elegant sterling silver ring embodies sophistication and style. "
      "ts unique design, sterling silver's nobility, "
      "and exquisite craftsmanship combine to create unparalleled luxury. "
      "Perfect for refined looks and special occasions, "
      "this ring adds a touch of timeless beauty to every moment. "
      "Meticulous craftsmanship and intricate details further enhance its charm, "
      "making it an ideal choice for both sophisticated daily wear "
      "and special occasions that deserve a touch of luxury.",
      5.0,
      JewType.ring,
      150,
      false,
    ),
    Jew(
      3,
      AppAsset.ring3,
      "Gold ring",
      50.0,
      1,
      false,
      "Discover opulence redefined with our exquisite gold ring. "
      "Meticulously handcrafted, this ring emanates timeless beauty and unparalleled elegance. "
      "The radiant gold band, symbolizing luxury and prestige, "
      "is adorned with intricate detailing that catches the light from every angle. "
      "Whether worn as a statement piece or to complement your refined style, "
      "this ring adds a touch of sophistication to any occasion, "
      "becoming a cherished adornment that reflects your impeccable taste.",
      5.0,
      JewType.ring,
      150,
      false,
    ),
    Jew(
      4,
      AppAsset.ring4,
      "Gold ring",
      110.0,
      1,
      false,
      "Discover opulence redefined with our exquisite gold ring. "
      "Meticulously handcrafted, this ring emanates timeless beauty and unparalleled elegance. "
      "The radiant gold band, symbolizing luxury and prestige, "
      "is adorned with intricate detailing that catches the light from every angle. "
      "Whether worn as a statement piece or to complement your refined style, "
      "this ring adds a touch of sophistication to any occasion, "
      "becoming a cherished adornment that reflects your impeccable taste.",
      5.0,
      JewType.ring,
      150,
      false,
    ),
    Jew(
      5,
      AppAsset.ear1,
      "Silver earring",
      14.0,
      1,
      false,
      "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      5.0,
      JewType.earring,
      150,
      false,
    ),
    Jew(
      6,
      AppAsset.ear2,
      "Gold earring",
      30.0,
      1,
      false,
      "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      5.0,
      JewType.earring,
      150,
      false,
    ),
    Jew(
      7,
      AppAsset.ear3,
      "Silver earring",
      25.0,
      1,
      false,
      "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      5.0,
      JewType.earring,
      150,
      false,
    ),
    Jew(
      8,
      AppAsset.braslet1,
      "Silver bracelet",
      75.0,
      1,
      false,
      "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      5.0,
      JewType.bracelet,
      150,
      false,
    ),
    Jew(
      9,
      AppAsset.braslet2,
      "Bracelet",
      10.0,
      1,
      false,
      "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      5.0,
      JewType.bracelet,
      150,
      false,
    ),
    Jew(
      10,
      AppAsset.braslet3,
      "Gold bracelet",
      100.0,
      1,
      false,
      "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      5.0,
      JewType.bracelet,
      150,
      false,
    ),
    Jew(
      11,
      AppAsset.brooch1,
      "Gold brooch",
      120.0,
      1,
      false,
      "Elevate your ensemble with our enchanting women's brooch. "
      "Meticulously crafted, this accessory exudes elegance and charm. "
      "Whether adorned with sparkling crystals or featuring delicate floral designs, "
      "it adds a touch of sophistication to any outfit. The intricate craftsmanship and "
      "attention to detail make it a perfect statement piece for both casual and formal occasions. "
      "Enhance your style with this exquisite brooch that captures "
      "the essence of timeless beauty and grace.",
      5.0,
      JewType.brooch,
      150,
      false,
    ),
    Jew(
      12,
      AppAsset.brooch2,
      "Gold brooch",
      95.0,
      1,
      false,
      "Elevate your ensemble with our enchanting women's brooch. "
      "Meticulously crafted, this accessory exudes elegance and charm. "
      "Whether adorned with sparkling crystals or featuring delicate floral designs, "
      "it adds a touch of sophistication to any outfit. The intricate craftsmanship and "
      "attention to detail make it a perfect statement piece for both casual and formal occasions. "
      "Enhance your style with this exquisite brooch that captures "
      "the essence of timeless beauty and grace.",
      5.0,
      JewType.brooch,
      150,
      false,
    ),
    Jew(
      13,
      AppAsset.pend1,
      "Gold pendant",
      205.0,
      1,
      false,
      "Enhance your neckline with the exquisite beauty of our necklace. "
      "Meticulously designed, this piece exudes elegance and allure. "
      "Whether adorned with shimmering gemstones or showcasing intricate patterns, "
      "it adds a touch of sophistication to any look. The meticulous craftsmanship "
      "and attention to detail make it a perfect accessory "
      "for both everyday elegance and special occasions. "
      "Elevate your style with this stunning necklace "
      "that effortlessly captures the essence of timeless grace and charm.",
      5.0,
      JewType.pendant,
      150,
      false,
    ),
    Jew(
      14,
      AppAsset.pend2,
      "Silver pendant",
      10.0,
      1,
      false,
      "Enhance your neckline with the exquisite beauty of our necklace. "
      "Meticulously designed, this piece exudes elegance and allure. "
      "Whether adorned with shimmering gemstones or showcasing intricate patterns, "
      "it adds a touch of sophistication to any look. The meticulous craftsmanship "
      "and attention to detail make it a perfect accessory "
      "for both everyday elegance and special occasions. "
      "Elevate your style with this stunning necklace "
      "that effortlessly captures the essence of timeless grace and charm.",
      5.0,
      JewType.pendant,
      150,
      false,
    ),
    Jew(
      15,
      AppAsset.watch1,
      "Watch",
      130.0,
      1,
      false,
      "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      5.0,
      JewType.watch,
      150,
      false,
    ),
    Jew(
      16,
      AppAsset.watch2,
      "Watch",
      155.0,
      1,
      false,
      "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      5.0,
      JewType.watch,
      150,
      false,
    ),
    Jew(
      17,
      AppAsset.watch3,
      "Watch",
      115.0,
      1,
      false,
      "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      5.0,
      JewType.watch,
      150,
      false,
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Shopping cart',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favorite',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Profile',
    )
  ];

  static List<JewCategory> categories = [
    JewCategory(JewType.all, true),
    JewCategory(JewType.ring, false),
    JewCategory(JewType.earring, false),
    JewCategory(JewType.brooch, false),
    JewCategory(JewType.bracelet, false),
    JewCategory(JewType.pendant, false),
    JewCategory(JewType.watch, false),
  ];

  static List<Jew> cartItems = [
    Jew(
      2,
      AppAsset.ring2,
      "Ring2",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.ring,
      150,
      false,
    ),
    Jew(
      9,
      AppAsset.braslet2,
      "Braslet2",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.bracelet,
      150,
      false,
    ),
    Jew(
      15,
      AppAsset.watch1,
      "Watch1",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.watch,
      150,
      false,
    ),
  ];

  static List<Jew> favoriteItems = [
    Jew(
      16,
      AppAsset.watch2,
      "Watch2",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.watch,
      150,
      false,
    ),
    Jew(
      5,
      AppAsset.ear1,
      "Ear1",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.earring,
      150,
      false,
    ),
    Jew(
      13,
      AppAsset.pend1,
      "Pend1",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      JewType.pendant,
      150,
      false,
    ),
  ];

  static Jew jew = Jew(
    16,
    AppAsset.watch2,
    "Watch2",
    10.0,
    1,
    false,
    dummyText,
    5.0,
    JewType.watch,
    150,
    false,
  );
}