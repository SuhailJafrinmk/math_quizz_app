class ValidatorFunctions {
  static String? validateInput(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a value';
    }
    final parsedValue = double.tryParse(input);
    if (parsedValue == null) {
      return 'Invalid number';
    }
    return null;
  }
}
