// ignore_for_file: file_names
class Group {
  String? title;
  String? domain;
  String? id;

  Group({this.title, this.domain, this.id});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      title: json['title'],
      domain: json['domain'],
      id: json['id'],
    );
  }
}
