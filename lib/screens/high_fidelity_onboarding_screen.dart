import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Required for go_router navigation

class HighFidelityOnboardingScreen extends StatefulWidget {
  const HighFidelityOnboardingScreen({super.key});

  @override
  State<HighFidelityOnboardingScreen> createState() => _HighFidelityOnboardingScreenState();
}

class _HighFidelityOnboardingScreenState extends State<HighFidelityOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final safeAreaTop = MediaQuery.of(context).padding.top;

    const double figmaHeight = 812;
    const double imageHeightFigma = 536;
    const double gradientStartFigmaY = 452;
    const double text1FigmaY = 476;
    const double buttonFigmaY = 702;
    const double buttonFigmaHeight = 56;
    const double homeIndicatorFigmaY = 799;
    const double homeIndicatorFigmaHeight = 5;

    final double topTextPadding = (text1FigmaY - gradientStartFigmaY) / figmaHeight * screenHeight;
    final double paddingBetweenButtonAndHomeIndicator = (homeIndicatorFigmaY - (buttonFigmaY + buttonFigmaHeight));
    final double homeIndicatorBottomOffset = (figmaHeight - homeIndicatorFigmaY - homeIndicatorFigmaHeight) / figmaHeight * screenHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (imageHeightFigma / figmaHeight),
            child: Image.asset(
              'assets/images/I179_50_417_719.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight - (screenHeight * (gradientStartFigmaY / figmaHeight)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF050505).withOpacity(0),
                    const Color(0xFF050505),
                  ],
                  stops: const [0.0, 0.2367],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: safeAreaBottom + (paddingBetweenButtonAndHomeIndicator / figmaHeight * screenHeight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: topTextPadding),
                    Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        letterSpacing: 0.16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        color: const Color(0xFFA2A2A2),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: 0.14,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: buttonFigmaHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home'); // Using go_router
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          elevation: 0,
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: safeAreaTop + 24,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '9:41',
                      style: GoogleFonts.sora(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt, color: Colors.white.withOpacity(0.4), size: 18),
                        const SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white.withOpacity(0.4), size: 18),
                        const SizedBox(width: 4),
                        Icon(Icons.battery_full, color: Colors.white.withOpacity(0.4), size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: homeIndicatorBottomOffset,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 134,
                height: homeIndicatorFigmaHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFF242424),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}