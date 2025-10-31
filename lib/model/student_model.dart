import 'dart:convert';

class StudentModel {
  int? id;
  String name;
  String email;
  String classs;
  int age;
  dynamic password;

  // 🔹 Kolom baru
  String? noTelp;
  String? alamat;
  String? tanggalLahir;
  String? namaOrtu;
  String? kontakOrtu;

  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.classs,
    required this.age,
    required this.password,
    this.noTelp,
    this.alamat,
    this.tanggalLahir,
    this.namaOrtu,
    this.kontakOrtu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'class': classs,
      'age': age,
      'password': password,
      'no_telp': noTelp,
      'alamat': alamat,
      'tanggal_lahir': tanggalLahir,
      'nama_ortu': namaOrtu,
      'kontak_ortu': kontakOrtu,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int?,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      classs: map['class'] ?? '',
      age: map['age'] ?? 0,
      password: map['password'],
      noTelp: map['no_telp'],
      alamat: map['alamat'],
      tanggalLahir: map['tanggal_lahir'],
      namaOrtu: map['nama_ortu'],
      kontakOrtu: map['kontak_ortu'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
