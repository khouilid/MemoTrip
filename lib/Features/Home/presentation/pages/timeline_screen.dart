import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/gen/assets.gen.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Timeline",
            style: TextStyle(
              fontSize: 26,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Form(
                  child: TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle: const TextStyle(color: Color(0xFF757575)),
                      fillColor: const Color(0xFF979797).withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search...",
                      prefixIcon: const Icon(CupertinoIcons.search),
                    ),
                  ),
                ),
              ),
              // Add icon for adding new post
              const SizedBox(width: 10),
              IconBtnWithCounter(
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.press,
  }) : super(key: key);

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: const Color(0xFF979797).withOpacity(0.1),
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          CupertinoIcons.add,
          color: AppColors.grayLevel2,
          size: 24,
        ),
      ),
    );
  }
}

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 100),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoProducts.length,
      itemBuilder: (context, index) => ProductCard(
        product: demoProducts[index],
        onPress: () {},
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColors.whiteSmoke2,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFF979797).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: NetworkImage(product.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.all(6)
                        .copyWith(right: 10, top: 1, bottom: 1),
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Tengier, Morocco",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                children: [
                  // icon time
                  Icon(
                    CupertinoIcons.clock,
                    color: AppColors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '12/12/2021',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Text(
                // long description
                'luxury hotel in the heart of the city, with a view of the sea and the mountains, with a view of the sea and the mountains with a view of the sea and the mountains',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4e4e4e,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-201359,resizemode-75,msid-65975117/magazines/panache/travel-in-a-clique-be-sane-4-point-guide-to-organise-a-big-group-trip.jpg"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: 'Wireless Controller for PS4™ - Red',
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: ' Nike Sport',
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://www.clickexcursions.co.uk/storage/excursions/January2023/2afEUi7NPMy9jZwqsHc7.jpeg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: 'description',
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];
