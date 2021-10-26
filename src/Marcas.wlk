class MarcaDeCerveza {
	const property contenidoDeLupulo 
	const property paisFabricacion 

	method graduacion()
}

class Rubia inherits MarcaDeCerveza {
	const property graduacion
}

class Negra inherits MarcaDeCerveza {
	override method graduacion() = graduacionReglamentaria.graduacion().min( self.contenidoDeLupulo() * 2 )
}

class Roja inherits Negra {
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property graduacion = 5
}

class Jarra {
	const property capacidad
	const property marca 
	
	method contenidoDeAlcohol() = (self.marca().graduacion() * self.capacidad()) * 0.01
}