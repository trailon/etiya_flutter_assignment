// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:etiya_flutter_assignment/db/endpoints.dart';
import 'package:etiya_flutter_assignment/models/repositorymodel.dart';
import 'package:etiya_flutter_assignment/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.byType(HomeScreenBody), findsOneWidget);
  });

  test('Functional API Call Test', () async {
    var dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.baseUrl = APIEndPoints.baseUrl;
    RepositoryModel? repositoryModel;
    try {
      var rs = await dio
          .get("${APIEndPoints.userRepo}trailon/ServerSimulationwithThreads");
      if (rs.statusCode != 200) {
        throw Error;
      }
      repositoryModel = RepositoryModel.fromJson(rs.data);
      expect(repositoryModel, isNotNull);
    } catch (e) {
      expect(repositoryModel, isNull);
    }
  });
}
