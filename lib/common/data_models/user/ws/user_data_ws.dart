class UserDataWs {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  UserDataWs({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserDataWs.fromJson(Map<String, dynamic> json) {
    return UserDataWs(
      id: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
