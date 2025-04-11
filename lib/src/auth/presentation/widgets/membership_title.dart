import 'package:flutter/material.dart';

class MembershipTitle extends StatelessWidget {
  const MembershipTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Mercedes-Benz\nMembership',
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Urbanist',
          ),
        ),
      ),
    );
  }
}
