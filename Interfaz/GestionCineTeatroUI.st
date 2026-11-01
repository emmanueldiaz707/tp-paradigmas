<?xml version="1.0"?>

<st-source>
<time-stamp>Interfaz grafica para GestionCineTeatro (paquete aparte, NO modifica el codigo base)</time-stamp>


<component-created>
<name>GestionCineTeatroUI</name> <type>package</type>
</component-created><!-- Package GestionCineTeatroUI* -->

<!--
  COMO USAR:
    1. Cargar primero el paquete base GestionCineTeatro.
    2. File > File In... este archivo (GestionCineTeatroUI.st).
    3. En un Workspace evaluar (Do it):   CineTeatroPrincipal open.

  Todas las ventanas trabajan sobre UNA sola instancia de AdministradorCineTeatro,
  que crea la ventana principal y se pasa a las demas con #admin:.
  La interfaz solo LLAMA a los metodos del administrador; no cambia ninguna clase del modelo.
-->

<component-created>
<name>GestionCineTeatroUI</name> <type>package</type>
</component-created>

<class>
<name>VentanaCineTeatro</name>
<environment>Smalltalk</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>admin </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>CineTeatroPrincipal</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>estado </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaPersonas</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nombre dni fechaNacimiento sexo domicilio email celular listaPersonas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaSocios</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaPersonas listaSocios listaCriticos usuario </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaObras</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>titulo descripcion duracion clasificacion elenco director tipo listaObras listaCriticos listaCriticas criticasMostradas puntaje resenia </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaSalas</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nombre permitePeliculas permiteTeatro filas columnas listaSalas plano </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaFunciones</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaObras listaSalas listaFunciones obrasMostradas fecha hora precio </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaReservasVentas</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaFunciones listaButacas listaSocios listaReservas medioPago plano butacasMostradas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<class>
<name>VentanaConsultas</name>
<environment>Smalltalk</environment>
<super>VentanaCineTeatro</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>fechaDesde fechaHasta cantidad texto listaObras salida </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>GestionCineTeatroUI</package>
</attributes>
</class>

<!-- ============================================================ -->
<!-- VentanaCineTeatro: superclase con utilidades comunes          -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaCineTeatro</class-id> <category>accessing</category>

<body package="GestionCineTeatroUI" selector="admin">admin

	^admin</body>

<body package="GestionCineTeatroUI" selector="admin:">admin: unAdministrador

	admin := unAdministrador</body>
</methods>

<methods>
<class-id>VentanaCineTeatro</class-id> <category>interface opening</category>

<body package="GestionCineTeatroUI" selector="postOpenWith:">postOpenWith: aBuilder

	super postOpenWith: aBuilder.
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	"Cada ventana redefine este metodo para recargar sus listas desde el administrador"
	^self</body>

<body package="GestionCineTeatroUI" selector="abrir:">abrir: unaClaseVentana

	"Abre otra ventana compartiendo el mismo administrador"

	| ventana |
	ventana := unaClaseVentana new.
	ventana admin: admin.
	ventana open.
	^ventana</body>
</methods>

<methods>
<class-id>VentanaCineTeatro</class-id> <category>utilidades</category>

<body package="GestionCineTeatroUI" selector="ejecutar:">ejecutar: unBloque

	"Ejecuta unBloque; si hay un error muestra un aviso en vez de abrir el debugger"

	^unBloque on: Error do: [:e |
		Dialog warn: 'Ocurrio un error: ', e description.
		e return: nil]</body>

<body package="GestionCineTeatroUI" selector="elementoSeleccionado:de:">elementoSeleccionado: unaSelectionInList de: unaColeccion

	"Devuelve el objeto de unaColeccion que corresponde a la fila seleccionada (o nil)"

	| i |
	i := unaSelectionInList selectionIndex.
	(i isNil or: [i &lt; 1 or: [i &gt; unaColeccion size]]) ifTrue: [^nil].
	^unaColeccion at: i</body>

<body package="GestionCineTeatroUI" selector="separarPorComas:">separarPorComas: unString

	"'Ana, Luis' -&gt; OrderedCollection ('Ana' 'Luis')"

	unString isNil ifTrue: [^OrderedCollection new].
	^((unString tokensBasedOn: $,) collect: [:s | s trimSeparators]) asOrderedCollection</body>

<body package="GestionCineTeatroUI" selector="unirConComas:">unirConComas: unaColeccion

	| ws |
	unaColeccion isNil ifTrue: [^''].
	ws := WriteStream on: String new.
	unaColeccion do: [:e | ws nextPutAll: e displayString] separatedBy: [ws nextPutAll: ', '].
	^ws contents</body>

<body package="GestionCineTeatroUI" selector="lineas:">lineas: unaColeccionDeStrings

	| ws |
	unaColeccionDeStrings isEmpty ifTrue: [^'(sin resultados)'].
	ws := WriteStream on: String new.
	unaColeccionDeStrings do: [:linea | ws nextPutAll: linea] separatedBy: [ws cr].
	^ws contents</body>

<body package="GestionCineTeatroUI" selector="siguienteIdDe:">siguienteIdDe: unaColeccion

	^(unaColeccion inject: 0 into: [:max :e | max max: e id]) + 1</body>

<body package="GestionCineTeatroUI" selector="salaDe:">salaDe: unaFuncion

	^admin salas detect: [:s | s id = unaFuncion idSala] ifNone: [nil]</body>

<body package="GestionCineTeatroUI" selector="butacasOcupadasDe:">butacasOcupadasDe: unaFuncion

	"Butacas vendidas o reservadas (sin cancelar) de la funcion, segun las listas del administrador"

	| ocupadas |
	ocupadas := OrderedCollection new.
	admin ventas do: [:v |
		v idFuncion = unaFuncion id ifTrue: [ocupadas addAll: v butacasVendidas]].
	admin reservas do: [:r |
		(r idFuncion = unaFuncion id and: [r estaCancelada not])
			ifTrue: [ocupadas addAll: r butacasReservadas]].
	^ocupadas</body>

<body package="GestionCineTeatroUI" selector="planoDe:ocupadas:">planoDe: unaSala ocupadas: butacasOcupadas

	"Dibuja el plano de la sala usando posicionX / posicionY de cada butaca"

	| ws maxY fila |
	ws := WriteStream on: String new.
	ws nextPutAll: '      PANTALLA / ESCENARIO'; cr; cr.
	maxY := unaSala butacas inject: 0 into: [:m :b | m max: b posicionY].
	1 to: maxY do: [:y |
		fila := (unaSala butacas select: [:b | b posicionY = y])
					asSortedCollection: [:a :b | a posicionX &lt;= b posicionX].
		fila isEmpty ifFalse: [ws nextPutAll: fila first fila; nextPutAll: '  '].
		fila do: [:b |
			ws nextPutAll: ((butacasOcupadas includes: b) ifTrue: ['[X]'] ifFalse: ['[ ]'])].
		ws cr].
	ws cr; nextPutAll: '[ ] libre    [X] ocupada'.
	^ws contents</body>
</methods>

<methods>
<class-id>VentanaCineTeatro</class-id> <category>textos para listas</category>

<body package="GestionCineTeatroUI" selector="nombrePersona:">nombrePersona: idPersona

	| p |
	p := admin personas detect: [:x | x id = idPersona] ifNone: [nil].
	^p isNil
		ifTrue: ['(persona ', idPersona printString, ')']
		ifFalse: [p nombre displayString]</body>

<body package="GestionCineTeatroUI" selector="tituloObra:">tituloObra: idObra

	| o |
	o := admin obras detect: [:x | x id = idObra] ifNone: [nil].
	^o isNil
		ifTrue: ['(obra ', idObra printString, ')']
		ifFalse: [o titulo displayString]</body>

<body package="GestionCineTeatroUI" selector="textoPersona:">textoPersona: p

	^p id printString, ' - ', p nombre displayString, '   DNI: ', p dni displayString</body>

