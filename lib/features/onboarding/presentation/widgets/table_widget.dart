import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableWidget extends StatelessWidget {
   const TableWidget({super.key, required this.employeeDataSource});
  final DataGridSource employeeDataSource;

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
        data: const SfDataGridThemeData(headerColor: Color(0xff009889)),
        child: SfDataGrid(
            source: employeeDataSource,
            frozenColumnsCount: 1,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'ID',
                      ))),
              GridColumn(
                  columnName: 'name',
                  label: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text('Name'))),
              GridColumn(
                  columnName: 'designation',
                  label: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Designation',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'salary',
                  label: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text('Salary'))),
            ]));
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
