class CustomerInputObjectModel {
  final String? description;
  final String? email;
  final String? name;
  final String? paymentMethod;
  final String? phoneNumber;

  CustomerInputObjectModel({
    required this.description,
    required this.email,
    required this.name,
    required this.paymentMethod,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'email': email,
      'name': name,
      'payment_method': paymentMethod,
      'phone': phoneNumber,
    };
  }
}
