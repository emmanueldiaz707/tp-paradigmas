<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.2 of 15 de julio de 2016 on 6 de septiembre de 2026 at 21:09:23</time-stamp>


<component-created>
<name>GestionCineTeatro</name> <type>package</type>
</component-created><!-- Package GestionCineTeatro* -->


<component-created>
<name>GestionCineTeatro</name> <type>package</type>
</component-created>

<class>
<name>Funcion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idObra idSala fecha horaInicio precioEntrada reservas ventas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Sala</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id nombre permitePeliculas permiteTeatro butacas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Butaca</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>fila numero posicionX posicionY </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Reserva</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idSocio idFuncion butacasReservadas fechaReserva fechaCancelacion </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Venta</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idReserva idFuncion fechaVenta monto medioPago butacasVendidas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Persona</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id nombre dni fechaNacimiento sexo domicilio email celular </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Socio</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idPersona fechaAlta activo </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>AdministradorCineTeatro</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>personas socios obras funciones salas reservas ventas criticos criticas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Critico</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idPersona nombreUsuario fechaAlta </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>ObraArtistica</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id titulo descripcion duracion clasificacion elenco director enCartel tipo </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Critica</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>idCritico resenia puntaje idPelicula </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<shared-variable>
<name>fucionesEnHorario</name>
<environment>Smalltalk</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</shared-variable>



<methods>
<class-id>AdministradorCineTeatro class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>AdministradorCineTeatro</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="ponerEnCartelera:">ponerEnCartelera: idObra

	| unaObra |
	unaObra := obras detect: [:o | o id = idObra].
	
	unaObra enCartel: true.</body>

<body package="GestionCineTeatro" selector="buscarPersonaPorDNI:">buscarPersonaPorDNI: unDNI

	^personas detect: [:p | p dni = unDNI].</body>

<body package="GestionCineTeatro" selector="ocupacionPromedioDe:">ocupacionPromedioDe: idObra

	"devuelve valor entre 0 y 1"

	| funcionesObra salaFuncion cantidadButacasVendidas fechaHoy ocupaciones |
	
	funcionesObra := OrderedCollection new.
	ocupaciones := OrderedCollection new.
	
	fechaHoy := Date today.
	
	"lista de funciones de la obra (excepto futuras)"
	funcionesObra := funciones select: [:f | (f idObra = idObra) and: [f fecha &lt;= fechaHoy]].
	
	"por cada función obtener ocupación y agregar a lista de ocupaciones"
	funcionesObra do: [:f | 
		cantidadButacasVendidas := f butacasOcupadas size. "total butacas ocupadas"
		salaFuncion := salas detect: [:s | s idSala = f idSala]. "buscar sala de la función"
		ocupaciones add: (cantidadButacasVendidas / (salaFuncion capacidadTotal)). "butacas ocupadas / capacidad total"
		].
	
	"calcular promedio de ocupaciones"
	^(ocupaciones inject: 0 into: [:acum :o | acum + o]) / (ocupaciones size)</body>

<body package="GestionCineTeatro" selector="sacarDeCartelera:">sacarDeCartelera: idObra

	| unaObra |
	unaObra := obras detect: [:o | o id = idObra].
	
	unaObra enCartel: false.</body>

<body package="GestionCineTeatro" selector="agregarObraTeatroTitulo:descripcion:duracion:clasificacion:elenco:director:">agregarObraTeatroTitulo: unTitulo descripcion: unaDescripcion  duracion: unaDuracion clasificacion: unaClasificacion elenco: listaElenco director: listaDirectores

	| unaObra |
	
	unaObra := ObraArtistica new.
	
	unaObra id: (obras size + 1).
	unaObra titulo: unTitulo.
	unaObra descripcion: unaDescripcion.
	unaObra duracion: unaDuracion.
	unaObra clasificacion: unaClasificacion.
	unaObra elenco: listaElenco.
	unaObra director: listaDirectores.
	unaObra tipo: 'obra de teatro'.
	unaObra enCartel: true.</body>

<body package="GestionCineTeatro" selector="criticos:">criticos: anObject

	criticos := anObject</body>

<body package="GestionCineTeatro" selector="salas">salas

	^salas</body>

<body package="GestionCineTeatro" selector="funcionesPorFecha:">funcionesPorFecha: unaFecha

	| listaFunciones |
	listaFunciones := funciones select: [:f | f fecha = unaFecha].
	^listaFunciones.</body>

