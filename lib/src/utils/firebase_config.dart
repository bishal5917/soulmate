import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseConfig {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  final baseDb = FirebaseFirestore.instance;
}
