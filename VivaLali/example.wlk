class Funciones {
  var property recinto
  method venderEntrada(persona) {
    recinto.asignarAsiento(persona)
  }
}

class Asiento {

}

class Estadio {
  var property campo

  method asignarAsiento(persona) {
    self.plateaAlta(persona)
  } 

  method plateaBaja() {
    if (/* Hay lugar */) {
        /* Asignar ahi */ 
    } else {
        self.plateaAlta(persona)
    }
  }

  method plateaAlta() {
    if (/* Hay lugar */) {
        /* Asignar ahi */ 
    } else {
        self.plateaAlta(persona)
    }
  }

  method plateaPreferencial() {
    if (/* Hay lugar */) {
        /* Asignar ahi */ 
    } else {
        self.plateaAlta(persona)
    }
  }

  method campo() = campo
}

class Teatro {
  method plateaBaja() {}

  method plateaAlta() {}

  method plateaPreferencial() {}
  
  method campo() = 0
}