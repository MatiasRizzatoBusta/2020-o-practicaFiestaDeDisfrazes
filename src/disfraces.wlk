import personas.*
import fiesta.*

class Disfraz {
	var nombreDisfraz
	var fechaConfeccion = new Date()
	var caracteristicas = []
	var puntos = 0
		
	method puntos() = puntos
	
	method sumarPuntos(puntosNuevos){
		puntos += puntosNuevos
	}
	
	method tieneDisfraz() = true
	
	method nombreDisfraz() = nombreDisfraz
	
	method esMickey() = nombreDisfraz == "Mickey Mouse"
	
	method esElOsoCarolina() = nombreDisfraz == "Oso Carolina"
	
	
	method duenioSexy(duenio) = duenio.esSexy()
 		
	method sumatoriaPuntos(duenio,fiesta) =	 caracteristicas.forEach({car => car.puntosQueDa(self,duenio,fiesta)})
		
	method tieneNombrePar() = nombreDisfraz.even()
	
	method hechoRecientemente(fechaActual) = fechaConfeccion >= (fechaActual.minusDays(30))
	
}

object ninguno inherits Disfraz{
	override method tieneDisfraz() = false
}

class Gracioso{
	var nivelDeGracia
	
	method puntosQueDa(disfraz,duenio,fiesta){
		if(duenio.edad() > 50){
			disfraz.sumarPuntos(nivelDeGracia * 3)
		}else{
			disfraz.sumarPuntos(nivelDeGracia)
		}
	}
	
}

class Tobara{
	var diaComprado
	
	method diaFiesta(fiesta) = fiesta.fecha()
	
	method puntosQueDa(disfraz,duenio,fiesta){
		if((diaComprado.plusDays(2)) <= self.diaFiesta(fiesta)){
			disfraz.sumarPuntos(5)
		}else{
			disfraz.sumarPuntos(3) 
		}
	}
}

object careta{
	
	method puntosQueDa(disfraz,duenio,fiesta){
		if(disfraz.esMickey()){
			 disfraz.sumarPuntos(8)
		}else{
			disfraz.sumarPuntos(6)
		}
	}
}

object sexy{
	
	method puntosQueDa(disfraz,duenio,fiesta){
		if(disfraz.duenioSexy(duenio)){
			disfraz.sumarPuntos(15)
		}else{
			disfraz.sumarPuntos(2)
		}
	}
}