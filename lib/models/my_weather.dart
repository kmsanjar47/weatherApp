class MyWeatherModel {
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  dynamic _visibility;
  Wind? _wind;
  Clouds? _clouds;
  dynamic _dt;
  Sys? _sys;
  dynamic _timezone;
  dynamic _id;
  String? _name;
  dynamic _cod;

  MyWeatherModel(
      {Coord? coord,
      List<Weather>? weather,
      String? base,
      Main? main,
      dynamic visibility,
      Wind? wind,
      Clouds? clouds,
      dynamic dt,
      Sys? sys,
      dynamic timezone,
      dynamic id,
      String? name,
      dynamic cod}) {
    if (coord != null) {
      _coord = coord;
    }
    if (weather != null) {
      _weather = weather;
    }
    if (base != null) {
      _base = base;
    }
    if (main != null) {
      _main = main;
    }
    if (visibility != null) {
      _visibility = visibility;
    }
    if (wind != null) {
      _wind = wind;
    }
    if (clouds != null) {
      _clouds = clouds;
    }
    if (dt != null) {
      _dt = dt;
    }
    if (sys != null) {
      _sys = sys;
    }
    if (timezone != null) {
      _timezone = timezone;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (cod != null) {
      _cod = cod;
    }
  }

  Coord? get coord => _coord;

  set coord(Coord? coord) => _coord = coord;

  List<Weather>? get weather => _weather;

  set weather(List<Weather>? weather) => _weather = weather;

  String? get base => _base;

  set base(String? base) => _base = base;

  Main? get main => _main;

  set main(Main? main) => _main = main;

  dynamic get visibility => _visibility;

  set visibility(dynamic visibility) => _visibility = visibility;

  Wind? get wind => _wind;

  set wind(Wind? wind) => _wind = wind;

  Clouds? get clouds => _clouds;

  set clouds(Clouds? clouds) => _clouds = clouds;

  dynamic get dt => _dt;

  set dt(dynamic dt) => _dt = dt;

  Sys? get sys => _sys;

  set sys(Sys? sys) => _sys = sys;

  dynamic get timezone => _timezone;

  set timezone(dynamic timezone) => _timezone = timezone;

  dynamic get id => _id;

  set id(dynamic id) => _id = id;

  String? get name => _name;

  set name(String? name) => _name = name;

  dynamic get cod => _cod;

  set cod(dynamic cod) => _cod = cod;

  MyWeatherModel.fromJson(Map<String, dynamic> json) {
    _coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    _clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_coord != null) {
      data['coord'] = _coord!.toJson();
    }
    if (_weather != null) {
      data['weather'] = _weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = _base;
    if (_main != null) {
      data['main'] = _main!.toJson();
    }
    data['visibility'] = _visibility;
    if (_wind != null) {
      data['wind'] = _wind!.toJson();
    }
    if (_clouds != null) {
      data['clouds'] = _clouds!.toJson();
    }
    data['dt'] = _dt;
    if (_sys != null) {
      data['sys'] = _sys!.toJson();
    }
    data['timezone'] = _timezone;
    data['id'] = _id;
    data['name'] = _name;
    data['cod'] = _cod;
    return data;
  }
}

class Coord {
  double? _lon;
  double? _lat;

  Coord({double? lon, double? lat}) {
    if (lon != null) {
      _lon = lon;
    }
    if (lat != null) {
      _lat = lat;
    }
  }

  double? get lon => _lon;

  set lon(double? lon) => _lon = lon;

  double? get lat => _lat;

  set lat(double? lat) => _lat = lat;

  Coord.fromJson(Map<String, dynamic> json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = _lon;
    data['lat'] = _lat;
    return data;
  }
}

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  Weather({int? id, String? main, String? description, String? icon}) {
    if (id != null) {
      _id = id;
    }
    if (main != null) {
      _main = main;
    }
    if (description != null) {
      _description = description;
    }
    if (icon != null) {
      _icon = icon;
    }
  }

  dynamic get id => _id;

  set id(dynamic id) => _id = id;

  String? get main => _main;

  set main(String? main) => _main = main;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get icon => _icon;

  set icon(String? icon) => _icon = icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['main'] = _main;
    data['description'] = _description;
    data['icon'] = _icon;
    return data;
  }
}

