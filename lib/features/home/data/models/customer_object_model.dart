class CustomerObjectModel {
  final String customerId;
  final String description;
  final String email;
  final String name;
  final String phoneNumber;

  CustomerObjectModel({
    required this.customerId,
    required this.description,
    required this.email,
    required this.name,
    required this.phoneNumber,
  });

  factory CustomerObjectModel.fromJson(jsonData) {
    return CustomerObjectModel(
      customerId: jsonData['id'],
      description: jsonData['description'],
      email: jsonData['email'],
      name: jsonData['name'],
      phoneNumber: jsonData['phone'],
    );
  }
}
