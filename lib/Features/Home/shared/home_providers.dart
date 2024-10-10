import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://t3.ftcdn.net/jpg/06/52/46/10/360_F_652461097_nhY9UrfRYtCQoEtZdPVwfWBYDygpYddn.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://t3.ftcdn.net/jpg/06/52/46/10/360_F_652461097_nhY9UrfRYtCQoEtZdPVwfWBYDygpYddn.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://t3.ftcdn.net/jpg/06/52/46/10/360_F_652461097_nhY9UrfRYtCQoEtZdPVwfWBYDygpYddn.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
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
      MemoryModel(
        id: 11,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 1",
        description: "Description for Memory 1",
        isFavourite: true,
        address: "Paris, France",
        latitude: 48.8566,
        longitude: 2.3522,
      ),
      MemoryModel(
        id: 12,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 2",
        description: "Description for Memory 2",
        isFavourite: false,
        address: "Versailles, France",
        latitude: 48.8049,
        longitude: 2.1204,
      ),
      MemoryModel(
        id: 13,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 3",
        description: "Description for Memory 3",
        isFavourite: true,
        address: "Boulogne-Billancourt, France",
        latitude: 48.8397,
        longitude: 2.2399,
      ),
      MemoryModel(
        id: 4,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 4",
        description: "Description for Memory 4",
        isFavourite: false,
        address: "Saint-Denis, France",
        latitude: 48.9362,
        longitude: 2.3574,
      ),
      MemoryModel(
        id: 5,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 5",
        description: "Description for Memory 5",
        isFavourite: true,
        address: "Nanterre, France",
        latitude: 48.8924,
        longitude: 2.2064,
      ),
      MemoryModel(
        id: 6,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 6",
        description: "Description for Memory 6",
        isFavourite: false,
        address: "Cergy, France",
        latitude: 49.0364,
        longitude: 2.0761,
      ),
      MemoryModel(
        id: 7,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 7",
        description: "Description for Memory 7",
        isFavourite: true,
        address: "Créteil, France",
        latitude: 48.7904,
        longitude: 2.4556,
      ),
      MemoryModel(
        id: 8,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 8",
        description: "Description for Memory 8",
        isFavourite: false,
        address: "Argenteuil, France",
        latitude: 48.9472,
        longitude: 2.2467,
      ),
      MemoryModel(
        id: 9,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 9",
        description: "Description for Memory 9",
        isFavourite: true,
        address: "Montreuil, France",
        latitude: 48.8641,
        longitude: 2.4432,
      ),
      MemoryModel(
        id: 10,
        images: [
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
          "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
        ],
        title: "Memory 10",
        description: "Description for Memory 10",
        isFavourite: false,
        address: "Aubervilliers, France",
        latitude: 48.9145,
        longitude: 2.3834,
      ),
      MemoryModel(
        id: 14,
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
        id: 15,
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
      MemoryModel(
        id: 16,
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
        id: 17,
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

//  final Map<String, Marker> _markers = {}; provider
final markersProvider = StateProvider<Map<String, Marker>>((ref) => {});
