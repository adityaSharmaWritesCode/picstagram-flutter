import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picstagram/models/posts.dart';
import 'package:picstagram/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post :
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      PostModel post = PostModel(
        description: description,
        username: username,
        uid: uid,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //updating like information
  Future<void> likePost(
    String postId,
    String uid,
    List likes,
  ) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update(
          {
            "likes": FieldValue.arrayRemove([uid])
          },
        );
      } else {
        await _firestore.collection('posts').doc(postId).update(
          {
            "likes": FieldValue.arrayUnion([uid])
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
