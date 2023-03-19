import 'package:intl/intl.dart';

extension IntExtension on int {
  String get getFormattedTime {
    return DateFormat("HH : mm").format(
      DateTime.fromMillisecondsSinceEpoch(this * 1000),
    );
  }

  String get getFormattedDate {
    return DateFormat("EEEE, MMM d").format(
      DateTime.fromMillisecondsSinceEpoch(this * 1000),
    );
  }
}
