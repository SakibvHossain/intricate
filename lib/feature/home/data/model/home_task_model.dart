class HomeTaskModel {
  final String time;
  final String type;
  final String title;
  final String description;
  final String buttonText;
  final bool isVideo;

  HomeTaskModel({
    required this.time,
    required this.type,
    required this.title,
    required this.description,
    required this.buttonText,
    this.isVideo = false,
  });
}
