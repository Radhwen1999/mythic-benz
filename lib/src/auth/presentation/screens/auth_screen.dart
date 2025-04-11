import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mythic_benz/src/auth/presentation/widgets/auth_bottom_sheet.dart';
import 'package:mythic_benz/src/auth/presentation/widgets/auth_header.dart';
import 'package:mythic_benz/src/auth/presentation/widgets/background_image.dart';
import 'package:mythic_benz/src/auth/presentation/widgets/membership_title.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Gap(60), AuthHeader(), MembershipTitle()],
          ),
          Positioned(
            bottom: 0,
            child: AuthBottomSheet(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
        ],
      ),
    );
  }
}
