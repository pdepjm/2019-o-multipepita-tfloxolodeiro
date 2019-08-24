object pepita {
	var energia = 100

	method estaCansada() {
		return energia < 50
	}
	
	method estaFeliz(){
		return energia.between(500,1000)
	}

	method vola(kms) {
		energia -= 10 + kms
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}
		
	method tieneEnergiaMultiploDe(multiplo)
	{
		return energia % multiplo == 0
	}
	
	method cuantoQuiereVolar(){
		var cuantoQuiereVolar = energia/5
		if(energia.between(300,400))
		{
			cuantoQuiereVolar += 10
		}
		if(self.tieneEnergiaMultiploDe(20))
		{
			cuantoQuiereVolar += 15
		}
		
		return cuantoQuiereVolar
	}
	
	method salirAComer(){
		self.vola(5)
		self.come(alpiste)
		self.vola(5)
	}
	
	method haceLoQueQuieras(){
		if (self.estaCansada())
		{
			self.come(alpiste)
		}
		if (self.estaFeliz())
		{
			self.vola(8)
		}
		
	}
}

object alpiste {
	var gramos = 10
	
	method energiaQueOtorga() { 
		return 4 * gramos
	}
	
	method gramos(nuevosGramos) {
		gramos = nuevosGramos
	}	
}

object manzana {
	method energiaQueOtorga() { 
		return 50
	}	
}

object mijo{
	var estaMojado = false //Se asume que empieza seco
	
	method mojarse(){
		estaMojado = true
	}
	method secarse(){
		estaMojado = false
	}
	
	method energiaQueOtorga(){
		if (estaMojado){
			return 15
		}
		else{
			return 20
		}
	}
}

object canelones{
	var tieneSalsa = false
	var tieneQueso = false
	
	method ponerSalsa(){
		tieneSalsa = true
	}
	method ponerQueso(){
		tieneQueso = true
	}
	method sacarSalsa(){
		tieneSalsa = false
	}
	method sacarQueso(){
		tieneQueso = false
	}
	
	method energiaQueOtorga(){
		var energiaQueOtorga = 20
		
		if (tieneSalsa){
			energiaQueOtorga += 5
 		}
 		if (tieneQueso){
 			energiaQueOtorga +=7
 		}
 		return energiaQueOtorga
	}
}

object roque{
	var pupilo = pepita
	
	method entrenar(){
		pupilo.vola(10)
		pupilo.come(alpiste)
		pupilo.vola(5)
		pupilo.haceLoQueQuieras()
	}
	
	//Tambien se podria hacer un metodo que tome un parametro
	
	method entrenar(ave){
		ave.vola(10)
		ave.come(alpiste)
		ave.vola(5)
		ave.haceLoQueQuieras()
	} 
}