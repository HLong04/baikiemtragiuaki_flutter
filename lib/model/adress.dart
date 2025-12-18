class Address {
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Address({
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
    );
  }
}