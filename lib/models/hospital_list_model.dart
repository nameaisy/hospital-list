import 'dart:convert';


List<HospitalListModel> hospitalListModelFromJson(List<dynamic> data) => List<HospitalListModel>.from(data.map((x) => HospitalListModel.fromJson(x)));
String hospitalListModelToJson(List<HospitalListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalListModel {
  HospitalListModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.phone,
    this.coordinates,
    this.website,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic title;
  dynamic content;
  dynamic image;
  dynamic phone;
  dynamic coordinates;
  dynamic website;
  dynamic createdAt;
  dynamic updatedAt;

  factory HospitalListModel.fromJson(Map<String, dynamic> json) => HospitalListModel(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    image: json["image"],
    phone: json["phone"],
    coordinates: json["coordinates"],
    website: json["website"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "image": image,
    "phone": phone,
    "coordinates": coordinates,
    "website": website,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}