import 'package:hive_ce/hive.dart';

part 'user_db.g.dart';

@HiveType(typeId: 0)
class UserDb extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  UserDb({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });
}