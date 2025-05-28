import 'dart:developer';

void logError(String message) {
  log('\x1B[31m$message\x1B[0m'); // Red
}

void logWarning(String message) {
  log('\x1B[33m$message\x1B[0m'); // Yellow
}

void logSuccess(String message) {
  log('\x1B[32m$message\x1B[0m'); // Green
}
