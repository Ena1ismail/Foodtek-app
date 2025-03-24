class NotificationItem {
  final String title;
  final String message;
  final String date;
  final bool isError;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    this.isError = false,
    this.isRead = false,
  });
}