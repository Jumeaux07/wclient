// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

ClientModel clientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  String? message;
  int? statut;
  Data? data;

  ClientModel({
    this.message,
    this.statut,
    this.data,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        message: json["message"],
        statut: json["statut"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statut": statut,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? nomPrenoms;
  String? phone1;
  String? phone2;
  String? sexe;
  String? password;
  int? communeId;
  int? quartierId;
  int? statutGeneriqueId;
  String? createdBy;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.nomPrenoms,
    this.phone1,
    this.phone2,
    this.sexe,
    this.password,
    this.communeId,
    this.quartierId,
    this.statutGeneriqueId,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nomPrenoms: json["nom_prenoms"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        sexe: json["sexe"],
        password: json["password"],
        communeId: json["commune_id"],
        quartierId: json["quartier_id"],
        statutGeneriqueId: json["statut_generique_id"],
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_prenoms": nomPrenoms,
        "phone1": phone1,
        "phone2": phone2,
        "sexe": sexe,
        "password": password,
        "commune_id": communeId,
        "quartier_id": quartierId,
        "statut_generique_id": statutGeneriqueId,
        "created_by": createdBy,
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
