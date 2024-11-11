class UserManager {
  List<String> users = [];

  void addUser(String user) {
    if (!users.contains(user)) {
      users.add(user);
    }
  }

  void removeUser(String user) {
    users.remove(user);
  }

  bool get isEmpty => users.isEmpty;
}
