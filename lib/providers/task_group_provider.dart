import 'package:flutter/cupertino.dart';
import 'package:todo_app/repository/supabase_repository.dart';

import '../models/task_group.dart';

class TaskGroupProvider extends ChangeNotifier {
  final supabaseRepository = SupabaseRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<TaskGroup> _taskGroups = [];
  List<TaskGroup> get taskGroups => _taskGroups;

  Future<void> listTaskGroups() async{
    try {
      _isLoading = true;
      notifyListeners();
      _taskGroups = await supabaseRepository.listTasksGroups();
      notifyListeners();

    }catch (e) {
      throw e.toString();
    }


  }

}