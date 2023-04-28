//  pattern Builder у додатку погоди (weather app):

// У цьому прикладі Weather - це клас, що визначає об'єкт погоди з властивостями,
// такими як розташування, температура, вологість та швидкість вітру.

// Weather class
class Weather {
  String location;
  double temperature;
  double humidity;
  double windSpeed;

  Weather(this.location, this.temperature, this.humidity, this.windSpeed);

  @override
  String toString() {
    return 'Location: $location, Temperature: $temperature, Humidity: $humidity, Wind speed: $windSpeed';
  }
}

// WeatherBuilder - це інтерфейс будівельника, який оголошує методи для
// встановлення властивостей погоди.

// Weather builder interface
abstract class WeatherBuilder {
  void setLocation(String location);
  void setTemperature(double temperature);
  void setHumidity(double humidity);
  void setWindSpeed(double windSpeed);
  Weather build();
}

// ConcreteWeatherBuilder - це конкретний будівельник, який реалізує інтерфейс
// WeatherBuilder. Він має внутрішнє поле weather - екземпляр класу Weather,
// який будується поступово за допомогою методів будівельника.

// Concrete weather builder
class ConcreteWeatherBuilder implements WeatherBuilder {
  late Weather weather;

  ConcreteWeatherBuilder() {
    weather = Weather('', 0, 0, 0);
  }

  @override
  void setLocation(String location) {
    weather.location = location;
  }

  @override
  void setTemperature(double temperature) {
    weather.temperature = temperature;
  }

  @override
  void setHumidity(double humidity) {
    weather.humidity = humidity;
  }

  @override
  void setWindSpeed(double windSpeed) {
    weather.windSpeed = windSpeed;
  }

  @override
  Weather build() {
    return weather;
  }
}

// WeatherDirector - це директор, який визначає порядок будівництва погоди.
// Він приймає будівельника в конструкторі та надає метод getWeather, який
// використовує будівельника для побудови об'єкта

// Weather director
class WeatherDirector {
  WeatherBuilder builder;

  WeatherDirector(this.builder);

  Weather getWeather(String location) {
    // Get weather data from external API
    // імітуємо дані зі стороннього АРІ
    double temperature = 20.0;
    double humidity = 60.0;
    double windSpeed = 10.0;
    //

    builder.setLocation(location);
    builder.setTemperature(temperature);
    builder.setHumidity(humidity);
    builder.setWindSpeed(windSpeed);

    return builder.build();
  }
}

void main() {
  WeatherBuilder builder = ConcreteWeatherBuilder();
  WeatherDirector director = WeatherDirector(builder);

  Weather weather = director.getWeather('Kyiv');
  print(weather);
}
