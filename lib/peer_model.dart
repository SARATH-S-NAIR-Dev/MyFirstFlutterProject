class PeerData {
  final String id;
  final String content;

  final String name;

  const PeerData({
    required this.id,
    required this.content,
    required this.name,
  });
  factory PeerData.fromJson(Map<String, dynamic> json) {
    return PeerData(
      id: json['id'],
      content: json['content'],
      name: json['name'],
    );
  }
}
