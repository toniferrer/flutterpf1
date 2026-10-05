import '../User.dart';
import '../Vehicle.dart';

//Mètode principal
void main() {
  List <Vehicle> flota = [];
  flota.add(Patinet()..id = 'Patinet1'..velocitatMaxima = 25..bateriaPercentatge = 80..preuPerMinut = 0.20..latitud = 20..longitud = 90);
  flota.add(Patinet()..id = 'Patinet2'..velocitatMaxima = 25..bateriaPercentatge = 70..preuPerMinut = 0.20..latitud = 40..longitud = 97);
  flota.add(Patinet()..id = 'Patinet3'..velocitatMaxima = 25..bateriaPercentatge = 90..preuPerMinut = 0.20..latitud = 60..longitud = 98);

  flota.add(Cotxe()..id = "Cotxe1"..places = 4..bateriaPercentatge = 50..preuPerMinut = 0.50..latitud = 34..longitud = 40);
  flota.add(Cotxe()..id = "Cotxe2"..places = 4..bateriaPercentatge = 10..preuPerMinut = 0.50..latitud = 24..longitud = 10);

  mostrarBateriaAlta(flota);
  mostrarBateriaMes20(flota);

  User user = User(id: "1", nom: "toni", correu: "toni@elcorreu.com");
  user.esVIP = true;
  simulacioUs(user, flota[1]);

  intentRecarrega(user);
}

//Mètode per mostrar el vehicle amb la bateria més alta
mostrarBateriaAlta(List <Vehicle> flota){
  Vehicle mesBateria = flota.reduce((a, b) {
    return a.bateriaPercentatge >= b.bateriaPercentatge ? a:b;
  });

  print("El vehicle amb més bateria es: ${mesBateria.id} amb ${mesBateria.bateriaPercentatge}% de carrega.");
}

//Mètode per mostrar els vehicles amb la bateria a mes del 20%
mostrarBateriaMes20(List <Vehicle> flota){
  List <Vehicle> subLlista = [];

  for(var unitat in flota){
    if(unitat.bateriaPercentatge>20 && unitat.enUs == false){
      subLlista.add(unitat);
      print("Mes de 20% de bateria: ${unitat.id}");
    }
  }
  return subLlista;
}

//Simulació d'us d'un vehicle durant 24 minuts
simulacioUs(User user, Vehicle vehicle){
  print("Incia reserva ${user.getId()} del vehicle ${vehicle.id}");

  vehicle.enUs = true;
  double cost = vehicle.calcularCostReserva(24, user);
  //Mostrar el cost de reserva
  print("La reserva ha costat: ${cost.toStringAsFixed(2)}€");

  vehicle.actualitzarUbicacio(300, 500);
  var (lat, lng) = vehicle.obtenirCoordenades();
  //Mostrar la nova ubicació 
  print("Nova ubicació: lat=$lat, lng=$lng");

  vehicle.enUs = false;
  print("Finalitza reserva ${user.getId()} del vehicle ${vehicle.id}");
}

//Intent de recarrega negativa
intentRecarrega(User user){
  user.recarregarSaldo(-10);
}