import 'package:ua_com_knin/models/Types.dart';

class ListTypes {
  final List<Types> types;

  ListTypes({
    this.types,
  });

  factory ListTypes.fromJson(List<dynamic> parsedJson) {
    List<Types> types= new List<Types>();
    types = parsedJson.map((i)=>Types.fromJson(i)).toList();
    return new ListTypes(
      types: types,
    );
  }
}