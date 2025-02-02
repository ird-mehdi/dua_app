import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class FeaturedLectureCard extends StatelessWidget {
  final String thumbnailUrl;
  final String duration;
  final String title;

  const FeaturedLectureCard({
    super.key,
    required this.thumbnailUrl,
    required this.duration,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: threeHundredPx,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: radius16,
                child: Image.asset(
                  thumbnailUrl,
                  height: 172,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: radius16,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Colors.black.withOpacityInt(0), Colors.black],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: tenPx,
                left: tenPx,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: eightPx, vertical: fourPx),
                  decoration: ShapeDecoration(
                    color: Color(0x3396AB99),
                    shape: RoundedRectangleBorder(
                      borderRadius: radius13,
                    ),
                  ),
                  child: Text(
                    duration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tenPx,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          gapH12,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: eightPx),
            child: Text(
              title,
              style: TextStyle(
                fontSize: fourteenPx,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
