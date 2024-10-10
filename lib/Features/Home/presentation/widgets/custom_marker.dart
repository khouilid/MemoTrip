import 'package:flutter/material.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.memoryModel,
  });
  final MemoryModel memoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(999),
              ),
              child: CachedNetworkImage(
                imageUrl: memoryModel.images.first,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -1),
            child: Transform.scale(
              scale: 6,
              child: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.white,
                size: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
