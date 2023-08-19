class Task {
  String? name;
  String? dueDate;
  String? category;

  Task({this.name, this.dueDate, this.category});

  Task.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dueDate = json['dueDate'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dueDate'] = this.dueDate;
    data['category'] = this.category;
    return data;
  }
}