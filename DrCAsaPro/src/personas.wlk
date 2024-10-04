class Persona {
  const enfermedades = []
  
  var temperatura
  var cantidadCelulas

  method contraerEnfermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }

  method tiene(unaEnfermedad) = 
    enfermedades.contains(unaEnfermedad)

  method vivirUnDia() {
    enfermedades.forEach { enfermedad => enfermedad.afectar(self) }
  }

  method aumentarTemperatura(unosGrados) {
    temperatura = 45.min(temperatura + unosGrados)
  }

  method disminuirTemperatura(unosGrados) {
    temperatura = 0.max(temperatura - unosGrados)
  }

  method destruirCelulas(unaCantidad) {
    cantidadCelulas -= unaCantidad
  }

  method cantidadCelulasAfectadasPorEnfermedadesAgresivas() =
    self.enfermedadesAgresivas().sum { enfermedad => 
      enfermedad.cantidadCelulasAmenazadas() 
    }

  method enfermedadesAgresivas() =
    enfermedades.filter { enfermedad => 
      enfermedad.esAgresivaPara(self) 
    }

  method temperatura() = temperatura

  method cantidadCelulas() = cantidadCelulas

  method enfermedadQueMasCelulasAfecta() =
    enfermedades.max { enfermedad => enfermedad.cantidadCelulasAmenazadas() }

  method estaEnComa() = self.estaDelirando() || self.tienePocasCelulas()

  method estaDelirando() = temperatura == 45

  method tienePocasCelulas() = cantidadCelulas < 1000000

  method vivir(unosDias) {
    unosDias.times { _ => self.vivirUnDia() }
  }

  method recibirMedicamento(unaDosis) {
    self.aplicarDosis(unaDosis)
    self.removerEnfermedadesCuradas()
  }

  method aplicarDosis(unaDosis) {
    enfermedades.forEach { enfermedad =>
      enfermedad.atenuarse(unaDosis * 15)
    }
  }

  method removerEnfermedadesCuradas() {
    enfermedades.removeAllSuchThat { enfermedad => 
      enfermedad.estaCurada()
    }
  }
}

class Medico inherits Persona {
  const dosis

  override method contraerEnfermedad(unaEnfermedad) {
    super(unaEnfermedad)
    self.atenderA(self)
  }

  method atenderA(unaPersona) {
    unaPersona.recibirMedicamento(dosis)
  }
}

class JefeDeDepartamento inherits Persona {
  const subordinados = #{}

  method atenderA(unaPersona) {
    subordinados.anyOne().atenderA(unaPersona)
  }

  method agregarSubordinado(unSubordinado) {
    subordinados.add(unSubordinado)
  }
}