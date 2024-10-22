import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

import '../models/task_group.dart';

class TaskProvider extends ChangeNotifier {
  final _supabaseRepository = SupabaseRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> listTasksByGroup(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _supabaseRepository.listTasksByGroup(groupId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}