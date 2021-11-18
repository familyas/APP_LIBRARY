import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class APIStatus {
  String username,
      email,
      phone,
      password,
      createddate,
      status,
      apimessage,
      id,
      judulbuku,
      isbn,
      tahun,
      penerbit,
      jumlah,
      kategori,
      createdby;

  APIStatus(
      {this.username,
      this.email,
      this.phone,
      this.password,
      this.createddate,
      this.status,
      this.apimessage,
      this.id,
      this.judulbuku,
      this.isbn,
      this.tahun,
      this.penerbit,
      this.jumlah,
      this.kategori,
      this.createdby});

  factory APIStatus.result(Map<String, dynamic> object) {
    return APIStatus(
        username: object['UserName'],
        email: object['Email'],
        phone: object['Phone'],
        password: object['Password'],
        createddate: object['CreatedDate'],
        status: object['status'],
        apimessage: object['apimessage'],
        id: object['ID'],
        judulbuku: object['JudulBuku'],
        isbn: object['ISBN'],
        tahun: object['TahunTerbit'],
        penerbit: object['Penerbit'],
        jumlah: object['JumlahBuku'],
        kategori: object['Kategori'],
        createdby: object['CreatedBy']);
  }

  static Future<List<APIStatus>> insertUser(BuildContext context, String email,
      String username, String phone, String password) async {
    String apiURL = "http://training-api.agungjustika.com/Lukman/insertUser";

    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.post(apiURL, data: {
      "Email": email,
      "UserName": username,
      "Phone": phone,
      "Password": password
    });

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APIStatus> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIStatus.result(listData[i]));
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
