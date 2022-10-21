unit Form_MenuPpal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Menus, jpeg, StdCtrls, Vcl.ToolWin, Vcl.ComCtrls;

type
  TFrMenuPpal = class(TForm)
    Image01: TImage;
    MainMenu1: TMainMenu;
    Procesos1: TMenuItem;
    Consultas: TMenuItem;
    Utilidades1: TMenuItem;
    Compaa1: TMenuItem;
    DiseadordrInformes1: TMenuItem;
    Personal1: TMenuItem;
    Timer1: TTimer;
    Compras1: TMenuItem;
    RegistrarAplicacin1: TMenuItem;
    Perfil1: TMenuItem;
    CambiodeContrasea1: TMenuItem;
    ResumendeCaja1: TMenuItem;
    Timer3: TTimer;
    Acercade1: TMenuItem;
    HistricodeFacturas1: TMenuItem;
    Log1: TMenuItem;
    Contabilidad1: TMenuItem;
    Cotizacin1: TMenuItem;
    Zona1: TMenuItem;
    Grupo1: TMenuItem;
    Lnea1: TMenuItem;
    Producto1: TMenuItem;
    ercero1: TMenuItem;
    DatosBase1: TMenuItem;
    sUBGRUPO1: TMenuItem;
    Municipio1: TMenuItem;
    Area1: TMenuItem;
    Bodega1: TMenuItem;
    AbrirCaja1: TMenuItem;
    CerrarCaja1: TMenuItem;
    AnularFactura1: TMenuItem;
    VentadeMostrador1: TMenuItem;
    VentadeMesa1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    ComprasyVentas1: TMenuItem;
    Compartidos1: TMenuItem;
    Contabilidad2: TMenuItem;
    PlandeCuentas1: TMenuItem;
    CentrodeCostos1: TMenuItem;
    Comprobante1: TMenuItem;
    Movimiento1: TMenuItem;
    BasedeImpuestos1: TMenuItem;
    Ventanas1: TMenuItem;
    Horizontal1: TMenuItem;
    Vertical1: TMenuItem;
    Cascada1: TMenuItem;
    Organizar1: TMenuItem;
    AdministracindeDocumento1: TMenuItem;
    Pedido1: TMenuItem;
    N7: TMenuItem;
    Base1: TMenuItem;
    N9: TMenuItem;
    EnlaceContable1: TMenuItem;
    BajadeInventario1: TMenuItem;
    CambiodeProducto1: TMenuItem;
    N6: TMenuItem;
    Predefnido1: TMenuItem;
    Parametro1: TMenuItem;
    CambiodeProductoenCompras1: TMenuItem;
    AnalisisdeeTransacciones1: TMenuItem;
    N6Procesos1: TMenuItem;
    DepurarMovimientoKardex1: TMenuItem;
    pnlToolBar: TPanel;
    BtnSessiones: TSpeedButton;
    BtnAyudas: TSpeedButton;
    BtnSalir: TSpeedButton;
    PnlAdmin: TPanel;
    AnlisisdeTransacciones1: TMenuItem;
    AnlisisdeKardex1: TMenuItem;
    CopiadeRespaldo1: TMenuItem;
    AjustedeKardex1: TMenuItem;
    BtnConsultar: TSpeedButton;
    Cargo1: TMenuItem;
    ResumendeCaja2: TMenuItem;
    HojadeInventario1: TMenuItem;
    N2: TMenuItem;
    ExportacinImportacin1: TMenuItem;
    SpeedButton1: TSpeedButton;
    InformeDiario1: TMenuItem;
    Comisiones1: TMenuItem;
    N5: TMenuItem;
    CuentasporCobrar1: TMenuItem;
    CuentasporPagar1: TMenuItem;
    Movimiento2: TMenuItem;
    N7101: TMenuItem;
    CapturaRapidadeTerceros1: TMenuItem;
    BtnAbrirCajon: TSpeedButton;
    PuertoTCP1: TMenuItem;
    Utilidad1: TMenuItem;
    BtnAdmin: TSpeedButton;
    Procedure OnClick_Item(pSender : TObject);
    procedure BtnAyudasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSessionesClick(Sender: TObject);
    procedure BtnCalculadoraClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure PnlAdminClick(Sender: TObject);
    procedure Horizontal1Click(Sender: TObject);
    procedure Vertical1Click(Sender: TObject);
    procedure Cascada1Click(Sender: TObject);
    procedure Organizar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnAbrirCajonClick(Sender: TObject);
    procedure BtnAdminClick(Sender: TObject);
  private
    { Private declarations }
    FUSUARIO_ACTUAL : String;
    Function Cerrar_Pantallas(pForced : Boolean = False) : Boolean;
    Function Help(Command: Word; Data: THelpEventData; Var CallHelp: Boolean): Boolean;
    Procedure OnException(Sender: TObject; E: Exception);
    Function Pantalla_Activa(pTag : Integer) : Boolean;
    Procedure Armar_Opciones_Informes;
  public
    { Public declarations }
    Procedure Cargar_Configuraciones;
  end;

var
  FrMenuPpal: TFrMenuPpal;

