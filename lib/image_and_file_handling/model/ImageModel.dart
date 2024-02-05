import 'package:flutter/material.dart';

class ImageModel {
  final String imageTitle;
  final String imageDescription;
  final Image imageSource;

  ImageModel({
    required this.imageTitle,
    required this.imageDescription,
    required this.imageSource,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageTitle: json['imageTitle'] ?? '',
      imageDescription: json['imageDescription'] ?? '',
      imageSource: Image.network(json['imageUrl'] ?? ''), // Example: You can replace 'imageUrl' with your actual JSON key for the image URL
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageTitle': imageTitle,
      'imageDescription': imageDescription,
      'imageUrl': imageSource.image.toString(), // Convert Image to String representation (You may need to adjust this based on your actual use case)
    };
  }
}
