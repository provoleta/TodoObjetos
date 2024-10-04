

class Enfermedad {
  var cantidadCelulasAmenazadas

  method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas

  method atenuarse(cantidadCelulas) {
    cantidadCelulasAmenazadas -= cantidadCelulas
  }

  method estaCurada() = cantidadCelulasAmenazadas <= 0

  method afectar(unaPersona)
  method esAgresivaPara(unaPersona)
}

class EnfermedadAutoinmune inherits Enfermedad {
  var cantidadDeVecesQueAfecto = 0

  override method afectar(unaPersona) {
    unaPersona.destruirCelulas(cantidadCelulasAmenazadas)
    self.aumentarVecesQueAfecto()
  }

  override method esAgresivaPara(_unaPersona) = cantidadDeVecesQueAfecto > 30

  method aumentarVecesQueAfecto() {
    cantidadDeVecesQueAfecto += 1
    }
}

class EnfermedadInfecciosa inherits Enfermedad {

  method reproducirse() {
    cantidadCelulasAmenazadas *= 2
  }

  override method afectar(unaPersona) {
    unaPersona.aumentarTemperatura(cantidadCelulasAmenazadas / 1000)
  }

  override method esAgresivaPara(unaPersona) = 
    cantidadCelulasAmenazadas > unaPersona.cantidadCelulas() * 0.10
}

object laMuerte  {
  method afectar(unaPersona) {
      unaPersona.disminuirTemperatura(unaPersona.temperatura())
  }

  method esAgresivaPara(unaPersona) = true

  method atenuarse(_CantidadDeCelulas) {}
}