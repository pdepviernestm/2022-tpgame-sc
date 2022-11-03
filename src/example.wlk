import wollok.game.*

class Tablero {
	
	const casillas = []
	const barcos = []
	
	method casillas(){return casillas}
	
	method addCasilla(l,e){
		casillas.add(new Posicion(letra=l,entero=e,estado="libre"))
	}
	
	method addBarco(barco){
		barcos.add(barco)
	}
	
	method todosLosBarcosDestruidos(){
		return barcos.all({b => b.destruido()})
	}
	
	method findBarco(c){
		const casilla = self.getCasilla(c)
		return barcos.find({b => b.ocupaLaCasilla(c)})
	}
	
	method casillasAdjuntas(casilla){
		const horizontal = casillas.filter({c => c.entero() == casilla.entero() && c.letraToEntero().between(casilla.letraToEntero()-1,casilla.letraToEntero()+1)})
		horizontal.remove(casilla)
		const vertical = casillas.filter({c => c.letra() == casilla.letra() && c.entero().between(casilla.entero()-1,casilla.entero()+1)})
		vertical.remove(casilla)
		return horizontal + vertical
		
	}
	
	//casilla opuesta a c2 respecto de c1
	method casillaOpuesta(c1,c2){
		if(c1.horizontalDerecha(c2)){
			return casillas.findOrDefault({c => c.entero() == c1.entero() && c.letraToEntero() == c1.letraToEntero() + 1 }, null)
		}
		if(c1.horizontalIzquierda(c2)){
			return casillas.findOrDefault({c => c.entero() == c1.entero() && c.letraToEntero() == c2.letraToEntero() + 1 }, null)
		}
		if(c1.verticalArriba(c2)){
			return casillas.findOrDefault({c => c.letra() == c1.letra() && c.entero() == c2.entero() - 1 }, null)
		}
		if(c1.verticalAbajo(c2)){
			return casillas.findOrDefault({c => c.letra() == c1.letra() && c.entero() == c1.entero() - 1 }, null)
		}
		
		return null
	}
	
	//falta implementar
	method moverBarco(b){
		b.mover(self)
	}
	
	method atacarCasilla(c){
		const casilla = self.getCasilla(c)
		const barcoAtacado = barcos.findOrDefault({b => b.ocupaLaCasilla(casilla)},null)
		if (barcoAtacado!=null){
			barcoAtacado.atacarBarco()
			const destruido = barcoAtacado.destruido()
			return new ReporteImpacto(impactoBarco = true, tipoBarco = barcoAtacado.tipo(), destruyeBarco = destruido, casilla = casilla)
		} else {
			return new ReporteImpacto(impactoBarco = false, tipoBarco = null, destruyeBarco = false, casilla = casilla)
		}
	}
	
	method encontrarPosicionPosible(length){
		var posInicial
		var posFinal
		const alineacion =  0.randomUpTo(1)
		
		//horizontal
		if(alineacion == 0){
			var entero = 0.randomUpTo(9)
			posInicial = casillas.filter({c => c.entero() == entero}).get(0.randomUpTo(9-length))
			posFinal = casillas.filter({c => c.entero() == entero}).get(posInicial.letraToEntero() + length)
		}
		//vertical
		
		if(alineacion == 1){
			var letra = casillas.get(0.randomUpTo(9)).letra()
			posInicial = casillas.filter({c => c.letra() == letra}).get(0.randomUpTo(9-length))
			posFinal =casillas.filter({c => c.letra() == letra}).get(posInicial.entero() + length)
			
		}
		
		const pi = posInicial.letra() + posInicial.entero()
		const pf = posFinal.letra() + posFinal.entero()
		
		if(self.verificarPosicion(pi,pf)){
			return self.posicionesEntre(pi,pf)
		} else {
			self.encontrarPosicionPosible(length)
		}
		
		return null
	}
	
	method getCasilla(a){
		return casillas.find({c => c.letra() == a.first() && c.entero() == a.last() })
	}
	
	method verificarPosicion(a,b){
		const pos = self.posicionesEntre(a,b)
		return pos.all({posicion => posicion.estado() == "disponible"})
	}
	
	method verificarPosicion(a,b,length){
		const pos = self.posicionesEntre(a,b)
		return pos.all({posicion => posicion.estado() == "disponible"}) && pos.length() == length
	}
	
