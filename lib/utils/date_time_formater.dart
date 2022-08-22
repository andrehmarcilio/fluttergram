const months = {
  1: "janeiro",
  2: "fevereiro",
  3: "março",
  4: "abril",
  5: "maio",
  6: "junho",
  7: "julho",
  8: "agosto",
  9: "setembro",
  10: "outubro",
  11: "novembro",
  12: "dezembro",
};

const weekDay = {
  1: "segunda",
  2: "terça",
  3: "quarta",
  4: "quinta",
  5: "sexta",
  6: "sábado",
  7: "domingo",
};

String formateDateTime(DateTime datetime) {
  if (datetime.isBefore(DateTime.now().add(const Duration(days: 7)))) {
    return weekDay[datetime.weekday]!.substring(0, 3);
  }
  return '${datetime.day.toString().padLeft(2, '0')} de ${months[datetime.month]!.substring(0,3)}.';
}
