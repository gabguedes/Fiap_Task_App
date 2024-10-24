import 'package:flutter/cupertino.dart';
import 'package:todo_app/repository/supabase_repository.dart';

import '../models/task_group.dart';

class TaskGroupProvider extends ChangeNotifier {
  final _supabaseRepository = SupabaseRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<TaskGroup> _taskGroups = [];
  List<TaskGroup> get taskGroups => _taskGroups;

  Future<void> listTaskGroups() async {
    _isLoading = true;
    notifyListeners();
    try {
      _taskGroups = await _supabaseRepository.listTasksGroups();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}