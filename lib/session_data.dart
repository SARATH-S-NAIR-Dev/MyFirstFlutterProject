import 'package:s_help/user_model.dart';

class SessionData {
  late UserData user;
  SessionData._privateConstructor();
  static final SessionData instance = SessionData._privateConstructor();
  void setUserData(UserData user) {
    this.user = user;
  }

  factory SessionData() => instance;

  get getUser => user;
}
