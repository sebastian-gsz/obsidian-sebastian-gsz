
-  **Enlaces**

	-  **[GitHub ](https://github.com/frappe)**
	
		-  **[frappe-docker ](https://github.com/frappe/frappe_docker/tree/main)**
		-  **[frappe-erpnext ](https://github.com/frappe/erpnext)**
	-  **[Frappe School ](https://school.frappe.io/lms/courses/inventory-management/learn/1-1)**
	-  **[Documentación ](https://docs.frappe.io/erpnext/open-source)**
![[barra.gif]]
-  **Presentación**

	Configurar un sistema ERP es como empezar tu negocio de nuevo, pero en el mundo virtual. Por suerte no es tan difícil como el negocio real y además puedes hacer una prueba.
	
	Para lograr una implementación de ERP correcta, el implementador debe reservar tiempo y realizar la implementación con dedicación. Normalmente, este no es un proyecto paralelo posterior al trabajo en el que dedicas un par de horas.
	
	Esto comienza con la empresa legal, el año fiscal, el plan de cuentas, almacenes, artículos, clientes, proveedores, usuarios y saldos iniciales. Configura estas bases antes de importar las transacciones diarias.
-  **Contabilidad**

	La contabilidad convierte la actividad empresarial cotidiana en un registro financiero fiable. Una venta, compra, movimiento de stock, gasto o pago comienza como un documento operativo y se convierte en anotaciones del libro mayor cuando se presenta.
	
	En Nova Industries, un fabricante y distribuidor de electrónica, el equipo financiero debe responder a preguntas sencillas: ¿Pagan los clientes puntualmente? ¿Qué debemos a los proveedores? ¿Es rentable el negocio y el saldo bancario está de acuerdo con los libros contables? ERPNext conecta esas preguntas con las transacciones que crearon cada importe.
	
	-  **Introducción**
	
		-  **[[wirtschaft-und-finanzen#^uhm10|Los dos estados financieros]]**
		-  **[[wirtschaft-und-finanzen#^uhm10|Debito y crédito]]**
		-  **El modelo contable**
		  
			Cada empresa tiene una moneda base, un año fiscal, cuentas impagadas y su propio **plan de cuentas**. El organigrama agrupa las cuentas en **Activos, Pasivos, Patrimonio, Ingresos y Gastos**. Las cuentas del libro mayor almacenan los asientos contables; las cuentas de grupo los organizan para la elaboración de informes.
			
			-  **La configuración inicial de la empresa**
			
				-  **Moneda base y año fiscal:** Establecen el marco económico y temporal bajo el cual operará la empresa para calcular informes, impuestos y cierres de ejercicio.
				-  **Plan de cuentas (Chart of Accounts):** Es la estructura troncal que organiza las finanzas del negocio, dividida universalmente en cinco bloques fundamentales: **Activos, Pasivos, Patrimonio, Ingresos y Gastos**.
			-  **Cuentas de grupo vs. Cuentas de libro mayor (Ledger)**
			
				-  **Cuentas de grupo:** Actúan como "carpetas" o categorías organizativas (por ejemplo, _Activos Corrientes_). No pueden recibir transacciones directas; su función es únicamente estructurar y sumarizar la información para la elaboración de balances e informes.
				-  **Cuentas del libro mayor (`Ledger`):** Son las cuentas finales (las "hojas" del árbol). Son las únicas que pueden almacenar y recibir los asientos contables reales.
			-  **Automatización y partida doble**
			
				-  **Contabilidad por partida doble:** El sistema garantiza que la balanza financiera se mantenga siempre equilibrada, asegurando que cada transacción refleje totales idénticos entre débitos (Debe) y créditos (Haber).
				-  **Cero intervención manual rutinaria:** A diferencia de los sistemas contables antiguos donde cada asiento se redactaba a mano, **ERPNext genera estos asientos de forma automática** en segundo plano. Tan solo debes hacer clic en **"Enviar" (`Submit`)** en un documento operativo (como una factura o un pago), y el sistema traduce esos datos en movimientos contables según tu configuración previa.
			-  **Rastreo de cifras**
			
				El sistema vincula de forma directa las operaciones del día a día (compras, ventas, pagos) con la contabilidad profunda, permitiéndote auditar, rastrear y justificar cualquier importe monetario desde su origen documental hasta el libro mayor.
			
			**El complemento de inventario**
			
			Adicionalmente, el texto señala que si la **contabilidad de stock** está habilitada, las transacciones de inventario generan de forma paralela _Stock Ledger Entries_ (Entradas del Libro de Stock). Esto permite que las cantidades y los valores de la mercancía se puedan auditar por separado, pero manteniendo siempre una conexión directa con el libro mayor general.
			
			-  **Source document (Documento fuente):** Representa el evento de negocio original. Detalla los importes, las partes implicadas, los impuestos, las fechas y las referencias introducidas por el usuario.
			-  **GL Entry (Asiento del libro mayor):** Muestra el movimiento de débito o crédito aplicado directamente a una cuenta contable. Incluye información asociada como la empresa, la parte, el centro de coste, el proyecto y otras dimensiones analíticas.
			-  **Payment Ledger Entry (Entrada del libro de pagos):** Explica con precisión cómo se vinculan y se asignan entre sí las cuentas por cobrar, las cuentas por pagar, los anticipos y los pagos.
		-  **Gestión integral del ciclo comercial**
		
			-  **Las facturas y sus correcciones**
			  
				-  **Factura de venta (Sales Invoice):** Es el documento oficial que registra el ingreso de dinero, los impuestos aplicados y el importe exacto que el cliente queda debiéndote.
				-  **Factura de compra (Purchase Invoice):** Registra el gasto o el valor del activo que has comprado (como tus perfiles de aluminio), los impuestos y lo que tú le debes al proveedor.
				-  **Notas de crédito y débito:** Son los mecanismos legales y contables para corregir, reducir o anular una factura previa (por ejemplo, si un cliente te devuelve material defectuoso), manteniendo siempre intacto el historial y la transparencia de auditoría.
			-  **El control de plazos y deudas pendientes**
			
				-  **Cuentas por cobrar y por pagar:** El sistema rastrea de forma milimétrica cada importe según el cliente o proveedor, el número de factura, la fecha de vencimiento exacta y el plazo acordado.
				-  **Informes de antigüedad (_Ageing_):** Informes clave que te permiten ver de un vistazo qué facturas están al día y cuáles llevan 30, 60 o más días vencidas.
				-  **Fraccionamiento de pagos:** Si negocias con un cliente pagar en varios plazos, el sistema puede dividir automáticamente una misma factura en cuotas programadas en el calendario.
			-  **Herramientas de cobro y pago automatizado**
			
				-  **Solicitudes de pago (Payment Requests):** Facilitan el flujo de caja permitiéndote enviar un enlace o aviso de pago directo al cliente.
				-  **Gestión de impagados (Dunning):** Herramientas automatizadas para realizar el seguimiento y enviar notificaciones de cobro a los clientes que acumulan retrasos.
				-  **Órdenes de pago (Payment Orders):** Permiten organizar, agrupar y pasar por un flujo de aprobación interno los pagos que la empresa va a emitir a sus proveedores.
-  **Almacén**
  
	-  Entender conceptos empresariales de inventario.
	-  Entender los procesos operativos.
	-  Entender cómo ERPNext los implementa.
	-  Definir indicadores y controles.
		
	**¿Qué es realmente la gestión de inventario?**
		
	- Tener disponibilidad de productos.
	- Minimizar capital inmovilizado.
	- Mantener trazabilidad.
	- Evitar pérdidas.
	- Facilitar compras.
	- Facilitar producción.
	- Facilitar ventas.
	
	Toda empresa mundial (Amazon, Toyota, Airbus, Coca-Cola, Samsung) busca optimizar estas 6 variables. La pregunta principal siempre es: **¿Qué tengo, dónde está, cuánto cuesta y cuándo debo reponerlo?**

