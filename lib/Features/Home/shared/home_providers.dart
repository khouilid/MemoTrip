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

List<MemoryModel> demoMemoryModels = [
  MemoryModel(
    id: 1,
    images: [
      "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg",
      "https://andrewstuder.com/wp-content/uploads/2020/04/AF3I3830-scaled.jpg"
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description:
        '''A simple zoomable image/content widget for Flutter. PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag. It also can show any widget instead of an image, such as Container, Text or a SVG. Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers.''',
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  MemoryModel(
    id: 2,
    images: [
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: ' Nike Sport',
    rating: 4.1,
    isPopular: true,
  ),
  MemoryModel(
    id: 3,
    images: [
      "https://www.clickexcursions.co.uk/storage/excursions/January2023/2afEUi7NPMy9jZwqsHc7.jpeg",
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: 'description',
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];
