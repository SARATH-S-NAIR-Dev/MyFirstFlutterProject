class UserData {
  final String imagePath;
  final String sid;
  final String name;
  final String email;
  final String about;
  final String contact;
  final String dob;
  final String roll;
  final String reg;
  final bool isDarkMode;

  final String address;

  const UserData({
    required this.imagePath,
    required this.sid,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
    required this.address,
    required this.contact,
    required this.dob,
    required this.roll,
    required this.reg,
  });
}