<body package="GestionCineTeatro" selector="agregarFuncionObra:sala:fecha:horaInicio:precioEntrada:">agregarFuncionObra: idObra sala: idSala fecha: unaFecha horaInicio: unaHoraInicio precioEntrada: unPrecio

	| unaFuncion |
	unaFuncion := Funcion new.
	unaFuncion id: (funciones size + 1).
	unaFuncion idObra: idObra.
	unaFuncion idSala: idSala.
	unaFuncion fecha: unaFecha.
	unaFuncion horaInicio: unaHoraInicio.
	unaFuncion precioEntrada: unPrecio.
	
	funciones add: unaFuncion.</body>

<body package="GestionCineTeatro" selector="generarButacasFilas:Columnas:">generarButacasFilas: filas Columnas: columnas

"Genera la matriz de butacas para una sala"

	| coleccionButacas unaButaca letraFila |
	coleccionButacas := OrderedCollection new.
	
	1 to: filas do: [ :f |
	
		letraFila := (Character value: 64 + f) asSymbol asString.
		
		1 to: columnas do: [ :c |
			unaButaca := Butaca new.
			unaButaca fila: letraFila.
			unaButaca numero: c.
			unaButaca posicionX: c.
			unaButaca posicionY: f.
			
			coleccionButacas add: unaButaca
		]
	].
	^coleccionButacas</body>

<body package="GestionCineTeatro" selector="criticos">criticos

	^criticos</body>

<body package="GestionCineTeatro" selector="nuevaCriticaPara:De:resenia:puntaje:">nuevaCriticaPara: idPelicula De: idCritico resenia: unaResenia puntaje: unPuntaje


	| unaCritica |
	unaCritica := Critica new.
	
	unaCritica idPelicula: idPelicula.
	unaCritica idCritico: idCritico.
	unaCritica resenia: unaResenia.
	unaCritica puntaje: unPuntaje.
	unaCritica id: (criticas size + 1).
	
	criticas add: unaCritica.</body>

<body package="GestionCineTeatro" selector="agregarPersona:">agregarPersona: unaPersona

	personas add: unaPersona.</body>

<body package="GestionCineTeatro" selector="socios:">socios: anObject

	socios := anObject</body>

<body package="GestionCineTeatro" selector="ventas">ventas

	^ventas</body>

<body package="GestionCineTeatro" selector="agregarVentaDirectaSocio:Funcion:butacasVenta:medioPago:">agregarVentaDirectaSocio: idSocio Funcion: idFuncion butacasVenta: butacasVenta medioPago: medioPago

	| unaVenta unaFuncion montoTotal |
	
	"falta validación disponibilidad"

	unaVenta := Venta new.
	unaFuncion := funciones detect: [:f | f idFuncion = idFuncion].
	
	"falta validar que sea socio"
	montoTotal := self aplicarDescuento: (unaFuncion precioEntrada * butacasVenta size).
	
	unaVenta id: ventas size + 1.
	unaVenta idFuncion: idFuncion.
	unaVenta fechaVenta: Date today.
	unaVenta monto: montoTotal.
	unaVenta medioPago: medioPago.
	unaVenta butacasVendidas: butacasVenta.
	
	ventas add: unaVenta.</body>

<body package="GestionCineTeatro" selector="criticas:">criticas: anObject

	criticas := anObject</body>

<body package="GestionCineTeatro" selector="funcionesPorObra:">funcionesPorObra: idObra

	| listaFunciones |
	listaFunciones := funciones select: [:f | f idObra = idObra].
	^listaFunciones.</body>

<body package="GestionCineTeatro" selector="resumenIngresosReservasPorSocioEntre:Y:">resumenIngresosReservasPorSocioEntre: fechaInicio Y: fechaFin

	"devuelve total recaudado en reservas por cada socio"
	
	| ventasReservasIntervalo diccionario unaReserva unMonto |
	
	diccionario := Dictionary new. "idSocio -&gt; montoTotalSocio"
	ventasReservasIntervalo := OrderedCollection new.
	
	ventasReservasIntervalo := ventas select: [:v | (v fechaVenta between: fechaInicio and: fechaFin) and:[v idReserva notNil]].
	
	ventasReservasIntervalo do: [:v | 
		unaReserva := reservas detect: [:r | r idReserva = v idReserva].
		unMonto := diccionario at: (unaReserva idSocio).
		unMonto isNil ifTrue: [unMonto := 0].
		diccionario at: (unaReserva idSocio) put: (unMonto + v monto).
		].
	^diccionario.
	
	
	
	"total := reservasIntervalo inject: 0 into: [:acum :v | acum + v monto]."
	
	"^total."</body>

