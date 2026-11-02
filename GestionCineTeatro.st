<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.2 of 15 de julio de 2016 on 1 de noviembre de 2026 at 21:26:43</time-stamp>


<component-created>
<name>GestionCineTeatro</name> <type>package</type>
</component-created><!-- Package GestionCineTeatro* -->


<component-created>
<name>GestionCineTeatro</name> <type>package</type>
</component-created>

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
<inst-vars>idCritico resenia puntaje idPelicula id </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatro</package>
</attributes>
</class>

<class>
<name>Funcion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id idObra idSala fecha horaInicio precioEntrada reservas ventas fechaHoraInicio </inst-vars>
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

<methods>
<class-id>Butaca class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Butaca</class-id> <category>comparing</category>

<body package="GestionCineTeatro" selector="hash">hash	^self fila hash bitXor: self numero hash.</body>

<body package="GestionCineTeatro" selector="=">= unaButaca	"misma instancia en memoria"	self == unaButaca ifTrue: [ ^true ].		"clase distinta"	self class = unaButaca class ifFalse: [ ^false ].		"misma fila y número"	^self fila = unaButaca fila and: [ self numero = unaButaca numero ].</body>
</methods>

<methods>
<class-id>Butaca</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="posicionX">posicionX	^posicionX</body>

<body package="GestionCineTeatro" selector="numero">numero	^numero</body>

<body package="GestionCineTeatro" selector="numero:">numero: anObject	numero := anObject</body>

<body package="GestionCineTeatro" selector="fila:">fila: anObject	fila := anObject</body>

<body package="GestionCineTeatro" selector="posicionY:">posicionY: anObject	posicionY := anObject</body>

<body package="GestionCineTeatro" selector="posicionY">posicionY	^posicionY</body>

<body package="GestionCineTeatro" selector="fila">fila	^fila</body>

<body package="GestionCineTeatro" selector="posicionX:">posicionX: anObject	posicionX := anObject</body>
</methods>

<methods>
<class-id>Butaca</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	fila := nil.	numero := nil.	posicionX := nil.	posicionY := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Reserva class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Reserva</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="idFuncion">idFuncion	^idFuncion</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="fechaReserva:">fechaReserva: anObject	fechaReserva := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="cancelar">cancelar	fechaCancelacion := Date today.</body>

<body package="GestionCineTeatro" selector="fechaReserva">fechaReserva	^fechaReserva</body>

<body package="GestionCineTeatro" selector="estaCancelada">estaCancelada	^fechaCancelacion notNil.</body>

<body package="GestionCineTeatro" selector="idSocio">idSocio	^idSocio</body>

<body package="GestionCineTeatro" selector="butacasReservadas:">butacasReservadas: anObject	butacasReservadas := anObject</body>

<body package="GestionCineTeatro" selector="fechaCancelacion">fechaCancelacion	^fechaCancelacion</body>

<body package="GestionCineTeatro" selector="butacasReservadas">butacasReservadas	^butacasReservadas</body>

<body package="GestionCineTeatro" selector="idSocio:">idSocio: anObject	idSocio := anObject</body>

<body package="GestionCineTeatro" selector="estaConfirmadaEn:">estaConfirmadaEn: listaVentas	^listaVentas anySatisfy: [:v | v idReserva = id]</body>

<body package="GestionCineTeatro" selector="fechaCancelacion:">fechaCancelacion: anObject	fechaCancelacion := anObject</body>

<body package="GestionCineTeatro" selector="idFuncion:">idFuncion: anObject	idFuncion := anObject</body>
</methods>

<methods>
<class-id>Reserva</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	idSocio := nil.	idFuncion := nil.	butacasReservadas := OrderedCollection new.	fechaReserva := nil.	fechaCancelacion := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Venta class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Venta</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="idFuncion:">idFuncion: anObject	idFuncion := anObject</body>

<body package="GestionCineTeatro" selector="monto:">monto: anObject	monto := anObject</body>

<body package="GestionCineTeatro" selector="medioPago:">medioPago: anObject	medioPago := anObject</body>

<body package="GestionCineTeatro" selector="idFuncion">idFuncion	^idFuncion</body>

<body package="GestionCineTeatro" selector="butacasVendidas">butacasVendidas	^butacasVendidas</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="medioPago">medioPago	^medioPago</body>

<body package="GestionCineTeatro" selector="idReserva">idReserva	^idReserva</body>

<body package="GestionCineTeatro" selector="monto">monto	^monto</body>

<body package="GestionCineTeatro" selector="idReserva:">idReserva: anObject	idReserva := anObject</body>

<body package="GestionCineTeatro" selector="butacasVendidas:">butacasVendidas: anObject	butacasVendidas := anObject</body>

<body package="GestionCineTeatro" selector="fechaVenta">fechaVenta	^fechaVenta</body>

<body package="GestionCineTeatro" selector="fechaVenta:">fechaVenta: anObject	fechaVenta := anObject</body>
</methods>

<methods>
<class-id>Venta</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	idReserva := nil.	idFuncion := nil.	fechaVenta := nil.	monto := nil.	medioPago := nil.	butacasVendidas := OrderedCollection new.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Persona class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Persona</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="domicilio">domicilio	^domicilio</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="sexo:">sexo: anObject	sexo := anObject</body>

<body package="GestionCineTeatro" selector="dni">dni	^dni</body>

<body package="GestionCineTeatro" selector="domicilio:">domicilio: anObject	domicilio := anObject</body>

<body package="GestionCineTeatro" selector="nombre:">nombre: anObject	nombre := anObject</body>

<body package="GestionCineTeatro" selector="celular:">celular: anObject	celular := anObject</body>

<body package="GestionCineTeatro" selector="fechaNacimiento">fechaNacimiento	^fechaNacimiento</body>

<body package="GestionCineTeatro" selector="email">email	^email</body>

<body package="GestionCineTeatro" selector="dni:">dni: anObject	dni := anObject</body>

<body package="GestionCineTeatro" selector="email:">email: anObject	email := anObject</body>

<body package="GestionCineTeatro" selector="sexo">sexo	^sexo</body>

<body package="GestionCineTeatro" selector="nombre">nombre	^nombre</body>

<body package="GestionCineTeatro" selector="celular">celular	^celular</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="fechaNacimiento:">fechaNacimiento: anObject	fechaNacimiento := anObject</body>
</methods>

<methods>
<class-id>Persona</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	nombre := nil.	dni := nil.	fechaNacimiento := nil.	sexo := nil.	domicilio := nil.	email := nil.	celular := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Socio class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Socio</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="desactivar">desactivar	activo := false.</body>

<body package="GestionCineTeatro" selector="esActivo">esActivo	^activo</body>

