import wollok.game.*

class Tablero {
	
	const casillas = []
	const barcos = []
	
	method casillas(){return casillas}
	method barcos(){return barcos}
	
	method showCasillas(){
		
		var filaAMostrar = ""
		
		const a = casillas.take(10)
		const b = casillas.take(20)
		const c = casillas.take(30)
		const d = casillas.take(40)
		const e = casillas.take(50)
		const f = casillas.take(60)
		const g = casillas.take(70)
		const h = casillas.take(80)
		const i = casillas.take(90)
		const j = casillas.take(100)
		
		j.removeAll(i)
		i.removeAll(h)
		h.removeAll(g)
		g.removeAll(f)
		f.removeAll(e)
		e.removeAll(d)
		d.removeAll(c)
		c.removeAll(b)
		b.removeAll(a)
		
		j.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		i.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		h.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		g.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		f.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		e.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		d.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		c.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		b.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
		a.forEach({c => filaAMostrar = filaAMostrar + c.letra() + c.entero() + " "})
		console.println(filaAMostrar)
		filaAMostrar = ""
		
	}
	
	method showCasillasEstado(){
		
		console.println("Tablero estados")
		
		var filaAMostrar = "9 "
		
		const a = casillas.take(10)
		const b = casillas.take(20)
		const c = casillas.take(30)
		const d = casillas.take(40)
		const e = casillas.take(50)
		const f = casillas.take(60)
		const g = casillas.take(70)
		const h = casillas.take(80)
		const i = casillas.take(90)
		const j = casillas.take(100)
		
		j.removeAll(i)
		i.removeAll(h)
		h.removeAll(g)
		g.removeAll(f)
		f.removeAll(e)
		e.removeAll(d)
		d.removeAll(c)
		c.removeAll(b)
		b.removeAll(a)
		
		j.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "8 "
		
		i.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "7 "
		
		h.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "6 "
		
		g.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "5 "
		
		f.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "4 "
		
		e.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "3 "
		
		d.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "2 "
		
		c.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "1 "
		
		b.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		filaAMostrar = "0 "
		
		a.forEach({c => filaAMostrar = filaAMostrar + c.estado().charAt(0) + " "})
		console.println(filaAMostrar)
		
		filaAMostrar = "  A B C D E F G H I J"
		console.println(filaAMostrar)
		
	}
	
	method addBarcos(b){
		barcos.addAll(b)
	}
	
	method showBarcos(){
		barcos.forEach({b => b.showBarco()})
	}
	
	method addCasilla(l,e){
		casillas.add(new Posicion(letra=l,entero=e,estado="libre"))
	}
	
	method addBarco(barco){
		barcos.add(barco)
	}
	
	method todosLosBarcosDestruidos(){
		return barcos.all({b => b.destruido()})
	}
	
	method findBarco(casilla){
		return barcos.find({b => b.ocupaLaCasilla(casilla)})
	}
	
