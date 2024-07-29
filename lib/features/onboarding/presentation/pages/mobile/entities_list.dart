

import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';



class EntitiesList extends StatefulWidget {
  const EntitiesList({super.key});

  @override
  State<EntitiesList> createState() => _EntitiesListState();
}

class Data {
  final int id;
  final String name;
  final int age;

  Data({required this.id, required this.name, required this.age});
}

class _EntitiesListState extends State<EntitiesList> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'HUTRAC_MA_T_70761312', 'Active', "Arun dev"),
      Employee(10002, 'HUTRAC_MA_T_5905', 'In Active', "Saurabh"),
      Employee(10003, 'HUTRAC_MA_T_70761312', 'Active', "Saurabh"),
      Employee(10004, 'HUTRAC_MA_T_70761312', 'Active', "Saurabh"),
      Employee(10005, 'HUTRAC_MA_T_70761312', 'In Active', "Dev"),
      Employee(10006, 'HUTRAC_MA_T_70761312', 'In Active', "Arun"),
      Employee(10007, 'HUTRAC_MA_T_70761312', 'In Active', "Raj"),
      Employee(10008, 'HUTRAC_MA_T_70761312', 'Active', "Arun"),
      Employee(10009, 'HUTRAC_MA_T_70761312', 'In Active', "Arun dev"),
      Employee(10010, 'HUTRAC_MA_T_70761312', 'In Active', "Arun dev")
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search"),
            Text("Select type")
          ],
        ),
      ),
      body: SfDataGridTheme(
        data:  SfDataGridThemeData(headerColor: primary),
        child: SfDataGrid(
          source: employeeDataSource,
          columnWidthMode: ColumnWidthMode.auto,
          frozenColumnsCount: 1,
          columns: <GridColumn>[
            GridColumn(
                columnName: 'id',
                columnWidthMode: ColumnWidthMode.auto,
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'ID',style: TextStyle(color: Colors.white),
                    ))),
            GridColumn(
                columnName: 'name',
                columnWidthMode: ColumnWidthMode.auto,
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name',style: TextStyle(color: Colors.white)))),
            GridColumn(
                columnName: 'designation',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Status',
                      overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white)
                    ))),
            GridColumn(
                columnName: 'salary',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Created by',style: TextStyle(color: Colors.white)))),
          ],
        ),
      ),
    );

  }
}



class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.createdby);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String createdby;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(
          columnName: 'designation', value: e.designation),
      DataGridCell<String>(columnName: 'salary', value: e.createdby),
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}
