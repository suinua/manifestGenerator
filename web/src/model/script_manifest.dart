import 'package:uuid/uuid.dart';

enum ScriptType {
  texture,
  behavior,
}

class ScriptManifest {
  ScriptType scriptType;
  String name;
  String description;

  List<String> textureCapabilities;

  ScriptManifest.texture(this.name, this.description, this.textureCapabilities)
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
      "type": "clien_data",
      "uuid": "${Uuid().v1()}",
      "version": [0, 0, 1]
    }
  ]
}
""";
  }

  String _textureToString() {
    String _stringCapabilities() {
      String result = "";

      for (int index = 0; index < textureCapabilities.length; index ++) {
         String capability = textureCapabilities[index];
        if (index + 1 == textureCapabilities.length) {
         result += '    "$capability"';
        } else {
         result += '    "$capability",\n';
        }        
      }
      return result;
    }

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
${_stringCapabilities()}
  ]
}
""";
  }
}
