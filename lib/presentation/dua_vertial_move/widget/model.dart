class DuaCardModel {
  final bool isFirstDuaTitleShown;
  final bool isSecondDuaTitleShown;
  final bool isLast;
  final bool isArabicTopTitleShown;
  final bool isFirstDuaReferenceShown;
  final bool isSecondDuaReferenceShown;
  final bool multipleDuaSeparatorDividerShown;
  final bool isSecondDuaSectionShown;

  DuaCardModel({
    this.isSecondDuaTitleShown = true,
    this.isFirstDuaTitleShown = true,
    this.isLast = true,
    this.isArabicTopTitleShown = true,
    this.isFirstDuaReferenceShown = true,
    this.isSecondDuaReferenceShown = true,
    this.multipleDuaSeparatorDividerShown = true,
    this.isSecondDuaSectionShown = true,
  });
}

List<DuaCardModel> duaCardModelList = [
  DuaCardModel(
    isFirstDuaTitleShown: false,
    isLast: true,
    isArabicTopTitleShown: true,
    isFirstDuaReferenceShown: true,
    isSecondDuaReferenceShown: true,
    isSecondDuaTitleShown: false,
    multipleDuaSeparatorDividerShown: false,
    isSecondDuaSectionShown: false,
  ),
  DuaCardModel(
    isFirstDuaTitleShown: false,
    isLast: true,
    isArabicTopTitleShown: true,
    isFirstDuaReferenceShown: false,
    isSecondDuaReferenceShown: true,
    isSecondDuaTitleShown: false,
    multipleDuaSeparatorDividerShown: true,
    isSecondDuaSectionShown: true,
  ),
];

List<DuaCardModel> planDetailsDuaCardModelList = [
  DuaCardModel(
    isFirstDuaTitleShown: true,
    isLast: true,
    isArabicTopTitleShown: true,
    isFirstDuaReferenceShown: true,
    isSecondDuaReferenceShown: true,
    isSecondDuaTitleShown: false,
    multipleDuaSeparatorDividerShown: true,
    isSecondDuaSectionShown: true,
  ),
  // DuaCardModel(
  //   isFirstDuaTitleShown: false,
  //   isLast: true,
  //   isArabicTopTitleShown: true,
  //   isFirstDuaReferenceShown: true,
  //   isSecondDuaReferenceShown: true,
  //   isSecondDuaTitleShown: false,
  //   multipleDuaSeparatorDividerShown: false,
  //   isSecondDuaSectionShown: false,
  // ),
];

List<DuaCardModel> scheduleDetailsDuaCardModelList = [
  DuaCardModel(
    isFirstDuaTitleShown: false,
    isLast: true,
    isArabicTopTitleShown: true,
    isFirstDuaReferenceShown: true,
    isSecondDuaReferenceShown: true,
    isSecondDuaTitleShown: false,
    multipleDuaSeparatorDividerShown: true,
    isSecondDuaSectionShown: true,
  ),
  DuaCardModel(
    isFirstDuaTitleShown: false,
    isLast: true,
    isArabicTopTitleShown: true,
    isFirstDuaReferenceShown: true,
    isSecondDuaReferenceShown: true,
    isSecondDuaTitleShown: false,
    multipleDuaSeparatorDividerShown: false,
    isSecondDuaSectionShown: false,
  ),
];
