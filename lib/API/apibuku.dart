import 'package:app_library/theme/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIBOOK {
  String status,
      apimessage,
      id,
      judulbuku,
      isbn,
      tahun,
      penerbit,
      jumlah,
      kategori,
      createdby;

  APIBOOK({
    this.status,
    this.apimessage,
    this.id,
    this.judulbuku,
    this.isbn,
    this.tahun,
    this.penerbit,
    this.jumlah,
    this.kategori,
    this.createdby,
  });

  factory APIBOOK.result(Map<String, dynamic> object) {
    return APIBOOK(
      status: object['status'],
      apimessage: object['apimessage'],
      id: object['ID'],
      judulbuku: object['JudulBuku'],
      isbn: object['ISBN'],
      tahun: object['TahunTerbit'],
      penerbit: object['Penerbit'],
      jumlah: object['JumlahBuku'],
      kategori: object['Kategori'],
      createdby: object['CreatedBy'],
    );
  }

  static Future<List<APIBOOK>> InserBuku(
    BuildContext context,
    String judul,
    String isbn,
    String tahun,
    String penerbit,
    String jumlah,
    String kategori,
    String createdby,
  ) async {
    String apiURL = "http://training-api.agungjustika.com/Lukman/iserBuku";
    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    Response response = await dio.post(apiURL, data: {
      "JudulBuku": judul,
      "ISBN": isbn,
      "TahunTerbit": tahun,
      "Penerbit": penerbit,
      "JumlahBuku": jumlah,
      "Kategori": kategori,
      "CreatedBy": createdby
    });

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;
        List<APIBOOK> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIBOOK.result(listData[i]));
        }
        return data;
      } else {
        MessageToash(context, "Koneksi Bermasalah");
        return null;
      }
    } catch (e) {
      MessageToash(context, "Gagal Mengurai Data");
    }
  }

  // ignore: missing_return
  static Future<List<APIBOOK>> getAllBuku(BuildContext context) async {
    String ApiURL = "http://training-api.agungjustika.com/Lukman/getAllBuku";
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(baseOptions);

    Response response = await dio.get(ApiURL);

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;
        List<APIBOOK> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIBOOK.result(listData[i]));
        }
        return data;
      } else {
        MessageToash(context, "Koneksi Bermasalah");
      }
    } catch (e) {
      MessageToash(context, "Gagal Mengurai Data");
    }
  }

  static Future<List<APIBOOK>> deleteBuku(
      BuildContext context, String id) async {
    String apiURL =
        "http://training-api.agungjustika.com/Lukman/deleteBuku/" + id;

    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.get(apiURL);

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APIBOOK> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIBOOK.result(listData[i]));
        }
        return data;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Koneksi Bermasalah")));
        return null;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Gagal Mengurai Data")));
      return null;
    }
  }
}
