
Proceso CalculoCostoFinalConArreglo

	// Declarar variables
	Definir N, i Como Entero
	Definir preciosFinales[10] Como Real
	Definir precioOriginal, porcentajeDescuento, iva, cantidad, peso, precioConDescuento, precioConIva, precioConCantidad, descuentoPorCantidad Como Real
	Definir costoEnvio, costoTotal, costoFinal, sumaPrecios Como Real
	Definir destino Como Cadena

	// Leer cantidad de productos diferentes
	Escribir "Ingrese la cantidad de productos diferentes que desea calcular (máx 10):"
	Leer N

	// Ciclo para leer datos de cada producto
	Para i <- 1 Hasta N Con Paso 1

		Escribir "---- Producto ", i, " ----"
		Escribir "Ingrese el precio original del producto:"
		Leer precioOriginal

		Escribir "Ingrese el porcentaje de descuento del cupón:"
		Leer porcentajeDescuento

		Escribir "Ingrese el porcentaje de IVA:"
		Leer iva

		Escribir "Ingrese la cantidad de unidades:"
		Leer cantidad

		// Calcular descuento del cupón
		precioConDescuento <- precioOriginal * (1 - porcentajeDescuento / 100)

		// Aplicar IVA
		precioConIva <- precioConDescuento * (1 + iva / 100)

		// Descuento por cantidad
		Si cantidad > 1 Entonces
			descuentoPorCantidad <- 5
		SiNo
			descuentoPorCantidad <- 0
		FinSi

		precioConCantidad <- precioConIva * (1 - descuentoPorCantidad / 100)

		// Guardar precio final unitario * cantidad en arreglo
		preciosFinales[i] <- precioConCantidad * cantidad

	FinPara

	// Leer datos del envío
	Escribir "Ingrese el peso total del paquete en kg:"
	Leer peso

	Escribir "Ingrese el destino del envío:"
	Leer destino

	// Calcular costo de envío
	costoEnvio <- 10 + (2 * peso)

	// Calcular suma total de precios
	sumaPrecios <- 0
	Para i <- 1 Hasta N Con Paso 1
		sumaPrecios <- sumaPrecios + preciosFinales[i]
	FinPara

	// Calcular costo total final
	costoTotal <- sumaPrecios + costoEnvio

	// Mostrar resultados
	Escribir "-------- RESUMEN --------"
	Para i <- 1 Hasta N Con Paso 1
		Escribir "Subtotal producto ", i, ": $", preciosFinales[i]
	FinPara

	Escribir "Costo de envío (", peso, " kg a ", destino, "): $", costoEnvio
	Escribir "Costo total final: $", costoTotal

FinProceso
