class NotiData {
  final String name;
  final String title;
  final String date;
  final String sdate;
  final String subject;

  const NotiData({
    required this.name,
    required this.title,
    required this.date,
    required this.sdate,
    required this.subject,
  });
  factory NotiData.fromJson(Map<String, dynamic> json) {
    return NotiData(
        name: json['title'],
        title: json['details'],
        date: json['date'],
        sdate: json['subdate'],
        subject: json['subject']);
  }
}