<body package="GestionCineTeatro" selector="criticas">criticas

	^criticas</body>

<body package="GestionCineTeatro" selector="agregarPeliculaTitulo:descripcion:duracion:clasificacion:elenco:director:">agregarPeliculaTitulo: unTitulo descripcion: unaDescripcion  duracion: unaDuracion clasificacion: unaClasificacion elenco: listaElenco director: listaDirectores

	| unaObra |
	
	unaObra := ObraArtistica new.
	
	unaObra id: (obras size + 1).
	unaObra titulo: unTitulo.
	unaObra descripcion: unaDescripcion.
	unaObra duracion: unaDuracion.
	unaObra clasificacion: unaClasificacion.
	unaObra elenco: listaElenco.
	unaObra director: listaDirectores.
	unaObra tipo: 'pelicula'.
	unaObra enCartel: true.</body>

<body package="GestionCineTeatro" selector="agregarVentaDirectaGeneralFuncion:butacasVenta:medioPago:">agregarVentaDirectaGeneralFuncion: idFuncion butacasVenta: butacasVenta medioPago: medioPago

	| unaVenta unaFuncion montoTotal |
	
	"falta validación disponibilidad"

	unaVenta := Venta new.
	unaFuncion := funciones detect: [:f | f idFuncion = idFuncion].
	
	montoTotal := unaFuncion precioEntrada * butacasVenta size.
	
	unaVenta id: ventas size + 1.
	unaVenta idFuncion: idFuncion.
	unaVenta fechaVenta: Date today.
	unaVenta monto: montoTotal.
	unaVenta medioPago: medioPago.
	unaVenta butacasVendidas: butacasVenta.
	
	ventas add: unaVenta.</body>

<body package="GestionCineTeatro" selector="agregarVentaReserva:medioPago:">agregarVentaReserva: idReserva medioPago: medioPago

	| unaVenta unaReserva unaFuncion montoTotal |

	unaVenta := Venta new.
	unaReserva := reservas detect: [:r | r idReserva = idReserva].
	unaFuncion := funciones detect: [:f | f idFuncion = unaReserva idFuncion].
	
	
	montoTotal := self aplicarDescuento: (unaFuncion precioEntrada * unaReserva butacasReservadas size).
	
	
	unaVenta id: ventas size + 1.
	unaVenta idReserva: idReserva.
	unaVenta idFuncion: unaReserva idFuncion.
	unaVenta fechaVenta: Date today.
	unaVenta monto: montoTotal.
	unaVenta medioPago: medioPago.
	unaVenta butacasVendidas: unaReserva butacasReservadas.
	
	ventas add: unaVenta.</body>

<body package="GestionCineTeatro" selector="eliminarSala:">eliminarSala: idSala

	| unaSala |
	unaSala := salas detect: [:s | s id = idSala].
	salas remove: unaSala.</body>

<body package="GestionCineTeatro" selector="desactivarSocio:">desactivarSocio: idSocio

	"Desactiva un socio"

	| unSocio |

	unSocio := socios detect: [:s | s id = idSocio]. 	

	unSocio desactivar.</body>

<body package="GestionCineTeatro" selector="eliminarPersona:">eliminarPersona: unaPersona

	personas remove: unaPersona.</body>

<body package="GestionCineTeatro" selector="funciones">funciones

	^funciones</body>

<body package="GestionCineTeatro" selector="puntajePromedioObra:">puntajePromedioObra: idObra

	| criticasObra sumatoria promedio |
	
	criticasObra := criticas select: [:c | c idObra = idObra].
	
	"FALTA VALIDAR QUE SEA PELÍCULA Y NO OBRA DE TEATRO"
	
	sumatoria := criticasObra inject: 0 into: [:acum :c | acum + c puntaje].
	
	promedio := sumatoria / (criticasObra size).

	^promedio.</body>

<body package="GestionCineTeatro" selector="resumenIngresosTotalesEntre:Y:">resumenIngresosTotalesEntre: fechaInicio Y: fechaFin

	"devuelve total recaudado, sin discriminar"
	
	| total ventasIntervalo |
	
	ventasIntervalo := OrderedCollection new.
	
	ventasIntervalo := ventas select: [:v | v fechaVenta between: fechaInicio and: fechaFin].
	
	total := ventasIntervalo inject: 0 into: [:acum :v | acum + v monto].
	
	^total.</body>

