class Urls {
  Urls._();

  static const String _baseUrl = "http://152.42.163.176:2006/api/v1";
  static String registration = '$_baseUrl/registration';
  static String login = '$_baseUrl/login';
  static String profileUpdate = '$_baseUrl/profileUpdate';
  static String createTask = '$_baseUrl/createTask';
  static String taskStatusCount = '$_baseUrl/taskStatusCount';
  static String newTasks = '$_baseUrl/listTaskByStatus/New';
  static String inProgressTasks = '$_baseUrl/listTaskByStatus/progress';
  static String cancelledTasks = '$_baseUrl/listTaskByStatus/Cancel';
  static String completedTasks = '$_baseUrl/listTaskByStatus/Completed';

  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  static String updateTask(String id, String status) =>
      '$_baseUrl/updateTaskStatus/$id/$status';
}