<body package="GestionCineTeatro" selector="activar">activar	activo := true.</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="fechaAlta">fechaAlta	^fechaAlta</body>

<body package="GestionCineTeatro" selector="activo:">activo: anObject	activo := anObject</body>

<body package="GestionCineTeatro" selector="idPersona">idPersona	^idPersona</body>

<body package="GestionCineTeatro" selector="activo">activo	^activo</body>

<body package="GestionCineTeatro" selector="fechaAlta:">fechaAlta: anObject	fechaAlta := anObject</body>

<body package="GestionCineTeatro" selector="idPersona:">idPersona: anObject	idPersona := anObject</body>
</methods>

<methods>
<class-id>Socio</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	idPersona := nil.	fechaAlta := nil.	activo := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>AdministradorCineTeatro class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>AdministradorCineTeatro</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="agregarPeliculaTitulo:descripcion:duracion:clasificacion:elenco:director:">agregarPeliculaTitulo: unTitulo descripcion: unaDescripcion  duracion: unaDuracion clasificacion: unaClasificacion elenco: listaElenco director: listaDirectores	| unaObra |		unaObra := ObraArtistica new.		unaObra id: (obras size + 1).	unaObra titulo: unTitulo.	unaObra descripcion: unaDescripcion.	unaObra duracion: unaDuracion.	unaObra clasificacion: unaClasificacion.	unaObra elenco: listaElenco.	unaObra director: listaDirectores.	unaObra tipo: 'pelicula'.	unaObra enCartel: true.		obras add: unaObra.</body>

<body package="GestionCineTeatro" selector="funciones">funciones	^funciones</body>

<body package="GestionCineTeatro" selector="mejoresPeliculasEnCartelera">mejoresPeliculasEnCartelera	"devuelve diccionario 'idObra'-&gt;'puntaje' donde cada obra tenga puntaje igual o mayor que el umbral"	| umbral d puntaje|	umbral := 7.	d := Dictionary new.		obras do: [:o | 		o esPelicula ifTrue:[		puntaje := self puntajePromedioObra: o id.		((puntaje&gt;=umbral) and: [o enCartel])			ifTrue: [d at: (o id) put: puntaje].		].	].	^d.</body>

<body package="GestionCineTeatro" selector="nuevaCriticaPara:De:resenia:puntaje:">nuevaCriticaPara: idPelicula De: idCritico resenia: unaResenia puntaje: unPuntaje	| unaCritica unaObra |		unaObra := obras detect: [:o | o id = idPelicula] ifNone:[nil].	(unaObra notNil and:[unaObra esPelicula]) ifTrue: [			unaCritica := Critica new.			unaCritica idPelicula: idPelicula.		unaCritica idCritico: idCritico.		unaCritica resenia: unaResenia.		unaCritica puntaje: unPuntaje.		unaCritica id: (criticas size + 1).			criticas add: unaCritica.	].</body>

<body package="GestionCineTeatro" selector="eliminarSala:">eliminarSala: idSala	| unaSala |	unaSala := salas detect: [:s | s id = idSala].	salas remove: unaSala.</body>

<body package="GestionCineTeatro" selector="sacarDeCartelera:">sacarDeCartelera: idObra	| unaObra |	unaObra := obras detect: [:o | o id = idObra].		unaObra enCartel: false.</body>

<body package="GestionCineTeatro" selector="agregarSocio:">agregarSocio: idPersona	"Da de alta (por primera vez) un socio"	| unSocio |	unSocio := Socio new.		unSocio idPersona: idPersona.		unSocio id: (socios size + 1). 		unSocio fechaAlta: Date today.		unSocio activar.		socios add: unSocio.</body>

<body package="GestionCineTeatro" selector="agregarSalaNombre:permitePeliculas:permteTeatro:filasButacas:columnasButacas:">agregarSalaNombre: unNombre permitePeliculas: permitePeliculas permteTeatro: permiteTeatro filasButacas: filas columnasButacas: columnas	| unaSala |	unaSala := Sala new.	unaSala id: (salas size + 1).	unaSala nombre: unNombre.	unaSala permitePeliculas: permitePeliculas.	unaSala permiteTeatro: permiteTeatro.	unaSala butacas: (self generarButacasFilas: filas Columnas: columnas).		salas add: unaSala.</body>

<body package="GestionCineTeatro" selector="mejoresObrasRecaudacion:">mejoresObrasRecaudacion: cantidadObras	| listaOrdenadaObras limite |		listaOrdenadaObras := SortedCollection sortBlock: [:a :b | (self recaudacionObra: a id) &gt; (self recaudacionObra: b id)].		listaOrdenadaObras addAll: obras.			limite := listaOrdenadaObras size.		limite&lt;cantidadObras		ifTrue:  [^listaOrdenadaObras copyFrom: 1 to: limite]		ifFalse: [^listaOrdenadaObras copyFrom: 1 to: cantidadObras]</body>

<body package="GestionCineTeatro" selector="ventas:">ventas: anObject	ventas := anObject</body>

<body package="GestionCineTeatro" selector="guardarTodo">guardarTodo	| ruta nombreCarpeta |		nombreCarpeta := 'datos'.		nombreCarpeta asFilename exists ifFalse: [ nombreCarpeta asFilename makeDirectory ].		ruta := nombreCarpeta, '\'.	self guardar: salas en: ruta, 'salas.dat'.	self guardar: personas en: ruta, 'personas.dat'.	self guardar: socios en: ruta, 'socios.dat'.	self guardar: obras en: ruta, 'obras.dat'.	self guardar: funciones en: ruta, 'funciones.dat'.	self guardar: reservas en: ruta, 'reservas.dat'.	self guardar: ventas en: ruta, 'ventas.dat'.	self guardar: criticos en: ruta, 'criticos.dat'.	self guardar: criticas en: ruta, 'criticas.dat'</body>

<body package="GestionCineTeatro" selector="criticos:">criticos: anObject	criticos := anObject</body>

<body package="GestionCineTeatro" selector="cargar:">cargar: nombreArchivo	| stream bos datos archivo | 		archivo := nombreArchivo asFilename.		archivo exists ifFalse: [^OrderedCollection new].		stream := archivo readStream.	bos := BinaryObjectStorage onOld: stream.	[ datos := bos contents asOrderedCollection ] ensure: [ bos close ].	^datos.</body>

<body package="GestionCineTeatro" selector="generarButacasFilas:Columnas:">generarButacasFilas: filas Columnas: columnas"Genera la matriz de butacas para una sala"	| coleccionButacas unaButaca letraFila |	coleccionButacas := OrderedCollection new.		1 to: filas do: [ :f |			letraFila := (Character value: 64 + f) asSymbol asString.				1 to: columnas do: [ :c |			unaButaca := Butaca new.			unaButaca fila: letraFila.			unaButaca numero: c.			unaButaca posicionX: c.			unaButaca posicionY: f.						coleccionButacas add: unaButaca		]	].	^coleccionButacas</body>

