import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final dogProvider = FutureProvider.autoDispose((ref) async {
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['message'];
  } else {
    throw Exception('Failed to load dog image');
  }
});