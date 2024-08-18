class User {
  final String name;
  final int age;
  final String address;
  final int id;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
  });
  Map<String, dynamic> usrMap() {
    return {
      'Name': name,
      'Id': id,
      'Age': age,
      'Address': address,
    };
  }
}
