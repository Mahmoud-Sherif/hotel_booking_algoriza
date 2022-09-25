class UserModel {
  final int id;
  final String token;
  final String name;
  final String email;
  final String? emailVerified;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final String? googleId;
  final String? provider;

  UserModel({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.googleId,
    required this.provider,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['api_token'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      emailVerified: json['email_verified_at'] ?? 'null',
      googleId: json['google_id'] ?? 'null',
      image: json['image'] ?? 'null',
      provider: json['provider'] ?? 'null',
      updatedAt: json['updated_at'],
    );
  }
}
