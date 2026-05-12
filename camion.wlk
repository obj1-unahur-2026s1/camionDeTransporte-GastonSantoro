    object camion {
	const cosas = []
	const tara = 1000

	method cargar(cosa) {
		cosas.add(cosa)
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	// Sumamos el peso de todas las cosas + la tara
	method pesoTotal() {
		return tara + cosas.sum({ c => c.peso() })
	}

	// Queremos saber si TODOS los pesos son pares
	method todosPesosPares() {
		return cosas.all({ c => c.peso() % 2 == 0 })
	}

    // Consulta si alguna cosa pesa un determinado valor
    method tieneAlgoQuePese(unPeso) {
        return cosas.any({ c => c.peso() == unPeso })
    }

    // primer cosa cargada con un determinado nivel de peligrosidad
    method cosaConPeligrosidad(nivel) {
        return cosas.find({ c => c.peligrosidad() == nivel })
}
    
    // Consulta extra: ¿Hay alguna cosa muy peligrosa?
    method cosasQueSuperenCiertaPeligrosidad(nivel) {
        return cosas.filter({ c => c.peligrosidad() > nivel })
    }

    // lista de cosas que superan el nivel de peligrosidad
    method cosasMasPeligrosasQue(unaCosa) {
        return cosas.filter({ c => c.peligrosidad() > unaCosa.peligrosidad() })
    }

    //Consultar si el camión esta excedeido de su peso maximo 2500 kg
    method estaExcedido() {
        return self.pesoTotal() > 2500
    }

    // conocer si el Camion puede circular en ruta
    method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
    return not self.estaExcedido() && 
           cosas.all({ c => c.peligrosidad() <= nivelMaximoPeligrosidad })
}

}
