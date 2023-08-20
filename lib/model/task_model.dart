class Task {
  int? id;
  String? name;
  String? dueDate;
  String? category;
  Task({this.id,this.name, this.dueDate, this.category});

  Task.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name = json['name'];
    dueDate = json['dueDate'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dueDate'] = this.dueDate;
    data['category'] = this.category;
    return data;
  }
}