<body package="GestionCineTeatro" selector="agregarCritico:NombreUsuario:">agregarCritico: idPersona NombreUsuario: unUsuario

	"Da de alta (por primera vez) un critico"

	| unCritico |

	unCritico := Critico new.
	
	unCritico idPersona: idPersona.
	
	unCritico id: (criticos size + 1). 
	
	unCritico nombreUsuario: unUsuario.
	
	unCritico fechaAlta: Date today.
		
	criticos add: unCritico.</body>

<body package="GestionCineTeatro" selector="reservas">reservas

	^reservas</body>

<body package="GestionCineTeatro" selector="resumenIngresosPorTipoVentaEntre:Y:">resumenIngresosPorTipoVentaEntre: fechaInicio Y: fechaFin

	"devuelve total recaudado discriminado por ventas directas y por reservas"
	
	| totalVentaDirecta totalVentaReserva ventasDirectas ventasReservas d | 
	
	ventasDirectas := OrderedCollection new.
	ventasReservas := OrderedCollection new.
	d := Dictionary new.
	
	ventasDirectas := ventas select: [:v | v idReserva isNil].
	ventasReservas := ventas select: [:v | v idReserva notNil].
	
	totalVentaDirecta := ventasDirectas inject: 0 into: [:acum :v | acum + v monto].
	totalVentaReserva := ventasReservas inject: 0 into: [:acum :v | acum + v monto].
	
	d at: 'ventasDirectas' put: totalVentaDirecta.
	d at: 'ventasReservas' put: totalVentaReserva.

	^d</body>

<body package="GestionCineTeatro" selector="buscarSocio:">buscarSocio: idSocio

	^socios detect: [:s | s id = idSocio].</body>

<body package="GestionCineTeatro" selector="ventas:">ventas: anObject

	ventas := anObject</body>

<body package="GestionCineTeatro" selector="agregarSocio:">agregarSocio: idPersona

	"Da de alta (por primera vez) un socio"

	| unSocio |

	unSocio := Socio new.
	
	unSocio idPersona: idPersona.
	
	unSocio id: (socios size + 1). 
	
	unSocio fechaAlta: Date today.
	
	unSocio activar.
	
	socios add: unSocio.</body>

<body package="GestionCineTeatro" selector="personas">personas

	^personas</body>

<body package="GestionCineTeatro" selector="eliminarFuncion:">eliminarFuncion: idFuncion

	| unaFuncion |
	unaFuncion := funciones detect: [:f | f id = idFuncion].
	funciones remove: unaFuncion.</body>

<body package="GestionCineTeatro" selector="personas:">personas: anObject

	personas := anObject</body>

<body package="GestionCineTeatro" selector="buscarPersonaPorId:">buscarPersonaPorId: unaId

	^personas detect: [:p | p id = unaId].</body>

<body package="GestionCineTeatro" selector="agregarReservaFuncion:butacasReservadas:socio:">agregarReservaFuncion: idFuncion butacasReservadas: butacasReservadas socio: idSocio

	| unaReserva |
	unaReserva := Reserva new.
	unaReserva id: (reservas size + 1).
	unaReserva idSocio: idSocio.
	unaReserva idFuncion: idFuncion.
	unaReserva butacasReservadas: butacasReservadas.
	unaReserva fechaReserva: Date today.
	
	reservas add: unaReserva.</body>

<body package="GestionCineTeatro" selector="obras:">obras: anObject

	obras := anObject</body>

<body package="GestionCineTeatro" selector="eliminarCritica:">eliminarCritica: idCritica

	| unaCritica |
	
	unaCritica := criticas detect: [:c | c id = idCritica].
	
	criticas remove: unaCritica.</body>

<body package="GestionCineTeatro" selector="agregarSalaNombre:permitePeliculas:permteTeatro:filasButacas:columnasButacas:">agregarSalaNombre: unNombre permitePeliculas: permitePeliculas permteTeatro: permiteTeatro filasButacas: filas columnasButacas: columnas

	| unaSala |
	unaSala := Sala new.
	unaSala id: (salas size + 1).
	unaSala nombre: unNombre.
	unaSala permitePeliculas: permitePeliculas.
	unaSala permiteTeatro: permiteTeatro.
	unaSala butacas: (self generarButacasFilas: filas Columnas: columnas).
	
	salas add: unaSala.</body>

