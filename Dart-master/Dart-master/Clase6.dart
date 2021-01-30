void main() {
  
  var _mivehiculo = new _Vehiculo("Mazda");
  var _tipovehiculo = new _TipoVehiculo("Chevrolet");
  
  _mivehiculo._imprimir();
  _tipovehiculo._imprimir();
  
  
}


class _Vehiculo{
   
  String marca;
  
  //Constructor datos por defectos 
  _Vehiculo(this.marca);
  
  //metodo 
  void _imprimir(){
    print("No estoy implementada");
  }
  
}


//sobreescribir sobre una jerarquia de clases 
class _TipoVehiculo extends _Vehiculo {
  
  //keyword super para poder heredar constructor
  _TipoVehiculo(String marca):super(marca);
  
  //sobreescribir metodos
  @override
  void _imprimir(){
    print("Soy un auto $marca");
  }
}