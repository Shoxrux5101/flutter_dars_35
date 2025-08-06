import 'package:flutter/material.dart';

class CuisineModel {
  final String image;
  final String title;
  final int id;

  CuisineModel({
    required this.image,
    required this.title,
    required this.id,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) {
    return CuisineModel(
      image: json['image'],
      title: json['title'],
      id: json['id'],
    );
  }
}
