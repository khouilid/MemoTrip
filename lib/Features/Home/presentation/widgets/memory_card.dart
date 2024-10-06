import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/core/presentation/routes/app_router.gr.dart';

class MemoryCard extends StatelessWidget {
  const MemoryCard({
    Key? key,
    this.aspectRetio = 1.02,
    required this.memoryModel,
    required this.onPress,
  }) : super(key: key);

  final double aspectRetio;
  final MemoryModel memoryModel;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColors.whiteSmoke2,
      child: GestureDetector(
        onTap: () {
          context.router.push(
            ImageViewerRoute(memoryModel: memoryModel),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          // enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal),
                      items: memoryModel.images.map((image) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        );
                      }).toList(),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        margin: const EdgeInsets.all(6),
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
                              color: AppColors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Tengier, Morocco",
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 8),
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
            Text(
              memoryModel.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
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
