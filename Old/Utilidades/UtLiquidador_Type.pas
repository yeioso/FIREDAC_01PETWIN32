unit UtLiquidador_Type;

interface
Uses
  UtFecha,
  System.SysUtils,
  Generics.Collections;

Type
  TRESULTADO = Class
    FCONCEPTO           : String;
    FCCOSTOS            : String;
    FNOMBRE             : String;
    FFECHA              : String;
    FHORA_INICIAL       : String;
    FHORA_FINAL         : String;
    FCANTIDAD           : Double;
    FVALOR              : Double;
    FTOTAL              : Double;
    FEPS_EMPLEADO       : Double;
    FEPS_EMPRESA        : Double;
    FAFP_EMPLEADO       : Double;
    FAFP_EMPRESA        : Double;
    FARL                : Double;
    FIBCF               : Double;
    FSENA               : Double;
    FCCF                : Double;
    FCESANTIAS          : Double;
    FINTERES_CESANTIAS  : Double;
    FPRIMA              : Double;
    FVACACIONES         : Double;
    FESAP               : Double;
    FESCUELA_INDUSTRIAL : Double;
  End;

  THORAS = Class
    FHORAINI : String;
    FHORAFIN : String;
    FHORAS   : Double;
  End;

  TCONCEPTO = Class
    FCONCEPTO            : String;
    FCCOSTOS             : String;
    FNOMBRE_CONCEPTO     : String;
    FNOMBRE_CCOSTOS      : String;
    FPERIODICIDAD        : String;
    FCANTIDAD_CCOSTOS    : Double;
    FPORCENTAJE_CCOSTOS  : Double;
    FPORCENTAJE_CONCEPTO : Double;
    FPORCENTAJE_EMPLEADO : Double;
    FPORCENTAJE_EMPRESA  : Double;
    FHORAS               : TList<THORAS>;
    Constructor Create;
    Destructor Destroy;
  End;

  TTURNO = Class
    FCODIGO_TURNO       : String;
    FCODIGO_LIQUIDACION : String;
    FNOMBRE_TURNO       : String;
    FID_PERIODICIDAD    : String;
    FNOMBRE_LIQUIDACION : String;
    FFECHAINI           : TFecha_Info;
    FFECHAFIN           : TFecha_Info;
    FBASICO             : String;
    FDOMINICAL          : String;
    FFESTIVO            : String;
    FTRANSPORTE         : String;
    FSALUD              : String;
    FPENSION            : String;
    FFSP                : String;
    RETEFUENTE          : String;
    FHORAS_DIA          : Double;
    FHORAS_TURNO        : Double;
    FHORAS_MES          : Double;
    FCONCEPTOS          : TList<TCONCEPTO>;
    Constructor Create;
    Destructor Destroy;
  End;

implementation

Constructor TCONCEPTO.Create;
Begin
  FHORAS := TList<THORAS>.Create;
End;

Destructor TCONCEPTO.Destroy;
Var
  lHORAS : THORAS;
begin
  For lHORAS In FHORAS Do
    lHORAS.DisposeOf;
  FHORAS.Clear;
  FHORAS.DisposeOf;
End;

{ TTURNO }
constructor TTURNO.Create;
begin
  FCONCEPTOS := TList<TCONCEPTO>.Create;
end;

destructor TTURNO.Destroy;
Var
  lCONCEPTO : TCONCEPTO;
begin
  For lCONCEPTO In FCONCEPTOS Do
    lCONCEPTO.DisposeOf;
  FCONCEPTOS.Clear;
  FCONCEPTOS.DisposeOf;
end;

end.
