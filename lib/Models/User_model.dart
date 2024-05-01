// ignore_for_file: avoid_types_as_parameter_titles

import 'dart:convert';
import 'package:flutter/material.dart';

class User {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String phoneNumber;
  late String wilaya;
  late String _id;
  late String profilePicture;

  void fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    email = json['email'] as String;
    password = json['password'] ?? "" as String;
    json['password'] == null ? password = "n" : password = json["password"];
    phoneNumber = json['phoneNumber'] as String;
    wilaya = json['wilaya'] as String;
    _id = json['_id'] as String;
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
      '_id': _id,
      'profilePicture': profilePicture,
    };
  }
}
