import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:mythic_benz/src/home/presentation/screens/home_page.dart';

abstract class DashboardUtils {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static final tabItems = <({IconData idle, IconData active, String label})>[
    (idle: IconlyLight.home, active: IconlyBold.home, label: 'Menu'),
    (idle: IconlyBroken.star, active: IconlyBold.scan, label: 'Favs.'),
    (idle: IconlyBroken.chat, active: IconlyBold.chat, label: 'Chat'),
  ];

  static int activeIndex(GoRouterState state) {
    return switch (state.fullPath) {
      HomePage.path => 0,
      _ => 1,
    };
  }
}
