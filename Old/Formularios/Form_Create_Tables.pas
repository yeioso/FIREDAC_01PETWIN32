unit Form_Create_Tables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, ComCtrls, Buttons, UtFormularios;

type
  TFrForm_Create_Tables = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    pfArchivos: TCheckListBox;
    Progreso: TProgressBar;
    BtnCrear: TSpeedButton;
    BtnSalir: TSpeedButton;
    lbInformacion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnCrearClick(Sender: TObject);
  Protected
  private
    { Private declarations }
    lCorrecto : Boolean;
    Procedure Crear_Tablas;
  public
    { Public declarations }
  end;

Function Create_Tables : Boolean;

implementation
{$R *.dfm}

Uses
  UtConexion,
  UtFunciones,
  Form_Splash,
  UtInfoTablas,
  UtConstantes,
  TableName_PUC,
  TableName_Base,
  Tablename_Caja,
  Tablename_Zona,
  Tablename_Area,
  Tablename_Cargo,
  Tablename_Linea,
  Tablename_Grupo,
  Tablename_Bodega,
  Tablename_Filtro,
  Tablename_Perfil,
  Tablename_System,
  Tablename_Usuario,
  Tablename_Tercero,
  Tablename_Espacio,
  TableName_Impuesto,
  Tablename_Producto,
  Tablename_Subgrupo,
  UtVariablesGlobales,
  Tablename_Parametro,
  Tablename_Municipio,
  TableName_Tercero_LP,
  Tablename_Precargada,
  Tablename_Comprobante,
  Tablename_Permiso_App,
  TableName_Producto_LP,
  Tablename_Exp_Imp_Enc,
  Tablename_Exp_Imp_Det,
  Tablename_Permiso_Menu,
  Tablename_Permiso_Tabla,
  TableName_Documento_Enc,
  TableName_Documento_Det,
  TableName_Centro_Costos,
  Tablename_Documento_Adm,
  TableName_Producto_Baja,
  TableName_Ajuste_Kardex,
  Tablename_Usuario_Comanda,
  Tablename_Producto_Receta,
  TableName_Hoja_Inventario,
  TableName_Tercero_Contacto,
  Tablename_Producto_Tercero,
  TableName_Tercero_Sinonimo,
  TableName_Documento_Receta,
  Tablename_Producto_Observacion,
  TableName_Documento_Observacion;


procedure TFrForm_Create_Tables.BtnCrearClick(Sender: TObject);
begin
  Crear_Tablas;
end;

procedure TFrForm_Create_Tables.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrForm_Create_Tables.FormCreate(Sender: TObject);
Var
  lI : Integer;
  lId : Integer;
  lStr : String;
begin
  lCorrecto := False;
  lbInformacion.Caption := '';
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Retornar_Caption_Tablas(pfArchivos.Items);
  Show_Splash;
  Try
    For lI := 0 To pfArchivos.Items.Count-1 Do
    Begin
      Actualiza__Splash('Preparando vista para '+ pfArchivos.Items[lI] + '...');
      lId := Retornar_Id_Caption(pfArchivos.Items[lI]);
      lStr := Retornar_Info_Tabla(lId).Name;
      pfArchivos.ItemEnabled[lI] := Not gVariableGlobal.CNX.TableExists(lStr);
      If pfArchivos.ItemEnabled[lI] Then
        pfArchivos.Checked[lI] := True;
    End;
  Except

  End;
  Free_Splash;
end;

Procedure TFrForm_Create_Tables.Crear_Tablas;
Var
  lI : Integer;
  lOk : Boolean;
