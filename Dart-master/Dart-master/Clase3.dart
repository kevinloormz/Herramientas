main(){
  //lamando funciones  
 saludos("Kevin");
 String imprimir=saludos2("Alexander");
 print(imprimir);
 saludos3("Loor");
 datos("Kevin","Loor");
 print(factorial(4).toString());
} 

//Funciones 
saludos(nombre){
  print("Hola como estas $nombre");
}

//Funciones con retorno 
String saludos2(String nombre){
   String mensaje= "Hola como estas $nombre";
  return mensaje;
}


//Simplificando funciones 
saludos3(apellido)=>print("Tu apellido es: $apellido");



//parametros opcionales 
datos(String nombre, [String apellido ,int edad]){
  
  if(apellido !=null && edad!=null){
    print("Hola $nombre $apellido tu edad es: $edad");
    
  }else {
     print("Hola $nombre");
    
  }
  
}


//Funciones recursivas
int factorial(int n){
  if (n==1){
    return 1;
  }else{
    return n* factorial(n-1);
  }
}

