object manic {
  var estrellas = 0
  var globos = 50
  
  method encontrarEstrellas() {
    estrellas += 8
  }

  method regalarEstrellas() {
    estrellas -= 1
  }

  method todoListo() {
    return estrellas >= 4
  }

  method preparado() {
    return self.todoListo() && globos >= 50
  }
}

object chuy 

object fiesta {
  var organizador = manic

  method preparada() {
    return organizador.preparado()
  }
}

