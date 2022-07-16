import 'package:demo/utilites/images.dart';
import 'package:flutter/material.dart';

Widget getCircularImage(double size, String imageURL) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(size))),
    child: ClipOval(
        child: FadeInImage.assetNetwork(
            fit: BoxFit.fill,
            placeholder: Images.claimImage,
            image: imageURL,
            imageErrorBuilder: (context, url, error) => ClipRRect(
                borderRadius: BorderRadius.circular(size),
                child: Image.network('https://image.shutterstock.com/image-vector/image-not-found-grayscale-photo-260nw-1737334631.jpg')))),
  );
}