<body package="GestionCineTeatroUI" selector="textoSocio:">textoSocio: s

	^'Socio ', s id printString, ' - ', (self nombrePersona: s idPersona),
		(s esActivo == true ifTrue: ['  (activo)'] ifFalse: ['  (inactivo)'])</body>

<body package="GestionCineTeatroUI" selector="textoCritico:">textoCritico: c

	^c id printString, ' - ', c nombreUsuario displayString, '  (', (self nombrePersona: c idPersona), ')'</body>

<body package="GestionCineTeatroUI" selector="usuarioCritico:">usuarioCritico: idCritico

	| c |
	c := admin criticos detect: [:x | x id = idCritico] ifNone: [nil].
	^c isNil ifTrue: ['(critico ', idCritico printString, ')'] ifFalse: [c nombreUsuario displayString]</body>

<body package="GestionCineTeatroUI" selector="textoObra:">textoObra: o

	^o id printString, ' - ', o titulo displayString, ' (', o tipo displayString, ', ',
		o duracion displayString, ' min)',
		(o enCartel == true ifTrue: ['  [EN CARTEL]'] ifFalse: ['  [fuera de cartel]'])</body>

<body package="GestionCineTeatroUI" selector="textoSala:">textoSala: s

	^s id printString, ' - ', s nombre displayString, '  (', s capacidadTotal printString, ' butacas',
		(s permitePeliculas == true ifTrue: [', cine'] ifFalse: ['']),
		(s permiteTeatro == true ifTrue: [', teatro'] ifFalse: ['']), ')'</body>

<body package="GestionCineTeatroUI" selector="textoFuncion:">textoFuncion: f

	| s |
	s := self salaDe: f.
	^f id printString, ' - ', (self tituloObra: f idObra),
		' | ', (s isNil ifTrue: ['?'] ifFalse: [s nombre displayString]),
		' | ', f fecha displayString, ' ', f horaInicio displayString,
		' | $', f precioEntrada displayString</body>

<body package="GestionCineTeatroUI" selector="textoButaca:">textoButaca: b

	^b fila displayString, '-', b numero printString</body>

<body package="GestionCineTeatroUI" selector="textoReserva:">textoReserva: r

	| estadoReserva |
	estadoReserva := r estaCancelada
		ifTrue: ['CANCELADA']
		ifFalse: [(r estaConfirmadaEn: admin ventas) ifTrue: ['PAGADA'] ifFalse: ['PENDIENTE DE PAGO']].
	^'Reserva ', r id printString, ' - Socio ', r idSocio printString,
		' - Funcion ', r idFuncion printString,
		' - Butacas: ', (self unirConComas: (r butacasReservadas collect: [:b | self textoButaca: b])),
		' - ', estadoReserva</body>
</methods>

<!-- ============================================================ -->
<!-- CineTeatroPrincipal: menu principal                           -->
<!-- ============================================================ -->

<methods>
<class-id>CineTeatroPrincipal class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Gestion Cine / Teatro'
			#bounds: #(#{Graphics.Rectangle} 200 150 630 590 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 12 ) #name: #lblTitulo #label: 'Menu principal' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 40 205 70 ) #name: #btnPersonas #model: #abrirPersonas #label: 'Personas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 75 205 105 ) #name: #btnSocios #model: #abrirSocios #label: 'Socios y criticos' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 110 205 140 ) #name: #btnObras #model: #abrirObras #label: 'Peliculas / Obras' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 145 205 175 ) #name: #btnSalas #model: #abrirSalas #label: 'Salas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 180 205 210 ) #name: #btnFunciones #model: #abrirFunciones #label: 'Funciones' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 215 205 245 ) #name: #btnReservas #model: #abrirReservasVentas #label: 'Reservas y ventas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 250 205 280 ) #name: #btnConsultas #model: #abrirConsultas #label: 'Consultas / listados' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 225 40 410 70 ) #name: #btnPrueba #model: #cargarDatosPrueba #label: 'Cargar datos de prueba' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 225 75 410 105 ) #name: #btnGuardar #model: #guardarDatos #label: 'Guardar en disco' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 225 110 410 140 ) #name: #btnCargar #model: #cargarDatos #label: 'Leer desde disco' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 225 145 410 175 ) #name: #btnEstado #model: #actualizar #label: 'Actualizar resumen' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 295 ) #name: #lblEstado #label: 'Resumen' )
				#(#{UI.TextEditorSpec} #layout: #(#{Graphics.Rectangle} 20 318 410 425 ) #name: #txtEstado #model: #estado #isReadOnly: true )
				) ) )</body>
</methods>

<methods>
<class-id>CineTeatroPrincipal</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	admin := AdministradorCineTeatro new.
	estado := String new asValue</body>
</methods>

<methods>
<class-id>CineTeatroPrincipal</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="estado">estado

	^estado</body>
</methods>

<methods>
<class-id>CineTeatroPrincipal</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="abrirPersonas">abrirPersonas

	self abrir: VentanaPersonas</body>

<body package="GestionCineTeatroUI" selector="abrirSocios">abrirSocios

	self abrir: VentanaSocios</body>

<body package="GestionCineTeatroUI" selector="abrirObras">abrirObras

	self abrir: VentanaObras</body>

<body package="GestionCineTeatroUI" selector="abrirSalas">abrirSalas

	self abrir: VentanaSalas</body>

<body package="GestionCineTeatroUI" selector="abrirFunciones">abrirFunciones

	self abrir: VentanaFunciones</body>

<body package="GestionCineTeatroUI" selector="abrirReservasVentas">abrirReservasVentas

	self abrir: VentanaReservasVentas</body>

<body package="GestionCineTeatroUI" selector="abrirConsultas">abrirConsultas

	self abrir: VentanaConsultas</body>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	| ws |
	ws := WriteStream on: String new.
	ws nextPutAll: 'Personas: ', admin personas size printString; cr.
	ws nextPutAll: 'Socios: ', admin socios size printString, '    Criticos: ', admin criticos size printString; cr.
	ws nextPutAll: 'Peliculas/obras: ', admin obras size printString, '    Criticas: ', admin criticas size printString; cr.
	ws nextPutAll: 'Salas: ', admin salas size printString, '    Funciones: ', admin funciones size printString; cr.
	ws nextPutAll: 'Reservas: ', admin reservas size printString, '    Ventas: ', admin ventas size printString.
	estado value: ws contents</body>

<body package="GestionCineTeatroUI" selector="archivoDatos">archivoDatos

	^'cineteatro.bos' asFilename</body>

<body package="GestionCineTeatroUI" selector="guardarDatos">guardarDatos

	"Guarda TODO el administrador (con todas sus listas) en disco usando BOSS"

	self ejecutar: [
		| bos |
		bos := BinaryObjectStorage onNew: self archivoDatos writeStream.
		[bos nextPut: admin] ensure: [bos close].
		Dialog warn: 'Datos guardados en ', self archivoDatos asString]</body>

<body package="GestionCineTeatroUI" selector="cargarDatos">cargarDatos

	"Lee el administrador guardado. Cerrar las otras ventanas antes de cargar."

	self archivoDatos exists ifFalse: [^Dialog warn: 'Todavia no existe ', self archivoDatos asString].
	self ejecutar: [
		| bos |
		bos := BinaryObjectStorage onOld: self archivoDatos readStream.
		[admin := bos next] ensure: [bos close].
		self actualizar.
		Dialog warn: 'Datos cargados desde disco']</body>

