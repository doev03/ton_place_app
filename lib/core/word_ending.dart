import 'dart:math' as math;

String wordEnding(n, List<String>titles) {
  final cases = [2, 0, 1, 1, 1, 2];
  return titles[(n % 100 > 4 && n % 100 < 20) ? 2 : cases[math.min(n % 10, 5)]];
}

String getDateDiffText(Duration dateDiff) {
  final secondTitles = ['секунду', 'секунды', 'секунд'];
  final minuteTitles = ['минуту', 'минуты', 'минут'];
  final hourTitles = ['час', 'часа', 'часов'];
  final dayTitles = ['день', 'дня', 'дней'];
  final monthTitles = ['месяц', 'месяца', 'месяцев'];
  final yearTitles = ['год', 'года', 'лет'];


  String dateDiffText = '';

  if (dateDiff.inDays >= 365) {
    final n = dateDiff.inDays ~/ 365;
    dateDiffText = '$n ${wordEnding(n, yearTitles)} назад';
  } else if (dateDiff.inDays >= 30) {
    final n = dateDiff.inDays ~/ 30;
    dateDiffText = '$n ${wordEnding(n, monthTitles)} назад';
  } else if (dateDiff.inHours >= 24) {
    final n = dateDiff.inHours ~/ 24;
    dateDiffText = '$n ${wordEnding(n, dayTitles)} назад';
  } else if (dateDiff.inMinutes >= 60) {
    final n = dateDiff.inMinutes ~/ 60;
    dateDiffText = '$n ${wordEnding(n, hourTitles)} назад';
  } else if (dateDiff.inSeconds >= 60) {
    final n = dateDiff.inSeconds ~/ 60;
    dateDiffText = '$n ${wordEnding(n, minuteTitles)} назад';
  } else {
    final n = dateDiff.inSeconds;
    dateDiffText = '$n ${wordEnding(n, secondTitles)} назад';
  }

  return dateDiffText;
}