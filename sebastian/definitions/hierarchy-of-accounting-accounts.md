---
def-type: atomic
version: 1
id: def-jerarquia-cuentas-contables
status: estandar
category: fiscalidad
date: 2026-08-05
tags:
  - fiscalidad
  - impuestos
  - contabilidad
  - legal
aliases:
  - obligaciones tributarias
  - jerarquía de cuentas contables
---
Cuando se mencionaba una cuenta específica asignada, la referencia apuntaba directamente a las **cuentas contables del libro mayor** (pertenecientes al plan de cuentas), y no a las fichas de los clientes o proveedores. No obstante, las fichas de clientes y proveedores pueden enlazarse a cuentas contables específicas.

En ERPNext, cuando el sistema genera una transacción comercial (por ejemplo, una factura de venta), determina qué cuenta contable utilizar evaluando una jerarquía de prioridad:

1. **Nivel de artículo individual**: Si el producto o servicio específico tiene configurada una cuenta contable propia.
2. **Nivel de grupo de artículos**: Si la categoría a la que pertenece el producto (por ejemplo, perfiles de aluminio) define una cuenta de ingresos o gastos predeterminada.
3. **Nivel de cliente o proveedor**: Si en la ficha comercial del cliente o proveedor se ha establecido una cuenta contable particular para sus transacciones.
4. **Nivel de compañía (por defecto)**: Si ninguna de las opciones anteriores está definida, el sistema recurre al valor por defecto configurado globalmente en la tabla de la compañía (`default_income_account` o `default_expense_account`).