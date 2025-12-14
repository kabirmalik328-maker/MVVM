class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String roleName;
  final String token;
  final String? businessId;
  final bool? isVerified;
  final String? createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.roleName,
    required this.token,
    this.phone,
    this.businessId,
    this.isVerified,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'],
      roleName: json['roleName'] ?? 'user',
      token: json['token'] ?? '',
      businessId: json['businessId'],
      isVerified: json['is_verified'] ?? json['verified'] ?? false,
      createdAt: json['created_at'] ?? json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'roleName': roleName,
      'token': token,
      'businessId': businessId,
      'is_verified': isVerified,
      'created_at': createdAt,
    };
  }
}