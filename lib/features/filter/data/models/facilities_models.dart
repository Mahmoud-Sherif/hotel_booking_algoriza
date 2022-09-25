import 'package:hotel_booking_algoriza/core/models/status_model.dart';

class Facilites {
  final StatusModel status;
  final List<FacilitesDataModel> facilitesData;

  Facilites({
    required this.status,
    required this.facilitesData,
  });
  factory Facilites.fromJson(Map<String, dynamic> json) {
    return Facilites(
      status: StatusModel.fromJson(json['status']),
      facilitesData: List<FacilitesDataModel>.from(
        json['data'].map((x) => FacilitesDataModel.fromJson(x)),
      ),
    );
  }
}

class FacilitesDataModel {
  final int id;
  final String name;
  final String image;
  final String createdAt;
  final String updatedAt;

  FacilitesDataModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  factory FacilitesDataModel.fromJson(Map<String, dynamic> json) {
    return FacilitesDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
