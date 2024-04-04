import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repositoru/src/models/user.dart';
import 'package:user_repositoru/src/user_repo.dart';
import 'package:user_repositoru/user_repository.dart';

class FirebaseUserRepo implements UserRepository{
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

 @override
  // TODO: implement user
  Stream<MyUser?> get user{
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield MyUser.empty;
      }else{
        yield await usersCollection
        .doc(firebaseUser.uid)
        .get()
        .then((value) =>MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)) );
      }
    });
  }

   @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

 
}
  