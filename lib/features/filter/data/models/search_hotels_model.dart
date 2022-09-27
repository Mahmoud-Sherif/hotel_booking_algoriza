import 'package:hotel_booking_algoriza/core/models/status_model.dart';

class SearchHotelsModel {
  final StatusModel status;
  final HotelsDataModel hotelModel;

  SearchHotelsModel({
    required this.status,
    required this.hotelModel,
  });
  factory SearchHotelsModel.fromJson(Map<String, dynamic> json) {
    return SearchHotelsModel(
      status: StatusModel.fromJson(json['status']),
      hotelModel: HotelsDataModel.fromJson(json['data']),
    );
  }
}

class SearchgHotelModel {
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

  factory SearchgHotelModel.fromJson(Map<String, dynamic> json) {
    return SearchgHotelModel(
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
        json['facilities'].map((x) => HotelFacilities.fromJson(x)),
      ),
    );
  }

  SearchgHotelModel({
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
  final String name;
  final String image;
  final String? createdAt;
  final String? updatedAt;

  HotelFacilities({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  factory HotelFacilities.fromJson(Map<String, dynamic> json) {
    return HotelFacilities(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['created_at'] ?? '0',
      updatedAt: json['updated_at'] ?? '0',
    );
  }
}

class HotelsDataModel {
  final List<SearchgHotelModel> search;
  final int currentPage;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final String hotelPerPage;
  final String? previewPageUrl;
  final int to;
  final int total;
  final List<LinkModel> links;

  HotelsDataModel({
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.hotelPerPage,
    required this.previewPageUrl,
    required this.to,
    required this.total,
    required this.search,
    required this.currentPage,
    required this.links,
  });

  factory HotelsDataModel.fromJson(Map<String, dynamic> json) {
    return HotelsDataModel(
      search: List<SearchgHotelModel>.from(
          json['data'].map((x) => SearchgHotelModel.fromJson(x))),
      currentPage: json['current_page'],
      links: List<LinkModel>.from(
        json['links'].map((x) => LinkModel.fromJson(x)),
      ),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      hotelPerPage: json['per_page'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'] ?? '0',
      path: json['path'],
      previewPageUrl: json['prev_page_url'] ?? '0',
      to: json['to'],
      total: json['total'],
    );
  }
}

class LinkModel {
  final String? url;
  final String label;
  final bool active;

  LinkModel({
    required this.url,
    required this.label,
    required this.active,
  });
  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      url: json['url'] ?? '0',
      label: json['label'],
      active: json['active'],
    );
  }
}

// class SearchDataModel {
//   final int id;
//   final String userID;
//   final String hotelId;
//   final String type;
//   final String createdAt;
//   final String updatedAt;
//   final SearchgHotelModel hotel;
//   final UserModel user;

//   SearchDataModel({
//     required this.id,
//     required this.userID,
//     required this.hotelId,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.hotel,
//     required this.user,
//   });
//   factory SearchDataModel.fromJson(Map<String, dynamic> json) {
//     return SearchDataModel(
//       id: json['id'],
//       userID: json['user_id'],
//       hotelId: json['hotel_id'],
//       type: json['type'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       hotel: SearchgHotelModel.fromJson(json['hotel']),
//       user: UserModel.fromJson(json['user']),
//     );
//   }
// }

// class Booking {
//   final List<BookingDataModel> data;
//   Booking({
//     required this.data,
//   });
//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
      // data: List<BookingDataModel>.from(
      //   json['data'].map((x) => BookingDataModel.fromJson(x)),
//       ),
//     );
//   }
// }
