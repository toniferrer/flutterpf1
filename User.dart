//Clase User
class User{
  final String correu;
  bool esVIP = false;
  final String _id;
  final String _nomComplet;
  double _saldo;

  //Constructor
  User({required String id, required String nom, required this.correu})
      : _id = id,
        _nomComplet = nom,
        _saldo = 0.0;

  //Getters
  double getSaldo(){
    return _saldo;
  }

  String getId(){
    return _id;
  }

  //Recarrega saldo
  recarregarSaldo(double quantitat){
    try{
      if(quantitat <= 0){
        throw ArgumentError('La quantitat ha de ser positiva');
      }
      _saldo += quantitat;
    }catch(e){
      print('Error en recarregarSaldo: $e');
    }
  }
}