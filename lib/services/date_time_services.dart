
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

abstract class DateTimeServices {
  // static DateTime millisecondsSinceEpochToDateTime({required int millisecondsSinceEpoch}) {
  //   print(1111111);
  //   print(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
  //   print(2222222);
  //   return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  // }

  static ({int hours, int minutes}) convertMinutesToHoursMinutes(int minutes) {
    int h = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return (hours: h, minutes: remainingMinutes);
  }

  // static ({int hours, int minutes, int seconds}) convertMinutesToHoursMinutesSeconds(int minutes) {
  //   print("line 11");
  //   print(minutes);
  //   int h = minutes ~/ 60;
  //   int remainingMinutes = minutes % 60;
  //   int remainingSeconds = remainingMinutes % 60;
  //   print((hours: h, minutes: remainingMinutes, seconds: remainingSeconds));
  //   return (hours: h, minutes: remainingMinutes, seconds: remainingSeconds);
  // }
  static ({String? date, String? time, DateTime? dateTime}) convertUtcToLocalDateTime(String utcTimestamp) {
    //9 Nov, 2023
    try {
      // Parse the UTC timestamp
      DateTime utcDateTime = DateTime.parse(utcTimestamp).toLocal();

      // Format the local date
      String localDate = DateFormat('d MMM, y').format(utcDateTime);

      // Format the local time in 12-hour format with AM/PM
      String localTime = DateFormat('h:mm a').format(utcDateTime);

      return (date: localDate, time: localTime, dateTime: utcDateTime);
    } catch (e, s) {
      Logger().e(e, stackTrace: s);

      return (date: null, time: null, dateTime: null);
    }
  }

  static bool isSameDate({required DateTime date1, required DateTime date2}) {
    try {
      return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
    } catch (e) {
      return false;
    }
  }

  static ({String? date, String? time, DateTime? dateTime}) convertMillisecondsToLocalizedDateTime(
      int millisecondsSinceEpoch) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return convertUtcToLocalDateTime(dateTime.toIso8601String());
  }

  static String? getRelativeDayNameWithinPast7Days(DateTime date) {
    DateTime currentDate = DateTime.now();

    // Check if the date is today
    if (date.year == currentDate.year && date.month == currentDate.month && date.day == currentDate.day) {
      return "Today";
    }

    // Check if the date is yesterday
    DateTime yesterdayDate = currentDate.subtract(const Duration(days: 1));
    if (date.year == yesterdayDate.year && date.month == yesterdayDate.month && date.day == yesterdayDate.day) {
      return "Yesterday";
    }

    // Check for other days in the last 7 days
    for (int i = 6; i >= 0; i--) {
      DateTime targetDate = currentDate.subtract(Duration(days: i));
      if (date.year == targetDate.year && date.month == targetDate.month && date.day == targetDate.day) {
        return DateFormat('EEEE').format(date); // 'EEEE' gives the day name
      }
    }

    return null;
  }

  static String? getRelativeDayName(DateTime date) {
    DateTime currentDate = DateTime.now();

    // Check if the date is today
    if (date.year == currentDate.year && date.month == currentDate.month && date.day == currentDate.day) {
      return "Today";
    }

    // Check if the date is yesterday
    DateTime yesterdayDate = currentDate.subtract(const Duration(days: 1));
    if (date.year == yesterdayDate.year && date.month == yesterdayDate.month && date.day == yesterdayDate.day) {
      return "Yesterday";
    }

    // Check if the date is tomorrow
    DateTime tomorrowDate = currentDate.add(const Duration(days: 1));
    if (date.year == tomorrowDate.year && date.month == tomorrowDate.month && date.day == tomorrowDate.day) {
      return "Tomorrow";
    }

    return null;
  }

  static int calculateAge(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);
    final age = difference.inDays ~/ 365;
    return age;
  }

  static ({int gapInMilliseconds, int gapInMinutes}) calculateTimeGapOfMillisecondsSinceEpoch(
      {required int timestamp1, required int timestamp2}) {
    int gapInMilliseconds = timestamp2 - timestamp1;

    int gapInMinutes = (gapInMilliseconds / (1000 * 60)).round();

    return (gapInMilliseconds: gapInMilliseconds, gapInMinutes: gapInMinutes);
  }

  static String formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} s ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} ${Intl.plural(
        difference.inHours,
        one: 'h ago',
        other: 'h ago',
      )}";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} ${Intl.plural(
        difference.inDays,
        one: 'd ago',
        other: 'd ago',
      )}";
    } else {
      final weeks = difference.inDays ~/ 7;
      return "$weeks ${Intl.plural(
        weeks,
        one: 'w ago',
        other: 'w ago',
      )}";
    }
  }
}
