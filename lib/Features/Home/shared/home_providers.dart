import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/Home/application/home_notifire.dart';
import 'package:template/Features/Home/application/home_states.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/Features/Home/infrastructure/Home_repository.dart';
import 'package:template/Features/Home/infrastructure/home_remote_datasource.dart';

import 'package:template/core/shared/providers.dart';

// final homeRemoteRepositoryProvider = Provider<HomeRemoteDataSource>(
//   (ref) => HomeRemoteDataSource(ref.watch(dioProvider)),
// );

// final homeRepository = Provider<HomeRepository>(
//   (ref) => HomeRepository(
//     ref.watch(homeRemoteRepositoryProvider),
//   ),
// );

// final homeNotifierProvider =
//     StateNotifierProvider<HomeStateNotifier, HomeState>(
//   (ref) => HomeStateNotifier(ref.watch(homeRepository)),
// );

// MemoryModel state provider
final memoryModelProvider = StateProvider<List<MemoryModel>>((ref) => [
      MemoryModel(
        id: 1,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Wireless Controller for PS4™",
        description:
            '''A simple zoomable image/content widget for Flutter. PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag. It also can show any widget instead of an image, such as Container, Text or a SVG. Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers.''',
        isFavourite: true,
        address: "Lagos, Nigeria",
        latitude: 48.864716,
        longitude: 2.349014,
      ),
      MemoryModel(
        id: 2,
        images: [
          "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Wireless Controller for PS4™",
        description:
            '''A simple zoomable image/content widget for Flutter. PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag. It also can show any widget instead of an image, such as Container, Text or a SVG. Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers.''',
        isFavourite: true,
        address: "Lagos, Nigeria",
        // 49.160647, 3.062534
        latitude: 49.160647,
        longitude: 3.062534,
      ),
      MemoryModel(
        id: 3,
        images: [
          "https://t3.ftcdn.net/jpg/06/52/46/10/360_F_652461097_nhY9UrfRYtCQoEtZdPVwfWBYDygpYddn.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Wireless Controller for PS4™",
        description:
            '''A simple zoomable image/content widget for Flutter. PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag. It also can show any widget instead of an image, such as Container, Text or a SVG. Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers.''',
        isFavourite: true,
        address: "Lagos, Nigeria",
// 48.555294, 2.309970
        latitude: 48.555294,
        longitude: 2.309970,
      ),
    ]);
