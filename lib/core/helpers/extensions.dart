import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/core/helpers/ui_string.dart';

extension ContextExtensions on BuildContext {
  // /// Is the device a phone
  //this change should reflect
  bool get isSmallScreen => MediaQuery.of(this).size.width < 650;

  // /// Is the device a tablet
  // bool get isMediumScreen =>
  //     MediaQuery.of(this).size.width >= 650 &&
  //     MediaQuery.of(this).size.width < 1100;

  // /// Is the device a desktop
  // bool get isBigScreen => MediaQuery.of(this).size.width >= 1100;

  /// Returns the current [ThemeData] of the [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Returns the current [MediaQueryData] of the [BuildContext].
  MediaQueryData get mq => MediaQuery.of(this);

  OverlayState? get overlay => Overlay.of(this);

  /// Returns the current [ModalRoute] args of the [BuildContext].
  dynamic get routeArgs => ModalRoute.of(this)!.settings.arguments;

  /// Returns the current [TextTheme] of the [BuildContext].
  TextTheme get textTheme => theme.textTheme;

  /// Returns the current [Size] of the [BuildContext].
  Size get mqSize => mq.size;

  /// Returns the current [MediaQueryData.size.width] of the [BuildContext].
  double get width => mq.size.width;

  /// Returns the current [MediaQueryData.size.height] of the [BuildContext].
  double get height => mq.size.height;

  /// Shows a [SnackBar] with the given [message] and [backgroundColor] acc
  /// to the [snackType].
  /// [duration] defaults to 2 seconds.
  /// [backgroundColor] defaults to [Colors.black].
  /// [backgroundRadius] defaults to 8.
  /// [textColor] defaults to [Colors.white].
  /// [snackType] defaults to [SnackType.info].
}

extension NumOperations on double {
  String toFeetAndInches() {
    var feet = (this ~/ 12).round();
    var inches = (this % 12).round();

    var height = "$feet'$inches\"";
    return height;
  }

  /// Returns random integer, where max range is
  /// based on the number applied upon.
  // String randomInt() => Random().nextInt(toInt()).toString();
}

extension IterableModifier<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) =>
      cast<E?>().firstWhere((v) => v != null && test(v), orElse: () => null);

  E? singleWhereOrNull(bool Function(E) test) =>
      cast<E?>().singleWhere((v) => v != null && test(v), orElse: () => null);
}

extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: this.hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer
      ..write(time.format(context))
      ..write(' ')
      ..write(period == DayPeriod.am
          ? localizations.anteMeridiemAbbreviation
          : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }

  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  bool isAfter(TimeOfDay other) {
    double b = other.hour + other.minute / 60.0;
    double a = hour + minute / 60.0;
    if (a >= b) {
      return true;
    } else {
      return false;
    }
  }

  bool isBefore(TimeOfDay other) {
    double b = other.hour + other.minute / 60.0;
    double a = hour + minute / 60.0;
    if (a <= b) {
      return true;
    } else {
      return false;
    }
  }

  double toDouble() => hour + minute / 60.0;
}

extension StringExtensions on String {
  /// Camelcase string extension
  String toCamelCase() {
    if (trim().isEmpty) return this;
    final wordList = split(UiString.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
          .toList()
          .join(UiString.space);
    }
    return wordList.first[0].toUpperCase() +
        wordList.first.substring(1).toLowerCase();
  }

  String camelToSentence() {
    return replaceAllMapped(
      RegExp(r'^([a-z])|[A-Z]'),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase(),
    );
  }

  /// Normalize Firebase or Platform exception message
  String normalizeMessage() {
    if (trim().isEmpty) return this;
    return replaceAll(
      UiString.normalizationRegEx,
      UiString.space,
    ).toCamelCase();
  }

  /// Provide name initials of any provided string
  String initials() {
    if (trim().isEmpty) return this;
    final wordList = split(UiString.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase())
          .toList()
          .join();
    }
    return wordList.first[0].toUpperCase();
  }

  DateTime toDate() {
    assert(isNotEmpty, 'String must be non-empty to be able to parse');
    final dateTime = DateTime.tryParse(this);
    assert(dateTime != null, 'Date format is incorrect');
    return dateTime!;
  }
}

extension ColorExtensions on int {
  MaterialColor toMaterialColor() {
    return MaterialColor(
      this,
      <int, Color>{
        50: Color(this),
        100: Color(this),
        200: Color(this),
        300: Color(this),
        400: Color(this),
        500: Color(this),
        600: Color(this),
        700: Color(this),
        800: Color(this),
        900: Color(this),
      },
    );
  }
}

extension DateExtensions on DateTime {
  String toStandardDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toDayMonthYear() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }

  String toDay() {
    return DateFormat('E').format(this);
  }

  String toDayMonthYearTime() {
    return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(this);
  }

  String toStartTimeFormat() {
    return DateFormat.jm().format(this);
  }

  String toEndTimeFormat() {
    return DateFormat.jm().format(this);
  }

  String toTime() {
    return DateFormat('hh:mm:ss.SSS aa').format(this);
  }
}

enum StartingDayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// Returns a numerical value associated with given `weekday`.
///
/// Returns 1 for `StartingDayOfWeek.monday`, all the way to 7 for `StartingDayOfWeek.sunday`.
int getWeekdayNumber(StartingDayOfWeek weekday) {
  return StartingDayOfWeek.values.indexOf(weekday) + 1;
}

bool hasNullField(dynamic object) {
  if (object == null) {
    return true; // Object itself is null
  }

  final fields = object.toMap(); // Assuming the object has a `toMap()` method
  log(fields.toString());
  for (final field in fields.entries) {
    // if (field['occupation'] != null && field.key == 'worksat') {
    //   if (UiString.occupationWithNullWorksat.contains(field['occupation'])) {
    //     continue;
    //   }
    // }
    if (field.key != 'linkedin' && field.value == null) {
      return true; // Found a null field
    }
  }

  return false; // No null fields found
}

List<T> rightRotate<T>(List<T> array, int rotations) {
  if (array.isEmpty) return array;

  final n = array.length;
  final shift = rotations % n;

  return [...array.sublist(n - shift), ...array.sublist(0, n - shift)];
}

List<T> leftRotate<T>(List<T> array, int rotations) {
  if (array.isEmpty) return array;

  final n = array.length;
  final shift = rotations % n;

  return [...array.sublist(shift), ...array.sublist(0, shift)];
}
