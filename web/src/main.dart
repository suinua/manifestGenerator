import 'dart:html';

import 'manifest_operation.dart';
import 'model/addon_manifest.dart';
import 'model/script_manifest.dart';

void main() async {
  querySelector("#generate").onClick.listen(generate);
  querySelector("#copy").onClick.listen(copyManifest);
  querySelector("#download").onClick.listen(downloadManifest);
}


dynamic getFormData() {
  SelectElement typeElement = querySelector("#type");
  String type = typeElement.value;

  InputElement nameElement = querySelector("#name");
  String name = nameElement.value;

  TextAreaElement descriptionElement = querySelector("#description");
  String description = descriptionElement.value;

  if (type == "texture") {
    return AddonManifest.texture(name, description);
  } else if (type == "behavior") {
    return AddonManifest.behavior(name, description);
  } else if (type == "skinPack") {
    return AddonManifest.skinPack(name, description);
  } else if (type == "scriptTexture") {
    return ScriptManifest.texture(name, description);
  } else if (type == "scriptBehavior") {
    return ScriptManifest.behavior(name, description);
  } else {
    print("${type} is not exist in Manifest types");
  }
  return null;
}

void generate(Event event) {
  dynamic formData = getFormData();
  DivElement insertTarget = querySelector("#form");
  TextAreaElement resultElement = querySelector("#result");

  if (resultElement == null) {
    TextAreaElement newResultElement = TextAreaElement()
      ..id = "result"
      ..cols = 30
      ..rows = 5
      ..value = formData.toString();

    insertTarget.append(newResultElement);
  } else {
    resultElement.value = formData.toString();
  }
}
