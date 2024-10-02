object pepita {
  var energia = 100
  var posicion = "caba"

  method vuelo(kilometros) {
    energia -= kilometros + 10
  }

  method comer(gramos) {
    energia += gramos * 4
  }

  method ir(lugar) {
    self.volarA(lugar)
    posicion = lugar
  }

  method volarA(lugar) {
    self.vuelo(ruta9.altura(lugar))
  }
}

object ruta9 {
  var pilar = 60
  var escobar = 80
  var caba = 0

  method altura(lugar) {
    return lugar
  }
}
