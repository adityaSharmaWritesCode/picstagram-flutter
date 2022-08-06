import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//TODO : Learn about uuid package

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //adding image to firebase storage
  //NOTE - WHY WE ARE ASKING IF IT IS A POST OR NOT
  //       Since a user can only have one profile pic at a time, we can suffice with having just one reference to one folder, i.e., the profile pics folder
  //       On the other hand, a user may have several posts and thus to store each post with a unique ID we would need to create another reference
  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();

    return downloadURL;
  }
}
