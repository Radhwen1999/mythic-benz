import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:mythic_benz/core/extensions/context_extensions.dart';
import 'package:mythic_benz/core/res/Media/media.dart';
import 'package:mythic_benz/core/res/style/colours.dart';
import 'package:mythic_benz/src/home/presentation/widgets/custom_clipper_widgets/custom_clipper_top_widget.dart';
import 'package:path_drawing/path_drawing.dart';

class TopMainHomeSection extends StatelessWidget {
  const TopMainHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final String svgTopPathData =
        'M240 0H54.6337C46.5548 0 38.8174 3.25838 33.1724 9.03781L0 43H200C222.091 43 240 25.0914 240 3V0Z';
    final Path topPath = parseSvgPathData(svgTopPathData);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 15,
            top: 10,
            child: Image.asset(Media.mercedesBanner, width: 150),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colours.smallButtonHomePageColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.gift, color: Colors.white, size: 15),
                      const Gap(10),
                      const Text(
                        '4570',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(IconlyLight.profile, color: Colors.white, size: 20),
                    const Gap(10),
                    const Text(
                      'Liam Anderson',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                const Text(
                  'card no 3421 2345 1234 1234\nmember from 23/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 200,
              height: context.height  * 0.05,
              child: ClipPath(
                clipper: CustomClipperTopWidget(topPath),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: Colours.gradientSilverGreyColor,
                  ),
                  child: Center(
                    child: Text(
                      'SILVER CARD',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
