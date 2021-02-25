class ListType {
  String name;

  ListType({this.name});

  factory ListType.fromJSON(Map<String, dynamic> json) =>
      ListType(name: json['name']);

  Map<String, dynamic> toJSON() => {'name': name};
}
