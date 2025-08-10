class BillingInfo {
  String firstName;
  String lastName;
  String phone;
  String email;
  String country;
  String address;
  String city;
  String state;
  String zipCode;
  String? additionalInfo;

  BillingInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.country,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    this.additionalInfo,
  });
}
