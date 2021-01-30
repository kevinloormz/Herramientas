void main() {
  
  //Utilizando la clase 
  var auto= new vehiculo(); //instancia en memoria
  
  
  //Enviando los parametros por defecto
  var autoDefault= new vehiculoDefault("Ford");
  
  auto.color='rojo';
  auto.marca='chevrolet';
  auto.modelo='corsa';
  
  auto.arrancar();
  auto._cambiarValor(auto);
  auto.arrancar();
  
  autoDefault.imprimir();
  
  
  
}

//Clases
class vehiculo{
  String color;
  String modelo; 
  String marca;
  
  //metodo
  void arrancar(){
    print("Arrancando $marca $modelo $color");
  }
  
  //metodo cambiar valores utilizando el objeto
  void _cambiarValor(vehiculo _vehiculo){
    _vehiculo.marca='Mazda';
  }
  
  
}


//Constructores entregarle al objeto un estado inicial
class vehiculoDefault{
  String marca;
  
  //Por defecto
  /*vehiculoDefault(String marca){
    this.marca=marca;
  }*/
  
  
  //Forma simplificada de definir un constructor
  vehiculoDefault(this.marca); //se llama igual que la clase
  
  
  
  void imprimir(){
    
    print("Por defecto soy un $marca");
  }
  
}




