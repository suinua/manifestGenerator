import 'package:uuid/uuid.dart';

class Addon {
  String _type;
  get type => _type;
  Addon.texture() : this._type = 'resources';
  Addon.behavior() : this._type = 'data';
  Addon.skinPack() : this._type = 'skin_pack';
}


class AddonManifest {
  Addon type;
  String name;
  String description;

  AddonManifest.texture(this.name, this.description)
      : this.type = Addon.texture();
  AddonManifest.behavior(this.name, this.description)
      : this.type = Addon.behavior();
  AddonManifest.skinPack(this.name, this.description)
      : this.type = Addon.skinPack();
      
  String toString() => """
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
      "description": "${this.description}",
      "type": "${this.type}",
      "uuid": "${Uuid().v1()}",
      "version": [0, 0, 1]
    }
  ]
}
""";
}