implementation
{$R *.dfm}

Uses

  UtOpciones,

  UtImpresion,
  Form_Inicio,
  Form_Splash,
  UtFunciones,
  Form_Entrada,
  UtConstantes,
  UtInfoTablas,
  UtCerrarCaja,
  UtControl_Menu,
  Form_Contrasena,
  UtVariablesGlobales,
  Form_Consulta_Productos;

Procedure TFrMenuPpal.Armar_Opciones_Informes;
Var
  lTexto : String;
Begin
  If Assigned(gVariableGlobal.LOGOTIPO) And Assigned(gVariableGlobal.LOGOTIPO.Picture) And Assigned(gVariableGlobal.LOGOTIPO.Picture.Bitmap) Then
  Begin
    Image01.Visible := False;
    Image01.Picture.Bitmap := Nil;
    Image01.Picture.Bitmap := gVariableGlobal.LOGOTIPO.Picture.Bitmap;
    Image01.Visible := True;
  End;
  lTexto := Trim(Application.Title) + ' - Versión: ' + Trim(gVariableGlobal.Version) + ' - ' + Trim(gVariableGlobal.EMPRESA_ACTUAL) + ' - ' + Trim(gVariableGlobal.USUARIO_NOMBRE) + ' - Fecha de Caja: ' + gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
  If gVariableGlobal.Version_Demo Then
     lTexto := lTexto + ' ' + 'Versión DEMO';
  Self.Caption := lTexto;
End;

Function TFrMenuPpal.Help(Command: Word; Data: THelpEventData; Var CallHelp: Boolean): Boolean;
Begin
  Try
    HtmlHelp(Self.Handle, pchar(Application.HelpFile), HH_HELP_CONTEXT, Data);
    CallHelp := False;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrMainForm.Help']);
  End;
  Result := True;
End;

