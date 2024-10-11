import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/Features/Home/presentation/pages/map_screen.dart';
import 'package:template/Features/Home/presentation/pages/profile_screen.dart';
import 'package:template/Features/Home/presentation/pages/timeline_screen.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/gen/assets.gen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MapViewState();
}

class _MapViewState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  /// isLoaded
  int currentPage = 0;
  late TabController tabController;

  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );

    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MapPage(),
      TimelineScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: BottomBar(
        barColor: AppColors.whiteSmoke2,
        hideOnScroll: true,
        iconWidth: 35,
        iconHeight: 35,
        borderRadius: const BorderRadius.all(Radius.circular(125)),
        child: TabBar(
          dividerColor: Colors.transparent,
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          splashFactory: NoSplash.splashFactory,
          indicatorColor: AppColors.chateauGreen,
          padding: const EdgeInsets.all(0),
          tabs: [
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.iconHome.path,
                  colorFilter: ColorFilter.mode(
                      currentPage == 0
                          ? AppColors.chateauGreen
                          : AppColors.grey2,
                      BlendMode.srcIn),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.calendar.path,
                  colorFilter: ColorFilter.mode(
                      currentPage == 1
                          ? AppColors.chateauGreen
                          : AppColors.grey2,
                      BlendMode.srcIn),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.iconUser.path,
                  colorFilter: ColorFilter.mode(
                      currentPage == 2
                          ? AppColors.chateauGreen
                          : AppColors.grey2,
                      BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
        body: (context, controller) => screens[currentPage],
      ),
    );
  }
}