	method distancia(casillaA,casillaB){
		return self.posicionesEntre(casillaA,casillaB).size()
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
	
	method atacarCasilla(casilla){
		const barcoAtacado = barcos.findOrDefault({b => b.ocupaLaCasilla(casilla)},null)
		if (barcoAtacado!=null){
			casilla.cambiarEstado("destruido")
			const destruido = barcoAtacado.destruido()
			return new ReporteImpacto(impactoBarco = true, tipoBarco = barcoAtacado.tipo(), destruyeBarco = destruido, casilla = casilla)
		} else {
			return new ReporteImpacto(impactoBarco = false, tipoBarco = null, destruyeBarco = false, casilla = casilla)
		}
	}
	
	method encontrarPosicionPosible(length){
		console.println("encontrarPosicionPosible - length " + length)
		var posInicial
		var posFinal
		var ret = null
		const alineacion =  0.randomUpTo(2).roundUp() - 1
		
		//horizontal
		if(alineacion == 0){
			var entero = 0.randomUpTo(10).roundUp() - 1
			console.println("Alineacion horizontal - entero " + entero)
			
			const fila = casillas.filter({c => c.entero() == entero})
			var ff = ""
			fila.forEach({f => ff = ff + f.letra() + f.entero() + " "})
			console.println("Fila - " + ff)
			
			const letraInicial = 0.randomUpTo(10-length).roundUp() - 1
			console.println("Letra inicial - " + letraInicial)
			
			posInicial = fila.get(letraInicial)
			posInicial.showCasilla()
			
			const letraFinal = letraInicial + length - 1
			console.println("Letra final - " + letraFinal)
			
			posFinal = fila.get(letraFinal)
			posFinal.showCasilla()
		}
		
		//vertical
		if(alineacion == 1){
			var letra = casillas.get(0.randomUpTo(10).roundUp() - 1).letra()
			console.println("Alineacion vertical - letra " + letra)
			
			const columna = casillas.filter({c => c.letra() == letra})
			var ff = ""
			columna.forEach({f => ff = ff + f.letra() + f.entero() + " "})
			console.println("Columna - " + ff)
			
			const enteroInicial = 0.randomUpTo(10-length).roundUp() - 1
			console.println("Entero inicial - " + enteroInicial)
			
			posInicial = columna.get(enteroInicial)
			posInicial.showCasilla()
			
			const enteroFinal = enteroInicial + length - 1
			console.println("Entero final - " + enteroFinal)
			
			posFinal =columna.get(enteroFinal)
			posFinal.showCasilla()
		}
			
		const posicionDisponible = self.verificarPosicion(posInicial,posFinal)
			
		if(posicionDisponible){
			ret = self.posicionesEntre(posInicial,posFinal)
		} else{
			ret = self.encontrarPosicionPosible(length)
		}
		
		return ret

		
	}
	
	method getCasilla(a){
		if(a != null) {
			return casillas.findOrDefault({c => c.letra() == a.charAt(0) && c.entero() == aux.stringToEntero(a.charAt(1)) },null)
		}
		return null
	}
	
	method verificarPosicion(a,b){
		const pos = self.posicionesEntre(a,b)
		const posicionesDisponibles = pos.all({posicion => posicion.estado() == "libre"})
		console.println("posicionesDisponibles - " + posicionesDisponibles)
		return posicionesDisponibles
	}
	
	method verificarPosicion(a,b,length){
		const pos = self.posicionesEntre(a,b)
		const posicionesDisponibles = pos.all({posicion => posicion.estado() == "libre"}) && pos.size() == length
		console.println("posicionesDisponibles - " + posicionesDisponibles)
		return posicionesDisponibles
	}
	
	method posicionesEntre(casillaA,casillaB){
		const pos = []
		const letras = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t"]
		const enteros = ["0","1","2","3","4","5","6","7","8","9"]
		
		if(casillaA.entero() == casillaB.entero()){
			const letrasEntre = letras.filter({l => aux.letraToEntero(l).between(casillaA.letraToEntero().min(casillaB.letraToEntero()),casillaA.letraToEntero().max(casillaB.letraToEntero()))})
			letrasEntre.forEach({letra=> pos.add(self.getCasilla(letra + casillaA.entero()))})
		}
		
		if(casillaA.letraToEntero() == casillaB.letraToEntero()){
			const enterosEntre = enteros.filter{e => aux.stringToEntero(e).between(casillaA.entero().min(casillaB.entero()),casillaA.entero().max(casillaB.entero()))}
			enterosEntre.forEach({entero => pos.add(self.getCasilla(casillaA.letra() + entero))})
		}
		
		return pos.asSet()
	}
}

class Barco {
	
	const tipo
	const longitud
	const posicionOcupadas = []
	
	method longitud(){return longitud}
	method posicionOcupadas(){return posicionOcupadas}
	
	method showBarco(){
		var posiciones = ""
		console.println("Barco - Tipo " + tipo + " - Longitud " + longitud)
		posicionOcupadas.forEach({pos => posiciones = posiciones + pos.letra() + pos.entero() + " "})
	}
	
	method empezarAColocar(casilla){
		casilla.setImage("casilla_jugador.png")
		game.addVisual(casilla)
		posicionOcupadas.add(casilla)
	}
	method posInicial(){return posicionOcupadas.get(0)}
	method terminarDeColocar(posFinal,tablero){
		const posInicial = posicionOcupadas.get(0)
		posInicial.setImage("")
		game.removeVisual(posInicial)
		if(tablero.verificarPosicion(posInicial,posFinal,longitud)){
			posicionOcupadas.clear()
			posicionOcupadas.addAll(tablero.posicionesEntre(posInicial,posFinal))
			posicionOcupadas.forEach({p => p.cambiarEstado("ocupado")})
			posicionOcupadas.forEach({p => p.setImage("barco.png")})
			posicionOcupadas.forEach({p => game.addVisual(p)})
			tablero.barcos().add(self)
			console.println("Se coloco el barco")
			return true
		} else {
			return false
		}
	}
	method reset(){
		posicionOcupadas.clear()
	}
	
	method tipo(){return tipo}
	
	method ocupaLaCasilla(casilla){
		return posicionOcupadas.contains(casilla)
	}
	
