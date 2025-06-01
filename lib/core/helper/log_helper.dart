import 'dart:developer';

void logError(String message) {
  log('\x1B[1;91m$message\x1B[0m'); // Bright Red + Bold
}

void logWarning(String message) {
  log('\x1B[1;93m$message\x1B[0m'); // Bright Yellow + Bold
}

void logSuccess(String message) {
  log('\x1B[1;92m$message\x1B[0m'); // Bright Green + Bold
}