<body package="GestionCineTeatro" selector="socios:">socios: anObject	socios := anObject</body>

<body package="GestionCineTeatro" selector="resumenIngresosPorTipoVentaEntre:Y:">resumenIngresosPorTipoVentaEntre: fechaInicio Y: fechaFin	"devuelve total recaudado discriminado por ventas directas y por reservas"		| totalVentaDirecta totalVentaReserva ventasDirectas ventasReservas d ventasIntervalo | 		ventasDirectas := OrderedCollection new.	ventasReservas := OrderedCollection new.	d := Dictionary new.		ventasIntervalo := ventas select: [:v | v fechaVenta between: fechaInicio and: fechaFin].	ventasDirectas := ventasIntervalo select: [:v | v idReserva isNil].	ventasReservas := ventasIntervalo select: [:v | v idReserva notNil].		totalVentaDirecta := ventasDirectas inject: 0 into: [:acum :v | acum + v monto].	totalVentaReserva := ventasReservas inject: 0 into: [:acum :v | acum + v monto].		d at: 'ventasDirectas' put: totalVentaDirecta.	d at: 'ventasReservas' put: totalVentaReserva.	^d</body>

<body package="GestionCineTeatro" selector="buscarPersonaPorId:">buscarPersonaPorId: unaId	^personas detect: [:p | p id = unaId].</body>

<body package="GestionCineTeatro" selector="cambiarUsuarioCritico:NuevoNombre:">cambiarUsuarioCritico: idCritico NuevoNombre: unUsuario	| unCritico |		unCritico := criticos detect: [:c | c id = idCritico].		unCritico nombreUsuario: unUsuario.</body>

<body package="GestionCineTeatro" selector="aplicarDescuento:">aplicarDescuento: unMonto	| porcentajeDescuento |	porcentajeDescuento := 20.	^unMonto - (unMonto * (porcentajeDescuento/100)).</body>

<body package="GestionCineTeatro" selector="cancelarReserva:">cancelarReserva: idReserva	| unaReserva unaFuncion ahora|		unaReserva := reservas detect: [:r | r id = idReserva].	unaFuncion := funciones detect: [:f | f id = unaReserva idFuncion].	ahora := Timestamp now.		(unaFuncion fechaHoraInicio - ahora) days &gt;=1		ifTrue: [			unaReserva fechaCancelacion: ahora asDate.			^true. "operación exitosa"			]		ifFalse: [^false] "error"</body>

<body package="GestionCineTeatro" selector="buscarCritico:">buscarCritico: idCritico	^criticos detect: [:c | c id = idCritico].</body>

<body package="GestionCineTeatro" selector="personas">personas	^personas</body>

<body package="GestionCineTeatro" selector="mejoresPeliculasCantidad:">mejoresPeliculasCantidad: cantidad	| listaOrdenadaPeliculas limite |		listaOrdenadaPeliculas := SortedCollection sortBlock: [:a :b | (self puntajePromedioObra: a id) &gt; (self puntajePromedioObra: b id)].		obras do: [:o | 		o esPelicula			ifTrue: [listaOrdenadaPeliculas add: o].		].		limite := listaOrdenadaPeliculas size.		limite&lt;cantidad		ifTrue:  [^listaOrdenadaPeliculas copyFrom: 1 to: limite]		ifFalse: [^listaOrdenadaPeliculas copyFrom: 1 to: cantidad]</body>

<body package="GestionCineTeatro" selector="puntajePromedioObra:">puntajePromedioObra: idObra	| criticasObra sumatoria promedio unaObra |		unaObra := obras detect: [:o | o id = idObra] ifNone: [^0].	unaObra esPelicula ifFalse: [^0]. "no es película"		criticasObra := criticas select: [:c | c idPelicula = idObra].		sumatoria := criticasObra inject: 0 into: [:acum :c | acum + c puntaje].		criticasObra isEmpty ifTrue: [^0].	promedio := sumatoria / (criticasObra size).	^promedio.</body>

<body package="GestionCineTeatro" selector="ocupacionPromedioDe:">ocupacionPromedioDe: idObra	"devuelve valor entre 0 y 1"	| funcionesObra salaFuncion cantidadButacasVendidas fechaHoy ocupaciones |		funcionesObra := OrderedCollection new.	ocupaciones := OrderedCollection new.		fechaHoy := Date today.		"lista de funciones de la obra (excepto futuras)"	funcionesObra := funciones select: [:f | (f idObra = idObra) and: [f fecha &lt;= fechaHoy]].		"por cada función obtener ocupación y agregar a lista de ocupaciones"	funcionesObra do: [:f | 		cantidadButacasVendidas := f butacasOcupadas size. "total butacas ocupadas"		salaFuncion := salas detect: [:s | s id = f idSala]. "buscar sala de la función"		ocupaciones add: (cantidadButacasVendidas / (salaFuncion capacidadTotal)). "butacas ocupadas / capacidad total"		].		"calcular promedio de ocupaciones"	ocupaciones isEmpty ifTrue: [^0].	^(ocupaciones inject: 0 into: [:acum :o | acum + o]) / (ocupaciones size).</body>

<body package="GestionCineTeatro" selector="agregarCritico:NombreUsuario:">agregarCritico: idPersona NombreUsuario: unUsuario	"Da de alta (por primera vez) un critico"	| unCritico |	unCritico := Critico new.		unCritico idPersona: idPersona.		unCritico id: (criticos size + 1). 		unCritico nombreUsuario: unUsuario.		unCritico fechaAlta: Date today.			criticos add: unCritico.</body>

<body package="GestionCineTeatro" selector="buscarSocio:">buscarSocio: idSocio	^socios detect: [:s | s id = idSocio].</body>

<body package="GestionCineTeatro" selector="eliminarPersona:">eliminarPersona: unaPersona	personas remove: unaPersona.</body>

