import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/Features/auth/application/auth_states.dart';

import 'package:template/Features/auth/shared/providers.dart';
import 'package:template/Features/splash/widgets/social_botton.dart';
import 'package:template/Features/user/shared/user_providers.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/core/shared/providers.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';
import '/core/presentation/routes/app_router.gr.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  int currentPage = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        // await ref
        // .read(authNotifierProvider.notifier)
        // .checkAndUpdateAuthStatus();
      });
    });

    _controller = VideoPlayerController.asset(Assets.images.onboarding)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });

    // ref
    //     .read(remoteServerConnexionProvider)
    //     .instance()
    //     .auth
    //     .onAuthStatesChange
    //     .listen((event) {
    //   // context.router.replace(const HomeRoute());
    //   print('---> $event');
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthStates>(authNotifierProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        authenticated: (state) {
          ref.watch(userProvider.notifier).state = state.user;
          Logger().i('User authenticated');
          context.router.replace(HomeRoute());
        },
        failure: (state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message ?? 'An error occured'),
              backgroundColor: AppColors.valentineRed,
            ),
          );
        },
      );
    });
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayer(_controller),
          ),
          Positioned(
            bottom: 280,
            left: 20,
            right: 20,
            child: Text(
              "Capture Every Moment",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 220,
            left: 20,
            right: 20,
            child: Text(
              "Track your travels and document\nmemories with photos, and notes.",
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 140,
            left: 20,
            right: 20,
            child: SocalButton(
              isBusy: false,
              press: () {
                context.router.replace(HomeRoute());
              },
              text: "Connect with Apple",
              color: AppColors.white,
              textcolor: AppColors.chateauGreen,
              icon: Image.asset(
                Assets.icons.languages.apple.path,
                width: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            right: 20,
            child: SocalButton(
              isBusy: ref.watch(authNotifierProvider).maybeMap(
                    orElse: () => false,
                    loading: (_) => true,
                  ),
              press: () {
                ref.read(authNotifierProvider.notifier).nativeGoogleSignIn();
              },
              text: "Connect with Google",
              color: AppColors.chateauGreen,
              textcolor: AppColors.white,
              icon: SvgPicture.asset(
                Assets.icons.languages.google.path,
                width: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: const Text(
              "By continuing your confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
              ),
            ),
          )
          // ),
          // const Spacer(),
        ],
      ),
    );
  }
}
