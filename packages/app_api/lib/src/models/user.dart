import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

/// {@template user}
/// User model
/// {@endtemplate}
@HiveType(typeId: 0)
class User extends Equatable {
  /// {@macro user}
  const User(this.name, this.email);

  /// Empty user
  static const empty = User('', '');

  ///
  bool get isEmpty => this == empty;

  /// User name
  @HiveField(0)
  final String name;

  /// User email
  @HiveField(1)
  final String email;

  @override
  String toString() {
    return 'name: $name, email: $email';
  }

  @override
  List<Object> get props => [name, email];
}
