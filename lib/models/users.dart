class UserModel {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const UserModel({
    required this.email,
    required this.username,
    required this.uid,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following,
      };
}