	method destruido(){
		return posicionOcupadas.all({p => p.estado() == "destruido"})
	}
	
	method colocarBarcoNPC(tablero){
		console.println("------- NPC coloca barco -------")
		self.showBarco()
		const posiciones = tablero.encontrarPosicionPosible(longitud)
		console.println("posiciones " + posiciones)
		var posicionesAOcupar = ""
		posiciones.forEach({p => posicionesAOcupar = posicionesAOcupar + p.letra() + p.entero() + " "})
		console.println("posicionesAOcupar " + posicionesAOcupar)
		posicionOcupadas.addAll(posiciones) 
		posicionOcupadas.forEach({p => p.cambiarEstado("ocupado")})
		tablero.barcos().add(self)
		console.println("Se coloco el barco")
	}
	/* 
	method colocarBarcoPC(tablero){
		tablero.showCasillasEstado()
		console.println("Va a colocar un " + tipo + " de longitud " + longitud)
		console.println("Indique la posicion inicial y final")
		const a = console.readLine()
		const pi = a.take(2)
		console.println(pi)
		const pf = a.substring(3,5)
		console.println(pf)
		if(a == "Mover barco"){
			console.println("Indique la posicion del barco a mover")
			const c = console.readLine()
			c.mover(tablero)
			self.colocarBarcoPC(tablero)
		} else if (tablero.casillas().contains(tablero.getCasilla(pi)) && tablero.casillas().contains(tablero.getCasilla(pf))) {
					
			if(tablero.verificarPosicion(pi,pf,longitud)){
				posicionOcupadas = tablero.posicionesEntre(pi,pf)
				posicionOcupadas.forEach({p => p.cambiarEstado("ocupado")})
				console.println("Se coloco el barco")
			}else{
				console.println("Hubo un error")
				self.colocarBarcoPC(tablero)
			}
		}
	}
	*/
}

class Posicion {
	
	var letra
	var entero
	var estado
	var image = ""
	method image() = image
	
	method letra(){return letra}
	method entero(){return entero}
	method estado(){return estado}
	
	method showCasilla(){
		console.println("Casilla")
		console.println(letra + entero)
		console.println(estado)
		console.println(image)
	}
	
	method cambiarEstado(e){
		estado = e
	} // libre, ocupado, destruido
	
	method position() = game.at(self.letraToEntero(),self.entero())

	
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
		return -1
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
	
	method showJugador(){
		console.println("Jugador " + nombre)
		console.println("Posibles Ataques")
		posiblesAtaques.forEach({ataque => ataque.showCasilla()})
		console.println("Reportes")
		reportes.forEach({reporte => reporte.showReporte()})
	}
	
	method casillasAtacadas(){
		return reportes.map({r => r.casilla()})
	}
	
	method reportes(){return reportes}
	
	method tablero(){return tablero}
	
	method setName(){
		console.println("Introduzca el nombre del jugador")
		nombre = console.readLine()
	}
	
	method nombre(n){nombre = n}
	
	method setSiguienteJugador(j){
		siguienteJugador = j
	}
	
	method siguienteJugador(){return siguienteJugador}
		
