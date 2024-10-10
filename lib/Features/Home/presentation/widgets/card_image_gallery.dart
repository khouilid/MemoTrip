import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:template/core/presentation/managers/color_manager.dart';

class CardImagesGalleryView extends StatelessWidget {
  const CardImagesGalleryView({
    super.key,
    required this.height,
    required this.images,
    this.fit,
  });

  final double height;
  final List<String> images;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          if (images.isNotEmpty) ...{
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    // border: _isImagesCountGreaterThan(1)
                    //     ? const Border(
                    //         right: BorderSide(
                    //           color: AppColors.pictonBlue,
                    //           width: 4.0,
                    //         ),
                    //       )
                    //     : null,
                    ),
                height: double.infinity,
                child: imageOrVideo(images.first, fit),
              ),
            ),
          },
          if (_isImagesCountGreaterThan(1)) ...{
            Expanded(
              flex: 2,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox.expand(
                        child: imageOrVideo(images[1], fit),
                      ),
                    ),
                    if (_isImagesCountGreaterThan(2))
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              // border: Border(
                              //   top: BorderSide(
                              //     color: AppColors.pictonBlue,
                              //     width: 4.0,
                              //   ),
                              // ),
                              ),
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox.expand(
                                  child: imageOrVideo(images[2], fit),
                                ),
                              ),
                              if (_isImagesCountGreaterThan(3))
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                                  child: Text(
                                    '+ ${images.length - 3}',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          },
        ],
      ),
    );
  }

  bool _isImagesCountGreaterThan(int count) {
    return images.length > count;
  }
}

Widget imageOrVideo(String image, BoxFit? fit) {
  return CachedNetworkImage(
    imageUrl: image,
    fit: fit ?? BoxFit.cover,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    // errorWidget: (context, url, error) => Image.asset(Assets.images.img4.path),
  );
}
