
// import 'package:dua/core/config/dua_screen.dart';
// import 'package:dua/core/external_libs/presentable_widget_builder.dart';
// import 'package:dua/core/static/svg_path.dart';
// import 'package:dua/core/static/ui_const.dart';
// import 'package:dua/core/utility/utility.dart';
// import 'package:dua/presentation/common/widgets/svg_image.dart';
// import 'package:dua/presentation/subcategory/presenter/sub_category_presenter.dart';
// import 'package:flutter/material.dart';

// class DuaListTile extends StatelessWidget {
//   final SubCategoryPresenter presenter;
//   const DuaListTile({super.key, required this.presenter});


//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return PresentableWidgetBuilder(
//       presenter: presenter,
//       builder: () => ExpansionTile(
//           tilePadding: EdgeInsets.zero,
//           childrenPadding: EdgeInsets.zero,
//           backgroundColor: context.color.shadeColor,
//           shape: RoundedRectangleBorder(

//             borderRadius: BorderRadius.circular(thirtyPx),
//             side: BorderSide.none,
//           ),
//           leading: Padding(
//             padding: EdgeInsets.all(eightPx),
//             child: Container(
//               width: thirtySixPx,
//               height: thirtySixPx,
//               decoration: BoxDecoration(
//                 color: presenter.currentUiState.isExtend
//                     ? context.color.secondaryColor
//                     : context.color.primaryColor100,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: context.color.iconShadeColor, width: 2),
//               ),
//               child: Center(
//                 child: Text(
//                   '2',
//                   style: TextStyle(color: context.color.btnTextColor),
//                 ),
//               ),
//             ),
//           ),
//           showTrailingIcon: false,
//           title: Text(
//             'The most important thing to ask Allah for',
//             style: theme.textTheme.titleMedium?.copyWith(
//               fontSize: fifteenPx,
//               color: context.color.titleColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           subtitle: Text(
//             'Total 15 Duas',
//             style: theme.textTheme.titleSmall?.copyWith(
//               fontSize: twelvePx,
//               color: context.color.subtitleColor,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           children: [
//             Container(
//               padding: EdgeInsets.all(sixteenPx),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Divider(
//                     height: onePx,
//                     color: context.color.iconShadeColor,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: twelvePx, left: tenPx),
//                     child: Row(
//                       children: [
//                         SvgImage(
//                           assetName: SvgPath.icMainComponent,
//                           width: twentyFourPx,
//                           height: twentyFourPx,
//                         ),
//                         gapW20,
//                         Text(
//                           'Sincerity',
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             fontSize: fourteenPx,
//                             color: context.color.titleColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   gapH10,
//                   Padding(
//                     padding: EdgeInsets.only(top: twelvePx, left: tenPx),
//                     child: Row(
//                       children: [
//                         SvgImage(
//                           assetName: SvgPath.icMainComponent,
//                           width: twentyFourPx,
//                           height: twentyFourPx,
//                         ),
//                         gapW20,
//                         Text(
//                           'Eating Lawful Food',
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             fontSize: fourteenPx,
//                             color: context.color.titleColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   gapH10,
//                   Padding(
//                     padding: EdgeInsets.only(top: twelvePx, left: tenPx),
//                     child: Row(
//                       children: [
//                         SvgImage(
//                           assetName: SvgPath.icMainComponent,
//                           width: twentyFourPx,
//                           height: twentyFourPx,
//                         ),
//                         gapW20,
//                         Text(
//                           "The Consciousness of One's Heart",
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             fontSize: fourteenPx,
//                             color: context.color.titleColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   gapH10,
//                   Padding(
//                     padding: EdgeInsets.only(top: twelvePx, left: tenPx),
//                     child: Row(
//                       children: [
//                         SvgImage(
//                           assetName: SvgPath.icMainComponent,
//                           width: twentyFourPx,
//                           height: twentyFourPx,
//                         ),
//                         gapW20,
//                         Text(
//                           'Supplicate for Good Only',
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             fontSize: fourteenPx,
//                             color: context.color.titleColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//           onExpansionChanged: (expanded) {
//             presenter.toggleIsExtend();
//           },

//         ),
//     );
//   }
// }

import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class DuaListTile extends StatefulWidget {
  const DuaListTile({super.key});

  @override
  State<DuaListTile> createState() => _DuaListTileState();
}

class _DuaListTileState extends State<DuaListTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      backgroundColor: context.color.shadeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(thirtyPx),
        side: BorderSide.none,
      ),
      leading: Padding(
        padding: EdgeInsets.all(eightPx),
        child: Container(
          width: thirtySixPx,
          height: thirtySixPx,
          decoration: BoxDecoration(
            color: _isExpanded
                ? context.color.secondaryColor
                : context.color.primaryColor100,
            shape: BoxShape.circle,
            border: Border.all(color: context.color.iconShadeColor, width: 2),
          ),
          child: Center(
            child: Text(
              '2',
              style: TextStyle(color: context.color.btnTextColor),
            ),
          ),
        ),
      ),
      showTrailingIcon: false,
      title: Text(
        'The most important thing to ask Allah for',
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: fifteenPx,
          color: context.color.titleColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'Total 15 Duas',
        style: theme.textTheme.titleSmall?.copyWith(
          fontSize: twelvePx,
          color: context.color.subtitleColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      children: [
        Container(
          padding: EdgeInsets.all(sixteenPx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: onePx,
                color: context.color.iconShadeColor,
              ),
              Padding(
                padding: EdgeInsets.only(top: twelvePx, left: tenPx),
                child: Row(
                  children: [
                    SvgImage(
                      assetName: SvgPath.icMainComponent,
                      width: twentyFourPx,
                      height: twentyFourPx,
                    ),
                    gapW20,
                    Text(
                      'Sincerity',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: fourteenPx,
                        color: context.color.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
              gapH10,
              Padding(
                padding: EdgeInsets.only(top: twelvePx, left: tenPx),
                child: Row(
                  children: [
                    SvgImage(
                      assetName: SvgPath.icMainComponent,
                      width: twentyFourPx,
                      height: twentyFourPx,
                    ),
                    gapW20,
                    Text(
                      'Eating Lawful Food',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: fourteenPx,
                        color: context.color.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
              gapH10,
              Padding(
                padding: EdgeInsets.only(top: twelvePx, left: tenPx),
                child: Row(
                  children: [
                    SvgImage(
                      assetName: SvgPath.icMainComponent,
                      width: twentyFourPx,
                      height: twentyFourPx,
                    ),
                    gapW20,
                    Text(
                      "The Consciousness of One's Heart",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: fourteenPx,
                        color: context.color.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
              gapH10,
              Padding(
                padding: EdgeInsets.only(top: twelvePx, left: tenPx),
                child: Row(
                  children: [
                    SvgImage(
                      assetName: SvgPath.icMainComponent,
                      width: twentyFourPx,
                      height: twentyFourPx,
                    ),
                    gapW20,
                    Text(
                      'Supplicate for Good Only',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: fourteenPx,
                        color: context.color.titleColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
    );
  }
}