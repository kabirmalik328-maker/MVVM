class Validators {
  static String? validateNote(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Note is optional
    }
    if (value.length > 100) {
      return 'Note must be less than 100 characters';
    }
    return null;
  }

  static bool isValidCounterValue(int value) {
    return value >= -1000 && value <= 1000;
  }
}