<body package="GestionCineTeatro" selector="salaLibre:fechaInicio:horaInicio:fechaFinal:horaFinal:">salaLibre: idSala fechaInicio: unaFechaInicio horaInicio: unaHoraInicio fechaFinal: unaFechaFinal horaFinal: unaHoraFinal

	| funcionesSala  funcionesEnFechas funcionesEnHorario |
	
	funcionesSala := funciones select: [:f | f idSala = idSala].
	
	funcionesEnFechas := funcionesSala select: [:f | f fecha between: unaFechaInicio and: unaFechaFinal].
	
	fucionesEnHorario := funcionesEnFechas select: [:f | (f horaInicio between: unaHoraInicio and: unaHoraFinal) or: [f horaFin between: unaHoraInicio and: unaHoraFinal]].
	
	^funcionesEnHorario isEmpty.</body>

<body package="GestionCineTeatro" selector="eliminarCritico:">eliminarCritico: idCritico

	| unCritico |
	
	unCritico := criticos detect: [:c | c id = idCritico].
	
	criticos remove: unCritico.</body>

<body package="GestionCineTeatro" selector="buscarCritico:">buscarCritico: idCritico

	^criticos detect: [:c | c id = idCritico].</body>

<body package="GestionCineTeatro" selector="salas:">salas: anObject

	salas := anObject</body>

<body package="GestionCineTeatro" selector="socios">socios

	^socios</body>

<body package="GestionCineTeatro" selector="activarSocio:">activarSocio: idSocio

	"Reactiva un socio desactivado"

	| unSocio |

	unSocio := socios detect: [:s | s id = idSocio]. 	

	unSocio activar.</body>

<body package="GestionCineTeatro" selector="reservas:">reservas: anObject

	reservas := anObject</body>

<body package="GestionCineTeatro" selector="cambiarUsuarioCritico:NuevoNombre:">cambiarUsuarioCritico: idCritico NuevoNombre: unUsuario

	| unCritico |
	
	unCritico := criticos select: [:c | c id = idCritico].
	
	unCritico nombreUsuario: unUsuario.</body>

<body package="GestionCineTeatro" selector="obras">obras

	^obras</body>

<body package="GestionCineTeatro" selector="mejoresPeliculasEnCartelera">mejoresPeliculasEnCartelera

	"devuelve diccionario 'idObra'-&gt;'puntaje' donde cada obra tenga puntaje igual o mayor que el umbral"

	| umbral d puntaje|
	umbral := 7.
	d := Dictionary new.
	
	obras do: [:o | 
		puntaje := self puntajePromedioObra: o idObra.
		((puntaje&gt;=umbral) and: [o enCartel])
			ifTrue: [d at: (o idObra) put: puntaje].
	].

	^d.</body>

<body package="GestionCineTeatro" selector="cancelarReserva:">cancelarReserva: idReserva

	| unaReserva unaFuncion |
	
	unaReserva := reservas detect: [:r | r idReserva = idReserva].
	unaFuncion := funciones detect: [:f | f idFuncion = unaReserva idFuncion].

	"ARREGLAR CONDICION"
	unaFuncion fecha - unaReserva fechaReserva &gt; 1
		ifTrue: [unaReserva fechaCancelacion: Date today.]</body>

<body package="GestionCineTeatro" selector="aplicarDescuento:">aplicarDescuento: unMonto

	| porcentajeDescuento |
	porcentajeDescuento := 20.

	^unMonto - unMonto * (porcentajeDescuento/100).</body>

<body package="GestionCineTeatro" selector="funciones:">funciones: anObject

	funciones := anObject</body>
</methods>

<methods>
<class-id>AdministradorCineTeatro</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	personas := OrderedCollection new.
	socios := OrderedCollection new.
	obras := OrderedCollection new.
	funciones := OrderedCollection new.
	salas := OrderedCollection new.
	reservas := OrderedCollection new.
	ventas := OrderedCollection new.
	criticos := OrderedCollection new.
	criticas := OrderedCollection new.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>ObraArtistica class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>ObraArtistica</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="clasificacion">clasificacion

	^clasificacion</body>

<body package="GestionCineTeatro" selector="duracion">duracion

	^duracion</body>

<body package="GestionCineTeatro" selector="descripcion">descripcion

	^descripcion</body>

<body package="GestionCineTeatro" selector="tipo">tipo

	^tipo</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="tipo:">tipo: anObject

	tipo := anObject</body>

<body package="GestionCineTeatro" selector="descripcion:">descripcion: anObject

	descripcion := anObject</body>

<body package="GestionCineTeatro" selector="enCartel">enCartel

	^enCartel</body>

<body package="GestionCineTeatro" selector="elenco">elenco

	^elenco</body>

