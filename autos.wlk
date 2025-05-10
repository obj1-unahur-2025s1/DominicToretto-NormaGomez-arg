object dominic {
  const autos = []
  method comprar(unAuto) =  autos.add(unAuto)
  method autosNoEnCondiciones()= autos.filter ({a=> not a.enCondiciones()})
  method autosEnCondiciones() = autos.filter ({a=> a.enCondiciones()})
  method mandarAutosATaller() {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }
  method realizarPruebasDeVelocidad() {
    autos.forEach({a=>a.hacerPrueba()})
  }
  method venderAutos() {
    autos.clear()
  }
  method promedioDeVelocidades() = autos.sum({a=>a.velocidadMaxima()})/autos.size()
  method masRapido() = self.autosEnCondiciones().max({a=>a.velocidadMaxima()})
  method hayUnAutoMasRapido() = self.masRapido().velocidadMaxima() >2 * self.promedioDeVelocidades()
}
  
object taller {
  const autosAReparar= []
  method recibirAutos(listaDeAutos) {
      autosAReparar.addAll(listaDeAutos)
  }
  method repararAutos() {
    autosAReparar.forEach({a=>a.reparar()})
    autosAReparar.clear()
  }
}

object ferrari {
  var motor = 87
  method enCondiciones() = motor>=65
  method reparar() { motor = 100  }
  method velocidadMaxima() = 110 + if (motor > 75) 15 else 0
  method hacerPrueba() {motor = (motor-30) . max(0)}
    
  }

object flecha {
  var property cantidadLitrosCombustible = 100
  var property color = azul
  var property combustible = gasolina
  method color() = color
  method cantidadLitrosCombustible() = cantidadLitrosCombustible
    
  method enCondiciones() { 
    return cantidadLitrosCombustible > combustible.nivelMinimo() && color.estaEnCondiciones()
  }
  method reparar() {
    cantidadLitrosCombustible = cantidadLitrosCombustible *2
    color = color.cambiarDeColor()
  }
  method hacerPrueba() {
    cantidadLitrosCombustible = cantidadLitrosCombustible -5
  }
  method velocidadMaxima() {
    return cantidadLitrosCombustible * 2 + combustible.calculoAdicional(cantidadLitrosCombustible)
  }
}
object intocable {
  var estaEnCondiciones = true

  method hacerPrueba() {
    estaEnCondiciones = false
  }

  method reparar() {
    estaEnCondiciones = true
  }

  method velocidadMaxima() = 45

  method enCondiciones() = estaEnCondiciones
}
//auto inventadoTiene una temperatura del motor (varía entre 0 y 100).

//Está en condiciones si la temperatura está entre 10 y 70.

//Al hacer una prueba, la temperatura sube 20 grados.

//Al reparar, la temperatura baja 30 grados.

//Su velocidad máxima es 100 - |50 - temperatura| (mientras más cerca esté de 50, más rápido es).
object inventado {
  const temperatura =40
  method enCondiciones() = temperatura >=10 && temperatura <=70
  method reparar() = temperatura - 30
  method velocidadMaxima() = 100- (temperatura - 50).abs()
  method hacerPrueba() = temperatura + 20
}
  
object gasolina {
  method nivelMinimo() = 85
  method calculoAdicional(litros) = 10
}
object nafta {
  method nivelMinimo() = 50
  method calculoAdicional(litros) = -1* litros * 2*0.10
}
object nitrogeno {
  method nivelMinimo() = 0
  method calculoAdicional(litros) = litros * 2 *10
  
}
object azul {
  method cambiarDeColor() = verde 
  method estaEnCondiciones() = false
}

object rojo {
  method cambiarDeColor() = azul
  method estaEnCondiciones() = true
}

object verde {
  method cambiarDeColor() = rojo
  method estaEnCondiciones() = false
}