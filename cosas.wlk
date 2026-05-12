
object knightRieder {
    
    method peso() = 500

    method peligrosidad() = 10
}

object bumblebee {
    
    var estaComoRobot = false // Estado inicial: Auto

    method peso() = 800

    // Cambiamos el estado
    method transformarARobot() {
        estaComoRobot = true
    }

    method transformarAAuto() {
        estaComoRobot = false
    }

    // La peligrosidad depende del estado
   method peligrosidad() {
    if (estaComoRobot) {
        return 30
    } else {
        return 15
    }
   }
}

object paqueteDeLadrillos {
    var property cantidadDeLadrillos = 1
    
    method peso() = 2 * cantidadDeLadrillos
    
    method peligrosidad() = 2
}

object arenaAGranel {

    var property peso = 0

    method peligrosidad() = 1
}

object bateriaAntiarea {
    var property estaConMisiles = true // con misiles

    method peso() {
        if (estaConMisiles) {
            return 300
        } else {
            return 200
        }
    }

    // La peligrosidad depende del estado
   method peligrosidad() {
    if (estaConMisiles) {
            return 100
        } else {
            return 0
        }
   }
}
object contenedorPortuario {
    const property cosas = []

    method agregar(cosa) {
        cosas.add(cosa)
    }

    method peso() {
        // 100 de base + la suma de los pesos de lo que tiene adentro
        return 100 + cosas.sum({ c => c.peso() })
    }

    method peligrosidad() {
        if (cosas.isEmpty()) {
            return 0
        } else {
            // Buscamos el valor máximo de peligrosidad entre sus cosas
            return cosas.map({ c => c.peligrosidad() }).max()
        }
    }
}

object residuosRadioactivos {

    var property peso = 0

    method peligrosidad() = 200
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = knightRieder // Ponemos una por defecto o empezamos en null

    method peso() {
        return cosaEnvuelta.peso()
    }

    method peligrosidad() {
        return cosaEnvuelta.peligrosidad() / 2
    }
}



