import 'dart:ffi';
import 'dart:typed_data';

class Pemilih {
  Pemilih({
    this.id,
    this.nik,
    this.name,
    this.phone,
    this.gender,
    this.date,
    this.address,
    this.latAddress,
    this.lngAddres,
    this.picture,
    this.picturePath,
  });

  int? id;
  String? nik;
  String? name;
  String? phone;
  String? gender;
  String? date;
  String? address;
  double? latAddress;
  double? lngAddres;
  String? picture;
  String? picturePath;

  factory Pemilih.fromSqfliteDatabase(Map<String, dynamic> map)=>Pemilih(
    id: map['id'] ?? 0,
    nik: map['nik'] ?? '',
    name: map['name'] ?? '',
    phone: map['phone'] ?? '',
    gender: map['gender'] ?? '',
    date: map['date'] ?? '',
    address: map['address'] ?? '',
    latAddress: double.parse(map['lat_address'] ?? 0),
    lngAddres: double.parse(map['lng_address'] ?? 0),
    picture: map['picture'] ?? '',
    picturePath: map['picture_path'] ?? '',
  );

}