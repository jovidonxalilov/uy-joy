import 'dart:convert';

class PropertyModel {
  final List<Datum> data;
  final int total;
  final int page;
  final int limit;

  PropertyModel({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  // Bu yerda o'zgartirish - Map qabul qiladi
  factory PropertyModel.fromJson(dynamic json) {
    if (json is String) {
      return PropertyModel.fromMap(jsonDecode(json));
    } else if (json is Map<String, dynamic>) {
      return PropertyModel.fromMap(json);
    }
    throw Exception('Invalid JSON format for PropertyModel');
  }

  String toJson() => json.encode(toMap());

  factory PropertyModel.fromMap(Map<String, dynamic> json) => PropertyModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    total: json["total"] ?? 0,
    page: json["page"] ?? 0,
    limit: json["limit"] ?? 10,
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "total": total,
    "page": page,
    "limit": limit,
  };
}

class Datum {
  final String id;
  final String typeOfSale;
  final String buildingType;
  final String title;
  final String description;
  final String numberOfRooms;
  final int numberOfBathrooms;
  final int area;
  final int floor;
  final int totalFloors;
  final String furnishing;
  final int latitude;
  final int longitude;
  final String location;
  final List<String> locatedNear;
  final bool isVip;
  final String? youtubeLink;
  final bool isVerified;
  final String rentalFrequency;
  final String currency;
  final int price;
  final List<Photos> photos;
  final String ownerId;
  final bool isPaid;
  final bool freeListingUsed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Datum({
    required this.id,
    required this.typeOfSale,
    required this.buildingType,
    required this.title,
    required this.description,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.area,
    required this.floor,
    required this.totalFloors,
    required this.furnishing,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.locatedNear,
    required this.isVip,
    required this.youtubeLink,
    required this.isVerified,
    required this.rentalFrequency,
    required this.currency,
    required this.price,
    required this.photos,
    required this.ownerId,
    required this.isPaid,
    required this.freeListingUsed,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? "",
    typeOfSale: json["typeOfSale"] ?? "",
    buildingType: json["buildingType"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    numberOfRooms: json["NumberOfRooms"] ?? "",
    numberOfBathrooms: json["NumberOfBathrooms"] ?? 0,
    area: json["Area"] ?? 0,
    floor: json["floor"] ?? 0,
    totalFloors: json["totalFloors"] ?? 0,
    furnishing: json["furnishing"] ?? "",
    latitude: json["latitude"] ?? 0,
    longitude: json["longitude"] ?? 0,
    location: json["location"] ?? "",
    // locatedNear xavfsiz parsing
    locatedNear: json["locatedNear"] != null
        ? List<String>.from(json["locatedNear"].map((x) => x.toString()))
        : [],
    isVip: json["isVip"] ?? false,
    youtubeLink: json["youtubeLink"],
    isVerified: json["isVerified"] ?? false,
    rentalFrequency: json["rentalFrequency"] ?? "",
    currency: json["currency"] ?? "",
    price: json["price"] ?? 0,
    // Photos xavfsiz parsing
    photos: json["photos"] != null
        ? List<Photos>.from(
            json["photos"].map(
              (x) => x is String ? Photos(photo: x) : Photos.fromJson(x),
            ),
          )
        : [],
    ownerId: json["ownerId"] ?? "",
    isPaid: json["isPaid"] ?? false,
    freeListingUsed: json["freeListingUsed"] ?? false,
    createdAt: json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : DateTime.now(),
    updatedAt: json["updatedAt"] != null
        ? DateTime.parse(json["updatedAt"])
        : DateTime.now(),
    user: User.fromMap(json["user"] ?? {}),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "typeOfSale": typeOfSale,
    "buildingType": buildingType,
    "title": title,
    "description": description,
    "NumberOfRooms": numberOfRooms,
    "NumberOfBathrooms": numberOfBathrooms,
    "Area": area,
    "floor": floor,
    "totalFloors": totalFloors,
    "furnishing": furnishing,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "locatedNear": List<dynamic>.from(locatedNear.map((x) => x)),
    "isVip": isVip,
    "youtubeLink": youtubeLink,
    "isVerified": isVerified,
    "rentalFrequency": rentalFrequency,
    "currency": currency,
    "price": price,
    "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
    "ownerId": ownerId,
    "isPaid": isPaid,
    "freeListingUsed": freeListingUsed,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "user": user.toMap(),
  };
}

// Tuzatilgan Photos klasi
class Photos {
  final String photo;

  Photos({required this.photo});

  // Bu yerda field nomi "photos" emas, "photo" bo'lishi kerak
  factory Photos.fromJson(dynamic json) {
    if (json is String) {
      return Photos(photo: json);
    } else if (json is Map<String, dynamic>) {
      return Photos(photo: json["photo"] ?? "");
    }
    return Photos(photo: json.toString());
  }

  Map<String, dynamic> toMap() => {"photo": photo};
}

class User {
  final String id;
  final String name;
  final String email;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
  };
}
