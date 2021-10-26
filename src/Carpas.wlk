import Marcas.*

class Carpa {
	var property limite 
	var property tieneBandaDeMusica 
	var property marca
	const property personas = []
	


	method cantidadPersonas() = personas.size()
	method hayLugar() = self.cantidadPersonas() < limite

	method registarIngreso(unaPersona){
		personas.add(unaPersona)
	}


	method puedeIngresar(persona) {
		return self.hayLugar() and not persona.estaEbria()
	}


	method servirJarra(persona, capacidadJarra){
		if (not self.personas().contains(persona) ){
			self.error("La persona no esta en la carpa")
		}
		 persona.agregarJarra(new Jarra(marca=self.marca(), capacidad=capacidadJarra))	
	}

	method cantidadEbriosEmpedernidos() = personas.count({ p => p.esEmpedernido()})
	
}