class Main {
  dynamic _temp;
  dynamic _feelsLike;
  dynamic _tempMin;
  dynamic _tempMax;
  dynamic _pressure;
  dynamic _humidity;

  Main(
      {dynamic temp,
      dynamic feelsLike,
      dynamic tempMin,
      dynamic tempMax,
      dynamic pressure,
      dynamic humidity}) {
    if (temp != null) {
      _temp = temp;
    }
    if (feelsLike != null) {
      _feelsLike = feelsLike;
    }
    if (tempMin != null) {
      _tempMin = tempMin;
    }
    if (tempMax != null) {
      _tempMax = tempMax;
    }
    if (pressure != null) {
      _pressure = pressure;
    }
    if (humidity != null) {
      _humidity = humidity;
    }
  }

  dynamic get temp => _temp;

  set temp(dynamic temp) => _temp = temp;

  dynamic get feelsLike => _feelsLike;

  set feelsLike(dynamic feelsLike) => _feelsLike = feelsLike;

  dynamic get tempMin => _tempMin;

  set tempMin(dynamic tempMin) => _tempMin = tempMin;

  dynamic get tempMax => _tempMax;

  set tempMax(dynamic tempMax) => _tempMax = tempMax;

  dynamic get pressure => _pressure;

  set pressure(dynamic pressure) => _pressure = pressure;

  dynamic get humidity => _humidity;

  set humidity(dynamic humidity) => _humidity = humidity;

  Main.fromJson(Map<String, dynamic> json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = _temp;
    data['feels_like'] = _feelsLike;
    data['temp_min'] = _tempMin;
    data['temp_max'] = _tempMax;
    data['pressure'] = _pressure;
    data['humidity'] = _humidity;
    return data;
  }
}

class Wind {
  dynamic _speed;
  dynamic _deg;

  Wind({dynamic speed, dynamic deg}) {
    if (speed != null) {
      _speed = speed;
    }
    if (deg != null) {
      _deg = deg;
    }
  }

  dynamic get speed => _speed;

  set speed(dynamic speed) => _speed = speed;

  dynamic get deg => _deg;

  set deg(dynamic deg) => _deg = deg;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = json['speed'];
    _deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = _speed;
    data['deg'] = _deg;
    return data;
  }
}

class Clouds {
  dynamic _all;

  Clouds({dynamic all}) {
    if (all != null) {
      _all = all;
    }
  }

  dynamic get all => _all;

  set all(dynamic all) => _all = all;

  Clouds.fromJson(Map<String, dynamic> json) {
    _all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = _all;
    return data;
  }
}

class Sys {
  dynamic _type;
  dynamic _id;
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys({dynamic type, dynamic id, String? country, int? sunrise, int? sunset}) {
    if (type != null) {
      _type = type;
    }
    if (id != null) {
      _id = id;
    }
    if (country != null) {
      _country = country;
    }
    if (sunrise != null) {
      _sunrise = sunrise;
    }
    if (sunset != null) {
      _sunset = sunset;
    }
  }

  dynamic get type => _type;

  set type(dynamic type) => _type = type;

  dynamic get id => _id;

  set id(dynamic id) => _id = id;

  String? get country => _country;

  set country(String? country) => _country = country;

  dynamic get sunrise => _sunrise;

  set sunrise(dynamic sunrise) => _sunrise = sunrise;

  dynamic get sunset => _sunset;

  set sunset(dynamic sunset) => _sunset = sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = _type;
    data['id'] = _id;
    data['country'] = _country;
    data['sunrise'] = _sunrise;
    data['sunset'] = _sunset;
    return data;
  }
}
