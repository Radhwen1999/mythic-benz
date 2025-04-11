import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:mythic_benz/core/res/Media/media.dart';
import 'package:mythic_benz/core/res/style/colours.dart';
import 'package:mythic_benz/src/home/presentation/widgets/custom_clipper_widgets/custom_clipper_center_widget.dart';
import 'package:path_drawing/path_drawing.dart';

class CenterMainHomeSection extends StatelessWidget {
  const CenterMainHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final String svgCenterPathData =
        'M256 0H30C13.4315 0 0 13.4315 0 30V72C0 83.0457 8.9543 92 20 92H82C93.0457 92 102 100.954 102 112V114C102 124.493 110.507 133 121 133C131.493 133 140 141.507 140 152V162C140 173.046 131.046 182 120 182H20C8.95431 182 0 190.954 0 202V225C0 241.569 13.4315 255 30 255H256C272.569 255 286 241.569 286 225V30C286 13.4315 272.569 0 256 0Z';
    final Path centerPath = parseSvgPathData(svgCenterPathData);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colours.lightGreyTintColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black87, width: 2),
                    ),
                    child: Text(
                      'NEWS',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25, bottom: 15),
                    child: Row(
                      children: [
                        Icon(IconlyLight.bag, size: 20),
                        const Gap(5),
                        Icon(CupertinoIcons.sun_max, size: 20),
                        const Gap(5),
                        Icon(IconlyLight.info_circle, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipPath(
                  clipper: CustomClipperCenterWidget(centerPath),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Media.pinkCloudBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            onPressed: () {},
                            child: Text(
                              'START YOUR JOURNEY',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 24,
            child: Text(
              'Learn more what you\ncan do to make your\ntravel more sustainable ...',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
