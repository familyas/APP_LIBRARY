import 'package:app_library/API/apibuku.dart';
import 'package:app_library/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ListBuku extends StatefulWidget {
  @override
  _ListBukuState createState() => _ListBukuState();
}

class _ListBukuState extends State<ListBuku> {
  List<Buku> _buku = [];

  BukuDataSource _bukuDataSource;

  @override
  void initState() {
    super.initState();
    getBuku();
    _bukuDataSource = BukuDataSource(buku: _buku);
  }

  void getBuku() {
    _buku = [];
    APIBOOK.getAllBuku(context).then((value) {
      for (int i = 0; i < value.length; i++) {
        _buku.add(Buku(
          value[i].id,
          value[i].judulbuku,
          value[i].isbn,
          value[i].tahun,
          value[i].penerbit,
          value[i].jumlah,
          value[i].kategori,
          value[i].createdby,
          ElevatedButton(
            onPressed: () {},
            child: Text("Edit"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text(
                          "Hapus Data Ini?",
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak")),
                          ElevatedButton(
                            onPressed: () {
                              APIBOOK
                                  .deleteBuku(context, value[i].id)
                                  .then((value) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(value[0].status),
                                ));
                                Navigator.pop(context);
                                getBuku();
                              });
                            },
                            child: Text("Ya"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                          ),
                        ],
                      ));
            },
            child: Text("Delete"),
            style: ElevatedButton.styleFrom(primary: Colors.red),
          ),
        ));
      }
      setState(() {
        _bukuDataSource = BukuDataSource(buku: _buku);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeOranges,
        title: Text(
          "LIST APP BOOK",
          style: TextStyle(fontFamily: 'quadrat', fontSize: 22),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: SfDataGridTheme(
          data: SfDataGridThemeData(
              // brightness: Brightness.light,
              headerHoverColor: Colors.black.withOpacity(0.3),
              headerColor: themeOranges),
          child: SfDataGrid(
            columnWidthMode: ColumnWidthMode.lastColumnFill,
            gridLinesVisibility: GridLinesVisibility.horizontal,
            frozenColumnsCount: 1,
            allowSorting: true,
            source: _bukuDataSource,
            columns: [
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ID',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'judulbuku',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Judul',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'isbn',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'ISBN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'tahun',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tahun',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'penerbit',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Penerbit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'jumlah',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Jumlah',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'kategori',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'createdby',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Created By',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'edit',
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              GridColumn(
                  columnName: 'delete',
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class Buku {
  Buku(
    this.id,
    this.judulbuku,
    this.isbn,
    this.tahun,
    this.penerbit,
    this.jumlah,
    this.kategori,
    this.createdby,
    this.edit,
    this.delete,
  );
  final String id;
  final String judulbuku;
  final String isbn;
  final String tahun;
  final String penerbit;
  final String jumlah;
  final String kategori;
  final String createdby;
  final ElevatedButton edit;
  final ElevatedButton delete;
}

class BukuDataSource extends DataGridSource {
  BukuDataSource({List<Buku> buku}) {
    _buku = buku
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'judulbuku', value: e.judulbuku),
              DataGridCell<String>(columnName: 'isbn', value: e.isbn),
              DataGridCell<String>(columnName: 'tahun', value: e.tahun),
              DataGridCell<String>(columnName: 'penerbit', value: e.penerbit),
              DataGridCell<String>(columnName: 'jumlah', value: e.jumlah),
              DataGridCell<String>(columnName: 'kategori', value: e.kategori),
              DataGridCell<String>(columnName: 'createdby', value: e.createdby),
              DataGridCell<ElevatedButton>(columnName: 'edit', value: e.edit),
              DataGridCell<ElevatedButton>(
                  columnName: 'delete', value: e.delete),
            ]))
        .toList();
  }
  List<DataGridRow> _buku = [];
  @override
  List<DataGridRow> get rows => _buku;

  Widget buildButton(dynamic value) {
    return Container(
      alignment: Alignment.center,
      child: value,
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _buku.indexOf(row);
    return DataGridRowAdapter(
      color: rowIndex % 2 == 1 ? Colors.white : Colors.blue[100],
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          if (dataGridCell.columnName != 'edit' &&
              dataGridCell.columnName != 'delete') {
            return Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            );
          } else {
            return Container(
              child: buildButton(dataGridCell.value),
            );
          }
        },
      ).toList(),
    );
  }
}
