import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mythic_benz/src/home/presentation/sections/bottom_main_home_section.dart';
import 'package:mythic_benz/src/home/presentation/sections/center_main_home_section.dart';
import 'package:mythic_benz/src/home/presentation/sections/top_main_home_section.dart';
import 'package:mythic_benz/src/home/presentation/widgets/main_bg_screen_glassmorphism.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _topController;
  late AnimationController _centerController;
  late AnimationController _bottomController;
  late Animation<Offset> _topAnimation;
  late Animation<Offset> _centerAnimation;
  late Animation<Offset> _bottomAnimation;
  bool _isCenterVisible = false;
  bool _isBottomVisible = false;

  @override
  void initState() {
    super.initState();
    _topController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isCenterVisible = true;
        });
        _centerController.forward();
      }
    });
    _centerController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isBottomVisible = true;
        });
        _bottomController.forward();
      }
    });
    _bottomController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _topAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _topController, curve: Curves.easeOut));
    _centerAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _centerController, curve: Curves.easeOut),
    );
    _bottomAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _bottomController, curve: Curves.easeOut),
    );
    _topController.forward();
  }

  @override
  void dispose() {
    _topController.dispose();
    _centerController.dispose();
    _bottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainBgScreenGlassmorphism(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Gap(60),
                SlideTransition(
                  position: _topAnimation,
                  child: const TopMainHomeSection(),
                ),
                const Gap(20),
                if (_isCenterVisible)
                  SlideTransition(
                    position: _centerAnimation,
                    child: const CenterMainHomeSection(),
                  ),
                const Gap(20),
                if (_isBottomVisible)
                  SlideTransition(
                    position: _bottomAnimation,
                    child: const BottomMainHomeSection(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
