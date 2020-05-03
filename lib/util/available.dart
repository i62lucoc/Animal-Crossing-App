final Map<String, int> monthNumber = {
  'January': 1,
  'February': 2,
  'March': 3,
  'April': 4,
  'May': 5,
  'June': 6,
  'July': 7,
  'August': 8,
  'September': 9,
  'October': 10,
  'November': 11,
  'December': 12,
};

bool getAvailableCritter(DateTime dateNow, String timeYear, String timeDay) {
  List<String> months = timeYear.split(' ');
  String varAux;
  int numero;

  DateTime startTime;
  DateTime endTime;

  if (timeDay.toUpperCase().contains('ALL DAY')) {
    varAux = 'All day';
  } else {
    List<String> timeAux = timeDay.split(' to ');
    varAux = timeAux[0].replaceAll(new RegExp(r'[(),-.]'), '').toUpperCase();
    numero = int.parse(varAux.replaceAll(new RegExp(r'[a-zA-z]'), ''));
    numero = varAux.contains('PM') ? numero + 12 : numero;
    startTime = new DateTime(dateNow.year, dateNow.month, dateNow.day, numero, 00, 00, 00);

    varAux = timeAux[1].replaceAll(new RegExp(r'[(),-.]'), '').toUpperCase();
    numero = int.parse(varAux.replaceAll(new RegExp(r'[a-zA-z]'), ''));
    numero = varAux.contains('PM') ? numero + 12 : numero;
    endTime = new DateTime(dateNow.year, dateNow.month, dateNow.day, numero, 00, 00, 00);
  }

  try {
    if (dateNow.month < monthNumber[months[0]] || dateNow.month > monthNumber[months[2]])
      return false;
    else if (varAux == 'All day')
      return true;
    else if (dateNow.isAfter(startTime) && dateNow.isBefore(endTime))
      return true;
    else 
      return false;
  } catch (e) {
    return false;
  }
}