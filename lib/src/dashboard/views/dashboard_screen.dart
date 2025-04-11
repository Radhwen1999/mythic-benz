import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mythic_benz/core/extensions/context_extensions.dart';
import 'package:mythic_benz/core/res/Media/media.dart';
import 'package:mythic_benz/core/res/style/colours.dart';
import 'package:mythic_benz/src/dashboard/app/dashboard_state.dart';
import 'package:mythic_benz/src/dashboard/utils/dashboard_utils.dart';
import 'package:mythic_benz/src/home/presentation/screens/home_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({required this.state, required this.child, super.key});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final activeIndex = DashboardUtils.activeIndex(state);
    return Scaffold(
      key: DashboardUtils.scaffoldKey,
      body: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                bottom: 20,
                right: context.width * 0.25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ValueListenableBuilder<int>(
                valueListenable: DashboardState.instance.indexNotifier,
                builder: (_, currentIndex, __) {
                  return GNav(
                    selectedIndex: currentIndex,
                    tabBorderRadius: 45,
                    rippleColor: Colors.white30,
                    hoverColor: Colors.blue,
                    haptic: true,
                    curve: Curves.easeOutExpo,
                    duration: const Duration(milliseconds: 300),
                    gap: 5,
                    tabMargin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    activeColor: Colors.black,
                    iconSize: 24,
                    tabBackgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    tabs:
                        DashboardUtils.tabItems.mapIndexed((index, item) {
                          final isActive = activeIndex == index;
                          return GButton(
                            icon: isActive ? item.active : item.idle,
                            text: item.label,
                          );
                        }).toList(),
                    onTabChange: (index) async {
                      DashboardState.instance.changeIndex(index);
                      switch (index) {
                        case 0:
                          await context.push(HomePage.path);
                          break;
                        case 1:
                          await context.push(HomePage.path);
                          break;
                        case 2:
                          await context.push(HomePage.path);
                          break;
                        case 3:
                          await context.push(HomePage.path);
                          break;
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed:
                  () => {
                    DashboardState.instance.changeIndex(4),
                    debugPrint('$activeIndex'),
                    context.push(HomePage.path),
                  },
              style: IconButton.styleFrom(
                foregroundColor:
                    activeIndex == 4
                        ? Colours.smallButtonHomePageColor
                        : Colours.lightGreyTintColor,
                shadowColor: Colors.black54,
                elevation: 10,
                backgroundColor: activeIndex == 4 ? Colors.white : Colors.black,
                padding: EdgeInsets.all(20),
              ),
              icon: SvgPicture.asset(
                Media.mercedesLogo,
                width: 20,
                colorFilter: ColorFilter.mode(
                  activeIndex == 4
                      ? Colours.smallButtonHomePageColor
                      : Colours.lightGreyTintColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
