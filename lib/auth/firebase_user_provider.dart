import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PetWowFirebaseUser {
  PetWowFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PetWowFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PetWowFirebaseUser> petWowFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PetWowFirebaseUser>((user) => currentUser = PetWowFirebaseUser(user));
