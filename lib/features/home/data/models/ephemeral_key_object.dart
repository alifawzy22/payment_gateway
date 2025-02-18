class EphemeralKeyObject {
  final String id;
  final String object;
  final String secret;

  EphemeralKeyObject({
    required this.id,
    required this.object,
    required this.secret,
  });

  factory EphemeralKeyObject.fromJson(jsonData) {
    return EphemeralKeyObject(
      id: jsonData['id'],
      object: jsonData['object'],
      secret: jsonData['secret'],
    );
  }
}
