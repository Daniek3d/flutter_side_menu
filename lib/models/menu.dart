// To parse this JSON data, do
//
//     final menuResponse = menuResponseFromMap(jsonString);

import 'dart:convert';

class Menu {
  Menu({
    this.path,
    this.title,
    this.icon,
    this.menuClass,
    this.extralink,
    this.submenu,
    this.nivel,
  });

  String path;
  String title;
  String icon;
  Class menuClass;
  bool extralink;
  List<Menu> submenu;
  int nivel;

  factory Menu.fromJson(String str) => Menu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        path: json["path"],
        title: json["title"],
        icon: json["icon"],
        menuClass: classValues.map[json["class"]],
        extralink: json["extralink"],
        submenu: List<Menu>.from(json["submenu"].map((x) => Menu.fromMap(x))),
        nivel: json["nivel"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "title": title,
        "icon": icon,
        "class": classValues.reverse[menuClass],
        "extralink": extralink,
        "submenu": List<dynamic>.from(submenu.map((x) => x.toMap())),
        "nivel": nivel,
      };
}

enum Class { NAV_SMALL_CAP, EMPTY, HAS_ARROW }

final classValues = EnumValues({
  "": Class.EMPTY,
  "has-arrow": Class.HAS_ARROW,
  "nav-small-cap": Class.NAV_SMALL_CAP
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
