import Marcas.*

class Persona {
	var property peso 
	const property jarrasCompradas = []
	var property aguante
	var property leGustaMusicaTradicional


	method alcoholIngerido() = self.jarrasCompradas().sum { j => j.contenidoDeAlcohol() }

	method agregarJarra(unaJarra) {
		jarrasCompradas.add(unaJarra)
	}

	method estaEbria() {
		return self.alcoholIngerido() * self.peso() > self.aguante()
	}

	method leGustaLaMarca(unaMarca)  

	method pais()
	
	method esEmpedernido() {
		return self.estaEbria() and self.jarrasCompradas().all { j => j.capacidad() >= 1}
	}

	method esPatriota() = jarrasCompradas.all({ j => j.marca().paisFabricacion() == self.pais() })
	
	
	method quiereEntrar(carpa) {
		return self.leGustaLaMarca(carpa.marca()) && self.leGustaMusicaTradicional() == carpa.tieneBandaDeMusica()
	}

	method puedeIngresar(carpa) {
		return self.quiereEntrar(carpa) && carpa.puedeIngresar(self)
	}

	method entrar(carpa) {
		if (not self.puedeIngresar(carpa)) {
			self.error("No puede ingresar")
		}
		carpa.registarIngreso(self)
	}
	
}

class Checo inherits Persona {
	override method leGustaLaMarca(unaMarca) = unaMarca.graduacion() > 8
	override method pais() = "República Checa"
}

class Belga inherits Persona {
	override method leGustaLaMarca(unaMarca) = unaMarca.contenidoDeLupulo() > 4
	override method pais() = "Bélgica"
}

class Aleman inherits Persona {
	override method leGustaLaMarca(unaMarca) = true
	override method pais() = "Alemania"
	override method quiereEntrar(carpa) = super(carpa) and carpa.cantidadPersonas() % 2 == 0
}
	