<body package="GestionCineTeatro" selector="elenco:">elenco: anObject

	elenco := anObject</body>

<body package="GestionCineTeatro" selector="duracion:">duracion: anObject

	duracion := anObject</body>

<body package="GestionCineTeatro" selector="enCartel:">enCartel: anObject

	enCartel := anObject</body>

<body package="GestionCineTeatro" selector="titulo">titulo

	^titulo</body>

<body package="GestionCineTeatro" selector="titulo:">titulo: anObject

	titulo := anObject</body>

<body package="GestionCineTeatro" selector="director">director

	^director</body>

<body package="GestionCineTeatro" selector="director:">director: anObject

	director := anObject</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="clasificacion:">clasificacion: anObject

	clasificacion := anObject</body>
</methods>

<methods>
<class-id>ObraArtistica</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	titulo := nil.
	descripcion := nil.
	duracion := nil.
	clasificacion := nil.
	elenco := OrderedCollection new.
	director := nil.
	enCartel := true.
	tipo := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Funcion class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Funcion</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="agregarReserva:">agregarReserva: unaReserva

	reservas add: unaReserva.</body>

<body package="GestionCineTeatro" selector="butacasOcupadas">butacasOcupadas

	| b |
	b := OrderedCollection new.
	
	ventas do: [:v | b addAll: v butacasVendidas].
	reservas do: [:r | b addAll: r butacasReservadas].
	
	^b.</body>

<body package="GestionCineTeatro" selector="idSala">idSala

	^idSala</body>

<body package="GestionCineTeatro" selector="precioEntrada">precioEntrada

	^precioEntrada</body>

<body package="GestionCineTeatro" selector="idSala:">idSala: anObject

	idSala := anObject</body>

<body package="GestionCineTeatro" selector="precioEntrada:">precioEntrada: anObject

	precioEntrada := anObject</body>

<body package="GestionCineTeatro" selector="ventas">ventas

	^ventas</body>

<body package="GestionCineTeatro" selector="ventas:">ventas: anObject

	ventas := anObject</body>

<body package="GestionCineTeatro" selector="butacasDisponiblesDe:">butacasDisponiblesDe: unaSala
	| b |
	b := unaSala butacas copy.
	
	
	ventas do: [:v | b removeAll: v butacasVendidas].
	reservas do: [:r | r fechaCancelacion isNil ifTrue: [b removeAll: r butacasReservadas]].
	
	^b.</body>

<body package="GestionCineTeatro" selector="horaInicio">horaInicio

	^horaInicio</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="fecha:">fecha: anObject

	fecha := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="estaAgotadaEn:">estaAgotadaEn: unaSala

	^(self butacasDisponiblesDe: unaSala) isEmpty</body>

<body package="GestionCineTeatro" selector="agregarVenta:">agregarVenta: unaVenta

	ventas add: unaVenta.</body>

<body package="GestionCineTeatro" selector="reservas">reservas

	^reservas</body>

<body package="GestionCineTeatro" selector="idObra">idObra

	^idObra</body>

<body package="GestionCineTeatro" selector="idObra:">idObra: anObject

	idObra := anObject</body>

<body package="GestionCineTeatro" selector="horaInicio:">horaInicio: anObject

	horaInicio := anObject</body>

<body package="GestionCineTeatro" selector="reservas:">reservas: anObject

	reservas := anObject</body>

<body package="GestionCineTeatro" selector="fecha">fecha

	^fecha</body>
</methods>

<methods>
<class-id>Funcion</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	idObra := nil.
	idSala := nil.
	fecha := nil.
	horaInicio := nil.
	precioEntrada := nil.
	reservas := OrderedCollection new.
	ventas := OrderedCollection new.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Sala class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Sala</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="permitePeliculas">permitePeliculas

	^permitePeliculas</body>

<body package="GestionCineTeatro" selector="butacas:">butacas: anObject

	butacas := anObject</body>

<body package="GestionCineTeatro" selector="permiteTeatro">permiteTeatro

	^permiteTeatro</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="admiteObra:listaObras:">admiteObra: idObra listaObras: listaObras

	| unaObra |
	unaObra := listaObras detect: [:o | o idObra = idObra].
	^(self permitePeliculas and:[unaObra tipo = 'pelicula']) or: [self permiteTeatro and:[unaObra tipo = 'obra de teatro']].</body>

<body package="GestionCineTeatro" selector="permiteTeatro:">permiteTeatro: anObject

	permiteTeatro := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="butacas">butacas

	^butacas</body>

