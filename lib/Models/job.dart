class Job {
  final int id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String department;
  final DateTime creationDate;
  final String rol;
  final List<dynamic> details;
  Job(
      {this.creationDate,
      this.department,
      this.id,
      this.longDescription,
      this.name,
      this.shortDescription,
      this.rol,
      this.details});
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      name: json['name'],
      shortDescription: json['shortDescription'],
      longDescription: json['longDescription'],
      department: json['department'],
      creationDate: DateTime.parse(json['creationDate']),
      rol: json['rol'],
      details: json['details'],
    );
  }
}
