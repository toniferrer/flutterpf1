//Mixin de geolocalització
import 'User.dart';

mixin GPSLocation {
  double latitud = 0.0;
  double longitud = 0.0;

  //Actualitza la posició
  void actualitzarUbicacio(double lat, double lng) {
    latitud = lat;
    longitud = lng;
  }

  //Retorna la posició actual
  (double lat, double lng)obtenirCoordenades() {
    return  (latitud,longitud);
  }
}

//Clase abstracte Vehicle
abstract class Vehicle with GPSLocation{
  late String id;
  late int bateriaPercentatge;
  bool enUs = false;
  late double preuPerMinut;
  double suplementFiltreEcologic = 2.0;

  //Mètode per obtenir el % de bateria
  String estatBateria(){
    return switch(bateriaPercentatge){
      >= 80 => "Alta",
      >= 20 => "Mitjana",
      < 20 => "Crítica (Requereix càrrega)",
      _ => "Error"
    };
  }
  
  //Mètode abstracte per calcular el cost d'una reserva
  double calcularCostReserva(int minuts, User user);
}

//Subclase
class Patinet extends Vehicle{
  late int velocitatMaxima;

  //Sobreescriu calcularCostReserva i calculam preu segons si es VIP o no
  @override
  double calcularCostReserva(int minuts, User user){
    if(user.esVIP == true){
      return (minuts * preuPerMinut)*0.90;
    }else{
      return minuts * preuPerMinut;
    }
  } 
}

//Subclase
class Cotxe extends Vehicle{
  late int places;
  late bool requereixLlicencia;

  //Sobreescriu calcularCostReserva i calculam el preu
  @override
  double calcularCostReserva(int minuts, User user){
    return (minuts * preuPerMinut) + suplementFiltreEcologic;
  } 
}