<body package="GestionCineTeatro" selector="nombre:">nombre: anObject

	nombre := anObject</body>

<body package="GestionCineTeatro" selector="permitePeliculas:">permitePeliculas: anObject

	permitePeliculas := anObject</body>

<body package="GestionCineTeatro" selector="capacidadTotal">capacidadTotal

	^butacas size.</body>

<body package="GestionCineTeatro" selector="nombre">nombre

	^nombre</body>
</methods>

<methods>
<class-id>Sala</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	nombre := nil.
	permitePeliculas := nil.
	permiteTeatro := nil.
	butacas := OrderedCollection new.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Butaca class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Butaca</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="numero:">numero: anObject

	numero := anObject</body>

<body package="GestionCineTeatro" selector="posicionX:">posicionX: anObject

	posicionX := anObject</body>

<body package="GestionCineTeatro" selector="posicionY:">posicionY: anObject

	posicionY := anObject</body>

<body package="GestionCineTeatro" selector="fila:">fila: anObject

	fila := anObject</body>

<body package="GestionCineTeatro" selector="posicionX">posicionX

	^posicionX</body>

<body package="GestionCineTeatro" selector="numero">numero

	^numero</body>

<body package="GestionCineTeatro" selector="posicionY">posicionY

	^posicionY</body>

<body package="GestionCineTeatro" selector="fila">fila

	^fila</body>
</methods>

<methods>
<class-id>Butaca</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	fila := nil.
	numero := nil.
	posicionX := nil.
	posicionY := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Reserva class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Reserva</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="butacasReservadas">butacasReservadas

	^butacasReservadas</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="fechaCancelacion:">fechaCancelacion: anObject

	fechaCancelacion := anObject</body>

<body package="GestionCineTeatro" selector="butacasReservadas:">butacasReservadas: anObject

	butacasReservadas := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="idFuncion:">idFuncion: anObject

	idFuncion := anObject</body>

<body package="GestionCineTeatro" selector="cancelar">cancelar

	fechaCancelacion := Date today.</body>

<body package="GestionCineTeatro" selector="estaConfirmadaEn:">estaConfirmadaEn: listaVentas

	^listaVentas anySatisfy: [:v | v idReserva = id]</body>

<body package="GestionCineTeatro" selector="fechaReserva">fechaReserva

	^fechaReserva</body>

<body package="GestionCineTeatro" selector="idSocio:">idSocio: anObject

	idSocio := anObject</body>

<body package="GestionCineTeatro" selector="idSocio">idSocio

	^idSocio</body>

<body package="GestionCineTeatro" selector="fechaReserva:">fechaReserva: anObject

	fechaReserva := anObject</body>

<body package="GestionCineTeatro" selector="idFuncion">idFuncion

	^idFuncion</body>

<body package="GestionCineTeatro" selector="estaCancelada">estaCancelada

	^fechaCancelacion notNil.</body>

<body package="GestionCineTeatro" selector="fechaCancelacion">fechaCancelacion

	^fechaCancelacion</body>
</methods>

<methods>
<class-id>Reserva</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	idSocio := nil.
	idFuncion := nil.
	butacasReservadas := OrderedCollection new.
	fechaReserva := nil.
	fechaCancelacion := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Venta class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Venta</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="medioPago">medioPago

	^medioPago</body>

<body package="GestionCineTeatro" selector="fechaVenta">fechaVenta

	^fechaVenta</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="medioPago:">medioPago: anObject

	medioPago := anObject</body>

<body package="GestionCineTeatro" selector="fechaVenta:">fechaVenta: anObject

	fechaVenta := anObject</body>

<body package="GestionCineTeatro" selector="idFuncion:">idFuncion: anObject

	idFuncion := anObject</body>

<body package="GestionCineTeatro" selector="butacasVendidas">butacasVendidas

	^butacasVendidas</body>

<body package="GestionCineTeatro" selector="idFuncion">idFuncion

	^idFuncion</body>

<body package="GestionCineTeatro" selector="monto">monto

	^monto</body>

<body package="GestionCineTeatro" selector="butacasVendidas:">butacasVendidas: anObject

	butacasVendidas := anObject</body>

<body package="GestionCineTeatro" selector="idReserva:">idReserva: anObject

	idReserva := anObject</body>

<body package="GestionCineTeatro" selector="idReserva">idReserva

	^idReserva</body>

<body package="GestionCineTeatro" selector="monto:">monto: anObject

	monto := anObject</body>
</methods>

