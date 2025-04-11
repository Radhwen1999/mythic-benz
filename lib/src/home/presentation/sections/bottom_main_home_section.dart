import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:mythic_benz/core/res/Media/media.dart';
import 'package:mythic_benz/core/res/style/colours.dart';
import 'package:mythic_benz/src/home/presentation/widgets/custom_clipper_widgets/custom_clipper_bottom_widget.dart';
import 'package:path_drawing/path_drawing.dart';

class BottomMainHomeSection extends StatelessWidget {
  const BottomMainHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final String svgBottomPathData =
        'M 123.782 0 H 160 C 182.091 0 200 17.9086 200 40 V 160 C 200 182.091 182.091 200 160 200 H 40 C 17.9086 200 0 182.091 0 160 V 128.47 C 0 105.748 19.6456 88.0092 42.2498 90.321 C 66.0643 92.7566 86.2646 73.0183 84.3806 49.1538 L 83.9064 43.1481 C 82.0701 19.8881 100.45 0 123.782 0 Z';
    final Path bottomPath = parseSvgPathData(svgBottomPathData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: AssetImage(Media.mercedesFlags),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomClipperBottomWidget(bottomPath),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(color: Colours.lightGreyTintColor),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mercedes-Benz',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Service Center',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '12 March 24',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              'Computer\nDiagnosis',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 10,
                child: IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  padding: EdgeInsets.all(16),
                  icon: Icon(IconlyLight.setting, size: 24),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
