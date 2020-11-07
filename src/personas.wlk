import disfraces.*

class Persona {
	var personalidad
	var edad
	
	method esSexy() = personalidad.puedeSerSexy(self)
	
	method estaConforme()
	
	method esPersonalidadAlegre() =  personalidad.esAlegre()
	
}

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
	
	method puedeSerSexy(persona) = not(personalidadActual.esAlegre())
}
