import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;
  final String userID;

  const AddUser(this.fullName, this.company, this.age, this.userID, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection


    Future<void> addUser()async {
      // Call the user's CollectionReference to add a new user

      CollectionReference db = FirebaseFirestore.instance.collection('users');

      final user = <String, dynamic>{
        'full_name': fullName, // John Doe
        'company': company, // Stokes and Sons
        'age': age, // 42
        'userID': userID
      };
      FirebaseFirestore.instance.collection('NVT').doc('user').set(user);   //>>CACH 2
        db.doc().collection('user')
          .add(user)

          .then((value) =>print("Add User"))
          .catchError((error) => print("Error writing document: $error"));

      // return users
      //     .add({
      //   'full_name': fullName, // John Doe
      //   'company': company, // Stokes and Sons
      //   'age': age // 42
      // })
      //     .then((value) => print("User Added"))
      //     .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: const Text(
        "Add User",
      ),
    );
  }
}