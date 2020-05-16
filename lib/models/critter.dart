class Critters {
  final List<dynamic> critters;

  const Critters({this.critters});

  factory Critters.fromJson(Map<String, dynamic> json) {
    return Critters(critters: json['query']['categorymembers']);
  }
}

class Critter {
  final int id;
  final String image,
      caughtQuote,
      museumPhrase,
      link,
      nameEn,
      monthNorthern,
      monthSouthern,
      time,
      location,
      rarity;
  final bool isAllDay, isAllYear;
  final int price, priceFlick;

  const Critter({
    this.nameEn,
    this.image,
    this.id,
    this.museumPhrase,
    this.price,
    this.priceFlick,
    this.caughtQuote,
    this.link,
    this.monthNorthern,
    this.monthSouthern,
    this.time,
    this.isAllDay,
    this.isAllYear,
    this.location,
    this.rarity,
  });

  factory Critter.fromJson(Map<String, dynamic> json) {
    return Critter(
      nameEn: json['name']['name-en'],
      image: json['image'],
      id: json['id'],
      museumPhrase: json['museum-phrase'],
      monthNorthern: json['availability']['month-northern'],
      monthSouthern: json['availability']['month-southern'],
      time: json['availability']['time'],
      isAllDay: json['availability']['isAllDay'],
      isAllYear: json['availability']['isAllYear'],
      location: json['availability']['location'],
      rarity: json['availability']['rarity'],
      priceFlick: json['price-flick'],
      price: json['price'],
      caughtQuote: json['catch-phrase'],
      link: json['link'],
    );
  }
}
