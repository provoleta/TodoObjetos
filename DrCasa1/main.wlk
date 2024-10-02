class Enfermedad {
    var celulasAmenazadas
    var tipo
    var infectado

    method efecto(dias) {
        if(tipo == infecciosa) {
            infectado.aumentarTemperatura() // La milesima no se que
        } else {
            infectado.destruirCelulas(celulasAmenazadas)
        }
    }
}

class Enfermo {
    var enfermedades
    var teperatura
    var celulas

    method contraerEnfermedad(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method vivir() {
        enfermedades.forEach{enfermedad => enfermedad.efecto(1)}
    }
}