import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class SingleDuaCard extends StatelessWidget {
  const SingleDuaCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(eightPx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: thirtySixPx,
                    height: thirtySixPx,
                    decoration: BoxDecoration(
                      color: context.color.primaryColor100,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  gapW12,
                  Expanded(
                    child: Text(
                      'The servant is dependent on his Lord #1',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: fifteenPx,
                        color: context.color.primaryColor100,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              gapH16,

              // Arabic Text
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                  style: context.textStyle.arabicAyah?.copyWith(
                      fontSize: twentyEightPx,
                      color: context.color.headingTextColor,
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                  textAlign: TextAlign.right,
                ),
              ),

              gapH25,
              // Transliteration
              Text(
                "lyyaaka na'budu wa lyyaaka nasta'een",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: fourteenPx,
                  color: context.color.titleColor.withOpacityInt(0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
              gapH20,

              // Translation

              Text(
                'It is You we worship and It is You we ask for help.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: fourteenPx,
                  color: context.color.titleColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              gapH16,

              // Quote
              Text(
                'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: fourteenPx,
                  color: context.color.titleColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              gapH20,

              // Reference
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reference:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: twelvePx,
                      color: context.color.titleColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Muslim: 770',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: fifteenPx,
                      color: context.color.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              gapH16,

              // Action buttons
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: eighteenPx),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.color.primaryColor10),
            ),
          ),
          child: Row(
            children: [
              gapW15,
              SvgImage(
                assetName: AppImages.icBookmark,
                color: context.color.primaryColor70,
                width: twentyFourPx,
                height: twentyFourPx,
              ),
              const Spacer(),
              SvgImage(
                assetName: AppImages.icLampCharge,
                color: context.color.primaryColor70,
                width: twentyFourPx,
                height: twentyFourPx,
              ),
              const Spacer(),
              SvgImage(
                assetName: AppImages.icPlayNoneBg,
                color: context.color.primaryColor70,
                width: twentyFourPx,
                height: twentyFourPx,
              ),
              const Spacer(),
              SvgImage(
                assetName: AppImages.icCalendar,
                color: context.color.primaryColor70,
                width: twentyFourPx,
                height: twentyFourPx,
              ),
              const Spacer(),
              SvgImage(
                assetName: AppImages.icMore,
                color: context.color.primaryColor70,
                width: twentyFourPx,
                height: twentyFourPx,
              ),
              gapW12,
            ],
          ),
        ),
      ],
    );
  }
}
