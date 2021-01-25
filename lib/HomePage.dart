import 'package:blocpattern/Employee.dart';
import 'package:flutter/material.dart';
import 'EmployeeBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Data'),
      ),
      body: StreamBuilder<List<Employee>>(
        stream: _employeeBloc.employeeListStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "${snapshot.data[index].id}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data[index].name}",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "₹ ${snapshot.data[index].salary}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )),
                    Container(
                        child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.green,
                      onPressed: () {
                        _employeeBloc.employeeSalaryIncremet
                            .add(snapshot.data[index]);
                      },
                    )),
                    Container(
                        child: IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                      onPressed: () {
                        _employeeBloc.employeeSalaryDecrement
                            .add(snapshot.data[index]);
                      },
                    )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
