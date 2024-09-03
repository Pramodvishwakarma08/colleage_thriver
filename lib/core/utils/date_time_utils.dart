import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// const String dateTimeFormatPattern = 'dd/MM/yyyy';
// const String FULL_DATE_FORMAT = 'dd MMMM yyyy';
//
// extension DateTimeExtension on DateTime {
//   String format([
//     String pattern = dateTimeFormatPattern,
//     String? locale,
//   ]) {
//     if (locale != null && locale.isNotEmpty) {
//       initializeDateFormatting(locale);
//     }
//     return DateFormat(pattern, locale).format(this);
//   }
// }
const String dateTimeFormatPattern = 'dd/MM/yyyy';
const String FULL_DATE_FORMAT = 'dd MMMM yyyy';
const String TIME_FORMAT_12_HOUR = 'hh:mm a';

extension DateTimeExtension on DateTime {
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatTime12Hour() {
    return DateFormat(TIME_FORMAT_12_HOUR).format(this);
  }
}


String  UTCtoISTFormatTime12Hour(String time){
  String dateTime = time;
  DateTime parsedDateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(dateTime).toLocal();
  String formatedDateTime = "${parsedDateFormat.formatTime12Hour()}";
  print("ISO${formatedDateTime}");
  return "$formatedDateTime";
}