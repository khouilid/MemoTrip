
import 'package:flutter/material.dart';
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

class MemoryListView extends StatelessWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 100),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoMemoryModels.length,
      itemBuilder: (context, index) => MemoryCard(
        memoryModel: demoMemoryModels[index],
        onPress: () {
          
        },
      ),
    );
  }
}
