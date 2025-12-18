class Name {
  final String? firstname;
  final String? lastname;

  Name({this.firstname, this.lastname});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}