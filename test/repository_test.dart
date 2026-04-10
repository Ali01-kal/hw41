import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:your_app/core/api_client.dart';
import 'package:your_app/data/repository/student_repository.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApi;
  late StudentRepository repository;

  setUp(() {
    mockApi = MockApiClient();
    repository = StudentRepository(apiClient: mockApi);
  });

  test('getStudents returns list', () async {
    when(() => mockApi.getStudents()).thenAnswer((_) async => [
          {"id": 1, "name": "Ali"}
        ]);

    final result = await repository.getStudents();

    expect(result.length, 1);
    expect(result.first.name, "Ali");
  });
}