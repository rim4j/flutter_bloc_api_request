class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      firstName: json["firstName"] ?? "First Name",
      lastName: json["lastName"] ?? "Last Name",
      avatar: json["avatar"] ??
          "https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?w=826&t=st=1685205615~exp=1685206215~hmac=ab73cc738f1ec260ad5c15ce8736be15d4d57c40702e3484d0964e9b7f60fab8",
    );
  }
}


// id: 12,
// email: "rachel.howell@reqres.in",
// first_name: "Rachel",
// last_name: "Howell",
// avatar: "https://reqres.in/img/faces/12-image.jpg"