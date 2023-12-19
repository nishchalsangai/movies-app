// // Log Manager
// import 'dart:async';
// import 'dart:developer';

// import 'package:logger/logger.dart';

// class LoggerService {
//   final _logStreamController = StreamController<String>.broadcast();

//   static final LoggerService _instance = LoggerService._internal();

//   factory LoggerService() {
//     return _instance;
//   }
//   LoggerService._internal();

//   void Function(String) get log => (String message) {
//         _logStreamController.sink.add(message);
//       };

//   Stream<String> get logs => _logStreamController.stream;
// }

// class CustomLogOutput extends LogOutput {
//   @override
//   void output(OutputEvent event) {
//     for (var line in event.lines) {
//       // Capture the message for your log manager
//       LoggerService().log(line);

//       // Also print it to the console
//       log(line);
//     }
//   }
// }
