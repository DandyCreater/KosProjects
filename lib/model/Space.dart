import 'package:flutter/cupertino.dart';

class Space {
  late int id;
  late String name;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late final List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberofCupboards;

  Space({
    this.id = 0,
    this.name = "",
    this.imageUrl = "",
    this.price = 0,
    this.city = "",
    this.country = "",
    this.rating = 0,
    this.address = "",
    this.mapUrl = "",
    this.phone = "",
    required this.photos,
    this.numberOfBedrooms = 0,
    this.numberOfKitchens = 0,
    this.numberofCupboards = 0,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    price = json['price'];
    city = json['city'];
    country = json['country'];
    rating = json['rating'];
    address = json['address'];
    mapUrl = json['mapUrl'];
    phone = json['phone'];
    photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfKitchens = json['number_of_kitchens'];
    numberofCupboards = json['number_of_cupboards'];
  }
}
