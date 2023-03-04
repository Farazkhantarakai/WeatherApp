// ignore: camel_case_types
class weather {
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  weather(
      {this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  weather.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['timezone'] = timezone;
    data['timezone_offset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  var dt;

  var temp;
  var feelsLike;

  var humidity;
  var uvi;
  var clouds;
  var visibility;
  var windSpeed;
  List<Weather>? weather;
  Rain? rain;

  Current(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.humidity,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.weather,
      this.rain});

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = (json['temp'] as num?)!.toDouble();
    feelsLike = json['feels_like'];
    humidity = json['humidity'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;

    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['humidity'] = humidity;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Rain {
  // ignore: prefer_typing_uninitialized_variables
  var d1h;
  Rain({this.d1h});
  Rain.fromJson(Map<String, dynamic> json) {
    d1h = json['1h'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = d1h;
    return data;
  }
}

class Hourly {
  int? dt;
  // ignore: prefer_typing_uninitialized_variables
  var temp;
  int? humidity;
  int? clouds;

  List<Weather>? weather;
  Rain? rain;

  Hourly(
      {this.dt,
      this.temp,
      this.humidity,
      this.clouds,
      d,
      this.weather,
      this.rain});

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'];

    humidity = json['humidity'];

    clouds = json['clouds'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }

    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['clouds'] = clouds;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}

class Daily {
  int? dt;

  Temp? temp;

  int? humidity;

  List<Weather>? weather;
  int? clouds;
  // ignore: prefer_typing_uninitialized_variables
  var uvi;

  Daily(
      {this.dt, this.temp, this.humidity, this.weather, this.clouds, this.uvi});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];

    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;

    humidity = json['humidity'];

    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    uvi = json['uvi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }

    data['humidity'] = humidity;

    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;

    data['uvi'] = uvi;
    return data;
  }
}

class Temp {
  // ignore: prefer_typing_uninitialized_variables
  var day;
  // ignore: prefer_typing_uninitialized_variables
  var min;
  // ignore: prefer_typing_uninitialized_variables
  var max;
  // ignore: prefer_typing_uninitialized_variables
  var night;
  // ignore: prefer_typing_uninitialized_variables
  var eve;
  // ignore: prefer_typing_uninitialized_variables
  var morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}