<body package="GestionCineTeatro" selector="agregarFuncionObra:sala:fecha:horaInicio:precioEntrada:">agregarFuncionObra: idObra sala: idSala fecha: unaFecha horaInicio: unaHoraInicio precioEntrada: unPrecio	| unaFuncion unaObra unaSala fechaHoraInicio fechaHoraFin |		unaObra := obras detect: [:o | o id = idObra] ifNone: [nil].	unaSala := salas detect: [:s | s id = idSala] ifNone: [nil].		fechaHoraInicio := Timestamp fromDate: unaFecha andTime: unaHoraInicio.	fechaHoraFin := fechaHoraInicio addSeconds: (unaObra duracion * 60). 		(((unaObra esPelicula and:[unaSala permitePeliculas]) 		or: [unaObra esObra and:[unaSala permiteTeatro]]) 	and:[self salaLibre: idSala fechaHoraInicio: fechaHoraInicio fechaHoraFinal: fechaHoraFin])		ifTrue:[			"sala libre y coincide tipo de película y sala"				unaFuncion := Funcion new.			unaFuncion id: (funciones size + 1).			unaFuncion idObra: idObra.			unaFuncion idSala: idSala.			unaFuncion fecha: unaFecha.			unaFuncion horaInicio: unaHoraInicio.			unaFuncion precioEntrada: unPrecio.				funciones add: unaFuncion.	].</body>

<body package="GestionCineTeatro" selector="funcionesAgotadasFuturas">funcionesAgotadasFuturas	"devuelve colección de funciones agotadas desde hoy"	| fechaHoy func unaSala |	func := OrderedCollection new.	fechaHoy := Date today.		funciones do: [:f | 		unaSala := salas detect: [:s | s id = f idSala].		((f estaAgotadaEn: unaSala) and: [f fecha&gt;=fechaHoy])			ifTrue: [func add: f].		].	^func</body>

<body package="GestionCineTeatro" selector="guardar:en:">guardar: unaColeccion en: nombreArchivo	| stream bos | 		stream := nombreArchivo asFilename writeStream.	bos := BinaryObjectStorage onNew: stream.	[ bos nextPutAll: unaColeccion ] ensure: [ bos close ].</body>

