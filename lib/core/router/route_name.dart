class RouteName {
  String name;
  late String path;

  RouteName(this.name, {String? routePath, bool? subRoute}) {
    if (subRoute == null) {
      if (routePath == null) {
        path = "/$name";
      } else {
        path = routePath;
      }
    } else {
      if (routePath == null) {
        path = name;
      } else {
        path = routePath;
      }
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'path': path,
    };
  }

  factory RouteName.fromMap(Map<String, dynamic> map) {
    return RouteName(
      map['name'] as String,
      routePath: map['path'] as String,
    );
  }

  @override
  String toString() => 'RouteName(name: $name, path: $path)';

  @override
  bool operator ==(covariant RouteName other) {
    if (identical(this, other)) return true;

    return other.name == name && other.path == path;
  }

  @override
  int get hashCode => name.hashCode ^ path.hashCode;
}
