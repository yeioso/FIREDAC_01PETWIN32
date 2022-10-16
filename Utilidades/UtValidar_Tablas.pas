unit UtValidar_Tablas;

interface
Function Validar_Tablas_Existentes(pTag : Integer) : Boolean;

implementation
Uses
  
  UtInfoTablas,
  UtConstantes;

Function Validar_Tablas_Existentes(pTag : Integer) : Boolean;
Begin
  Result := True;
//  Case pTag Of
//    104   : Result := Tablas_Validas([Retornar_Info_Tabla(Id_Perfil  ).Name], 'Validar_Tablas_Existentes');
//    10503 : Result := Tablas_Validas([Retornar_Info_Tabla(Id_Grupo   ).Name], 'Validar_Tablas_Existentes');
//    10504 : Result := Tablas_Validas([Retornar_Info_Tabla(Id_Producto).Name], 'Validar_Tablas_Existentes');
//    201   : Result := Tablas_Validas([Retornar_Info_Tabla(Id_Lista_Precio).Name,
//                                      Retornar_Info_Tabla(Id_Tercero     ).Name,
//                                      Retornar_Info_Tabla(id_Zona        ).Name,
//                                      Retornar_Info_Tabla(Id_Grupo       ).Name,
//                                      Retornar_Info_Tabla(Id_Producto    ).Name,
//                                      Retornar_Info_Tabla(Id_Usuario     ).Name], 'Validar_Tablas_Existentes');
//    202   : Result := Tablas_Validas([Retornar_Info_Tabla(Id_Producto    ).Name], 'Validar_Tablas_Existentes');
//  End;
End;

end.
