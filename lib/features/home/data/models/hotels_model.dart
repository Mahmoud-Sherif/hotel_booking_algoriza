import 'package:hotel_booking_algoriza/core/models/status_model.dart';

class HotelsModel {
  final StatusModel status;
  final HotelsDataModel hotelModel;

  HotelsModel({
    required this.status,
    required this.hotelModel,
  });
  factory HotelsModel.fromJson(Map<String, dynamic> json) {
    return HotelsModel(
      status: StatusModel.fromJson(json['status']),
      hotelModel: HotelsDataModel.fromJson(json['data']),
    );
  }
}

class HotelModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String long;
  final String lat;
  final String rate;
  final String createdAt;
  final String updatedAt;
  final List<HotelImages> hotelImages;
  final List<HotelFacilities> hotelFacilities;

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      long: json['longitude'],
      lat: json['latitude'],
      rate: json['rate'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      hotelImages: List<HotelImages>.from(
        json['hotel_images'].map((x) => HotelImages.fromJson(x)),
      ),
      hotelFacilities: List<HotelFacilities>.from(
        json['hotel_facilities'].map((x) => HotelFacilities.fromJson(x)),
      ),
    );
  }

  HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.long,
    required this.lat,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelImages,
    required this.hotelFacilities,
  });
}

class HotelImages {
  final int id;
  final String hotelId;
  final String image;
  final String? createdAt;
  final String? updatedAt;

  HotelImages({
    required this.id,
    required this.hotelId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HotelImages.fromJson(Map<String, dynamic> json) {
    return HotelImages(
      id: json['id'],
      hotelId: json['hotel_id'],
      image: json['image'],
      createdAt: json['created_at'] ?? '0',
      updatedAt: json['updated_at'] ?? '0',
    );
  }
}

class HotelFacilities {
  final int id;
  final String hotelId;
  final String facilitiesId;
  final String? createdAt;
  final String? updatedAt;

  HotelFacilities({
    required this.id,
    required this.hotelId,
    required this.facilitiesId,
    required this.createdAt,
    required this.updatedAt,
  });
  factory HotelFacilities.fromJson(Map<String, dynamic> json) {
    return HotelFacilities(
      id: json['id'],
      hotelId: json['hotel_id'],
      facilitiesId: json['facility_id'],
      createdAt: json['created_at'] ?? '0',
      updatedAt: json['updated_at'] ?? '0',
    );
  }
}

class HotelsDataModel {
  final List<HotelModel> data;
  final int currentPage;

  HotelsDataModel({
    required this.data,
    required this.currentPage,
  });

  factory HotelsDataModel.fromJson(Map<String, dynamic> json) {
    return HotelsDataModel(
      data: List<HotelModel>.from(
        json['data'].map((x) => HotelModel.fromJson(x)),
      ),
      currentPage: json['current_page'],
    );
  }
}
