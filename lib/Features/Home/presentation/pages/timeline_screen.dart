import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/Home/presentation/widgets/memory_card.dart';
import 'package:template/Features/Home/presentation/widgets/timeline_header.dart';
import 'package:template/Features/Home/shared/home_providers.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              TimelineHeader(),
              SizedBox(height: 20),
              MemoryListView(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(memoryModelProvider);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 100),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: memoList.length,
      itemBuilder: (context, index) => MemoryCard(
        memoryModel: memoList[index],
        onPress: () {},
      ),
    );
  }
}
