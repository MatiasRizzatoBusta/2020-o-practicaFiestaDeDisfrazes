import disfraces.*

class Fiesta {
	var lugar = ""
	var fecha
	var invitados = []
	
	method fecha() = fecha
	
	method esUnBodrio() = invitados.all({invitado => not(invitado.estaConforme(self))}) 
	
	method mejorDisfraz() =	invitados.max({invitado => invitado.puntosDisfraz(self)})
	
	method estaEnFiesta(asistente) = invitados.any({invitado => invitado.esEl(asistente)})
	
	method estanEnLaFiesta(asistente,otroAsist) = self.estaEnFiesta(asistente) and	self.estaEnFiesta(otroAsist)
	
	method puedenCambiarDisfraz(asistente,otroAsist){
		if(self.estanEnLaFiesta(asistente,otroAsist)){
			if(not(asistente.estaConforme(self)) || not(otroAsist.estaConforme(self))){
				const traje = asistente.disfraz()
				const otroT = otroAsist.disfraz()
				asistente.cambiarDisfraz(traje)
				otroAsist.cambiarDisfraz(otroT)
				return asistente.estaConforme(self) and otroAsist.estaConforme(self)
				}else{
					return false
				}
		}else{
			return false
		}
		
	}
	
	method sePuedeAgregar(invitado) = not(invitados.any({unInv => unInv.esEl(invitado)})) and invitado.llevaDisfraz()
	
	method agregarInvitado(invitado){
		if(self.sePuedeAgregar(invitado)){
			invitados.add(invitado)
		}else{
			self.error("NO se puede agregar porque no tiene disfraz")
		}
	}
	
	method fiestaInolvidable() = invitados.all({invitado => invitado.esSexy() and invitado.estaConforme(self)})
		
	
}
