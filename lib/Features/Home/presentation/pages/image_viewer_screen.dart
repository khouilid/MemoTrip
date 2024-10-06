import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class ImageViewerPage extends HookWidget {
  const ImageViewerPage({super.key, required this.memoryModel});
  final MemoryModel memoryModel;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> visible = useState(true);
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              visible.value = !visible.value;
            },
            child: Container(
                child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  heroAttributes: PhotoViewHeroAttributes(tag: memoryModel.id),
                  imageProvider: NetworkImage(memoryModel.images[index]),
                  initialScale: PhotoViewComputedScale.covered,
                  // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                );
              },
              itemCount: memoryModel.images.length,
              // loadingBuilder: (context, event) => Center(
              //   child: Container(
              //     width: 20.0,
              //     height: 20.0,
              //     child: CircularProgressIndicator(
              //       value: event == null
              //           ? 0
              //           : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              //     ),
              //   ),
              // ),
              // backgroundDecoration: widget.backgroundDecoration,
              // pageController: widget.pageController,
              // onPageChanged: onPageChanged,
            )),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                context.router.maybePop();
              },
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Back",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
          // add titlle and description in the bottom
          Visibility(
            visible: visible.value,
            child: Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          margin: const EdgeInsets.all(6).copyWith(left: 0),
                          padding: const EdgeInsets.all(6)
                              .copyWith(right: 10, top: 1, bottom: 1),
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                color: AppColors.black,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Tengier, Morocco",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        memoryModel.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        memoryModel.description,
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
