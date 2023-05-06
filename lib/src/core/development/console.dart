import 'dart:developer';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

import '../enums/enums.dart';

console(var data) {
  if (kDebugMode) {
    return print(data);
  }
}

consolelog(var data) {
  if (kDebugMode) {
    return log(data.toString());
  }
}

logger(var message, {LoggerType loggerType = LoggerType.info}) {
  if (kDebugMode) {
    var logger = Logger(
      printer: PrettyPrinter(
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
          ),
    );
    switch (loggerType) {
      case LoggerType.success:
        logger.i("\x1B[32m$message\x1B[0m");
        break;
      case LoggerType.debug:
        logger.d(message);
        break;
      case LoggerType.error:
        logger.e(message);
        break;
      case LoggerType.info:
        logger.i(message);
        break;
      case LoggerType.warning:
        logger.w(message);
        break;
      case LoggerType.verbose:
        logger.v(message);
        break;
      default:
    }
  }
}