<body package="GestionCineTeatro" selector="cargarDatosDePrueba">cargarDatosDePrueba	| p1 p2 p3 p4 p5 p6 s1 s2 s3 f1 f2 f3 f4 r1 r2 r3 sRealista fRealista butacasAVender |		"Limpiar datos"	self initialize.	"Personas"	p1 := Persona new id: 1; nombre: 'Juan Pérez'; dni: '35111222'; fechaNacimiento: (Date newDay: 15 monthNumber: 5 year: 1990); sexo: 'M'; domicilio: 'San Martín 123'; email: 'juan@mail.com'; celular: '3442111111'; yourself.	p2 := Persona new id: 2; nombre: 'María Gómez'; dni: '38222333'; fechaNacimiento: (Date newDay: 20 monthNumber: 8 year: 1994); sexo: 'F'; domicilio: 'Urquiza 456'; email: 'maria@mail.com'; celular: '3442222222'; yourself.	p3 := Persona new id: 3; nombre: 'Carlos López'; dni: '30333444'; fechaNacimiento: (Date newDay: 10 monthNumber: 2 year: 1984); sexo: 'M'; domicilio: '9 de Julio 789'; email: 'carlos@mail.com'; celular: '3442333333'; yourself.	p4 := Persona new id: 4; nombre: 'Ana Martínez'; dni: '40444555'; fechaNacimiento: (Date newDay: 5 monthNumber: 11 year: 1997); sexo: 'F'; domicilio: 'Galarza 321'; email: 'ana@mail.com'; celular: '3442444444'; yourself.	p5 := Persona new id: 5; nombre: 'Lucía Fernández'; dni: '42555666'; fechaNacimiento: (Date newDay: 28 monthNumber: 1 year: 2000); sexo: 'F'; domicilio: 'Rocamora 654'; email: 'lucia@mail.com'; celular: '3442555555'; yourself.	p6 := Persona new id: 6; nombre: 'Pedro Sánchez'; dni: '28666777'; fechaNacimiento: (Date newDay: 12 monthNumber: 7 year: 1981); sexo: 'M'; domicilio: 'Artigas 987'; email: 'pedro@mail.com'; celular: '3442666666'; yourself.		self agregarPersona: p1; agregarPersona: p2; agregarPersona: p3; agregarPersona: p4; agregarPersona: p5; agregarPersona: p6.	"Socios (4 socios: 1, 2 y 3 activos; 4 inactivo)"	self agregarSocio: 1.	self agregarSocio: 2.	self agregarSocio: 3.	self agregarSocio: 4.	self desactivarSocio: 4.	"Críticos"	self agregarCritico: 5 NombreUsuario: 'lucia_cine'.	self agregarCritico: 6 NombreUsuario: 'pedro_reviews'.	"Salas 1 a 3 (4 y 6 butacas)"	self agregarSalaNombre: 'Sala Cine 1' permitePeliculas: true permteTeatro: false filasButacas: 2 columnasButacas: 2.	self agregarSalaNombre: 'Sala Teatro Mayor' permitePeliculas: false permteTeatro: true filasButacas: 2 columnasButacas: 3.	self agregarSalaNombre: 'Sala Cultural Mixta' permitePeliculas: true permteTeatro: true filasButacas: 2 columnasButacas: 2.	s1 := salas detect: [ :s | s id = 1 ].	s2 := salas detect: [ :s | s id = 2 ].	s3 := salas detect: [ :s | s id = 3 ].	"Obras artísticas (3 películas y 2 obras de teatro)"	self agregarPeliculaTitulo: 'El Secreto de sus Ojos' 		descripcion: 'Un asesor legal retirado escribe una novela con la esperanza de cerrar el ciclo de casos de homicidio sin resolver que todavía lo persiguen.' 		duracion: 129 		clasificacion: '+13' 		elenco: (OrderedCollection with: 'Ricardo Darín' with: 'Soledad Villamil' with: 'Pablo Rago') 		director: (OrderedCollection with: 'Juan José Campanella').	self agregarPeliculaTitulo: 'Nueve Reinas' 		descripcion: 'Dos estafadores intentan jugársela a un coleccionista de sellos vendiéndole una hoja de sellos raros falsificados.' 		duracion: 114 		clasificacion: '+13' 		elenco: (OrderedCollection with: 'Ricardo Darín' with: 'Gastón Pauls' with: 'Graciela Tenenbaum')		director: (OrderedCollection with: 'Fabián Bielinsky').	self agregarPeliculaTitulo: 'Relatos Salvajes' 		descripcion: 'Seis historias que alternan la intriga, la comedia, la violencia, y en donde sus personajes se verán empujados hacia el abismo y hacia el innegable placer de perder el control, cruzando la delgada línea que separa la civilización de la barbarie.' 		duracion: 122 		clasificacion: '+16' 		elenco: (OrderedCollection with: 'Ricardo Darín' with: 'Érica Rivas' with: 'Darío Grandinetti')		director: (OrderedCollection with: 'Damián Szifron').	self sacarDeCartelera: 3.	self agregarObraTeatroTitulo: 'Esperando la Carroza' 		descripcion: 'Clásico grotesco criollo.' 		duracion: 95 		clasificacion: 'ATP' 		elenco: (OrderedCollection with: 'Luis Brandoni' with: 'Betiana Blum')  "======================revisar====================="		director: (OrderedCollection with: 'Ciro Zorzoli').	self agregarObraTeatroTitulo: 'Parque Lezama' 		descripcion: 'Dos ancianos forjan una amistad en un banco de plaza.' 		duracion: 110 		clasificacion: '+13' 		elenco: (OrderedCollection with: 'Luis Brandoni' with: 'Eduardo Blanco') 		director: (OrderedCollection with: 'Juan José Campanella').	"Críticas para películas 1, 2 y 3"	self nuevaCriticaPara: 1 De: 1 resenia: 'Obra maestra del cine nacional.' puntaje: 10.	self nuevaCriticaPara: 1 De: 2 resenia: 'Excelente guion y actuaciones.' puntaje: 9.	self nuevaCriticaPara: 2 De: 1 resenia: 'Muy entretenida.' puntaje: 7.	self nuevaCriticaPara: 2 De: 2 resenia: 'Algo predecible al final.' puntaje: 5.	self nuevaCriticaPara: 3 De: 1 resenia: 'Brillante.' puntaje: 8.	"Funciones 2 pasadas y 2 futuras"	self agregarFuncionObra: 1 sala: 1 fecha: (Date today subtractDays: 5) horaInicio: (Time fromSeconds: 20 * 3600) precioEntrada: 5000.	self agregarFuncionObra: 4 sala: 2 fecha: (Date today subtractDays: 2) horaInicio: (Time fromSeconds: 21 * 3600) precioEntrada: 8000.	self agregarFuncionObra: 1 sala: 1 fecha: (Date today addDays: 3) horaInicio: (Time fromSeconds: 18 * 3600) precioEntrada: 5000.	self agregarFuncionObra: 5 sala: 3 fecha: (Date today addDays: 5) horaInicio: (Time fromSeconds: 22 * 3600) precioEntrada: 10000.	f1 := funciones detect: [ :f | f id = 1 ].	f2 := funciones detect: [ :f | f id = 2 ].	f3 := funciones detect: [ :f | f id = 3 ].	f4 := funciones detect: [ :f | f id = 4 ].	"Reservas y ventas"		"Caso A: Función 1 (Hace 5 días) agotada"	self agregarReservaFuncion: 1 butacasReservadas: (s1 butacas copyFrom: 1 to: 2) socio: 1.	r1 := reservas last.	r1 fechaReserva: (Date today subtractDays: 7).	f1 agregarReserva: r1.	self agregarVentaReserva: r1 id medioPago: 'Tarjeta de Débito'.	ventas last fechaVenta: (Date today subtractDays: 5).	f1 agregarVenta: ventas last.		self agregarVentaDirectaGeneralFuncion: 1 butacasVenta: (s1 butacas copyFrom: 3 to: 4) medioPago: 'Efectivo'.	ventas last fechaVenta: (Date today subtractDays: 5).	f1 agregarVenta: ventas last.	"Caso B: Función 2 (Hace 2 días) a mitad de capacidad"	self agregarVentaDirectaSocio: 2 Funcion: 2 butacasVenta: (s2 butacas copyFrom: 1 to: 3) medioPago: 'Transferencia'.	ventas last fechaVenta: (Date today subtractDays: 2).	f2 agregarVenta: ventas last.	"Caso C: Función 3 (En 3 días) agotada (2 vendidas y 2 reservadas sin pagar)"	self agregarVentaDirectaGeneralFuncion: 3 butacasVenta: (s1 butacas copyFrom: 1 to: 2) medioPago: 'Efectivo'.	f3 agregarVenta: ventas last.		self agregarReservaFuncion: 3 butacasReservadas: (s1 butacas copyFrom: 3 to: 4) socio: 2.	r2 := reservas last.	f3 agregarReserva: r2.	"Caso D: Función 4 (En 5 días) con Reserva Cancelada"	self agregarReservaFuncion: 4 butacasReservadas: (s3 butacas copyFrom: 1 to: 2) socio: 3.	r3 := reservas last.	self cancelarReserva: r3 id.	f4 agregarReserva: r3.				"Sala realista (180 butacas) y función al 70% de ocupación (126 butacas)"		"Sala 4 (12 filas x 15 columnas)"	self agregarSalaNombre: 'Sala 4 - Gran Cine' permitePeliculas: true permteTeatro: false filasButacas: 12 columnasButacas: 15.	sRealista := salas detect: [ :s | s id = 4 ].		"Función 5: Película 1 (El Secreto de sus Ojos) en Sala 4 para dentro de 2 días"	self agregarFuncionObra: 1 sala: 4 fecha: (Date today addDays: 2) horaInicio: (Time fromSeconds: 20 * 3600) precioEntrada: 6000.	fRealista := funciones detect: [ :f | f id = 5 ].		"Tomar 126 butacas de las 180 disponibles"	butacasAVender := sRealista butacas copyFrom: 1 to: 126.		"Registrar venta directa para las butacas y asociar a la función"	self agregarVentaDirectaGeneralFuncion: 5 butacasVenta: butacasAVender medioPago: 'Efectivo'.	fRealista agregarVenta: ventas last.</body>

<body package="GestionCineTeatro" selector="activarSocio:">activarSocio: idSocio	"Reactiva un socio desactivado"	| unSocio |	unSocio := socios detect: [:s | s id = idSocio]. 		unSocio activar.</body>

<body package="GestionCineTeatro" selector="sociosDeudores">sociosDeudores		"devuelve conjunto de objetos Socio con reservas sin pagar"		| listaIdSocio listaSociosDeudores |	listaIdSocio := OrderedSet new.	listaSociosDeudores := OrderedSet new.		reservas do: [:r | 		((r estaCancelada not) and: [(r estaConfirmadaEn: ventas) not]) "si no está cancelada ni confirmada"			ifTrue: [listaIdSocio add: r idSocio]		].		listaIdSocio do: [:i | 		| unSocio |		unSocio := socios detect: [:s | s id = i].		listaSociosDeudores add: unSocio.		].	^listaSociosDeudores</body>

<body package="GestionCineTeatro" selector="funciones:">funciones: anObject	funciones := anObject</body>

<body package="GestionCineTeatro" selector="eliminarCritica:">eliminarCritica: idCritica	| unaCritica |		unaCritica := criticas detect: [:c | c id = idCritica].		criticas remove: unaCritica.</body>

