import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/Home/domain/memory_model.dart';
import 'package:template/core/shared/providers.dart';

import "../application/Home_notifire.dart";
import '../application/Home_states.dart';
import '../infrastructure/Home_remote_datasource.dart';
import '../infrastructure/Home_repository.dart';

final homeRemoteRepositoryProvider = Provider<HomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(ref.watch(dioProvider)),
);

final homeRepository = Provider<HomeRepository>(
  (ref) => HomeRepository(
    ref.watch(homeRemoteRepositoryProvider),
  ),
);

final homeNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(ref.watch(homeRepository)),
);

List<MemoryModel> demoMemoryModels = [
  MemoryModel(
    id: 1,
    images: [
      "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-201359,resizemode-75,msid-65975117/magazines/panache/travel-in-a-clique-be-sane-4-point-guide-to-organise-a-big-group-trip.jpg"
          "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
      "https://tobebright.com/wp-content/uploads/2020/02/IMG_0744.jpg",
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
  MemoryModel(
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
  MemoryModel(
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
