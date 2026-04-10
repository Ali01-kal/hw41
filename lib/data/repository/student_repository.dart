import '../../core/api_client.dart';
import '../models/student_model.dart';

class StudentRepository {
  final ApiClient apiClient;

  StudentRepository({required this.apiClient});

  Future<List<StudentModel>> getStudents() async {
    final data = await apiClient.getStudents();
    return data.map((e) => StudentModel.fromJson(e)).toList();
  }
}