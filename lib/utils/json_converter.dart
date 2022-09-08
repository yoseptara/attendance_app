import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

// class GeoPointJsonConverter implements JsonConverter<GeoPoint, GeoPoint> {
//   const GeoPointJsonConverter() : super();
//
//   @override
//   GeoPoint fromJson(GeoPoint geoPoint) {
//     // print('cek GeoPointJsonConverter json : $json');
//     // final GeoPoint _geoPoint = GeoPoint(
//     //   json['lat'],
//     //   json['lng'],
//     // );
//     return geoPoint;
//   }
//
//   @override
//   GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
//
// }
