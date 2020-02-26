import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ua_com_knin/models/ListAdverts.dart';
import 'package:ua_com_knin/models/ListCategoty.dart';
import 'package:ua_com_knin/models/ListCities.dart';
import 'package:ua_com_knin/models/ListTypes.dart';
import 'package:ua_com_knin/models/Post.dart';
import 'package:ua_com_knin/models/Seller.dart';

class ApiHelper {

  final String baseUrl = 'http://knin.com.ua';

  Future<ListCities> fetchCity() async {
    final response =
    await http.get('$baseUrl/api/cities/all');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ListCities.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchCity');
    }
  }

  Future<ListTypes> fetchTypes() async {
    final response =
    await http.get('$baseUrl/api/realty/types');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ListTypes.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchTypes');
    }
  }

  Future<ListAdverts> fetchAllAdverts(int limit, int startFrom, int typeId) async {
    final response =
    await http.get('$baseUrl/api/realty/all?limit=$limit&offset=$startFrom&type_id=$typeId');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ListAdverts.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchAllAdverts');
    }
  }

  Future<ListAdverts> fetchVIPAdverts() async {
    final response =
    await http.get('$baseUrl/api/realty/vip');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ListAdverts.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchVIPAdverts');
    }
  }

  Future<ListAdverts> fetchSearchAdverts(String cityId, List<int> typeIdList, int categoryId, int priceFrom, int priceTill, int limit, int offset) async {

    String typeIds = "";
    for (int i = 0 ; i < typeIdList.length; i++){
      if (i+1 != typeIdList.length){
        typeIds += "${typeIdList[i]},";
      } else {
        typeIds += "${typeIdList[i]}";
      }
    }

    var quew ='$baseUrl/api/realty/all?';

    if (cityId != "-1"){quew+='city_id=$cityId';} else {quew+='city_id=';}
    if (typeIdList.length != 0){quew+='&type_id=$typeIds';} else {}
    if (categoryId != -1){quew+='&category_id=$categoryId';} else {quew+='&category_id=';}
    if (priceFrom != -1){quew+='&price_from=$priceFrom';} else {quew+='&price_from=0';}
    if (priceTill != -1){quew+='&price_till=$priceTill';} else {quew+='&price_till=99999999999';}
    if (limit != -1){quew+='&limit=$limit';} else {quew+='&limit=100';}
    if (offset != -1){quew+='&offset=$offset';} else {quew+='&offset=0';}

    print(quew);

    final response =
    await http.get(quew);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.

      return ListAdverts.fromJson(json.decode(response.body.replaceAll("'", "`")));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchSearchAdverts');
    }
  }

  Future<Seller> fetchSeller(int sellerId) async {
    final response =
    await http.get('$baseUrl/api/users/seller?seller_id=$sellerId');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Seller.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchSearchAdverts');
    }
  }

  Future<ListCategory> fetchCategories() async {
    final response =
    await http.get('$baseUrl/api/categories/all');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ListCategory.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load fetchSearchAdverts');
    }
  }


  Future<Post> createPost(Map body) async {
    return http.post('$baseUrl/api/propose/send', body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      print('POST STATUS $statusCode');

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return Post.fromJson(json.decode(response.body));
    });
  }

}