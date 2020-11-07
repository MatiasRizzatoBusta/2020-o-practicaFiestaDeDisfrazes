import disfraces.*

class Persona {
	var personalidad
	var edad
	var caracteristica
	var disfraz
	var nombre
	
	method edad() = edad
	
	method llevaDisfraz() = disfraz.tieneDisfraz() 
	
	method disfraz() = disfraz
	
	method nombre() = nombre
	
	method cambiarDisfraz(nuevoDisfraz){
		disfraz.sacarDuenio()
		disfraz = nuevoDisfraz
	}
	
	method esSexy() = personalidad.puedeSerSexy(self)
	
	method estaConforme(){
		disfraz.sumatoriaPuntos()
		return disfraz.puntos() > 10 and caracteristica.cumpleCondicionCar(disfraz)
	}
	
	method esPersonalidadAlegre() =  personalidad.esAlegre()
	
	method puntosDisfraz(){
		disfraz.sumatoriaPuntos()
		return disfraz.puntos()
	}
	
	method esEl(asistente) = asistente.nombre() == nombre
	
	method tieneDisfraz() = disfraz != ninguno
	
}

const nadie = new Persona(personalidad = alegre,edad = 0,caracteristica = caprichoso,disfraz = ninguno,nombre = "ninguno")

object alegre{
	method puedeSerSexy(persona) = false
	
	method esAlegre() = true
}

object taciturno{
	method puedeSerSexy(persona) = persona.edad() < 30 
	
	method esAlegre() = false
	
}

object cambiante{
	var personalidadActual = alegre
	
	method cambiarPersonalidad(personalidad){
		personalidadActual = personalidad
	}
	
	method puedeSerSexy(persona) = not(personalidadActual.esAlegre())
}

// CARACTERISTICAS DE UNA PERSONA

object caprichoso {
	method cumpleCondicionCar(disfraz) = disfraz.tieneNombrePar()
}

class Pretencioso{
	var fechaActual 
	
	method cumpleCondicionCar(disfraz) = disfraz.hechoRecientemente(fechaActual)
}

class Numerologo{
	var cifraDeterminada
	
	method cumpleCondicionCar(disfraz) =  disfraz.puntos() == cifraDeterminada
}