	method posicionesEntre(a,b){
		const pos = []
		const casillaA = self.getCasilla(a)
		const casillaB = self.getCasilla(b)
		const letras = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t"]
		const enteros = ["0","1","2","3","4","5","6","7","8","9"]
		
		if(casillaA.entero() == casillaB.entero()){
			const letrasEntre = letras.filter({l => l.indexOf().between(casillaA.letraToEntero().min(casillaB.letraToEntero()),casillaA.letraToEntero().max(casillaB.letraToEntero()))})
			letrasEntre.forEach({letra=> pos.add(self.getCasilla(letra + casillaA.entero()))})
		}
		
		if(casillaA.letraToEntero() == casillaB.letraToEntero()){
			const enterosEntre = enteros.filter{e => e.between(casillaA.entero().min(casillaB.entero()),casillaA.entero().max(casillaB.entero()))}
			enterosEntre.forEach({entero => pos.add(self.getCasilla(casillaA.letra() + entero))})
		}
		
		return pos
	}
}

class Barco {
	
	const tipo
	const longitud
	var posicionOcupadas = []
	
	method tipo(){return tipo}
	
	method ocupaLaCasilla(casilla){
		return posicionOcupadas.contains(casilla)
	}
	
	method destruido(){
		return posicionOcupadas.all({p => p.estado() == "destruido"})
	}
	
	method mover(tablero){
		posicionOcupadas.clear()
		self.colocarBarcoPC(tablero)
	}
	
	method colocarBarcoNPC(tablero){
		posicionOcupadas = tablero.encontrarPosicionPosible(longitud)
	}
	
	//Agregar manejo de errores
	//Implementar mover	
	method colocarBarcoPC(tablero){
		console.println("Va a colocar un " + tipo + " de longitud " + longitud)
		console.println("Indique la posicion inicial")
		var a = console.readLine()
		if(a == "Mover barco"){
			console.println("Indique la posicion del barco a mover")
			var c = console.readLine()
			c.mover(tablero)
			self.colocarBarcoPC(tablero)
		} else if (tablero.casillas().contains(tablero.getCasilla(a))) {
			console.println("Indique la posicion final")
			var b = console.readLine()
			
			if(tablero.verificarPosicion(a,b,longitud)){
				posicionOcupadas = tablero.posicionesEntre(a,b)
				console.println("Se coloco el barco")
			}else{
				self.colocarBarcoPC(tablero)
			}
		}
	}
}

class Posicion {
	
	var letra
	var entero
	var estado
	var image = ""
	
	method letra(){return letra}
	method entero(){return entero}
	method estado(){return estado}
	
	method cambiarEstado(e){
		estado = e
	} // libre, ocupado, destruido
	
	method position() {
		return game.at(self.letraToEntero(),entero)
	}
	
	method letraToEntero(){
		if(letra == "a"){return 0}
		if(letra == "b"){return 1}
		if(letra == "c"){return 2}
		if(letra == "d"){return 3}
		if(letra == "e"){return 4}
		if(letra == "f"){return 5}
		if(letra == "g"){return 6}
		if(letra == "h"){return 7}
		if(letra == "i"){return 8}
		if(letra == "j"){return 9}
		if(letra == "k"){return 10}
		if(letra == "l"){return 11}
		if(letra == "m"){return 12}
		if(letra == "n"){return 13}
		if(letra == "o"){return 14}
		if(letra == "p"){return 15}
		if(letra == "q"){return 16}
		if(letra == "r"){return 17}
		if(letra == "s"){return 18}
		if(letra == "t"){return 19}
		return 0
	}
	
	method setImage(i){
		image = i
	}
	
	method horizontalDerecha(casilla){
		return (self.entero() == casilla.entero()) && self.letraToEntero() > casilla.letraToEntero()
	}//la casilla consultada esta a la derecha de la casilla pasada por argumento
	
	method horizontalIzquierda(casilla){
		return (self.entero() == casilla.entero()) && self.letraToEntero() < casilla.letraToEntero()
	}//la casilla consultada esta a la izquierda de la casilla pasada por argumento
	
	method verticalArriba(casilla){
		return (self.entero() > casilla.entero()) && self.letraToEntero() == casilla.letraToEntero()
	}//la casilla consultada esta arriba de la casilla pasada por argumento
	
	method verticalAbajo(casilla){
		return (self.entero() < casilla.entero()) && self.letraToEntero() == casilla.letraToEntero()
	}//la casilla consultada esta abajo de la casilla pasada por argumento
	
}

class Jugador {
	
	var nombre = ""
	var siguienteJugador = null
	const tablero
	const posiblesAtaques = []
	const reportes = []
	
	method casillasAtacadas(){
		return reportes.map({r => r.casilla()})
	}
	
	method tablero(){return tablero}
	
	method setName(){
		console.println("Introduzca el nombre del jugador")
		nombre = console.readLine()
	}
	
