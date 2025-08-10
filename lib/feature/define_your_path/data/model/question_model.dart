class TextQuestion {
  final String title;
  final String subtitle;
  final List<String> fields; // Even single-input screens use a list

  TextQuestion( {
    required this.subtitle,
    required this.title,
    required this.fields,
  });
}
