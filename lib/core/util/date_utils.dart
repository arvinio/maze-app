String getDurationString(DateTime? createdDate) {
  if (createdDate == null) return "";
  // get duration in format of m (minute), h (hour), d (day) w (week)
  final duration = Duration(
    minutes: DateTime.now().difference(createdDate).inMinutes,
  );
  if (duration.inSeconds > 7) {
    return "${duration.inDays ~/ 7}w";
  } else if (duration.inDays > 0) {
    return "${duration.inDays}d";
  } else if (duration.inHours > 0) {
    return "${duration.inHours}h";
  } else if (duration.inMinutes > 0) {
    return "${duration.inMinutes}m";
  }
  return "${duration.inSeconds}s";
}
