import 'dart:convert';
import 'dart:io';

String fixture(String name) {
  var currentDirectory = Directory.current.toString().replaceAll('\'', '');
  var lastDirectory =
      currentDirectory.split('/')[currentDirectory.split('/').length - 1];
  if (lastDirectory == 'test') {
    return File('fixture/$name').readAsStringSync();
  } else {
    return File('test/fixture/$name').readAsStringSync();
  }
}

Map<String, dynamic> decodeFixture(String fileName) {
  Map<String, dynamic> json = jsonDecode(fixture(fileName));
  return json;
}
