import 'dart:convert';

class UserDataWs {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isInstructorExaminer;

  UserDataWs({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isInstructorExaminer,
  });

  factory UserDataWs.fromJson(Map<String, dynamic> json) {
    return UserDataWs(
      id: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      isInstructorExaminer: json['instructorExaminer'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'instructorExaminer': isInstructorExaminer,
    };
  }
}
