//Pin validation
String? validatePin(String? value) {
  if (value == null || value.isEmpty) {
    return 'PIN cannot be empty';
  }
  if (value.length != 5) {
    return 'PIN must be exactly 5 digits';
  }
  if (!RegExp(r'^\d{5}$').hasMatch(value)) {
    return 'PIN must contain only numbers';
  }
  return null;
}
