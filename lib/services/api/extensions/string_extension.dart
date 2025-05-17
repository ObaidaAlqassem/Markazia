extension StringExtension on String {
  String get getFlag => toUpperCase().replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => String.fromCharCode(
          (match.group(0)?.codeUnitAt(0))! + 127397,
        ),
      );
}
