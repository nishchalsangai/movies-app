import 'dart:convert';

import 'package:floor/floor.dart';

class DateTimeConverter extends TypeConverter<DateTime?, int?> {
  @override
  DateTime? decode(int? databaseValue) {
    return databaseValue != null
        ? DateTime.fromMillisecondsSinceEpoch(databaseValue)
        : null;
  }

  @override
  int? encode(DateTime? value) {
    return value?.millisecondsSinceEpoch;
  }
}

class IntListConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    return (json.decode(databaseValue) as List<dynamic>)
        .map((e) => e as int)
        .toList();
  }

  @override
  String encode(List<int> value) {
    return json.encode(value);
  }
}