<body package="GestionCineTeatro" selector="agregarVentaDirectaSocio:Funcion:butacasVenta:medioPago:">agregarVentaDirectaSocio: idSocio Funcion: idFuncion butacasVenta: butacasVenta medioPago: medioPago	| unaVenta unaFuncion montoTotal unSocio |		"========== falta validación disponibilidad =========="	unaVenta := Venta new.	unaFuncion := funciones detect: [:f | f id = idFuncion].		"Verificar si es socio activo"	unSocio := socios detect: [:s | s id = idSocio] ifNone:[nil].	((unSocio isNil) or: [(unSocio esActivo) not]) ifTrue:[		"no es socio, vender como general"		self agregarVentaDirectaGeneralFuncion: idFuncion butacasVenta: butacasVenta medioPago: medioPago	] ifFalse: [		"es socio activo"		montoTotal := self aplicarDescuento: (unaFuncion precioEntrada * butacasVenta size).			unaVenta id: ventas size + 1.		unaVenta idFuncion: idFuncion.		unaVenta fechaVenta: Date today.		unaVenta monto: montoTotal.		unaVenta medioPago: medioPago.		unaVenta butacasVendidas: butacasVenta.			ventas add: unaVenta.		unaFuncion agregarVenta: unaVenta.	].</body>

<body package="GestionCineTeatro" selector="cargarTodo">cargarTodo	| ruta |	ruta := 'datos\'.						salas := self cargar: ruta,'salas.dat'.	personas := self cargar: ruta,'personas.dat'.	socios := self cargar: ruta,'socios.dat'.	obras := self cargar: ruta,'obras.dat'.	funciones := self cargar: ruta,'funciones.dat'.	reservas := self cargar: ruta,'reservas.dat'.	ventas := self cargar: ruta,'ventas.dat'.	criticos := self cargar: ruta,'criticos.dat'.	criticas := self cargar: ruta,'criticas.dat'</body>

<body package="GestionCineTeatro" selector="agregarObraTeatroTitulo:descripcion:duracion:clasificacion:elenco:director:">agregarObraTeatroTitulo: unTitulo descripcion: unaDescripcion  duracion: unaDuracion clasificacion: unaClasificacion elenco: listaElenco director: listaDirectores	| unaObra |		unaObra := ObraArtistica new.		unaObra id: (obras size + 1).	unaObra titulo: unTitulo.	unaObra descripcion: unaDescripcion.	unaObra duracion: unaDuracion.	unaObra clasificacion: unaClasificacion.	unaObra elenco: listaElenco.	unaObra director: listaDirectores.	unaObra tipo: 'obra de teatro'.	unaObra enCartel: true.		obras add: unaObra.</body>

<body package="GestionCineTeatro" selector="criticas">criticas	^criticas</body>

<body package="GestionCineTeatro" selector="criticos">criticos	^criticos</body>

<body package="GestionCineTeatro" selector="modificarPersona:">modificarPersona: personaNuevo	| personaViejo |	personaViejo := personas detect: [:p | p id = personaNuevo id].		personaViejo celular: personaNuevo celular.	personaViejo domicilio: personaNuevo domicilio.	personaViejo email: personaNuevo email.	personaViejo nombre: personaNuevo nombre.	personaViejo sexo: personaNuevo sexo.</body>

<body package="GestionCineTeatro" selector="recaudacionObra:">recaudacionObra: idObra	| funcionesObra ventasObra |  		ventasObra := OrderedCollection new.		funcionesObra := self funcionesPorObra: idObra.		funcionesObra do: [:f | 		ventasObra addAll: (ventas select: [:v | v idFuncion = f id]) ].		^ventasObra inject: 0 into: [:acum :v | acum + v monto].</body>

<body package="GestionCineTeatro" selector="resumenIngresosTotalesEntre:Y:">resumenIngresosTotalesEntre: fechaInicio Y: fechaFin	"devuelve total recaudado, sin discriminar"		| total ventasIntervalo |		ventasIntervalo := OrderedCollection new.		ventasIntervalo := ventas select: [:v | v fechaVenta between: fechaInicio and: fechaFin].		total := ventasIntervalo inject: 0 into: [:acum :v | acum + v monto].		^total.</body>

<body package="GestionCineTeatro" selector="buscarPersonaPorDNI:">buscarPersonaPorDNI: unDNI	^personas detect: [:p | p dni = unDNI].</body>

<body package="GestionCineTeatro" selector="agregarReservaFuncion:butacasReservadas:socio:">agregarReservaFuncion: idFuncion butacasReservadas: butacasReservadas socio: idSocio	| unaReserva |		"========== falta validación disponibilidad =========="		unaReserva := Reserva new.	unaReserva id: (reservas size + 1).	unaReserva idSocio: idSocio.	unaReserva idFuncion: idFuncion.	unaReserva butacasReservadas: butacasReservadas.	unaReserva fechaReserva: Date today.		reservas add: unaReserva.	(funciones detect: [:f | f id = idFuncion]) agregarReserva: unaReserva.</body>

<body package="GestionCineTeatro" selector="personas:">personas: anObject	personas := anObject</body>

<body package="GestionCineTeatro" selector="listaObrasDirector:">listaObrasDirector: nombreDirector	^obras select: [:o | o director includes: nombreDirector].</body>

<body package="GestionCineTeatro" selector="funcionesPorObra:">funcionesPorObra: idObra	| listaFunciones |	listaFunciones := funciones select: [:f | f idObra = idObra].	^listaFunciones.</body>

<body package="GestionCineTeatro" selector="funcionesPorFecha:">funcionesPorFecha: unaFecha	| listaFunciones |	listaFunciones := funciones select: [:f | f fecha = unaFecha].	^listaFunciones.</body>

<body package="GestionCineTeatro" selector="eliminarCritico:">eliminarCritico: idCritico	| unCritico |		unCritico := criticos detect: [:c | c id = idCritico].		criticos remove: unCritico.</body>

<body package="GestionCineTeatro" selector="obras">obras	^obras</body>

<body package="GestionCineTeatro" selector="agregarVentaReserva:medioPago:">agregarVentaReserva: idReserva medioPago: medioPago	| unaVenta unaReserva unaFuncion montoTotal |	unaVenta := Venta new.	unaReserva := reservas detect: [:r | r id = idReserva].	unaFuncion := funciones detect: [:f | f id = unaReserva idFuncion].			montoTotal := self aplicarDescuento: (unaFuncion precioEntrada * unaReserva butacasReservadas size).			unaVenta id: ventas size + 1.	unaVenta idReserva: idReserva.	unaVenta idFuncion: unaReserva idFuncion.	unaVenta fechaVenta: Date today.	unaVenta monto: montoTotal.	unaVenta medioPago: medioPago.	unaVenta butacasVendidas: unaReserva butacasReservadas.		ventas add: unaVenta.	unaFuncion agregarVenta: unaVenta.</body>

