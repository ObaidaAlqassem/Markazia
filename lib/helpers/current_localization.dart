import 'package:intl/intl.dart';

class CurrentLocalization {
  static bool get isEnglish => Intl.getCurrentLocale() == 'en';

  static String get getCurrentLocal => Intl.getCurrentLocale();
}