<body package="GestionCineTeatroUI" selector="cargarDatosPrueba">cargarDatosPrueba

	"Carga datos de ejemplo usando SOLO los metodos del AdministradorCineTeatro"

	self ejecutar: [
		#(	#('Juan Perez' 30111222 'M' 'San Martin 123')
			#('Ana Gomez' 28999888 'F' 'Belgrano 456')
			#('Luis Diaz' 35123456 'M' 'Mitre 789')
			#('Sofia Ruiz' 40222333 'F' 'Rivadavia 1010') ) do: [:datos |
				| p |
				p := Persona new.
				p id: (self siguienteIdDe: admin personas);
					nombre: (datos at: 1);
					dni: (datos at: 2);
					sexo: (datos at: 3);
					domicilio: (datos at: 4);
					fechaNacimiento: (Date today subtractDays: 12000);
					email: 'contacto@mail.com';
					celular: '3415555555'.
				admin agregarPersona: p].
		admin agregarSocio: 1.
		admin agregarSocio: 3.
		admin agregarCritico: 2 NombreUsuario: 'ana_critica'.
		admin agregarSalaNombre: 'Sala 1' permitePeliculas: true permteTeatro: false filasButacas: 5 columnasButacas: 8.
		admin agregarSalaNombre: 'Sala Teatro' permitePeliculas: false permteTeatro: true filasButacas: 4 columnasButacas: 6.
		admin agregarPeliculaTitulo: 'El Padrino' descripcion: 'Drama' duracion: 175 clasificacion: '+16'
			elenco: #('Marlon Brando' 'Al Pacino') asOrderedCollection
			director: #('Francis Ford Coppola') asOrderedCollection.
		admin agregarObraTeatroTitulo: 'Esperando la carroza' descripcion: 'Comedia' duracion: 90 clasificacion: 'ATP'
			elenco: #('China Zorrilla') asOrderedCollection
			director: #('Alejandro Doria') asOrderedCollection.
		admin agregarFuncionObra: 1 sala: 1 fecha: (Date today addDays: 2) horaInicio: (Time fromSeconds: 20 * 3600) precioEntrada: 5000.
		admin agregarFuncionObra: 2 sala: 2 fecha: (Date today addDays: 3) horaInicio: (Time fromSeconds: 21 * 3600) precioEntrada: 7000.
		admin nuevaCriticaPara: 1 De: 1 resenia: 'Una obra maestra' puntaje: 10.
		self actualizar.
		Dialog warn: 'Datos de prueba cargados'].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaPersonas                                               -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaPersonas class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Personas'
			#bounds: #(#{Graphics.Rectangle} 120 120 760 590 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 20 ) #name: #lbl1 #label: 'Nombre' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 18 300 40 ) #name: #fNombre #model: #nombre )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 50 ) #name: #lbl2 #label: 'DNI' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 48 300 70 ) #name: #fDni #model: #dni #type: #number )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 80 ) #name: #lbl3 #label: 'Fecha nac.' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 78 300 100 ) #name: #fFecha #model: #fechaNacimiento #type: #date )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 110 ) #name: #lbl4 #label: 'Sexo' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 108 300 130 ) #name: #fSexo #model: #sexo )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 140 ) #name: #lbl5 #label: 'Domicilio' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 138 300 160 ) #name: #fDomicilio #model: #domicilio )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 170 ) #name: #lbl6 #label: 'Email' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 168 300 190 ) #name: #fEmail #model: #email )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 200 ) #name: #lbl7 #label: 'Celular' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 110 198 300 220 ) #name: #fCelular #model: #celular )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 240 110 268 ) #name: #btnAgregar #model: #agregar #label: 'Agregar' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 115 240 205 268 ) #name: #btnModificar #model: #modificar #label: 'Modificar' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 210 240 300 268 ) #name: #btnEliminar #model: #eliminar #label: 'Eliminar' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 275 110 303 ) #name: #btnLimpiar #model: #limpiar #label: 'Limpiar' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 320 8 ) #name: #lblLista #label: 'Personas registradas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 320 30 620 450 ) #name: #lstPersonas #model: #listaPersonas )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaPersonas</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	nombre := String new asValue.
	dni := nil asValue.
	fechaNacimiento := nil asValue.
	sexo := String new asValue.
	domicilio := String new asValue.
	email := String new asValue.
	celular := String new asValue.
	listaPersonas := SelectionInList new.
	listaPersonas selectionIndexHolder onChangeSend: #personaSeleccionada to: self</body>
</methods>

<methods>
<class-id>VentanaPersonas</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="nombre">nombre
	^nombre</body>

<body package="GestionCineTeatroUI" selector="dni">dni
	^dni</body>

<body package="GestionCineTeatroUI" selector="fechaNacimiento">fechaNacimiento
	^fechaNacimiento</body>

<body package="GestionCineTeatroUI" selector="sexo">sexo
	^sexo</body>

<body package="GestionCineTeatroUI" selector="domicilio">domicilio
	^domicilio</body>

<body package="GestionCineTeatroUI" selector="email">email
	^email</body>

<body package="GestionCineTeatroUI" selector="celular">celular
	^celular</body>

<body package="GestionCineTeatroUI" selector="listaPersonas">listaPersonas
	^listaPersonas</body>
</methods>

<methods>
<class-id>VentanaPersonas</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	listaPersonas list: (admin personas collect: [:p | self textoPersona: p])</body>

<body package="GestionCineTeatroUI" selector="personaActual">personaActual

	^self elementoSeleccionado: listaPersonas de: admin personas</body>

<body package="GestionCineTeatroUI" selector="personaSeleccionada">personaSeleccionada

	"Al hacer click en la lista se copian los datos a los campos"

	| p |
	p := self personaActual.
	p isNil ifTrue: [^self].
	nombre value: p nombre.
	dni value: p dni.
	fechaNacimiento value: p fechaNacimiento.
	sexo value: p sexo.
	domicilio value: p domicilio.
	email value: p email.
	celular value: p celular</body>

<body package="GestionCineTeatroUI" selector="cargarCamposEn:">cargarCamposEn: unaPersona

	unaPersona
		nombre: nombre value;
		dni: dni value;
		fechaNacimiento: fechaNacimiento value;
		sexo: sexo value;
		domicilio: domicilio value;
		email: email value;
		celular: celular value</body>

<body package="GestionCineTeatroUI" selector="agregar">agregar

	| p |
	(nombre value isNil or: [nombre value isEmpty]) ifTrue: [^Dialog warn: 'Ingrese el nombre'].
	self ejecutar: [
		p := Persona new.
		p id: (self siguienteIdDe: admin personas).
		self cargarCamposEn: p.
		admin agregarPersona: p].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="modificar">modificar

	| seleccionada p |
	seleccionada := self personaActual.
	seleccionada isNil ifTrue: [^Dialog warn: 'Seleccione una persona de la lista'].
	self ejecutar: [
		p := Persona new.
		p id: seleccionada id.
		self cargarCamposEn: p.
		admin modificarPersona: p].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="eliminar">eliminar

	| p |
	p := self personaActual.
	p isNil ifTrue: [^Dialog warn: 'Seleccione una persona de la lista'].
	(Dialog confirm: 'Eliminar a ', p nombre displayString, '?') ifFalse: [^self].
	self ejecutar: [admin eliminarPersona: p].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="limpiar">limpiar

	listaPersonas selectionIndex: 0.
	#(#nombre #sexo #domicilio #email #celular) do: [:aspecto | (self perform: aspecto) value: String new].
	dni value: nil.
	fechaNacimiento value: nil</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaSocios (socios y criticos)                             -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaSocios class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Socios y criticos'
			#bounds: #(#{Graphics.Rectangle} 140 140 900 620 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 8 ) #name: #lbl1 #label: 'Personas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 30 360 230 ) #name: #lstPersonas #model: #listaPersonas )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 240 220 268 ) #name: #btnSocio #model: #darAltaSocio #label: 'Dar de alta como socio' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 285 ) #name: #lbl2 #label: 'Usuario critico' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 283 360 305 ) #name: #fUsuario #model: #usuario )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 315 220 343 ) #name: #btnCritico #model: #registrarCritico #label: 'Registrar como critico' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 380 8 ) #name: #lbl3 #label: 'Socios' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 380 30 740 200 ) #name: #lstSocios #model: #listaSocios )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 380 208 500 236 ) #name: #btnActivar #model: #activarSocio #label: 'Activar' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 505 208 625 236 ) #name: #btnDesactivar #model: #desactivarSocio #label: 'Desactivar' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 380 250 ) #name: #lbl4 #label: 'Criticos' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 380 272 740 420 ) #name: #lstCriticos #model: #listaCriticos )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 380 428 555 456 ) #name: #btnCambiar #model: #cambiarUsuario #label: 'Cambiar usuario' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 565 428 740 456 ) #name: #btnEliminar #model: #eliminarCritico #label: 'Eliminar critico' )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaSocios</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	listaPersonas := SelectionInList new.
	listaSocios := SelectionInList new.
	listaCriticos := SelectionInList new.
	usuario := String new asValue</body>
