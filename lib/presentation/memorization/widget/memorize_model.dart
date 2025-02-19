class MemorizeModel {
  final String title;
  final int daysLeft;
  final int completedTasks;
  final int totalTasks;
  final double progress;
  final int remainingDays;
  final String endDate;

  MemorizeModel({
    required this.title,
    required this.daysLeft,
    required this.completedTasks,
    required this.totalTasks,
    required this.progress,
    required this.remainingDays,
    required this.endDate,
  });
}

List<MemorizeModel> getMemorizeModel = [
  MemorizeModel(
    title: 'My 30 Day Plan',
    daysLeft: 15,
    completedTasks: 3,
    totalTasks: 5,
    progress: 0.6,
    remainingDays: 15,
    endDate: 'Feb 28, 2025',
  ),
  MemorizeModel(
    title: 'My 60 Day Plan',
    daysLeft: 45,
    completedTasks: 2,
    totalTasks: 8,
    progress: 0.25,
    remainingDays: 45,
    endDate: 'Mar 15, 2025',
  ),
  // MemorizeModel(
  //   title: 'My 45 Day Plan',
  //   daysLeft: 30,
  //   completedTasks: 4,
  //   totalTasks: 6,
  //   progress: 0.67,
  //   remainingDays: 30,
  //   endDate: 'Apr 1, 2025',
  // ),
  // MemorizeModel(
  //   title: 'My 90 Day Plan',
  //   daysLeft: 75,
  //   completedTasks: 5,
  //   totalTasks: 12,
  //   progress: 0.42,
  //   remainingDays: 75,
  //   endDate: 'May 20, 2025',
  // ),
  // MemorizeModel(
  //   title: 'My 21 Day Plan',
  //   daysLeft: 10,
  //   completedTasks: 6,
  //   totalTasks: 7,
  //   progress: 0.85,
  //   remainingDays: 10,
  //   endDate: 'Feb 10, 2025',
  // ),
  // MemorizeModel(
  //   title: 'My 100 Day Plan',
  //   daysLeft: 88,
  //   completedTasks: 4,
  //   totalTasks: 15,
  //   progress: 0.27,
  //   remainingDays: 88,
  //   endDate: 'Jun 30, 2025',
  // ),
];
