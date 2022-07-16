class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.image, 
      this.gender, 
      this.address, 
      this.phone, 
      this.dateOfBirth, 
      this.city, 
      this.location, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.favourites, 
      this.reviews,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    gender = json['gender'];
    address = json['address'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    city = json['city'];
    location = json['location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['favourites'] != null) {
      favourites = [];
      json['favourites'].forEach((v) {
        favourites?.add(Favourites.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {

      });
    }
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? image;
  String? gender;
  String? address;
  String? phone;
  String? dateOfBirth;
  String? city;
  String? location;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Favourites>? favourites;
  List<dynamic>? reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['image'] = image;
    map['gender'] = gender;
    map['address'] = address;
    map['phone'] = phone;
    map['date_of_birth'] = dateOfBirth;
    map['city'] = city;
    map['location'] = location;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (favourites != null) {
      map['favourites'] = favourites?.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Favourites {
  Favourites({
    this.id,
    this.userId,
    this.hotelId,
    this.name,
    this.image,
    this.price,
    this.discountPrice,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Favourites.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    discountPrice = json['discount_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? userId;
  String? hotelId;
  String? name;
  String? image;
  String? price;
  String? discountPrice;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['hotel_id'] = hotelId;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['discount_price'] = discountPrice;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}