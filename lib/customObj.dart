class currentUser {
  final String name;
  final String email;
  final String acctype;

  const currentUser({
    required this.name,
    required this.email,
    required this.acctype,
  });

  factory currentUser.fromJson(Map<String, dynamic> json) {
    return currentUser(
      name: json['name'],
      email: json['email'],
      acctype: json['acctype'],
    );
  }
}