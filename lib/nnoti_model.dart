class NNotiData {
  final String title;
  final String content;

  const NNotiData({
    required this.content,
    required this.title,
  });
  factory NNotiData.fromJson(Map<String, dynamic> json) {
    return NNotiData(
      content: json['details'],
      title: json['title'],
    );
  }
}
