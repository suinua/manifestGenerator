import 'dart:html';

import 'model/Manifest.dart';
import 'manifestOperation.dart';

void main() {
  querySelector("#generate").onClick.listen(generate);
  querySelector("#copy").onClick.listen(copyManifest);
  querySelector("#download").onClick.listen(downloadManifest);
}

void generate(Event event) {
  Manifest formData = getFormData();
  DivElement insertTarget = querySelector("#form");
  TextAreaElement resultElement = querySelector("#result");

  //#resultが存在しなければ要素を追加
  //存在していればvalueを置き換え
  if (resultElement == null) {
    TextAreaElement newResultElement = TextAreaElement()
      ..id = "result"
      ..cols = 30
      ..rows = 5
      ..value = formData.asText();
    
    insertTarget.append(newResultElement);

  } else {
    resultElement.value = formData.asText();

  }
}

Manifest getFormData() {
  SelectElement typeElement = querySelector("#type");
  String type = typeElement.value;

  InputElement nameElement = querySelector("#name");
  String name = nameElement.value;

  TextAreaElement descriptionElement = querySelector("#description");
  String description = descriptionElement.value;

  if (type == "texture") {
    return Manifest.texture(name, description);
  } else if (type == "behavior") {
    return Manifest.behavior(name, description);
  } else if (type == "skinPack") {
    return Manifest.skinPack(name, description);
  } else {
    print("${type} is not exist in Manifest types");
  }
  return null;
}
