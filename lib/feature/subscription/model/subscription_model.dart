class SubscriptionPlan {
  final String title;
  final String price;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan({
    required this.title,
    required this.price,
    required this.features,
    this.isPopular = false,
  });
}
