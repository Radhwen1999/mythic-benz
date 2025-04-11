import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:mythic_benz/core/res/style/colours.dart';
import 'package:mythic_benz/core/service/router.dart';
import 'package:mythic_benz/core/widgets/input_field.dart';
import 'package:mythic_benz/core/widgets/rounded_button.dart';
import 'package:mythic_benz/src/home/presentation/screens/home_page.dart';

class AuthBottomSheet extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AuthBottomSheet({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colours.lightGreyTintColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(20),
            const Text(
              'Hello, please log in to access your membership',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            InputField(
              hintText: 'e-mail address',
              prefixIcon: const Icon(Icons.alternate_email_sharp),
              controller: emailController,
            ),
            const Gap(10),
            InputField(
              hintText: 'mercedes code',
              prefixIcon: const Icon(IconlyBold.lock),
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  'I forgot',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
            ),
            const Gap(20),
            RoundedButton(
              text: 'Log in',
              backgroundColour: Colors.black,
              onPressed: () {
                router.go(HomePage.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
