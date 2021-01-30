void main() {
  
  //utilizando la nueva clase
  var camion = new _camion();
  
  camion.marca="Chevrolet";
  camion._imprimir();
  
  
}

//Clases
class _vehiculo{
  String color;
  String modelo; 
  String marca; 
  
  
  void _imprimir(){
    print("$marca $modelo $color");
  }
  
}


//Heredando de clases 
class _camion extends _vehiculo{
  
  
}





