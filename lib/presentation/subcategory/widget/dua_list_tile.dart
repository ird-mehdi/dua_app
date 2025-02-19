import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter.dart';
import 'package:flutter/material.dart';

class DuaListTile extends StatelessWidget {
  final int index;
  final SubCategoryPresenter presenter;

  const DuaListTile({
    super.key,
    required this.index,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PresentableWidgetBuilder<SubCategoryPresenter>(
        presenter: presenter,
        builder: () {
          return ExpansionTile(
            tilePadding:
                EdgeInsets.only(left: sixteenPx, right: sixteenPx, top: tenPx),
            backgroundColor: context.color.shadeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(twentyPx),
              side: BorderSide.none,
            ),
            leading: Container(
              width: thirtySixPx,
              height: thirtySixPx,
              decoration: BoxDecoration(
                color: presenter.isExpanded(index)
                    ? context.color.primaryColor100
                    : context.color.secondaryColor.withOpacityInt(0.3),
                shape: BoxShape.circle,
                border:
                    Border.all(color: context.color.iconShadeColor, width: 2),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: theme.textTheme.labelMedium?.copyWith(
                      color: presenter.isExpanded(index)
                          ? context.color.white
                          : context.color.primaryColor100,
                      fontSize: thirteenPx,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            showTrailingIcon: false,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The most important thing to ask Allah for',
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontSize:
                          presenter.isExpanded(index) ? fifteenPx : fourteenPx,
                      color: context.color.titleColor,
                      fontWeight: FontWeight.w500),
                ),
                gapH8,
                Text(
                  'Total 15 Duas',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: twelvePx,
                    color: context.color.subtitleColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            children: [
              Container(
                margin: EdgeInsets.only(right: tenPx, left: tenPx),
                padding: EdgeInsets.only(top: fivePx, bottom: tenPx),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: eightPx),
                      child: Divider(
                        height: onePx,
                        color: context.color.primaryColor10,
                      ),
                    ),
                    gapH10,
                    IconTextRow(
                        theme: theme,
                        iconPath: SvgPath.icMainComponent,
                        text: 'Sincerity'),
                    gapH10,
                    IconTextRow(
                        theme: theme,
                        iconPath: SvgPath.icMainComponent,
                        text: 'Eating Lawful Food'),
                    gapH10,
                    IconTextRow(
                        theme: theme,
                        iconPath: SvgPath.icMainComponent,
                        text: "The Consciousness of One's Heart"),
                    gapH10,
                    IconTextRow(
                        theme: theme,
                        iconPath: SvgPath.icMainComponent,
                        text: 'Supplicate for Good Only')
                  ],
                ),
              )
            ],
            onExpansionChanged: (expanded) {
              presenter.toggleExpansion(index);
            },
          );
        });
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({super.key, required this.theme, this.iconPath, this.text});
  final String? iconPath;
  final String? text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: sixteenPx,
        bottom: twelvePx,
        top: twoPx,
      ),
      child: Row(
        children: [
          SvgImage(
            assetName: iconPath ?? SvgPath.icMainComponent,
            width: twentyFivePx,
            height: twentyFivePx,
          ),
          gapW25,
          Text(
            text ?? 'Sincerity',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: fourteenPx,
              color: context.color.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
