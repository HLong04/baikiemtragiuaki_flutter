class Rating {
  final dynamic rate;
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'] ?? 0, count: json['count'] ?? 0);
  }
}