	method setSiguienteJugador(j){
		siguienteJugador = j
	}
	
	method turnoPC(){
		
		console.println("Introduzca la casilla a atacar")
		const casilla = console.readLine()
		
		if(!self.casillasAtacadas().contains(siguienteJugador.tablero().getcasilla(casilla))){
			
			const reporteImpacto = siguienteJugador.tablero().atacarCasilla(casilla)
			
			if(reporteImpacto.impactoBarco()){
				if(reporteImpacto.destruyeBarco()){
					console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
				} else {
					console.println("El ataque impacto un barco en la casilla " + casilla)
				}
			} else {
				console.println("El ataque impacto agua")
			}
			
			reportes.add(reporteImpacto)
			
			if(!self.finDePartida()){
				console.println("Turno NPC")
				siguienteJugador.turnoNPC()
			} else {
				console.println("Fin de la partida. Gana el jugador")
			}
			
		} else {
			console.println("Esa casilla ya a sido atacada")
			self.turnoPC()
		}
		
	}
		
	method turnoNPC(){
		
		if(posiblesAtaques.isEmpty()){
			
			//Ataque random
			
			const casilla = self.elegirCasilla()
			
			if(!self.casillasAtacadas().contains(siguienteJugador.tablero().getCasilla(casilla))){
				
				const reporteImpacto = siguienteJugador.tablero().atacarCasilla(casilla)
			
				if(reporteImpacto.impactoBarco()){
					if(reporteImpacto.destruyeBarco()){
						console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
						posiblesAtaques.clear()
					} else {
						console.println("El ataque impacto un barco en la casilla " + casilla)
						posiblesAtaques.remove(casilla)
						self.agregarPosiblesAtaques(reporteImpacto)
					}
				} else {
					posiblesAtaques.remove(casilla)
					console.println("El ataque impacto agua")
				}
			
				reportes.add(reporteImpacto)
			
				if(!self.finDePartida()){
					console.println("Turno PC")
					siguienteJugador.turnoPC()
				} else {
					console.println("Fin de la partida. Gana el NPC")
				}
				
			} else {
				self.turnoNPC()
			}
		}else {
			
			//Ataca casillas conocidas
			
			const casilla = posiblesAtaques.get(0.randomUpTo(posiblesAtaques.length() - 1))
			posiblesAtaques.remove(casilla)
			
			const reporteImpacto = siguienteJugador.tablero().atacarCasilla(casilla.letra() + casilla.entero())
			
			if(reporteImpacto.impactoBarco()){
				if(reporteImpacto.destruyeBarco()){
					console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
					posiblesAtaques.clear()
				} else {
					console.println("El ataque impacto un barco en la casilla " + casilla)
					self.agregarPosiblesAtaques(reporteImpacto)
				}
			} else {
				console.println("El ataque impacto agua")
			}
			
			reportes.add(reporteImpacto)
			
			if(!self.finDePartida()){
				console.println("Turno PC")
				siguienteJugador.turnoPC()
			} else {
				console.println("Fin de la partida. Gana el NPC")
			}
			
		}
		
	}
	
	method finDePartida(){
		siguienteJugador.tablero().todosLosBarcosDestruidos()
	}
	
	method agregarPosiblesAtaques(reporte){
		const casillasPosibles = []
		var casillasAdjuntas = siguienteJugador.tablero().casillasAdjuntas(reporte.casilla())
		var reporteDelMismoTipo = reportes.filter({r => r.tipoBarco() == reporte.tipoBarco()})
		var casillasAdjuntasDelMismoTipo = casillasAdjuntas.filter({c => reporteDelMismoTipo.contains(c)})
		if(casillasAdjuntasDelMismoTipo.isEmpty()){
			casillasPosibles.addAll(casillasAdjuntas)
		} else {
			casillasAdjuntasDelMismoTipo.forEach({c => casillasPosibles.add(siguienteJugador.tablero().opuesta(reporte.casilla(),c))})
		}
		posiblesAtaques.addAll(casillasPosibles.filter({c => !posiblesAtaques.contains(c)}))
	}
	
	method elegirCasilla(){
		var casilla siguienteJugador.tablero().casillas().get(0.randomUpTo(99))
		return casilla.letra() + casilla.entero()
	}
	
}

class ReporteImpacto{
	
	var impactoBarco
	var tipoBarco
	var destruyeBarco
	var casilla
	
	method impactoBarco(){return impactoBarco}
	method tipoBarco(){return tipoBarco}
	method destruyeBarco(){return destruyeBarco}
	method casilla(){return casilla}
	
}