procedure TFrMenuPpal.Horizontal1Click(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

Procedure TFrMenuPpal.OnException(Sender: TObject; E: Exception);
Begin
  If (E <> Nil) And (Not Vacio(E.Message)) Then
    gVariableGlobal.Add_Log(E, ['Origen', 'TFrMenuPpal.OnException']);
End;

procedure TFrMenuPpal.Organizar1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

Function TFrMenuPpal.Pantalla_Activa(pTag : Integer) : Boolean;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := False;
  while (lI < Application.MainForm.MDIChildCount) do
  Begin
    Result := Application.MainForm.MDIChildren[lI].Tag = pTag;
    if Result then
    Begin
      Application.MainForm.MDIChildren[lI].Show;
      lI := Application.MainForm.MDIChildCount;
    End
    Else
      Inc(lI);
  End;
End;

procedure TFrMenuPpal.PnlAdminClick(Sender: TObject);
begin
  If pnlToolBar.Visible Then
  Begin
    AnimateWindow(pnlToolBar.Handle, 400, AW_HIDE     Or AW_SLIDE Or AW_VER_NEGATIVE );
  End
  Else
  Begin
    AnimateWindow(pnlToolBar.Handle, 400, AW_ACTIVATE Or AW_SLIDE Or AW_VER_POSITIVE );
  End;
  pnlToolBar.Visible := Not pnlToolBar.Visible;
end;

procedure TFrMenuPpal.SpeedButton1Click(Sender: TObject);
Var
  lD : String;
  lT : String;
  lN : String;
begin
//Form_Busqueda_Documento_Show('', lD, lT, lN);
end;

Procedure TFrMenuPpal.Cargar_Configuraciones;
Begin
  Show_Splash;
  Actualiza__Splash('Creando informes predefinidos');
//gVariableGlobal.Armar_Opciones_Informes;
  Actualiza__Splash('Validando opciones de menu');
  gVariableGlobal.Validar_Opciones_Menu;
  Actualiza__Splash('Estableciendo permisos en las opciones de menu');
  Validar_Opciones_Caja;
  gVariableGlobal.Cargar_Variables(gVariableGlobal.USUARIO_ACTUAL, gVariableGlobal.PERFIL_ACTUAL);
  If Vacio(gVariableGlobal.USUARIO_ADMIN) Then
  Begin
    BtnAdmin.Caption := 'No admin';
    BtnAdmin.Hint := 'Ambiente no en modo admin';
  End
  Else
  Begin
    BtnAdmin.Caption := 'Admin';
    BtnAdmin.Hint := 'Ambiente en modo admin';
  End;
  Free_Splash;
End;

procedure TFrMenuPpal.Cascada1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFrMenuPpal.Timer3Timer(Sender: TObject);
begin
  If gVariableGlobal.Version_Demo Then
    Show_Form_Inicio;
end;

procedure TFrMenuPpal.Vertical1Click(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TFrMenuPpal.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrMenuPpal.BtnSessionesClick(Sender: TObject);
begin
  FrMenuPpal.Timer1.Enabled := False;
  If Ingreso_Correcto Then
  Begin
    Cargar_Configuraciones;
    UtCerrarCaja_Pendiente;
  End;
  FrMenuPpal.Timer1.Enabled := True;
end;

Function TFrMenuPpal.Cerrar_Pantallas(pForced : Boolean = False) : Boolean;
Begin
  Result := True;
  If Application.MainForm.MDIChildCount = 0 Then
    Exit;
  Result := pForced Or SiNo('Desea cerrar las pantallas activas?');
  If Result Then
    While Application.MainForm.MDIChildCount > 0 Do
    Begin
      Try
        Application.MainForm.MDIChildren[0].Free;
      Except
        On E : Exception Do
          gVariableGlobal.Add_Log(E, ['Origen', 'TFrMainForm.Cerrar_Pantallas']);
      End;
    End;
End;

procedure TFrMenuPpal.FormActivate(Sender: TObject);
begin
  Self.Menu := MainMenu1;
end;

procedure TFrMenuPpal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  UtCerrarCaja_Pendiente;
  CanClose := SiNo('Está seguro(a) de salir de ' + Trim(Application.Title) + '?');
  If CanClose Then
    Cerrar_Pantallas(True);
end;

procedure TFrMenuPpal.FormCreate(Sender: TObject);
begin
  Application.OnException := Self.OnException;
  Armar_Opciones_Informes;
  Application.OnHelp := Help;
end;

procedure TFrMenuPpal.BtnAbrirCajonClick(Sender: TObject);
begin
  If (gVariableGlobal.TIPO_IMPRESORA = 'Estandard 1') Or Vacio(gVariableGlobal.TIPO_IMPRESORA) Then
    Abrir_Cajon_Monedero
  Else
    UtImpresionAbrir_Cajon(gVariableGlobal.PUERTO_IMPRESORA, gVariableGlobal.TIPO_IMPRESORA);
end;

procedure TFrMenuPpal.BtnAdminClick(Sender: TObject);
Var
  ltmp : String;
  lPerfil : String;
  lPassword : String;
begin
  If Not SiNo('Esta seguro hacer el cambio de usuario') Then
    Exit;
  If Vacio(gVariableGlobal.USUARIO_ADMIN) Then
  Begin
    ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['ID_ADMIN'], ['S'], ['CODIGO_USUARIO'], 'TFrProducto.DsMaestroDataChange', False);
    If Not Vacio(ltmp) Then
    Begin
      lPerfil := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['CODIGO_PERFIL'], 'Form_Entrada');
      lPassword := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['CONTRASENA'], 'Form_Entrada');
      If Show_Form_Contrasena(lPassword) Then
      Begin
        FUSUARIO_ACTUAL := gVariableGlobal.USUARIO_ACTUAL;
        gVariableGlobal.USUARIO_NOMBRE := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['NOMBRE'], 'Form_Entrada');
        gVariableGlobal.Cargar_Variables(ltmp, lPerfil);
        Cargar_Configuraciones;
        gVariableGlobal.USUARIO_ADMIN := ltmp;
        Mensajes('Proceso terminado');
        BtnAdmin.Caption := 'Admin';
        BtnAdmin.Hint := 'Ambiente en modo admin';
      End;
    End
    Else
    Begin
      Mensajes('No ha definido el admin del sistema');
    End;
  End
  Else
  Begin
    lPerfil := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FUSUARIO_ACTUAL], ['CODIGO_PERFIL'], 'Form_Entrada');
    gVariableGlobal.USUARIO_NOMBRE := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FUSUARIO_ACTUAL], ['NOMBRE'], 'Form_Entrada');
    gVariableGlobal.Cargar_Variables(FUSUARIO_ACTUAL, lPerfil);
    Cargar_Configuraciones;
    gVariableGlobal.USUARIO_ADMIN := '';
    BtnAdmin.Caption := 'No admin';
    BtnAdmin.Hint := 'Ambiente no en modo admin';
    Mensajes('Proceso terminado');
  End;
end;

procedure TFrMenuPpal.BtnAyudasClick(Sender: TObject);
begin
  HtmlHelp(Self.Handle, pchar(Application.HelpFile), HH_DISPLAY_TOPIC, 0);
end;

procedure TFrMenuPpal.BtnCalculadoraClick(Sender: TObject);
begin
  WinExec(pAnsichar('calc.exe'), 0);
end;

procedure TFrMenuPpal.BtnConsultarClick(Sender: TObject);
begin
  Form_Consulta_Productos_Show;
end;

Procedure TFrMenuPpal.OnClick_Item(pSender : TObject);
Begin
  If Not (pSender Is TComponent) Then
    Exit;
  If ((pSender As TComponent).Tag = 301) Or ((pSender As TComponent).Tag = 404) Or (Not Pantalla_Activa((pSender As TComponent).Tag)) Then
  Begin
    If (pSender Is TSpeedButton) Then
      gVariableGlobal.Add_Log(['Origen', pSender.ClassName, 'Opcion: ', (pSender As TSpeedButton).Caption])
    Else
      If (pSender Is TMenuItem) Then
        gVariableGlobal.Add_Log(['Origen', pSender.ClassName, 'Opcion: ', (pSender As TMenuItem).Caption]);
    Ejecutar_Opcion((pSender As TComponent).Tag, (pSender As TComponent).Name);
  End;
  pnlToolBar.Align := TAlign.alTop;
End;

end.