Begin
  lOk := True;
  Progreso.Min := 0;
  Progreso.Max := pfArchivos.Items.Count;
  Try
    For lI := 0 To pfArchivos.Items.Count-1 Do
    Begin
      If lOk Then
      Begin
        Progreso.StepIt;
        lbInformacion.Caption := 'Procesando ' + Trim(pfArchivos.Items[lI]) + '...';
        If pfArchivos.Checked[lI] Then
        Begin
          Case Retornar_Id_Caption(pfArchivos.Items[lI]) Of
            Id_Filtro                 : Create_Tabla_Filtro                ;
            Id_Perfil                 : Create_Tabla_Perfil                ;
            Id_Permiso_Menu           : Create_Tabla_Permiso_Menu          ;
            Id_Permiso_Tabla          : Create_Tabla_Permiso_Tabla         ;
            Id_Permiso_App            : Create_Tabla_Permiso_App           ;

            Id_Usuario                : Create_Tabla_Usuario               ;
            Id_Caja                   : Create_Tabla_Caja                  ;
            Id_Zona                   : Create_Tabla_Zona                  ;
            Id_Espacio                : Create_Tabla_Espacio               ;

            Id_Bodega                 : Create_Tabla_Bodega                ;
            Id_Linea                  : Create_Tabla_Linea                 ;
            Id_Grupo                  : Create_Tabla_Grupo                 ;
            Id_Subgrupo               : Create_Tabla_Subgrupo              ;
            Id_Cargo                  : Create_Tabla_Cargo                 ;
            Id_Area                   : Create_Tabla_Area                  ;
            Id_Comprobante            : Create_Tabla_Comprobante           ;
            Id_Centro_Costos          : Create_Tabla_Centro_Costos         ;
            Id_Base                   : Create_Tabla_Base                  ;
            Id_Impuesto               : Create_Tabla_Impuesto              ;
            Id_Documento_Adm          : Create_Tabla_Documento_Adm         ;
            Id_PUC                    : Create_Tabla_PUC                   ;
            Id_Municipio              : Begin
                                          Create_Tabla_Municipio           ;
                                          Cargar_Informacion_Inicial_Municipio;
                                        End;

            Id_Producto               : Create_Tabla_Producto              ;
            Id_Producto_LP            : Create_Tabla_Producto_LP           ;

            Id_Producto_Receta        : Create_Tabla_Producto_Receta       ;
            Id_Producto_Observacion   : Create_Tabla_Producto_Observacion  ;
            Id_Producto_Baja          : Create_Tabla_Producto_Baja         ;

            Id_Tercero                : Create_Tabla_Tercero               ;
            Id_Tercero_Contacto       : Create_Tabla_Tercero_Contacto      ;
            Id_Tercero_Sinonimo       : Create_Tabla_Tercero_Sinonimo      ;
            Id_Tercero_LP             : Create_Tabla_Tercero_LP            ;
            Id_Producto_Tercero       : Create_Tabla_Producto_Tercero      ;

            Id_Precargada             : Create_Tabla_Precargada            ;
            Id_Parametro              : Create_Tabla_Parametro             ;

            Id_Documento_Enc_Aux      : Create_Tabla_Documento_Enc         (Id_Documento_Enc_Aux                      );
            Id_Documento_Det_Aux      : Create_Tabla_Documento_Det         (Id_Documento_Enc_Aux, Id_Documento_Det_Aux);
            Id_Documento_Rec_Aux      : Create_Tabla_Documento_Receta      (Id_Documento_Rec_Aux, Id_Documento_Enc_Aux);
            Id_Documento_Obs_Aux      : Create_Tabla_Documento_Observacion (Id_Documento_Obs_Aux, Id_Documento_Enc_Aux);

            Id_Documento_Enc          : Create_Tabla_Documento_Enc         (Id_Documento_Enc                  );
            Id_Documento_Det          : Create_Tabla_Documento_Det         (Id_Documento_Enc, Id_Documento_Det);
            Id_Documento_Rec          : Create_Tabla_Documento_Receta      (Id_Documento_Rec, Id_Documento_Enc);
            Id_Documento_Obs          : Create_Tabla_Documento_Observacion (Id_Documento_Obs, Id_Documento_Enc);

            Id_Hoja_Inventario        : Create_Tabla_Hoja_Inventario       ;

            Id_Ajuste_Kardex          : Create_Tabla_Ajuste_Kardex         ;


            Id_Exp_Imp_Enc            : Create_Tabla_Exp_Imp_Enc           ;
            Id_Exp_Imp_Det            : Create_Tabla_Exp_Imp_Det           ;

            Id_Usuario_Comanda        : Create_Tabla_Usuario_Comanda       ;

            Id_SYSTEM                 : Create_Tabla_SYSTEM                ;
          End;
        End;
      End;
    End;
  Except
    On E : Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'Crear_Tablas , TFrForm_Create_Tables.Crear_Tablas']);
    End;
  End;
  If lOk Then
    lbInformacion.Caption := '';
  lCorrecto := lOk;
  If lCorrecto Then
    Mensajes('Proceso Terminado')
  Else
    Mensajes('Existe problemas al crear los archivos');
  Close;
End;

Function Create_Tables : Boolean;
Var
  FrForm_Create_Tables: TFrForm_Create_Tables;
Begin
  FrForm_Create_Tables := TFrForm_Create_Tables.Create(Nil);
  FrForm_Create_Tables.ShowModal;
  Result := FrForm_Create_Tables.lCorrecto;
  FrForm_Create_Tables.Free;
End;

end.

