import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/Features/splash/widgets/social_botton.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';
import '/core/presentation/routes/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int currentPage = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.images.onboarding)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const Spacer(flex: 2),
          // Expanded(
          //   flex: 14,
          //   child: PageView.builder(
          //     itemCount: onBoardingFlow.length,
          //     onPageChanged: (value) {
          //       setState(() {
          //         currentPage = value;
          //       });
          //     },
          //     itemBuilder: (context, index) => OnboardContent(
          //       illustration: onBoardingFlow[index]["illustration"],
          //       title: onBoardingFlow[index]["title"],
          //       text: onBoardingFlow[index]["text"],
          //     ),
          //   ),
          // ),
          // const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: List.generate(
          //     onBoardingFlow.length,
          //     (index) => DotIndicator(isActive: index == currentPage),
          //   ),
          // ),
          // const Spacer(flex: 2),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayer(_controller),
            //  Image.asset(
            //   Assets.images.onboard1.path,
            //   fit: BoxFit.cover,
            //   // width: 200,
            // ),
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
            bottom: 70,
            left: 20,
            right: 20,
            child: SocalButton(
              press: () {
                context.router.replace(HomeRoute());
              },
              text: "Connect with Apple",
              color: AppColors.chateauGreen,
              icon: Image.asset(
                Assets.icons.languages.apple.path,
                width: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            left: 20,
            right: 20,
            child: SocalButton(
              press: () {
                context.router.replace(HomeRoute());
              },
              text: "Connect with Google",
              color: AppColors.chateauGreen,
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

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: .8,
            child: SvgPicture.asset(
              illustration!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // const SizedBox(height: 16),
        // Text(
        //   title!,
        //   style: Theme.of(context)
        //       .textTheme
        //       .titleLarge!
        //       .copyWith(fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(height: 8),
        // Text(
        //   text!,
        //   style: Theme.of(context).textTheme.bodyMedium,
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = AppColors.chateauGreen,
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> onBoardingFlow = [
  {
    "illustration": Assets.images.onboardingOne.path,
    "title": "Capture Every Moment",
    "text": "Track your travels and document\nmemories with photos, and notes."
  },
  {
    "illustration": Assets.images.onbaordingTwo.path,
    "title": "Share Your Journey",
    "text":
        "Collaborate with others to create a shared\njournal that tells the full story of your adventures."
  },
  {
    "illustration": Assets.images.onbaordingThree.path,
    "title": "Relive and Preserve",
    "text":
        "Easily organize your memories and turn them\ninto a physical album to keep forever."
  }
];