<body package="GestionCineTeatro" selector="eliminarFuncion:">eliminarFuncion: idFuncion	"===== Falta borrar reservas y ventas huérfanas ====="	| unaFuncion |	unaFuncion := funciones detect: [:f | f id = idFuncion].	funciones remove: unaFuncion.</body>

<body package="GestionCineTeatro" selector="ventas">ventas	^ventas</body>

<body package="GestionCineTeatro" selector="salas">salas	^salas</body>

<body package="GestionCineTeatro" selector="reservas:">reservas: anObject	reservas := anObject</body>

<body package="GestionCineTeatro" selector="criticas:">criticas: anObject	criticas := anObject</body>

<body package="GestionCineTeatro" selector="ponerEnCartelera:">ponerEnCartelera: idObra	| unaObra |	unaObra := obras detect: [:o | o id = idObra].		unaObra enCartel: true.</body>

<body package="GestionCineTeatro" selector="salaLibre:fechaHoraInicio:fechaHoraFinal:">salaLibre: idSala fechaHoraInicio: unaFechaHoraInicio fechaHoraFinal: unaFechaHoraFinal	| funcionesSala |		funcionesSala := funciones select: [:f | f idSala = idSala].		funcionesSala do: [:f | 		|  inicioF finF obra |		obra := obras detect: [:o | o id = f idObra].		inicioF := f fechaHoraInicio.		finF := inicioF addSeconds: (obra duracion * 60).		((unaFechaHoraInicio &lt; finF) and: [inicioF &lt; unaFechaHoraFinal])			ifTrue: [^false]].	^true</body>

<body package="GestionCineTeatro" selector="agregarVentaDirectaGeneralFuncion:butacasVenta:medioPago:">agregarVentaDirectaGeneralFuncion: idFuncion butacasVenta: butacasVenta medioPago: medioPago	| unaVenta unaFuncion montoTotal |		"========== falta validación disponibilidad =========="	unaVenta := Venta new.	unaFuncion := funciones detect: [:f | f id = idFuncion].		montoTotal := unaFuncion precioEntrada * butacasVenta size.		unaVenta id: ventas size + 1.	unaVenta idFuncion: idFuncion.	unaVenta fechaVenta: Date today.	unaVenta monto: montoTotal.	unaVenta medioPago: medioPago.	unaVenta butacasVendidas: butacasVenta.		ventas add: unaVenta.	unaFuncion agregarVenta: unaVenta.</body>

<body package="GestionCineTeatro" selector="desactivarSocio:">desactivarSocio: idSocio	"Desactiva un socio"	| unSocio |	unSocio := socios detect: [:s | s id = idSocio]. 		unSocio desactivar.</body>

<body package="GestionCineTeatro" selector="resumenIngresosReservasPorSocioEntre:Y:">resumenIngresosReservasPorSocioEntre: fechaInicio Y: fechaFin	"devuelve total recaudado en reservas por cada socio"		| ventasReservasIntervalo diccionario unaReserva unMonto |		diccionario := Dictionary new. "idSocio -&gt; montoTotalSocio"	ventasReservasIntervalo := OrderedCollection new.		ventasReservasIntervalo := ventas select: [:v | (v fechaVenta between: fechaInicio and: fechaFin) and:[v idReserva notNil]].		ventasReservasIntervalo do: [:v | 		unaReserva := reservas detect: [:r | r id = v idReserva].		unMonto := diccionario at: (unaReserva idSocio)		ifAbsent: [0].		diccionario at: (unaReserva idSocio) put: (unMonto + v monto).		].	^diccionario.				"total := reservasIntervalo inject: 0 into: [:acum :v | acum + v monto]."		"^total."</body>

<body package="GestionCineTeatro" selector="reservas">reservas	^reservas</body>

<body package="GestionCineTeatro" selector="obras:">obras: anObject	obras := anObject</body>

<body package="GestionCineTeatro" selector="agregarPersona:">agregarPersona: unaPersona	personas add: unaPersona.</body>

<body package="GestionCineTeatro" selector="salas:">salas: anObject	salas := anObject</body>

<body package="GestionCineTeatro" selector="funcionesAgotadasHistorico">funcionesAgotadasHistorico	"devuelve colección de funciones agotadas desde hoy"	| func unaSala |	func := OrderedCollection new.		funciones do: [:f | 		unaSala := salas detect: [:s | s id = f idSala].		(f estaAgotadaEn: unaSala)			ifTrue: [func add: f].		].	^func</body>

<body package="GestionCineTeatro" selector="listaObrasActor:">listaObrasActor: nombreActor	^obras select: [:o | o elenco includes: nombreActor].</body>

<body package="GestionCineTeatro" selector="socios">socios	^socios</body>
</methods>

<methods>
<class-id>AdministradorCineTeatro</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	personas := OrderedCollection new.	socios := OrderedCollection new.	obras := OrderedCollection new.	funciones := OrderedCollection new.	salas := OrderedCollection new.	reservas := OrderedCollection new.	ventas := OrderedCollection new.	criticos := OrderedCollection new.	criticas := OrderedCollection new.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Critico class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Critico</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="fechaAlta">fechaAlta	^fechaAlta</body>

<body package="GestionCineTeatro" selector="idPersona">idPersona	^idPersona</body>

<body package="GestionCineTeatro" selector="nombreUsuario">nombreUsuario	^nombreUsuario</body>

<body package="GestionCineTeatro" selector="idPersona:">idPersona: anObject	idPersona := anObject</body>

<body package="GestionCineTeatro" selector="fechaAlta:">fechaAlta: anObject	fechaAlta := anObject</body>

<body package="GestionCineTeatro" selector="nombreUsuario:">nombreUsuario: anObject	nombreUsuario := anObject</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>
</methods>

<methods>
<class-id>Critico</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil. 	idPersona := nil.	nombreUsuario := nil.	fechaAlta := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ObraArtistica class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>ObraArtistica</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="enCartel">enCartel	^enCartel</body>

<body package="GestionCineTeatro" selector="tipo:">tipo: anObject	tipo := anObject</body>

<body package="GestionCineTeatro" selector="titulo">titulo	^titulo</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="tipo">tipo	^tipo</body>

<body package="GestionCineTeatro" selector="enCartel:">enCartel: anObject	enCartel := anObject</body>

<body package="GestionCineTeatro" selector="esObra">esObra	^tipo='obra de teatro'</body>

<body package="GestionCineTeatro" selector="duracion">duracion	"duración en minutos"	^duracion</body>

<body package="GestionCineTeatro" selector="titulo:">titulo: anObject	titulo := anObject</body>

<body package="GestionCineTeatro" selector="director">director	^director</body>

