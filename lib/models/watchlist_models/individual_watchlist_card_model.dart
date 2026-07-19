class IndividualWatchlistCardModel {
  const IndividualWatchlistCardModel({
    required this.icon,
    required this.name,
    required this.symbol,
    required this.isFavourite,
    required this.value,
    required this.valueChanged,
    required this.valueChangedPerc,
    required this.valueChangedIcon,
  });

  final String icon;
  final String name;
  final String symbol;
  final bool isFavourite;
  final double value;
  final double valueChanged;
  final double valueChangedPerc;
  final bool valueChangedIcon;
}
