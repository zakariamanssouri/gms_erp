
//{"id":1,"name":"admin","email":"admin@gmail.com","email_verified_at":null,"created_at":null,"updated_at":null}
class User{
  int? id;
  String? name;
  String? email;
  String? password;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  //convert arrey into list

  factory User.fromJson(Map<String, dynamic> json) { 
   return User(
      id: json['id'],
      name: json['name'],
      email: json['email'], 
    );
  }

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
  
  String tostring(){
    String result = "$id  $name  $email" ;
    return result.toString();
  }
}

