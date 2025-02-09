class DuaCardModel {
  final bool? isLast;
  final bool? isFooterShown;
  final bool? isFirst;
  final bool? isArabicTopTitleShown;
  final bool? isReferenceShown;
  final bool? isDuaNumberShown;

  DuaCardModel({
    this.isLast,
    this.isFooterShown,
    this.isFirst,
    this.isArabicTopTitleShown,
    this.isReferenceShown,
    this.isDuaNumberShown,
  });
}

List<DuaCardModel> duaCardModelList = [
  DuaCardModel(
    isLast: true,
    isFirst: true,
    isArabicTopTitleShown: true,
    isReferenceShown: true,
    isDuaNumberShown: true,
    isFooterShown: true,
  ),
  DuaCardModel(
    isLast: true,
    isFirst: false,
    isArabicTopTitleShown: true,
    isReferenceShown: true,
    isDuaNumberShown: true,
    isFooterShown: true,
  ),
  DuaCardModel(
    isLast: true,
    isFirst: true,
    isArabicTopTitleShown: true,
    isReferenceShown: true,
    isDuaNumberShown: true,
    isFooterShown: true,
  ),
  DuaCardModel(
    isLast: true,
    isFirst: true,
    isArabicTopTitleShown: true,
    isReferenceShown: true,
    isDuaNumberShown: true,
    isFooterShown: true,
  ),
];
