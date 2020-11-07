import personas.*

class Disfraz {
	var nombreDisfraz
	var fechaConfeccion
	var caracteristicas = []
	var puntos
	var personaQueLoLleva
		
	method puntos() = puntos
	
	method nombreDisfraz() = nombreDisfraz
	
	method esMickey() = nombreDisfraz == "Mickey Mouse"
	
	method esElOsoCarolina() = nombreDisfraz == "Oso Carolina"
	
	method edadDuenio() = personaQueLoLleva.edad()
	
	method duenioSexy() = personaQueLoLleva.esSexy()
 		
	method sumatoriaPuntos() {
		caracteristicas.forEach({car => car.puntosQueDa(self)})
		const puntosQueTiene =caracteristicas.sum({car => car.puntosQueTiene()})
		puntos = puntosQueTiene
	}
	
}

class Gracioso{
	var nivelDeGracia
	var puntosQueTiene
	
	method puntosQueTiene() = puntosQueTiene
	
	method puntosQueDa(disfraz){
		if(disfraz.edadDuenio() > 50){
			puntosQueTiene = nivelDeGracia * 3
		}else{
			puntosQueTiene = nivelDeGracia
		}
	}
	
	
}

class tobara{
	var puntosQueTiene
	var diaComprado
	var diaFiesta
	
	method puntosQueTiene() = puntosQueTiene
	
	method puntosQueDa(disfraz){
		if((diaComprado + 2) <= diaFiesta){
			puntosQueTiene = 5
		}else{
			puntosQueTiene = 3
		}
	}
}

class Careta{
	var puntosQueTiene
	
	method puntosQueTiene() = puntosQueTiene
	
	method puntosQueDa(disfraz){
		if(disfraz.esMickey()){
			puntosQueTiene = 8
		}else{
			puntosQueTiene = 6
		}
	}
}

class Sexy{
	var puntosQueTiene
	
	method puntosQueTiene() = puntosQueTiene
	
	method puntosQueDa(disfraz){
		if(disfraz.duenioSexy()){
			puntosQueTiene = 15
		}else{
			puntosQueTiene = 2
		}
	}
}