<methods>
<class-id>Venta</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	idReserva := nil.
	idFuncion := nil.
	fechaVenta := nil.
	monto := nil.
	medioPago := nil.
	butacasVendidas := OrderedCollection new.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Persona class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Persona</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="domicilio">domicilio

	^domicilio</body>

<body package="GestionCineTeatro" selector="celular">celular

	^celular</body>

<body package="GestionCineTeatro" selector="celular:">celular: anObject

	celular := anObject</body>

<body package="GestionCineTeatro" selector="fechaNacimiento">fechaNacimiento

	^fechaNacimiento</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="domicilio:">domicilio: anObject

	domicilio := anObject</body>

<body package="GestionCineTeatro" selector="fechaNacimiento:">fechaNacimiento: anObject

	fechaNacimiento := anObject</body>

<body package="GestionCineTeatro" selector="sexo">sexo

	^sexo</body>

<body package="GestionCineTeatro" selector="email">email

	^email</body>

<body package="GestionCineTeatro" selector="email:">email: anObject

	email := anObject</body>

<body package="GestionCineTeatro" selector="dni">dni

	^dni</body>

<body package="GestionCineTeatro" selector="nombre">nombre

	^nombre</body>

<body package="GestionCineTeatro" selector="sexo:">sexo: anObject

	sexo := anObject</body>

<body package="GestionCineTeatro" selector="nombre:">nombre: anObject

	nombre := anObject</body>

<body package="GestionCineTeatro" selector="dni:">dni: anObject

	dni := anObject</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>
</methods>

<methods>
<class-id>Persona</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	nombre := nil.
	dni := nil.
	fechaNacimiento := nil.
	sexo := nil.
	domicilio := nil.
	email := nil.
	celular := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Socio class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Socio</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="activar">activar

	activo := true.</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="activo:">activo: anObject

	activo := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="idPersona:">idPersona: anObject

	idPersona := anObject</body>

<body package="GestionCineTeatro" selector="activo">activo

	^activo</body>

<body package="GestionCineTeatro" selector="idPersona">idPersona

	^idPersona</body>

<body package="GestionCineTeatro" selector="fechaAlta:">fechaAlta: anObject

	fechaAlta := anObject</body>

<body package="GestionCineTeatro" selector="esActivo">esActivo
	^activo</body>

<body package="GestionCineTeatro" selector="desactivar">desactivar

	activo := false.</body>

<body package="GestionCineTeatro" selector="fechaAlta">fechaAlta

	^fechaAlta</body>
</methods>

<methods>
<class-id>Socio</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
	idPersona := nil.
	fechaAlta := nil.
	activo := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Critico class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Critico</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="nombreUsuario:">nombreUsuario: anObject

	nombreUsuario := anObject</body>

<body package="GestionCineTeatro" selector="idPersona">idPersona

	^idPersona</body>

<body package="GestionCineTeatro" selector="nombreUsuario">nombreUsuario

	^nombreUsuario</body>

<body package="GestionCineTeatro" selector="fechaAlta:">fechaAlta: anObject

	fechaAlta := anObject</body>

<body package="GestionCineTeatro" selector="fechaAlta">fechaAlta

	^fechaAlta</body>

<body package="GestionCineTeatro" selector="id">id

	^id</body>

<body package="GestionCineTeatro" selector="id:">id: anObject

	id := anObject</body>

<body package="GestionCineTeatro" selector="idPersona:">idPersona: anObject

	idPersona := anObject</body>
</methods>

<methods>
<class-id>Critico</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	id := nil.
 	idPersona := nil.
	nombreUsuario := nil.
	fechaAlta := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Critica class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Critica</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="idPelicula:">idPelicula: anObject

	idPelicula := anObject</body>

<body package="GestionCineTeatro" selector="resenia:">resenia: anObject

	resenia := anObject</body>

<body package="GestionCineTeatro" selector="puntaje">puntaje

	^puntaje</body>

<body package="GestionCineTeatro" selector="idPelicula">idPelicula

	^idPelicula</body>

<body package="GestionCineTeatro" selector="resenia">resenia

	^resenia</body>

<body package="GestionCineTeatro" selector="idCritico:">idCritico: anObject

	idCritico := anObject</body>

<body package="GestionCineTeatro" selector="idCritico">idCritico

	^idCritico</body>

<body package="GestionCineTeatro" selector="puntaje:">puntaje: anObject

	puntaje := anObject</body>
</methods>

<methods>
<class-id>Critica</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	idCritico := nil.
	resenia := nil.
	puntaje := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>



</st-source>
