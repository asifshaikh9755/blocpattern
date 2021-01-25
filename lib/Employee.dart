class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  double get salary => _salary;

  set salary(double salary) {
    this._salary = salary;
  }

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  int get id => _id;

  set id(int id) {
    this._id = id;
  }
}