	method turnoNPC(){
		
		if(posiblesAtaques.isEmpty()){
			
			//Ataque random
			console.println("Ataque random")
			
			const casilla = self.elegirCasilla()
			const c = casilla.letra()+casilla.entero()
			
			if(!self.casillasAtacadas().contains(casilla)){
				
				const reporteImpacto = siguienteJugador.tablero().atacarCasilla(casilla)
			
				if(reporteImpacto.impactoBarco()){
					if(reporteImpacto.destruyeBarco()){
						console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
						const posiciones = siguienteJugador.tablero().findBarco(casilla).posicionOcupadas()
						posiciones.forEach({p => p.setImage("cruz_destruido.png")})
						posiblesAtaques.clear()
					} else {
						console.println("El ataque impacto un barco en la casilla " + c)
						posiblesAtaques.remove(casilla)
						casilla.setImage("barco_impactado.png")
						self.agregarPosiblesAtaques(reporteImpacto)
					}
				} else {
					posiblesAtaques.remove(casilla)
					casilla.setImage("cruz_vacio.png")
					game.addVisual(casilla)
					console.println("El ataque impacto agua")
				}
			
				reportes.add(reporteImpacto)
			
				if(!self.finDePartida()){
					console.println("Turno PC")
					casillaJugador.setTurno("pc")
				} else {
					console.println("Fin de la partida. Gana el NPC")
					const c = siguienteJugador.tablero().getCasilla('e2')
					game.allVisuals().forEach({e => game.removeVisual(e)})	
					c.setImage("npcwin.png")
					game.addVisual(c)
				}
				
			} else {
				self.turnoNPC()
			}
		}else {
			
			//Ataca casillas conocidas
			
			console.println("Ataque conocidas")
			
			const casilla = posiblesAtaques.get(0.randomUpTo(posiblesAtaques.size()).roundUp() - 1)
			
			if(!self.casillasAtacadas().contains(casilla)){
				const c = casilla.letra()+casilla.entero()
				posiblesAtaques.remove(casilla)
			
				const reporteImpacto = siguienteJugador.tablero().atacarCasilla(casilla)
			
				if(reporteImpacto.impactoBarco()){
					if(reporteImpacto.destruyeBarco()){
						console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
						const posiciones = siguienteJugador.tablero().findBarco(casilla).posicionOcupadas()
						posiciones.forEach({p => p.setImage("cruz_destruido.png")})
						posiblesAtaques.clear()
					} else {
						console.println("El ataque impacto un barco en la casilla " + c)
						self.agregarPosiblesAtaques(reporteImpacto)
						casilla.setImage("barco_impactado.png")
					}
				} else {
					console.println("El ataque impacto agua " + c)
					casilla.setImage("cruz_vacio.png")
					game.addVisual(casilla)
				}
			
				reportes.add(reporteImpacto)
			
				if(!self.finDePartida()){
					console.println("Turno PC")
					casillaJugador.setTurno("pc")
				} else {
					console.println("Fin de la partida. Gana el NPC")
					const c = siguienteJugador.tablero().getCasilla('e2')
					game.allVisuals().forEach({e => game.removeVisual(e)})	
					c.setImage("npcwin.png")
					game.addVisual(c)
				}
			} else {
				self.turnoNPC()
			}
			
			
			
		}
		
	}
	
	method finDePartida(){
		return siguienteJugador.tablero().todosLosBarcosDestruidos()
	}
	
	method agregarPosiblesAtaques(reporte){
		const casillasPosibles = []
		var casillasAdjuntas = siguienteJugador.tablero().casillasAdjuntas(reporte.casilla())
		const reporteDelMismoTipo = reportes.filter({r => r.tipoBarco() == reporte.tipoBarco()})
		const casillasAdjuntasDelMismoTipo = casillasAdjuntas.filter({c => reporteDelMismoTipo.contains(c)})
		if(casillasAdjuntasDelMismoTipo.isEmpty()){
			casillasPosibles.addAll(casillasAdjuntas)
		} else {
			casillasAdjuntasDelMismoTipo.forEach({c => casillasPosibles.add(siguienteJugador.tablero().opuesta(reporte.casilla(),c))})
		}
		posiblesAtaques.addAll(casillasPosibles.filter({c => !posiblesAtaques.contains(c)}))
	}
	
	method elegirCasilla(){
		return siguienteJugador.tablero().casillas().get(0.randomUpTo(100).roundUp() - 1)
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
	
	method showReporte(){
		console.println("Reporte Impacto")
		casilla.showCasilla()
		console.println("impactoBarco " + impactoBarco)
		console.println("tipoBarco " + tipoBarco)
		console.println("destruyeBarco " + destruyeBarco)
	}
	
}

object aux {
		
	method stringToEntero(l){
		if(l == "0"){return 0}
		if(l == "1"){return 1}
		if(l == "2"){return 2}
		if(l == "3"){return 3}
		if(l == "4"){return 4}
		if(l == "5"){return 5}
		if(l == "6"){return 6}
		if(l == "7"){return 7}
		if(l == "8"){return 8}
		if(l == "9"){return 9}
		return 0
	}
	
	method enteroToString(l){
		if(l == 0){return "0"}
		if(l == 1){return "1"}
		if(l == 2){return "2"}
		if(l == 3){return "3"}
		if(l == 4){return "4"}
		if(l == 5){return "5"}
		if(l == 6){return "6"}
		if(l == 7){return "7"}
		if(l == 8){return "8"}
		if(l == 9){return "9"}
		return ""
	}
	
