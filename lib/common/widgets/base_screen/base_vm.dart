import 'package:flutter/material.dart';

/// Typy zdarzeń UI
enum UiEventType {
  dialog,
  snackbar,
}

/// Model zdarzenia UI
class UiEvent {
  final UiEventType type;
  final String message;
  final String? title;

  UiEvent({
    required this.type,
    required this.message,
    this.title,
  });
}

abstract class BaseVm extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  final List<UiEvent> _uiEvents = [];
  List<UiEvent> get uiEvents => List.unmodifiable(_uiEvents);

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String message) {
    _error = message;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }

  void showDialogEvent({
    required String title,
    required String message,
  }) {
    _uiEvents.add(
      UiEvent(
        type: UiEventType.dialog,
        title: title,
        message: message,
      ),
    );
    notifyListeners();
  }

  void showSnackbarEvent(String message) {
    _uiEvents.add(
      UiEvent(
        type: UiEventType.snackbar,
        message: message,
      ),
    );
    notifyListeners();
  }

  void consumeUiEvent(UiEvent event) {
    _uiEvents.remove(event);
  }

  Future<void> runSafe(
      Future<void> Function() action, {
        bool showLoading = true,
        String? errorMessage,
      }) async {
    try {
      if (showLoading) setLoading(true);
      clearError();
      await action();
    } catch (e, s) {
      debugPrint('ERROR: $e');
      debugPrintStack(stackTrace: s);

      final message = errorMessage ?? 'Wystąpił nieoczekiwany błąd';
      setError(message);
      showSnackbarEvent(message);
    } finally {
      if (showLoading) setLoading(false);
    }
  }
}