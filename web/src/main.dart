import 'dart:html';

import 'capabilies_operation.dart';
import 'manifest_operation.dart';
import 'model/addon_manifest.dart';
import 'model/script_manifest.dart';

Capabilities capabilities = Capabilities();

void main() async {
  querySelector("#generate").onClick.listen(generate);
  querySelector("#copy").onClick.listen(copyManifest);
  querySelector("#download").onClick.listen(downloadManifest);

  querySelector("#type").onChange.listen((e) {
    SelectElement typeElement = querySelector("#type");
    if (typeElement.value == "scriptTexture") {
      querySelector("#CapabilityGroup").style.display = "";
    } else {
      querySelector("#CapabilityGroup").style.display = "none";      
    }
  });


  InputElement addCapabilityButton = querySelector("#addCapability");

  addCapabilityButton.onClick.listen((event) {
    InputElement newCapabilityInput = querySelector("#newCapabilityText");
    String newCapability = newCapabilityInput.value;

    capabilities.add(newCapability);

    querySelector("#Capabilities")
        .insertAdjacentHtml("beforeend", capabilities.toHtml(newCapability));

    SpanElement removeCapabilityButton =
        querySelector("#removeCapability-$newCapability");
    removeCapabilityButton.onClick.listen((event) {
      SpanElement deleteTarget = querySelector("#Capability-$newCapability");
      deleteTarget.remove();
    });
  });
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
    return ScriptManifest.texture(name, description, capabilities.valueList);
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
