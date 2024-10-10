import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/Features/splash/widgets/social_botton.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/gen/assets.gen.dart';
import '/core/presentation/routes/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 14,
              child: PageView.builder(
                itemCount: onBoardingFlow.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: onBoardingFlow[index]["illustration"],
                  title: onBoardingFlow[index]["title"],
                  text: onBoardingFlow[index]["text"],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingFlow.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child:
                  // Google
                  SocalButton(
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
            // ),
            const Spacer(),
          ],
        ),
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
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
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
