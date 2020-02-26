import 'package:html/parser.dart';

class StringHtmlCleaner {


  String parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }
}