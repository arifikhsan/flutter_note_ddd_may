import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_note_ddd_may/domain/auth/user.dart';
import 'package:flutter_note_ddd_may/domain/core/value_objects.dart';

extension FirebaseUserDomainX on FirebaseUser {
  User toDomain() {
    return User(id: UniqueId.fromUniqueString(uid));
  }
}