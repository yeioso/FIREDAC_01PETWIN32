unit TableName_PUC;

interface

Function Create_Tabla_PUC : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_PUC : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_PUC).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_PUC).Name + '  '                          );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                             );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PUC  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_PUC    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(003)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PYG      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(003)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO    ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '     ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PUC) '                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                              );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_PUC', 'Tabla',  Retornar_Info_Tabla(Id_PUC).Name]);
      End;
    End;
  End;
End;

(*
SELECT PC.Codigo AS Codigo, PC.detalle AS Detalle, SUM(DA.Debe-DA.Haber) As SALDO
FROM PlanCuentas PC, DetalleAsiento DA
WHERE
PC.Codigo = left(DA.Codigo,len(PC.Codigo))
and len(PC.Codigo) <= 5
GROUP BY Pc.Codigo, PC.Detalle
ORDER BY PC.Codigo;

********************************************************************************
UPDATE employees
SET employees.first_name = contacts.first_name
FROM employees
INNER JOIN contacts
ON (employees.last_name = contacts.last_name)
WHERE employee_id > 95;
********************************************************************************
UPDATE employees
SET first_name = (SELECT first_name
                  FROM contacts
                  WHERE contacts.last_name = employees.last_name)
WHERE employee_id > 95;
********************************************************************************
*)


(*
balance de comprobación
SELECT Cuenta, SUM(SaldoAnterior) SaldoAnterior, SUM(DEBITO) Debito, SUM(Credito) Credito
FROM (

SELECT Cuenta, SUM(DEBIDO - CREDITO) as SaldoAnterior, 0 Cargos, 0 Abonos
FROM MovimientoDiario
WHERE Fecha < FechaInicial
GROUP BY Cuenta

UNION ALL

SELECT Cuenta, 0 as SaldoAnterior, SUM(Debido) Debito, SUM(Credito) Credito
FROM MovimientoDiario
WHERE Fecha BETWEEN FechaInicial AND FechaFinal
GROUP BY Cuenta

) AS Balanza
GROUP BY Cuenta
*)

(*
select cuenta, saldo_inicial ( cuenta, 2007) as saldo_inicial,
         sum( case month(fecha ) =1 then debe-haber else 0 ) as enero,
         sum( case month(fecha ) = 2then debe-haber else 0 ) as febrero,
         sum( case month(fecha ) = 3 then debe-haber else 0 ) as marzo,
...
         sum( case month(fecha ) =12 then debe-haber else 0 ) as Diciembre

form Saldos
where fecha between 01/01/2007 and 31/12/2007
GROUP BY CUENTA

select  'Tareas Cerradas' as Consulta, Tecnico,
sum( case datepart("month", f_fin) when 1 then 1 else 0 end) as Enero,
sum( case datepart("month", f_fin) when 2 then 1 else 0 end) as Febrero,
sum( case datepart("month", f_fin) when 3 then 1 else 0 end) as Marzo,
sum( case datepart("month", f_fin) when 4 then 1 else 0 end) as Abril,
sum( case datepart("month", f_fin) when 5 then 1 else 0 end) as Mayo,
sum( case datepart("month", f_fin) when 6 then 1 else 0 end) as Junio,
sum( case datepart("month", f_fin) when 7 then 1 else 0 end) as Julio,
sum( case datepart("month", f_fin) when 8 then 1 else 0 end) as Agosto,
sum( case datepart("month", f_fin) when 9 then 1 else 0 end) as Septiembre,
sum( case datepart("month", f_fin) when 10 then 1 else 0 end) as Octubre,
sum( case datepart("month", f_fin) when 11 then 1 else 0 end) as Noviembre,
sum( case datepart("month", f_fin) when 12 then 1 else 0 end) as Diciembre
/*cast (sum( T.Duracion)/3600.00 as decimal(10,2)) as Tiempo_horas  */
FROM ahd.tareas
where
f_fin  between  '01/01/2005' and '12/31/2005'
group by Tecnico

*)


end.