</methods>

<methods>
<class-id>VentanaSocios</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="listaPersonas">listaPersonas
	^listaPersonas</body>

<body package="GestionCineTeatroUI" selector="listaSocios">listaSocios
	^listaSocios</body>

<body package="GestionCineTeatroUI" selector="listaCriticos">listaCriticos
	^listaCriticos</body>

<body package="GestionCineTeatroUI" selector="usuario">usuario
	^usuario</body>
</methods>

<methods>
<class-id>VentanaSocios</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	listaPersonas list: (admin personas collect: [:p | self textoPersona: p]).
	listaSocios list: (admin socios collect: [:s | self textoSocio: s]).
	listaCriticos list: (admin criticos collect: [:c | self textoCritico: c])</body>

<body package="GestionCineTeatroUI" selector="personaActual">personaActual
	^self elementoSeleccionado: listaPersonas de: admin personas</body>

<body package="GestionCineTeatroUI" selector="socioActual">socioActual
	^self elementoSeleccionado: listaSocios de: admin socios</body>

<body package="GestionCineTeatroUI" selector="criticoActual">criticoActual
	^self elementoSeleccionado: listaCriticos de: admin criticos</body>

<body package="GestionCineTeatroUI" selector="darAltaSocio">darAltaSocio

	| p |
	p := self personaActual.
	p isNil ifTrue: [^Dialog warn: 'Seleccione una persona'].
	(admin socios anySatisfy: [:s | s idPersona = p id])
		ifTrue: [^Dialog warn: 'Esa persona ya es socio'].
	self ejecutar: [admin agregarSocio: p id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="activarSocio">activarSocio

	| s |
	s := self socioActual.
	s isNil ifTrue: [^Dialog warn: 'Seleccione un socio'].
	self ejecutar: [admin activarSocio: s id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="desactivarSocio">desactivarSocio

	| s |
	s := self socioActual.
	s isNil ifTrue: [^Dialog warn: 'Seleccione un socio'].
	self ejecutar: [admin desactivarSocio: s id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="registrarCritico">registrarCritico

	| p |
	p := self personaActual.
	p isNil ifTrue: [^Dialog warn: 'Seleccione una persona'].
	usuario value isEmpty ifTrue: [^Dialog warn: 'Ingrese un nombre de usuario'].
	self ejecutar: [admin agregarCritico: p id NombreUsuario: usuario value].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="cambiarUsuario">cambiarUsuario

	| c |
	c := self criticoActual.
	c isNil ifTrue: [^Dialog warn: 'Seleccione un critico'].
	usuario value isEmpty ifTrue: [^Dialog warn: 'Ingrese el nuevo nombre de usuario'].
	self ejecutar: [admin cambiarUsuarioCritico: c id NuevoNombre: usuario value].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="eliminarCritico">eliminarCritico

	| c |
	c := self criticoActual.
	c isNil ifTrue: [^Dialog warn: 'Seleccione un critico'].
	self ejecutar: [admin eliminarCritico: c id].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaObras (peliculas / obras de teatro y criticas)         -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaObras class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Peliculas y obras de teatro'
			#bounds: #(#{Graphics.Rectangle} 100 100 920 660 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 20 ) #name: #lbl1 #label: 'Titulo' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 18 380 40 ) #name: #fTitulo #model: #titulo )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 50 ) #name: #lbl2 #label: 'Descripcion' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 48 380 70 ) #name: #fDesc #model: #descripcion )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 80 ) #name: #lbl3 #label: 'Duracion (min)' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 78 200 100 ) #name: #fDuracion #model: #duracion #type: #number )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 110 ) #name: #lbl4 #label: 'Clasificacion' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 108 200 130 ) #name: #fClasif #model: #clasificacion )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 140 ) #name: #lbl5 #label: 'Elenco (a, b)' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 138 380 160 ) #name: #fElenco #model: #elenco )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 170 ) #name: #lbl6 #label: 'Director(es)' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 168 380 190 ) #name: #fDirector #model: #director )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 200 ) #name: #lbl7 #label: 'Tipo' )
				#(#{UI.RadioButtonSpec} #layout: #(#{Core.Point} 130 198 ) #name: #rbPelicula #model: #tipo #label: 'Pelicula' #select: #pelicula )
				#(#{UI.RadioButtonSpec} #layout: #(#{Core.Point} 230 198 ) #name: #rbTeatro #model: #tipo #label: 'Obra de teatro' #select: #teatro )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 235 130 263 ) #name: #btnAgregar #model: #agregar #label: 'Agregar' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 135 235 255 263 ) #name: #btnCartel #model: #ponerEnCartel #label: 'Poner en cartel' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 260 235 380 263 ) #name: #btnSacar #model: #sacarDeCartel #label: 'Sacar de cartel' )
				#(#{UI.GroupBoxSpec} #layout: #(#{Graphics.Rectangle} 10 275 390 540 ) #name: #grpCriticas #label: 'Nueva critica (solo peliculas)' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 298 ) #name: #lbl8 #label: 'Critico' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 318 380 400 ) #name: #lstCriticos #model: #listaCriticos )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 412 ) #name: #lbl9 #label: 'Puntaje (1-10)' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 410 200 432 ) #name: #fPuntaje #model: #puntaje #type: #number )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 442 ) #name: #lbl10 #label: 'Resenia' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 440 380 462 ) #name: #fResenia #model: #resenia )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 475 195 503 ) #name: #btnCritica #model: #agregarCritica #label: 'Agregar critica' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 205 475 380 503 ) #name: #btnBorrarCritica #model: #eliminarCritica #label: 'Eliminar critica' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 400 8 ) #name: #lbl11 #label: 'Peliculas y obras' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 400 30 800 300 ) #name: #lstObras #model: #listaObras )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 400 310 ) #name: #lbl12 #label: 'Criticas de la seleccionada' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 400 332 800 540 ) #name: #lstCriticas #model: #listaCriticas )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaObras</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	titulo := String new asValue.
	descripcion := String new asValue.
	duracion := 90 asValue.
	clasificacion := 'ATP' asValue.
	elenco := String new asValue.
	director := String new asValue.
	tipo := #pelicula asValue.
	puntaje := 8 asValue.
	resenia := String new asValue.
	criticasMostradas := OrderedCollection new.
	listaObras := SelectionInList new.
	listaCriticos := SelectionInList new.
	listaCriticas := SelectionInList new.
	listaObras selectionIndexHolder onChangeSend: #obraSeleccionada to: self</body>
</methods>

<methods>
<class-id>VentanaObras</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="titulo">titulo
	^titulo</body>

<body package="GestionCineTeatroUI" selector="descripcion">descripcion
	^descripcion</body>

<body package="GestionCineTeatroUI" selector="duracion">duracion
	^duracion</body>

<body package="GestionCineTeatroUI" selector="clasificacion">clasificacion
	^clasificacion</body>

<body package="GestionCineTeatroUI" selector="elenco">elenco
	^elenco</body>

<body package="GestionCineTeatroUI" selector="director">director
	^director</body>

<body package="GestionCineTeatroUI" selector="tipo">tipo
	^tipo</body>

<body package="GestionCineTeatroUI" selector="puntaje">puntaje
	^puntaje</body>

<body package="GestionCineTeatroUI" selector="resenia">resenia
	^resenia</body>

<body package="GestionCineTeatroUI" selector="listaObras">listaObras
	^listaObras</body>

<body package="GestionCineTeatroUI" selector="listaCriticos">listaCriticos
	^listaCriticos</body>

<body package="GestionCineTeatroUI" selector="listaCriticas">listaCriticas
	^listaCriticas</body>
</methods>

<methods>
<class-id>VentanaObras</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	| i |
	i := listaObras selectionIndex.
	listaObras list: (admin obras collect: [:o | self textoObra: o]).
	listaCriticos list: (admin criticos collect: [:c | self textoCritico: c]).
	(i notNil and: [i between: 1 and: admin obras size]) ifTrue: [listaObras selectionIndex: i].
	self obraSeleccionada</body>

<body package="GestionCineTeatroUI" selector="obraActual">obraActual
	^self elementoSeleccionado: listaObras de: admin obras</body>

<body package="GestionCineTeatroUI" selector="obraSeleccionada">obraSeleccionada

	"Muestra las criticas de la obra elegida"

	| o |
	o := self obraActual.
	criticasMostradas := o isNil
		ifTrue: [OrderedCollection new]
		ifFalse: [admin criticas select: [:c | c idPelicula = o id]].
	listaCriticas list: (criticasMostradas collect: [:c |
		c puntaje printString, '/10 - ', (self usuarioCritico: c idCritico), ': ', c resenia displayString])</body>

<body package="GestionCineTeatroUI" selector="agregar">agregar

	| cantidadAntes |
	titulo value isEmpty ifTrue: [^Dialog warn: 'Ingrese el titulo'].
	cantidadAntes := admin obras size.
	self ejecutar: [
		tipo value = #pelicula
			ifTrue: [admin agregarPeliculaTitulo: titulo value
						descripcion: descripcion value
						duracion: duracion value
						clasificacion: clasificacion value
						elenco: (self separarPorComas: elenco value)
						director: (self separarPorComas: director value)]
			ifFalse: [admin agregarObraTeatroTitulo: titulo value
						descripcion: descripcion value
						duracion: duracion value
						clasificacion: clasificacion value
						elenco: (self separarPorComas: elenco value)
						director: (self separarPorComas: director value)]].
	admin obras size = cantidadAntes
		ifTrue: [Dialog warn: 'Atencion: el administrador no agrego la obra a su lista "obras".'].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="ponerEnCartel">ponerEnCartel

	| o |
	o := self obraActual.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una obra'].
	self ejecutar: [admin ponerEnCartelera: o id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="sacarDeCartel">sacarDeCartel

	| o |
	o := self obraActual.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una obra'].
	self ejecutar: [admin sacarDeCartelera: o id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="agregarCritica">agregarCritica

	| o c |
	o := self obraActual.
	c := self elementoSeleccionado: listaCriticos de: admin criticos.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una pelicula de la lista'].
	o esPelicula ifFalse: [^Dialog warn: 'Solo las peliculas pueden recibir criticas'].
	c isNil ifTrue: [^Dialog warn: 'Seleccione el critico'].
	(puntaje value isNil or: [(puntaje value between: 1 and: 10) not])
		ifTrue: [^Dialog warn: 'El puntaje debe estar entre 1 y 10'].
	self ejecutar: [admin nuevaCriticaPara: o id De: c id resenia: resenia value puntaje: puntaje value].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="eliminarCritica">eliminarCritica

	| critica |
	critica := self elementoSeleccionado: listaCriticas de: criticasMostradas.
	critica isNil ifTrue: [^Dialog warn: 'Seleccione una critica'].
	self ejecutar: [admin eliminarCritica: critica id].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaSalas                                                  -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaSalas class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Salas'
			#bounds: #(#{Graphics.Rectangle} 120 120 840 600 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 20 ) #name: #lbl1 #label: 'Nombre' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 120 18 300 40 ) #name: #fNombre #model: #nombre )
				#(#{UI.CheckBoxSpec} #layout: #(#{Core.Point} 20 50 ) #name: #chkPeliculas #model: #permitePeliculas #label: 'Permite peliculas' )
				#(#{UI.CheckBoxSpec} #layout: #(#{Core.Point} 20 75 ) #name: #chkTeatro #model: #permiteTeatro #label: 'Permite teatro' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 107 ) #name: #lbl2 #label: 'Filas' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 120 105 180 127 ) #name: #fFilas #model: #filas #type: #number )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 137 ) #name: #lbl3 #label: 'Butacas x fila' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 120 135 180 157 ) #name: #fColumnas #model: #columnas #type: #number )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 172 155 200 ) #name: #btnAgregar #model: #agregar #label: 'Agregar sala' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 165 172 300 200 ) #name: #btnEliminar #model: #eliminar #label: 'Eliminar sala' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 212 ) #name: #lbl4 #label: 'Salas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 234 300 460 ) #name: #lstSalas #model: #listaSalas )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 320 8 ) #name: #lbl5 #label: 'Plano de la sala seleccionada' )
				#(#{UI.TextEditorSpec} #layout: #(#{Graphics.Rectangle} 320 30 700 460 ) #name: #txtPlano #model: #plano #isReadOnly: true #style: #fixed )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaSalas</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	nombre := String new asValue.
	permitePeliculas := true asValue.
	permiteTeatro := false asValue.
	filas := 5 asValue.
	columnas := 8 asValue.
	plano := String new asValue.
	listaSalas := SelectionInList new.
	listaSalas selectionIndexHolder onChangeSend: #salaSeleccionada to: self</body>
</methods>

<methods>
<class-id>VentanaSalas</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="nombre">nombre
	^nombre</body>

<body package="GestionCineTeatroUI" selector="permitePeliculas">permitePeliculas
	^permitePeliculas</body>

<body package="GestionCineTeatroUI" selector="permiteTeatro">permiteTeatro
	^permiteTeatro</body>

<body package="GestionCineTeatroUI" selector="filas">filas
	^filas</body>

<body package="GestionCineTeatroUI" selector="columnas">columnas
	^columnas</body>

<body package="GestionCineTeatroUI" selector="listaSalas">listaSalas
	^listaSalas</body>

<body package="GestionCineTeatroUI" selector="plano">plano
	^plano</body>
</methods>

<methods>
<class-id>VentanaSalas</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	listaSalas list: (admin salas collect: [:s | self textoSala: s]).
	plano value: String new</body>

<body package="GestionCineTeatroUI" selector="salaActual">salaActual
	^self elementoSeleccionado: listaSalas de: admin salas</body>

<body package="GestionCineTeatroUI" selector="salaSeleccionada">salaSeleccionada

	| s |
	s := self salaActual.
	plano value: (s isNil ifTrue: [String new] ifFalse: [self planoDe: s ocupadas: #()])</body>

<body package="GestionCineTeatroUI" selector="agregar">agregar

	nombre value isEmpty ifTrue: [^Dialog warn: 'Ingrese el nombre de la sala'].
	(permitePeliculas value or: [permiteTeatro value])
		ifFalse: [^Dialog warn: 'La sala debe permitir peliculas, teatro o ambos'].
	(filas value isNil or: [filas value &lt; 1 or: [filas value &gt; 26]])
		ifTrue: [^Dialog warn: 'Filas: entre 1 y 26 (una letra por fila)'].
	(columnas value isNil or: [columnas value &lt; 1])
		ifTrue: [^Dialog warn: 'Ingrese la cantidad de butacas por fila'].
	self ejecutar: [
		admin agregarSalaNombre: nombre value
			permitePeliculas: permitePeliculas value
			permteTeatro: permiteTeatro value
			filasButacas: filas value
			columnasButacas: columnas value].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="eliminar">eliminar

	| s |
	s := self salaActual.
	s isNil ifTrue: [^Dialog warn: 'Seleccione una sala'].
	(admin funciones anySatisfy: [:f | f idSala = s id])
		ifTrue: [^Dialog warn: 'No se puede eliminar: la sala tiene funciones programadas'].
	self ejecutar: [admin eliminarSala: s id].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaFunciones                                              -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaFunciones class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Funciones'
			#bounds: #(#{Graphics.Rectangle} 100 100 920 660 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 8 ) #name: #lbl1 #label: 'Obras EN CARTEL' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 30 300 200 ) #name: #lstObras #model: #listaObras )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 320 8 ) #name: #lbl2 #label: 'Salas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 320 30 600 200 ) #name: #lstSalas #model: #listaSalas )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 620 32 ) #name: #lbl3 #label: 'Fecha' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 680 30 800 52 ) #name: #fFecha #model: #fecha #type: #date )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 620 62 ) #name: #lbl4 #label: 'Hora' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 680 60 800 82 ) #name: #fHora #model: #hora #type: #time )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 620 92 ) #name: #lbl5 #label: 'Precio $' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 680 90 800 112 ) #name: #fPrecio #model: #precio #type: #number )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 620 128 800 156 ) #name: #btnVerificar #model: #verificarSala #label: 'Verificar sala libre' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 620 162 800 190 ) #name: #btnAgregar #model: #agregarFuncion #label: 'Agregar funcion' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 215 ) #name: #lbl6 #label: 'Funciones programadas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 237 800 500 ) #name: #lstFunciones #model: #listaFunciones )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 510 200 538 ) #name: #btnEliminar #model: #eliminarFuncion #label: 'Eliminar funcion' )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaFunciones</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	listaObras := SelectionInList new.
	listaSalas := SelectionInList new.
	listaFunciones := SelectionInList new.
	obrasMostradas := OrderedCollection new.
	fecha := Date today asValue.
	hora := (Time fromSeconds: 20 * 3600) asValue.
	precio := 5000 asValue</body>
</methods>

<methods>
<class-id>VentanaFunciones</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="listaObras">listaObras
	^listaObras</body>

<body package="GestionCineTeatroUI" selector="listaSalas">listaSalas
	^listaSalas</body>

<body package="GestionCineTeatroUI" selector="listaFunciones">listaFunciones
	^listaFunciones</body>

<body package="GestionCineTeatroUI" selector="fecha">fecha
	^fecha</body>

<body package="GestionCineTeatroUI" selector="hora">hora
	^hora</body>

<body package="GestionCineTeatroUI" selector="precio">precio
	^precio</body>
</methods>

<methods>
<class-id>VentanaFunciones</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	"Solo se pueden programar funciones de obras en cartel"
	obrasMostradas := admin obras select: [:o | o enCartel == true].
	listaObras list: (obrasMostradas collect: [:o | self textoObra: o]).
	listaSalas list: (admin salas collect: [:s | self textoSala: s]).
	listaFunciones list: (admin funciones collect: [:f | self textoFuncion: f])</body>

<body package="GestionCineTeatroUI" selector="obraActual">obraActual
	^self elementoSeleccionado: listaObras de: obrasMostradas</body>

<body package="GestionCineTeatroUI" selector="salaActual">salaActual
	^self elementoSeleccionado: listaSalas de: admin salas</body>

<body package="GestionCineTeatroUI" selector="salaLibrePara:en:">salaLibrePara: unaObra en: unaSala

	| inicio fin |
	inicio := Timestamp fromDate: fecha value andTime: hora value.
	fin := inicio addSeconds: unaObra duracion * 60.
	^admin salaLibre: unaSala id fechaHoraInicio: inicio fechaHoraFinal: fin</body>

<body package="GestionCineTeatroUI" selector="verificarSala">verificarSala

	| o s libre |
	o := self obraActual.
	s := self salaActual.
	(o isNil or: [s isNil]) ifTrue: [^Dialog warn: 'Seleccione una obra y una sala'].
	libre := self ejecutar: [self salaLibrePara: o en: s].
	libre isNil ifTrue: [^self].
	libre
		ifTrue: [Dialog warn: 'La sala esta LIBRE en ese horario']
		ifFalse: [Dialog warn: 'La sala esta OCUPADA en ese horario']</body>

<body package="GestionCineTeatroUI" selector="agregarFuncion">agregarFuncion

	| o s |
	o := self obraActual.
	s := self salaActual.
	(o isNil or: [s isNil]) ifTrue: [^Dialog warn: 'Seleccione una obra y una sala'].
	(s admiteObra: o id listaObras: admin obras)
		ifFalse: [^Dialog warn: 'Esa sala no admite este tipo de obra'].
	(self ejecutar: [self salaLibrePara: o en: s]) == true
		ifFalse: [^Dialog warn: 'La sala no esta libre en ese horario'].
	self ejecutar: [
		admin agregarFuncionObra: o id
			sala: s id
			fecha: fecha value
			horaInicio: hora value
			precioEntrada: precio value].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="eliminarFuncion">eliminarFuncion

	| f |
	f := self elementoSeleccionado: listaFunciones de: admin funciones.
	f isNil ifTrue: [^Dialog warn: 'Seleccione una funcion'].
	self ejecutar: [admin eliminarFuncion: f id].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaReservasVentas                                         -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaReservasVentas class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Reservas y ventas de entradas'
			#bounds: #(#{Graphics.Rectangle} 60 60 960 660 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 8 ) #name: #lbl1 #label: 'Funciones' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 30 440 170 ) #name: #lstFunciones #model: #listaFunciones )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 180 ) #name: #lbl2 #label: 'Butacas libres (Ctrl+click)' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 202 170 560 ) #name: #lstButacas #model: #listaButacas #multipleSelections: true #useModifierKeys: true )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 180 180 ) #name: #lbl3 #label: 'Plano' )
				#(#{UI.TextEditorSpec} #layout: #(#{Graphics.Rectangle} 180 202 440 560 ) #name: #txtPlano #model: #plano #isReadOnly: true #style: #fixed )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 460 8 ) #name: #lbl4 #label: 'Socios' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 460 30 880 170 ) #name: #lstSocios #model: #listaSocios )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 460 180 ) #name: #lbl5 #label: 'Medio de pago' )
				#(#{UI.RadioButtonSpec} #layout: #(#{Core.Point} 460 202 ) #name: #rbEfectivo #model: #medioPago #label: 'Efectivo' #select: #efectivo )
				#(#{UI.RadioButtonSpec} #layout: #(#{Core.Point} 560 202 ) #name: #rbTarjeta #model: #medioPago #label: 'Tarjeta' #select: #tarjeta )
				#(#{UI.RadioButtonSpec} #layout: #(#{Core.Point} 660 202 ) #name: #rbTransf #model: #medioPago #label: 'Transferencia' #select: #transferencia )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 460 235 665 263 ) #name: #btnReservar #model: #reservar #label: 'Reservar (socio)' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 675 235 880 263 ) #name: #btnVenderSocio #model: #venderSocio #label: 'Vender a socio (-20%)' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 460 268 665 296 ) #name: #btnVenderGeneral #model: #venderGeneral #label: 'Vender (publico general)' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 460 310 ) #name: #lbl6 #label: 'Reservas' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 460 332 880 520 ) #name: #lstReservas #model: #listaReservas )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 460 530 665 558 ) #name: #btnCancelar #model: #cancelarReserva #label: 'Cancelar reserva' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 675 530 880 558 ) #name: #btnPagar #model: #pagarReserva #label: 'Pagar reserva' )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaReservasVentas</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	listaFunciones := SelectionInList new.
	listaButacas := MultiSelectionInList new.
	listaSocios := SelectionInList new.
	listaReservas := SelectionInList new.
	medioPago := #efectivo asValue.
	plano := String new asValue.
	butacasMostradas := OrderedCollection new.
	listaFunciones selectionIndexHolder onChangeSend: #funcionSeleccionada to: self</body>
</methods>

<methods>
<class-id>VentanaReservasVentas</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="listaFunciones">listaFunciones
	^listaFunciones</body>

<body package="GestionCineTeatroUI" selector="listaButacas">listaButacas
	^listaButacas</body>

<body package="GestionCineTeatroUI" selector="listaSocios">listaSocios
	^listaSocios</body>

<body package="GestionCineTeatroUI" selector="listaReservas">listaReservas
	^listaReservas</body>

<body package="GestionCineTeatroUI" selector="medioPago">medioPago
	^medioPago</body>

<body package="GestionCineTeatroUI" selector="plano">plano
	^plano</body>
</methods>

<methods>
<class-id>VentanaReservasVentas</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	| i |
	i := listaFunciones selectionIndex.
	listaFunciones list: (admin funciones collect: [:f | self textoFuncion: f]).
	listaSocios list: (admin socios collect: [:s | self textoSocio: s]).
	listaReservas list: (admin reservas collect: [:r | self textoReserva: r]).
	(i notNil and: [i between: 1 and: admin funciones size]) ifTrue: [listaFunciones selectionIndex: i].
	self funcionSeleccionada</body>

<body package="GestionCineTeatroUI" selector="funcionActual">funcionActual
	^self elementoSeleccionado: listaFunciones de: admin funciones</body>

<body package="GestionCineTeatroUI" selector="socioActual">socioActual
	^self elementoSeleccionado: listaSocios de: admin socios</body>

<body package="GestionCineTeatroUI" selector="reservaActual">reservaActual
	^self elementoSeleccionado: listaReservas de: admin reservas</body>

<body package="GestionCineTeatroUI" selector="funcionSeleccionada">funcionSeleccionada

	"Muestra las butacas libres y el plano de la funcion elegida"

	| f sala ocupadas |
	f := self funcionActual.
	sala := f isNil ifTrue: [nil] ifFalse: [self salaDe: f].
	sala isNil ifTrue: [
		butacasMostradas := OrderedCollection new.
		listaButacas list: OrderedCollection new.
		^plano value: String new].
	ocupadas := self butacasOcupadasDe: f.
	butacasMostradas := sala butacas reject: [:b | ocupadas includes: b].
	listaButacas list: (butacasMostradas collect: [:b | self textoButaca: b]).
	plano value: (self planoDe: sala ocupadas: ocupadas)</body>

<body package="GestionCineTeatroUI" selector="butacasElegidas">butacasElegidas

	^(listaButacas selectionIndexes asSortedCollection collect: [:i | butacasMostradas at: i]) asOrderedCollection</body>

<body package="GestionCineTeatroUI" selector="validarFuncionYButacas">validarFuncionYButacas

	"Devuelve un mensaje de error, o nil si esta todo bien"

	self funcionActual isNil ifTrue: [^'Seleccione una funcion'].
	self butacasElegidas isEmpty ifTrue: [^'Seleccione al menos una butaca'].
	^nil</body>

<body package="GestionCineTeatroUI" selector="validarSocio">validarSocio

	| s |
	s := self socioActual.
	s isNil ifTrue: [^'Seleccione un socio'].
	s esActivo == true ifFalse: [^'El socio esta inactivo'].
	^nil</body>

<body package="GestionCineTeatroUI" selector="reservar">reservar

	| error |
	error := self validarFuncionYButacas.
	error isNil ifTrue: [error := self validarSocio].
	error isNil ifFalse: [^Dialog warn: error].
	self ejecutar: [
		admin agregarReservaFuncion: self funcionActual id
			butacasReservadas: self butacasElegidas
			socio: self socioActual id].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="venderSocio">venderSocio

	| error |
	error := self validarFuncionYButacas.
	error isNil ifTrue: [error := self validarSocio].
	error isNil ifFalse: [^Dialog warn: error].
	self ejecutar: [
		admin agregarVentaDirectaSocio: self socioActual id
			Funcion: self funcionActual id
			butacasVenta: self butacasElegidas
			medioPago: medioPago value asString].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="venderGeneral">venderGeneral

	| error |
	error := self validarFuncionYButacas.
	error isNil ifFalse: [^Dialog warn: error].
	self ejecutar: [
		admin agregarVentaDirectaGeneralFuncion: self funcionActual id
			butacasVenta: self butacasElegidas
			medioPago: medioPago value asString].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="cancelarReserva">cancelarReserva

	| r resultado |
	r := self reservaActual.
	r isNil ifTrue: [^Dialog warn: 'Seleccione una reserva'].
	r estaCancelada ifTrue: [^Dialog warn: 'La reserva ya estaba cancelada'].
	(r estaConfirmadaEn: admin ventas) ifTrue: [^Dialog warn: 'La reserva ya fue pagada'].
	resultado := self ejecutar: [admin cancelarReserva: r id].
	resultado == true ifTrue: [Dialog warn: 'Reserva cancelada sin costo'].
	resultado == false ifTrue: [Dialog warn: 'No se puede cancelar: faltan menos de 24 hs. El socio debe pagarla.'].
	self actualizar</body>

<body package="GestionCineTeatroUI" selector="pagarReserva">pagarReserva

	| r |
	r := self reservaActual.
	r isNil ifTrue: [^Dialog warn: 'Seleccione una reserva'].
	r estaCancelada ifTrue: [^Dialog warn: 'La reserva esta cancelada'].
	(r estaConfirmadaEn: admin ventas) ifTrue: [^Dialog warn: 'La reserva ya fue pagada'].
	self ejecutar: [admin agregarVentaReserva: r id medioPago: medioPago value asString].
	self actualizar</body>
</methods>

<!-- ============================================================ -->
<!-- VentanaConsultas                                              -->
<!-- ============================================================ -->

<methods>
<class-id>VentanaConsultas class</class-id> <category>interface specs</category>

<body package="GestionCineTeatroUI" selector="windowSpec">windowSpec

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec}
		#window:
		#(#{UI.WindowSpec}
			#label: 'Consultas y listados'
			#bounds: #(#{Graphics.Rectangle} 60 60 960 640 ) )
		#component:
		#(#{UI.SpecCollection}
			#collection: #(
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 20 ) #name: #lbl1 #label: 'Fecha / desde' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 18 300 40 ) #name: #fDesde #model: #fechaDesde #type: #date )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 50 ) #name: #lbl2 #label: 'Hasta' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 48 300 70 ) #name: #fHasta #model: #fechaHasta #type: #date )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 80 ) #name: #lbl3 #label: 'Cantidad (top)' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 78 300 100 ) #name: #fCantidad #model: #cantidad #type: #number )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 110 ) #name: #lbl4 #label: 'Director / actor' )
				#(#{UI.InputFieldSpec} #layout: #(#{Graphics.Rectangle} 130 108 300 130 ) #name: #fTexto #model: #texto )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 140 ) #name: #lbl5 #label: 'Obra' )
				#(#{UI.SequenceViewSpec} #layout: #(#{Graphics.Rectangle} 20 160 300 290 ) #name: #lstObras #model: #listaObras )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 305 158 333 ) #name: #b1 #model: #funcionesPorFecha #label: 'Funciones x fecha' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 305 300 333 ) #name: #b2 #model: #funcionesPorObra #label: 'Funciones x obra' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 338 158 366 ) #name: #b3 #model: #sociosDeudores #label: 'Reservas impagas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 338 300 366 ) #name: #b4 #model: #mejoresEnCartel #label: 'Mejores criticas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 371 158 399 ) #name: #b5 #model: #ingresos #label: 'Ingresos' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 371 300 399 ) #name: #b6 #model: #ocupacion #label: 'Ocupacion promedio' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 404 158 432 ) #name: #b7 #model: #agotadasFuturas #label: 'Agotadas (futuras)' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 404 300 432 ) #name: #b8 #model: #agotadasHistorico #label: 'Agotadas (todas)' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 20 445 ) #name: #lblExtra #label: 'Consultas extra' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 467 158 495 ) #name: #b9 #model: #topRecaudacion #label: 'Top recaudacion' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 467 300 495 ) #name: #b10 #model: #topPeliculas #label: 'Top peliculas' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 500 158 528 ) #name: #b11 #model: #obrasDirector #label: 'Obras del director' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 162 500 300 528 ) #name: #b12 #model: #obrasActor #label: 'Obras del actor' )
				#(#{UI.ActionButtonSpec} #layout: #(#{Graphics.Rectangle} 20 533 158 561 ) #name: #b13 #model: #recaudacion #label: 'Recaudacion obra' )
				#(#{UI.LabelSpec} #layout: #(#{Core.Point} 320 8 ) #name: #lbl6 #label: 'Resultado' )
				#(#{UI.TextEditorSpec} #layout: #(#{Graphics.Rectangle} 320 30 880 561 ) #name: #txtSalida #model: #salida #isReadOnly: true #style: #fixed )
				) ) )</body>
</methods>

<methods>
<class-id>VentanaConsultas</class-id> <category>initialize-release</category>

<body package="GestionCineTeatroUI" selector="initialize">initialize

	super initialize.
	fechaDesde := (Date today subtractDays: 30) asValue.
	fechaHasta := (Date today addDays: 30) asValue.
	cantidad := 5 asValue.
	texto := String new asValue.
	salida := String new asValue.
	listaObras := SelectionInList new</body>
</methods>

<methods>
<class-id>VentanaConsultas</class-id> <category>aspects</category>

<body package="GestionCineTeatroUI" selector="fechaDesde">fechaDesde
	^fechaDesde</body>

<body package="GestionCineTeatroUI" selector="fechaHasta">fechaHasta
	^fechaHasta</body>

<body package="GestionCineTeatroUI" selector="cantidad">cantidad
	^cantidad</body>

<body package="GestionCineTeatroUI" selector="texto">texto
	^texto</body>

<body package="GestionCineTeatroUI" selector="listaObras">listaObras
	^listaObras</body>

<body package="GestionCineTeatroUI" selector="salida">salida
	^salida</body>
</methods>

<methods>
<class-id>VentanaConsultas</class-id> <category>actions</category>

<body package="GestionCineTeatroUI" selector="actualizar">actualizar

	listaObras list: (admin obras collect: [:o | self textoObra: o])</body>

<body package="GestionCineTeatroUI" selector="obraActual">obraActual
	^self elementoSeleccionado: listaObras de: admin obras</body>

<body package="GestionCineTeatroUI" selector="mostrar:">mostrar: unBloque

	"Ejecuta la consulta (un bloque que devuelve un String) y muestra el resultado"

	| resultado |
	salida value: String new.
	resultado := self ejecutar: unBloque.
	resultado isNil ifFalse: [salida value: resultado]</body>

<body package="GestionCineTeatroUI" selector="mostrarFunciones:">mostrarFunciones: unaColeccion

	self mostrar: [self lineas: (unaColeccion collect: [:f | self textoFuncion: f])]</body>

<body package="GestionCineTeatroUI" selector="funcionesPorFecha">funcionesPorFecha

	self mostrar: [self lineas: ((admin funcionesPorFecha: fechaDesde value) collect: [:f | self textoFuncion: f])]</body>

<body package="GestionCineTeatroUI" selector="funcionesPorObra">funcionesPorObra

	| o |
	o := self obraActual.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una obra'].
	self mostrar: [self lineas: ((admin funcionesPorObra: o id) collect: [:f | self textoFuncion: f])]</body>

<body package="GestionCineTeatroUI" selector="sociosDeudores">sociosDeudores

	self mostrar: [
		self lineas: (admin sociosDeudores asOrderedCollection collect: [:s | self textoSocio: s])]</body>

<body package="GestionCineTeatroUI" selector="mejoresEnCartel">mejoresEnCartel

	self mostrar: [
		| ws |
		ws := WriteStream on: String new.
		ws nextPutAll: 'Peliculas en cartel con puntaje &gt;= 7:'; cr; cr.
		admin mejoresPeliculasEnCartelera keysAndValuesDo: [:idObra :prom |
			ws nextPutAll: (self tituloObra: idObra), ': ', prom asFloat printString; cr].
		ws contents]</body>

<body package="GestionCineTeatroUI" selector="ingresos">ingresos

	self mostrar: [
		| ws desde hasta porTipo porSocio |
		desde := fechaDesde value.
		hasta := fechaHasta value.
		ws := WriteStream on: String new.
		ws nextPutAll: 'Ingresos del ', desde displayString, ' al ', hasta displayString; cr; cr.
		ws nextPutAll: 'TOTAL: $', (admin resumenIngresosTotalesEntre: desde Y: hasta) displayString; cr; cr.
		porTipo := admin resumenIngresosPorTipoVentaEntre: desde Y: hasta.
		ws nextPutAll: 'Ventas directas: $', (porTipo at: 'ventasDirectas') displayString; cr.
		ws nextPutAll: 'Ventas por reserva (socios): $', (porTipo at: 'ventasReservas') displayString; cr; cr.
		ws nextPutAll: 'Detalle por socio:'; cr.
		porSocio := admin resumenIngresosReservasPorSocioEntre: desde Y: hasta.
		porSocio keysAndValuesDo: [:idSocio :monto |
			ws nextPutAll: '   Socio ', idSocio printString, ': $', monto displayString; cr].
		ws contents]</body>

<body package="GestionCineTeatroUI" selector="ocupacion">ocupacion

	| o |
	o := self obraActual.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una obra'].
	self mostrar: [
		'Ocupacion promedio de ', o titulo displayString, ': ',
			((admin ocupacionPromedioDe: o id) * 100) rounded printString, ' %']</body>

<body package="GestionCineTeatroUI" selector="agotadasFuturas">agotadasFuturas

	self mostrar: [self lineas: (admin funcionesAgotadasFuturas collect: [:f | self textoFuncion: f])]</body>

<body package="GestionCineTeatroUI" selector="agotadasHistorico">agotadasHistorico

	self mostrar: [self lineas: (admin funcionesAgotadasHistorico collect: [:f | self textoFuncion: f])]</body>

<body package="GestionCineTeatroUI" selector="topRecaudacion">topRecaudacion

	self mostrar: [
		self lineas: ((admin mejoresObrasRecaudacion: cantidad value) asOrderedCollection collect: [:o |
			o titulo displayString, ': $', (admin recaudacionObra: o id) displayString])]</body>

<body package="GestionCineTeatroUI" selector="topPeliculas">topPeliculas

	self mostrar: [
		self lineas: ((admin mejoresPeliculasCantidad: cantidad value) asOrderedCollection collect: [:o |
			o titulo displayString, ': ', (admin puntajePromedioObra: o id) asFloat printString])]</body>

<body package="GestionCineTeatroUI" selector="obrasDirector">obrasDirector

	self mostrar: [self lineas: ((admin listaObrasDirector: texto value) collect: [:o | self textoObra: o])]</body>

<body package="GestionCineTeatroUI" selector="obrasActor">obrasActor

	self mostrar: [self lineas: ((admin listaObrasActor: texto value) collect: [:o | self textoObra: o])]</body>

<body package="GestionCineTeatroUI" selector="recaudacion">recaudacion

	| o |
	o := self obraActual.
	o isNil ifTrue: [^Dialog warn: 'Seleccione una obra'].
	self mostrar: ['Recaudacion de ', o titulo displayString, ': $', (admin recaudacionObra: o id) displayString]</body>
</methods>



</st-source>