	method letraToEntero(letra){
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
	
}

object casillaJugador {
	var jugador
	var curState = "gameStart"
	var curTablero
	//posInicial,posFinal,ataque
	var casilla
	var turno
	//pc, npc
	var image ="casilla_jugador.png"
	method setPlayer(p){jugador = p}
	method image() = image
	method position() = casilla.position()
	method setTablero(t){curTablero = t}
	method curTablero(){return curTablero}
	method casilla(){return casilla}
	method casilla(c){casilla=c}
	method move(c){
		if (c != null) { 
			casilla = c
			var barco
			if(!barcosDisponiblesPC.isEmpty()){
				barco = barcosDisponiblesPC.get(0)
			} 
			if(curState == "posInicial"){
				image = aux.enteroToString(barco.longitud()) + ".png"
			}
			if(curState == "posFinal"){
				const distancia = curTablero.distancia(barco.posInicial(),casilla)
				if(distancia == 0 || distancia > barco.longitud()){
					image = "cross.png"
				} else if (distancia < barco.longitud()) {
					image = aux.enteroToString(barco.longitud() - distancia + 1) + ".png"
				} else {
					image = "check.png"
				}
			}
		}
	}
	method setTurno(t){turno = t}
	method nextState(){
		if(curState == "gameStart"){
			console.println("Start game")
			game.removeVisual(curTablero.getCasilla("e2"))
			game.addVisual(self)
			curState = "posInicial"
			image = aux.enteroToString(barcosDisponiblesPC.get(0).longitud()) + ".png"
			return 0
		}
		if(curState == "posInicial"){
			barcosDisponiblesPC.get(0).empezarAColocar(casilla)
			curState = "posFinal"
			return 0
		}
		if(curState == "posFinal"){
			if(barcosDisponiblesPC.get(0).terminarDeColocar(casilla,curTablero)){
				barcosDisponiblesPC.remove(barcosDisponiblesPC.get(0))
				if(barcosDisponiblesPC.isEmpty()){
					curState = "ataque"
					image = "aim.png"
					curTablero = jugador.siguienteJugador().tablero()
					casilla = curTablero.casillas().first()
					
					const quienInicia = 0.randomUpTo(2).roundUp() - 1
					if(quienInicia == 0){
						console.println("Inicia PC")
						turno = "pc"
					}else{
						console.println("Inicia NPC")
						turno = "npc"
						jugador.siguienteJugador().turnoNPC()
					}
					return 0
				} else {
					curState = "posInicial"
					return 0
				}
			} else {
				image = aux.enteroToString(barcosDisponiblesPC.get(0).longitud()) + ".png"
				barcosDisponiblesPC.get(0).reset()
				curState = "posInicial"
				return 0
			}
		}
		if(curState == "ataque"){
			if(turno == "pc") {
				if(!jugador.casillasAtacadas().contains(casilla)){
					const reporteImpacto = jugador.siguienteJugador().tablero().atacarCasilla(casilla)
					jugador.casillasAtacadas().add(casilla)
					if(reporteImpacto.impactoBarco()){
						if(reporteImpacto.destruyeBarco()){
							console.println("El ataque destruye un " + reporteImpacto.tipoBarco())
							const posiciones = jugador.siguienteJugador().tablero().findBarco(casilla).posicionOcupadas()
							posiciones.forEach({p => p.setImage("cruz_destruido.png")})
							game.addVisual(casilla)
						} else {
							console.println("El ataque impacto un barco en la casilla " + casilla)
							casilla.setImage("cruz_impacto.png")
							game.addVisual(casilla)
						}
					} else {
						console.println("El ataque impacto agua")
						casilla.setImage("cruz_vacio.png")
						game.addVisual(casilla)
					}
					
					jugador.reportes().add(reporteImpacto)
								
					if(!jugador.finDePartida()){
						turno = "npc"
						console.println("Turno NPC")
						jugador.siguienteJugador().turnoNPC()
					} else {
						console.println("Fin de la partida. Gana el jugador")
						game.allVisuals().forEach({e => game.removeVisual(e)})
						const c = jugador.tablero().getCasilla('e2')
						c.setImage("pcwin.png")
						game.addVisual(c)
					}
				
					return 0
				}  else {
					console.println("Esa casilla ya a sido atacada")
					return 0
				}
			}
			return 0
		}
		return 0
	
	}
}

const barcosDisponiblesPC = [
		new Barco(longitud=5,tipo="Carrier"),
		new Barco(longitud=4,tipo="Battleship"),
		new Barco(longitud=4,tipo="Battleship"),
		new Barco(longitud=3,tipo="Cruiser"),
		new Barco(longitud=3,tipo="Cruiser"),
		new Barco(longitud=3,tipo="Submarine"),
		new Barco(longitud=2,tipo="Patrol"),
		new Barco(longitud=2,tipo="Patrol"),
		new Barco(longitud=2,tipo="Patrol"),
		new Barco(longitud=2,tipo="Patrol")
]



