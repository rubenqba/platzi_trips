import 'dart:convert' as convert;
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:platzi_trips/model/hiker_place.dart';
import 'package:platzi_trips/model/review_model.dart';
import 'package:platzi_trips/model/user.dart';

class ModelUtils {
  static final _JsonDataFiles dataFiles = _JsonDataFiles();
  static final _ApiService _apiService = _ApiService();

  static List<String> landscapes() {
    return [
      "assets/img/paisaje1.jpg",
      "assets/img/paisaje2.jpg",
      "assets/img/paisaje3.jpg",
      "assets/img/paisaje4.jpg",
      "assets/img/paisaje5.jpg",
    ];
  }

  static List<ReviewModel> reviews() {
    return [
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4,
          "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5,
          "Great place, I'll come back soon", []),
      ReviewModel(
          "assets/img/avatar3.png",
          "World Criticizer",
          56,
          2,
          "The food is awful and my entire bed was full of bugs. I don't recommend this place",
          []),
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4,
          "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5,
          "Great place, I'll come back soon", []),
      ReviewModel(
          "assets/img/avatar3.png",
          "World Criticizer",
          56,
          2,
          "The food is awful and my entire bed was full of bugs. I don't recommend this place",
          []),
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4,
          "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5,
          "Great place, I'll come back soon", []),
      ReviewModel(
          "assets/img/avatar3.png",
          "World Criticizer",
          56,
          2,
          "The food is awful and my entire bed was full of bugs. I don't recommend this place",
          []),
    ];
  }

  static String locationDescription() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet sem at ex sollicitudin finibus sit amet vitae orci. Fusce in enim tortor. Aliquam tempor ultricies erat non convallis. Praesent mattis facilisis nulla, eget vulputate sapien tempus quis. Sed a metus quis odio rhoncus imperdiet et sit amet augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec nec posuere nisl, ut posuere mauris. Phasellus ultrices, velit ut vehicula vehicula, velit nibh accumsan diam, eget aliquet ipsum quam vitae mauris. Sed tempus nulla eget lorem feugiat ultricies.";
  }

  static List<HikerPlace> instanceHikerPlaces() {
    return dataFiles._hikerPlaces;
  }

  static Future<List<HikerPlace>> hikerPlaces() {
    return dataFiles.getHikerPlaces();
  }

  static User getUser() {
    return _apiService.getUser(null);
  }

  static Future<User> randomUser() {
    return _apiService.getRandomUser();
  }
}

class _JsonDataFiles {
  _JsonDataFiles._internal();

  static final _JsonDataFiles _instance = _JsonDataFiles._internal();

  final List<HikerPlace> _hikerPlaces = List.empty(growable: true);

  factory _JsonDataFiles() {
    _instance
        ._loadHikerPlaces()
        .then((values) => _instance._hikerPlaces.addAll(values));
    return _instance;
  }

  Future<List<HikerPlace>> _loadHikerPlaces() async {
    _hikerPlaces.clear();
    return rootBundle
        .loadString("assets/data/hiker_data.json")
        .then((json) => convert.jsonDecode(json) as List)
        .then((data) {
          //print(data);
          var list = data
              .map(_hikerPlaceMapper)
              .toList();
          list.forEach(print);
          return list;
        });
  }

  HikerPlace _hikerPlaceMapper(dynamic p) {
    Set<String> categories = Set.of((p['categories'] as List).map((e) => e as String));
    return HikerPlace(
      name: p["name"],
      categories: categories,
      steps: p["steps"] as int,
      favorite: p["favorite"] as bool,
      image: p["image"]
    );
  }

  Future<List<HikerPlace>> getHikerPlaces() {
    return _loadHikerPlaces();
  }
}

class _ApiService {
  static const String API = "https://randomuser.me/api";

  _ApiService._internal();

  static final _ApiService _instance = _ApiService._internal();

  final List<User> _internalUsers = List.empty(growable: true);

  factory _ApiService() {
    _instance
        ._getPeople(10)
        .then((value) => _instance._internalUsers.addAll(value));
    return _instance;
  }

  User getUser(int? index) {
    if (index == null) {
      return _internalUsers[Random.secure().nextInt(_internalUsers.length)];
    }
    return _internalUsers[index];
  }

  Future<User> getRandomUser() {
    return _getPeople(1).then((value) => value[0]);
  }

  Future<List<User>> _getPeople(int number) async {
    var url = Uri.parse("$API?results=$number");

    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = data["info"]["results"] as int;
        print('number of users retrieved: $itemCount.');
        var list = (data["results"] as List).map(_userMapper).toList();
        list.forEach(print);
        return list;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return List.empty();
    });
  }

  static String _extractEmail(dynamic json) {
    return json["email"] as String;
  }

  static String _extractName(dynamic json) {
    var firstName = json["name"]["first"] as String;
    var lastName = json["name"]["last"] as String;
    return "$firstName $lastName";
  }

  static String _extractAvatar(dynamic json) {
    return json["picture"]["large"] as String;
  }

  User _userMapper(dynamic map) {
    return User(_extractAvatar(map), _extractName(map), 4, _extractEmail(map));
  }
}
