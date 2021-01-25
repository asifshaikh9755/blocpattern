import 'dart:async';
import 'Employee.dart';

class EmployeeBloc {
  List<Employee> _employee = [
    Employee(1, 'Emp one', 20000),
    Employee(1, 'Emp two', 60000),
    Employee(1, 'Emp three', 30000),
    Employee(1, 'Emp four', 20000),
  ];

  //controllers
  final _emplyeeListStreamController = StreamController<List<Employee>>();

  final _employeeSalaryIncrementController = StreamController<Employee>();
  final _employeeSalaryDecrementController = StreamController<Employee>();

  //getters
  Stream<List<Employee>> get employeeListStream =>
      _emplyeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _emplyeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncremet =>
      _employeeSalaryIncrementController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementController.sink;

  EmployeeBloc() {
    _emplyeeListStreamController.add(_employee);
    _employeeSalaryIncrementController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalayr = salary * 20 / 100;

    _employee[employee.id - 1].salary = salary + incrementedSalayr;

    employeeListSink.add(_employee);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalayr = salary * 20 / 100;

    _employee[employee.id - 1].salary = salary - decrementedSalayr;

    employeeListSink.add(_employee);
  }

  void dispose() {
    _emplyeeListStreamController.close();
    _employeeSalaryIncrementController.close();
    _employeeSalaryDecrementController.close();
  }
}
