import 'package:uuid/uuid.dart';

enum ScriptType {
  texture,
  behavior,
}

class ScriptManifest {
  ScriptType scriptType;
  String name;
  String description;

  ScriptManifest.texture(this.name, this.description)
      : this.scriptType = ScriptType.texture;
  ScriptManifest.behavior(this.name, this.description)
      : this.scriptType = ScriptType.behavior;

  String toString() {
    if (scriptType == ScriptType.texture) {
      return _textureToString();
    } else {
      return _behaviorToString();
    }
  }

  String _behaviorToString() {
    return """
{
  "format_version": 1,
  "header": {
    "description": "${this.description}",
    "name": "${this.name}",
    "uuid": "${Uuid().v1()}",
    "version": [0, 0, 1]
  },
  "modules": [
    {
      "description": "${this.name + ' Model'}",
      "type": "data",
      "uuid": "${Uuid().v1()}",
      "version": [0, 0, 1]
    },
    {
      "description": "${this.name + ' Client Scripts'}",
      "type": "client_data",
      "uuid": "${Uuid().v1()}",
      "version": [0, 0, 1]
    }
  ]
}
""";
  }

  String _textureToString() {

    return """
{
  "format_version": 1,
  "header": {
    "description": "${this.description}",
    "name": "${this.name}",
    "uuid": "${Uuid().v1()}",
    "version": [0, 0, 1]
  },
  "modules": [
    {
      "description": "Client Behavior Module",
      "type": "resources",
      "uuid": "${Uuid().v1()}",
      "version": [0, 0, 1]
    }
  ],
  "capabilities": [
    "experimental_custom_ui"
  ]
}
""";
  }
}
