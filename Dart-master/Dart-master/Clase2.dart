main(){
  
//Flujos de control 
bool validar= false;
  
  
  if (validar==true){
    print("Correcto");
  }else{
    print("Denegado");
  }
  
  //simplificar esta expresion 
  
  var resultado= validar?"Acceso exitoso":"Acceso denegado";
  
  print(resultado);
    
//switch
var accion=5;
  
  
 switch (accion){
   case 1 : print("Uno") ; break;
   case 2 : print("Dos") ; break;
   case 3 : print("Tres") ; break;
   case 4 : print("Cuatro") ; break;
   default : print("Ninguno"); 
 }
  
//For loop 
  
var i=0;
for(i; i<=5; i++){
  print(i);
}
  
//While 
  
  var i=0;
  
  while (i<=10){
    print("Imprimiendo $i");
    i++;
  }
  
  
} 