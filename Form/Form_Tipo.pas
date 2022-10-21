unit Form_Tipo;

interface

Function Form_Tipo_Show : Boolean;

implementation
Uses
  uGlobal,
  uConexion,
  Vcl.Forms,
  uTable_Info,
  uManager_Form,
  uManager_Field,
  System.SysUtils;

Type
  TMTipo = Class(TMForm)

  End;

Function Form_Tipo_Show : Boolean;
Var
  lForm : TMTipo;
Begin
  lForm := TMTipo.CreateNew(Application, gMGlobal.CNX, gMTable.Items[Table001_Tipo_Item].TableName, gMTable.Items[Table001_Tipo_Item].Caption);
  lForm.SetMDIChild;
  lForm.PAGE.MRECORD.MField.AddEdit    ('C�digo'          , 'TIPO_ITEM_CODIGO'    , 0, 0, 0, [mfShowGrid], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Nombre'          , 'TIPO_ITEM_NOMBRE'    , 0, 0, 0, [mfShowGrid], []);
  lForm.PAGE.MRECORD.MField.AddComboBox('Id'              , 'TIPO_ITEM_ID'        , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Fecha Inicio'    , 'TIPO_ITEM_FECHAINI'  , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Fecha Final'     , 'TIPO_ITEM_FECHAFIN'  , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Valor Minimo'    , 'TIPO_ITEM_VALORMIN'  , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Valor Maximo'    , 'TIPO_ITEM_VALORMAX'  , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Valor Asignado 1', 'TIPO_ITEM_ASIGNADO01', 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddEdit    ('Valor Asignado 2', 'TIPO_ITEM_ASIGNADO02', 0, 0, 0, [], []);
//  lForm.PAGE.MRECORD.MField.AddImage   ('Imagen'          , 'TIPO_ITEM_IMAGEN'    , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddMemo    ('Informacion'     , 'TIPO_ITEM_INFO'      , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddComboBox('Documento'       , 'TIPO_ITEM_DOCUMENTO' , 0, 0, 0, [], []);
  lForm.PAGE.MRECORD.MField.AddComboBox('Estado'          , 'TIPO_ITEM_ESTADO'    , 0, 0, 0, [], []);

  lForm.Prepare;
  lForm.Show;
//  FreeAndNil(lForm);
End;


end.
