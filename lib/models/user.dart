class User {
  final String? email;
  final String? uid;
  final String? photoUrl;
  final String? username;
  final String? bio;
  final String? followers;
  final String? following;

  const User(
      {required this.email,
      this.uid,
      this.photoUrl,
      this.username,
      this.bio,
      this.followers,
      this.following});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
