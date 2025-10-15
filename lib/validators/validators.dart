class Validators {
  static bool isvalidUser(String username) {
    if (username.isEmpty) return false;
    if (!username.contains('@')) return false;
    return true;
  }

  static bool isvalidPass(String pass) {
    return pass.isNotEmpty && pass.length >= 6;
  }
}