<body package="GestionCineTeatro" selector="clasificacion">clasificacion	^clasificacion</body>

<body package="GestionCineTeatro" selector="descripcion:">descripcion: anObject	descripcion := anObject</body>

<body package="GestionCineTeatro" selector="elenco">elenco	^elenco</body>

<body package="GestionCineTeatro" selector="duracion:">duracion: anObject	"duración en minutos"	duracion := anObject</body>

<body package="GestionCineTeatro" selector="clasificacion:">clasificacion: anObject	clasificacion := anObject</body>

<body package="GestionCineTeatro" selector="descripcion">descripcion	^descripcion</body>

<body package="GestionCineTeatro" selector="elenco:">elenco: anObject	elenco := anObject</body>

<body package="GestionCineTeatro" selector="director:">director: anObject	director := anObject</body>

<body package="GestionCineTeatro" selector="esPelicula">esPelicula	^tipo='pelicula'</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>
</methods>

<methods>
<class-id>ObraArtistica</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	titulo := nil.	descripcion := nil.	duracion := nil.	clasificacion := nil.	elenco := OrderedCollection new.	director := nil.	enCartel := true.	tipo := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Critica class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Critica</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="idPelicula">idPelicula	^idPelicula</body>

<body package="GestionCineTeatro" selector="resenia:">resenia: anObject	resenia := anObject</body>

<body package="GestionCineTeatro" selector="resenia">resenia	^resenia</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="idCritico:">idCritico: anObject	idCritico := anObject</body>

<body package="GestionCineTeatro" selector="puntaje">puntaje	^puntaje</body>

<body package="GestionCineTeatro" selector="idPelicula:">idPelicula: anObject	idPelicula := anObject</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="idCritico">idCritico	^idCritico</body>

<body package="GestionCineTeatro" selector="puntaje:">puntaje: anObject	puntaje := anObject</body>
</methods>

<methods>
<class-id>Critica</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	idCritico := nil.	resenia := nil.	puntaje := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Funcion class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Funcion</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="fecha">fecha	^fecha</body>

<body package="GestionCineTeatro" selector="butacasDisponiblesDe:">butacasDisponiblesDe: unaSala| ocupadas |	ocupadas := self butacasOcupadas.    ^unaSala butacas reject: [:b | ocupadas includes: b]</body>

<body package="GestionCineTeatro" selector="horaInicio:">horaInicio: anObject	horaInicio := anObject</body>

<body package="GestionCineTeatro" selector="fechaHoraInicio:">fechaHoraInicio: anObject	self fecha: anObject asDate.	self horaInicio: anObject asTime.	"fechaHoraInicio := anObject"</body>

<body package="GestionCineTeatro" selector="idObra">idObra	^idObra</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="estaAgotadaEn:">estaAgotadaEn: unaSala	^(self butacasDisponiblesDe: unaSala) isEmpty</body>

<body package="GestionCineTeatro" selector="ventas:">ventas: anObject	ventas := anObject</body>

<body package="GestionCineTeatro" selector="ventas">ventas	^ventas</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="horaInicio">horaInicio	^horaInicio</body>

<body package="GestionCineTeatro" selector="idObra:">idObra: anObject	idObra := anObject</body>

<body package="GestionCineTeatro" selector="idSala">idSala	^idSala</body>

<body package="GestionCineTeatro" selector="agregarVenta:">agregarVenta: unaVenta	ventas add: unaVenta.</body>

<body package="GestionCineTeatro" selector="fechaHoraInicio">fechaHoraInicio	^Timestamp fromDate: self fecha andTime: self horaInicio</body>

<body package="GestionCineTeatro" selector="reservas:">reservas: anObject	reservas := anObject</body>

<body package="GestionCineTeatro" selector="agregarReserva:">agregarReserva: unaReserva	reservas add: unaReserva.</body>

<body package="GestionCineTeatro" selector="idSala:">idSala: anObject	idSala := anObject</body>

<body package="GestionCineTeatro" selector="precioEntrada:">precioEntrada: anObject	precioEntrada := anObject</body>

<body package="GestionCineTeatro" selector="fecha:">fecha: anObject	fecha := anObject</body>

<body package="GestionCineTeatro" selector="reservas">reservas	^reservas</body>

<body package="GestionCineTeatro" selector="butacasOcupadas">butacasOcupadas	| b |	b := Set new.		ventas do: [:v | b addAll: v butacasVendidas].    reservas do: [:r | r estaCancelada ifFalse: [b addAll: r butacasReservadas]].    ^b</body>

<body package="GestionCineTeatro" selector="precioEntrada">precioEntrada	^precioEntrada</body>
</methods>

<methods>
<class-id>Funcion</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	idObra := nil.	idSala := nil.	fecha := nil.	horaInicio := nil.	precioEntrada := nil.	reservas := OrderedCollection new.	ventas := OrderedCollection new.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Sala class</class-id> <category>instance creation</category>

<body package="GestionCineTeatro" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Sala</class-id> <category>accessing</category>

<body package="GestionCineTeatro" selector="capacidadTotal">capacidadTotal	^butacas size.</body>

<body package="GestionCineTeatro" selector="id">id	^id</body>

<body package="GestionCineTeatro" selector="nombre:">nombre: anObject	nombre := anObject</body>

<body package="GestionCineTeatro" selector="permitePeliculas">permitePeliculas	^permitePeliculas</body>

<body package="GestionCineTeatro" selector="admiteObra:listaObras:">admiteObra: idObra listaObras: listaObras	| unaObra |	unaObra := listaObras detect: [:o | o id = idObra].	^(self permitePeliculas and:[unaObra tipo = 'pelicula']) or: [self permiteTeatro and:[unaObra tipo = 'obra de teatro']].</body>

<body package="GestionCineTeatro" selector="id:">id: anObject	id := anObject</body>

<body package="GestionCineTeatro" selector="nombre">nombre	^nombre</body>

<body package="GestionCineTeatro" selector="permitePeliculas:">permitePeliculas: anObject	permitePeliculas := anObject</body>

<body package="GestionCineTeatro" selector="permiteTeatro">permiteTeatro	^permiteTeatro</body>

<body package="GestionCineTeatro" selector="permiteTeatro:">permiteTeatro: anObject	permiteTeatro := anObject</body>

<body package="GestionCineTeatro" selector="butacas:">butacas: anObject	butacas := anObject</body>

<body package="GestionCineTeatro" selector="butacas">butacas	^butacas</body>
</methods>

<methods>
<class-id>Sala</class-id> <category>initialize-release</category>

<body package="GestionCineTeatro" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	id := nil.	nombre := nil.	permitePeliculas := nil.	permiteTeatro := nil.	butacas := OrderedCollection new.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>



</st-source>
