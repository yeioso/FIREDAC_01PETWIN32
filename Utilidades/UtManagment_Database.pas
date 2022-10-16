unit UtManagment_Database;

interface

Uses
  Vcl.StdCtrls,
  System.Classes,
  Generics.Collections;

Type
  TManagment_Database = Class(TObject)
    Name_Instance    : String ;
    ServerName       : String ;
    PathDatabase     : String ;
    DatabaseName     : String ;
    Port             : Integer;
    UserName         : String ;
    Password         : String ;
    Connection       : String ;
    Exists           : Boolean;
  End;

Procedure UtManagment_Database_Load;
Function UtManagment_Database_Save : Boolean;
Procedure UtManagment_Database_Load_ComboBox(pComboBox : TComboBox);
Function UtManagment_Database_Existe(Var pDB : TManagment_Database; Const pName, pServerName, pPathDatabase, pDatabaseName, pUserName, pPassword, pConnection : String; Const pPort : Integer; Const pInsert : Boolean = False) : Boolean;

implementation

Uses
  UtXML,
  Vcl.Forms,
  UtFunciones,
  Criptografia,
  Form_Database,
  System.SysUtils;

Const
  Const_Key = 'DATABASE2015';

Var
  gLista_Database : TList<TManagment_Database>;

Function UtManagment_Database_FileName : String;
Begin
  Result := IncludeTrailingBackslash(ExtractFilePath(GetModuleName(HInstance)));
  Result := IncludeTrailingBackslash(Result + 'config');
  ForceDirectories(Result);
  Result := Result + 'ManagerData.ocx';
End;


Procedure UtManagment_Database_Restart;
Var
  lI : Integer;
Begin
  For lI := 0 To gLista_Database.Count-1 Do
    gLista_Database[lI].Free;
  gLista_Database.Clear;
End;

Procedure UtManagment_Database_Load_ComboBox(pComboBox : TComboBox);
Var
  lI : Integer;
  lItem : TManagment_Database;
Begin
  For lI := 0 To gLista_Database.Count-1 Do
  Begin
    lItem := TManagment_Database.Create;
    lItem.Name_Instance := gLista_Database[lI].Name_Instance;
    lItem.ServerName    := gLista_Database[lI].ServerName;
    lItem.DatabaseName  := gLista_Database[lI].DatabaseName;
    lItem.PathDatabase  := gLista_Database[lI].PathDatabase;
    lItem.Port          := gLista_Database[lI].Port;
    lItem.UserName      := gLista_Database[lI].UserName;
    lItem.Password      := gLista_Database[lI].Password;
    lItem.Connection    := gLista_Database[lI].Connection;
    pComboBox.Items.AddObject(gLista_Database[lI].Name_Instance, lItem);
  End;
End;

Procedure UtManagment_Database_Load;
Var
  lI : Integer;
  lID : Integer;
  lXML : TASEXmlFast;
  lNodo : TASEXmlFastNode;
  lItem : TManagment_Database;
Begin
  UtManagment_Database_Restart;
  If FileExists(UtManagment_Database_FileName) Then
  Begin
    lI := -1;
    lXML := TASEXmlFast.Create;
    lXML.Xml.LoadFromFile(UtManagment_Database_FileName);
    lID := lXML.AsInteger['R000'];
    For lI := 1 To lID Do
    Begin
      lNodo := lXML.GetNode('R' + Justificar(IntToStr(lI), '0', 3));
      If Assigned(lNodo) Then
      Begin
        lItem := TManagment_Database.Create;
        lItem.Name_Instance    := lNodo.AsString ['NAME'        ];
        lItem.ServerName       := lNodo.AsString ['SERVERNAME'  ];
        lItem.PathDatabase     := lNodo.AsString ['PATHDATABASE'];
        lItem.DatabaseName     := lNodo.AsString ['DATABASENAME'];
        lItem.Port             := lNodo.AsInteger['PORT'        ];
        lItem.UserName         := lNodo.AsString ['USERNAME'    ];
        lItem.Password         := lNodo.AsString ['PASSWORD'    ];
        lItem.Connection       := lNodo.AsString ['CONNECTION'  ];
      End;
      gLista_Database.Add(lItem);
    End;
  End;
End;

Function UtManagment_Database_Save : Boolean;
Var
  lI : Integer;
  lXML : TASEXmlFast;
  lNodo : TASEXmlFastNode;
Begin
  Result := False;
  If gLista_Database.Count <= 0 Then
    Exit;
  lXML := TASEXmlFast.Create;
  For lI := 0 To gLista_Database.Count-1 Do
  Begin
    lNodo := lXML.AppendRecord;
    lNodo.AsString ['NAME'        ] := gLista_Database[lI].Name_Instance;
    lNodo.AsString ['SERVERNAME'  ] := gLista_Database[lI].ServerName   ;
    lNodo.AsString ['DATABASENAME'] := gLista_Database[lI].DatabaseName ;
    lNodo.AsString ['PATHDATABASE'] := gLista_Database[lI].PathDatabase ;
    lNodo.AsInteger['PORT'        ] := gLista_Database[lI].Port         ;
    lNodo.AsString ['USERNAME'    ] := gLista_Database[lI].UserName     ;
    lNodo.AsString ['PASSWORD'    ] := gLista_Database[lI].Password     ;
    lNodo.AsString ['CONNECTION'  ] := gLista_Database[lI].Connection   ;
  End;
  lXML.Xml.SaveToFile(UtManagment_Database_FileName);
End;


Function UtManagment_Database_Existe(Var pDB : TManagment_Database; Const pName, pServerName, pPathDatabase, pDatabaseName, pUserName, pPassword, pConnection : String; Const pPort : Integer; Const pInsert : Boolean = False) : Boolean;
Var
  lItem : TManagment_Database;
Begin
  Result := False;
  For lItem In gLista_Database Do
  Begin
    If AnsiUpperCase(Trim(lItem.Name_Instance)) = AnsiUpperCase(Trim(pName)) Then
    Begin
      pDB.Name_Instance := lItem.Name_Instance;
      pDB.ServerName    := lItem.ServerName   ;
      pDB.PathDatabase  := lItem.PathDatabase ;
      pDB.DatabaseName  := lItem.DatabaseName ;
      pDB.Port          := lItem.Port         ;
      pDB.UserName      := lItem.UserName     ;
      pDB.Password      := lItem.Password     ;
      pDB.Connection    := lItem.Connection   ;
      Result := True;
      Break;
    End;
  End;
  If (Not Result) And pInsert Then
  Begin
    pDB.Name_Instance    := pName        ;
    pDB.ServerName       := pServerName  ;
    pDB.DatabaseName     := pDatabaseName;
    pDB.PathDatabase     := pPathDatabase;
    pDB.Port             := pPort        ;
    pDB.UserName         := pUserName    ;
    pDB.Password         := pPassword    ;
    pDB.Connection       := pConnection  ;

    lItem := TManagment_Database.Create;
    lItem.Name_Instance    := pName        ;
    lItem.ServerName       := pServerName  ;
    lItem.DatabaseName     := pDatabaseName;
    lItem.PathDatabase     := pPathDatabase;
    lItem.Port             := pPort        ;
    lItem.UserName         := pUserName    ;
    lItem.Password         := pPassword    ;
    lItem.Connection       := pConnection  ;
    gLista_Database.Add(lItem);
    UtManagment_Database_Save;
  End;
End;

Initialization
  gLista_Database := TList<TManagment_Database>.Create;

Finalization
  UtManagment_Database_Restart;
  gLista_Database.DisposeOf;


end.
