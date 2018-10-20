import 'package:uuid/uuid.dart';

class Manifest {
  final String type;
  final String name;
  final String description;

  const Manifest.texture(this.name, this.description) : this.type = "resources";
  const Manifest.behavior(this.name, this.description) : this.type = "data";
  const Manifest.skinPack(this.name, this.description)
      : this.type = "skin_pack";

  String asText() {
    var uuid1 = Uuid().v1();
    var uuid2 = Uuid().v1();

    var manifest = """
{
    "format_version": 1,
    "header": {
        "description": "${this.description}",
        "name": "${this.name}",
        "uuid": "${uuid1}",
        "version": [0, 0, 1]
    },
    "modules": [
        {
            "description": "${this.description}",
            "type": "${this.type}",
            "uuid": "${uuid2}",
            "version": [0, 0, 1]
        }
    ]
}""";
    return manifest;
  }
}
