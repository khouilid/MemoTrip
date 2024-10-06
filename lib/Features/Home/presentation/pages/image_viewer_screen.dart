import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

@RoutePage()
class ImageViewerPage extends StatelessWidget {
  const ImageViewerPage({super.key, required this.galleryItems});
  final List<String> galleryItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(galleryItems[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
        );
      },
      itemCount: galleryItems.length,
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
    ));
  }
}
