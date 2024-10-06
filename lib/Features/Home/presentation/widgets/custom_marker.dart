import 'package:flutter/material.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/core/presentation/managers/color_manager.dart';

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
                image: DecorationImage(
                  image: NetworkImage(memoryModel.images.first),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -1),
            child: Transform.scale(
              scale: 6,
              child: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.chateauGreen,
                size: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
