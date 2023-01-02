class Logger {
  bool printToConsole;

  Logger({
    this.printToConsole = true,
  });

  void debug(String message) {
    _consoleLog(message);
  }

  void info(String message) {
    _consoleLog(message);
  }

  void warning(String message) {
    _consoleLog(message);
  }

  void error(
    String message, {
    StackTrace? trace,
  }) {
    _consoleLog(message);
    if (trace != null && printToConsole) {
      print(trace);
    }
  }

  // ignore: use_setters_to_change_properties
  void setConsoleLogging({required bool enabled}) {
    printToConsole = enabled;
  }

  void _consoleLog(String message) {
    if (printToConsole) {
      print(message);
    }
  }
}
