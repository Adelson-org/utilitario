unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, QRCtrls, QuickRpt, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel40: TQRLabel;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    ADOQuery2: TADOQuery;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRFormapago: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Prestamo_edit: TEdit;
    Label1: TLabel;
    Sumar_Button: TButton;
    Label2: TLabel;
    Monto_edit: TEdit;
    Restar_button: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sumar_ButtonClick(Sender: TObject);
    procedure Restar_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  recibo:string;

implementation

{$R *.dfm}


//ESCRIBE SENTENCIA SQL
procedure SENTENCIA(Adoquery:TAdoquery; sentencia2:AnsiString; accion:string);
BEGIN
     with Adoquery do
     BEGIN          //LA ACCION ES PARA PONER EL OPEN; O EXECSQL;
        Close;
        SQL.Clear;

        SQL.Add(ansiUpperCase(sentencia2));
        if UpperCase(ACCION)='ABRIR' then Open else
        if UpperCase(ACCION)='EJECUTAR' then ExecSql else
        if UpperCase(ACCION)='NINGUNA' then
     end
end;






procedure TForm1.Button1Click(Sender: TObject);
begin

    SENTENCIA(adoquery1,' '+
    ' SELECT e.nombre empleador, cl.nombre cliente, p.`inicial` cuota '+
    ' FROM cliente cl, empleador e, prestamo p'+
    ' WHERE p.cliente=cl.numero and cl.empleador=e.numero '+
    ' and LOWER(trim(cl.referencia))='''+LowerCase( ComboBox1.Text )+''''+
    ' AND p.`Estatus` IN(''original'',''abonado'') '+
    ' GROUP BY e.nombre,cl.nombre,p.numero '+
    ' ORDER BY e.nombre, cl.nombre '+
     ''
    ,'abrir');

    QRFormapago.Caption:=ComboBox1.Text;

     QuickRep1.Print;


     //QuickRep1.Preview;


end;




procedure TForm1.FormCreate(Sender: TObject);
begin
       {
      SENTENCIA(adoquery1,'select nombre from vendedor where comision>0 order by nombre asc','abrir');

      ComboBox1.Clear;
      if adoquery1.RecordCount>0 then
      while not adoquery1.Eof do
      begin
          ComboBox1.Items.Add(ADOQuery1.fieldbyname('nombre').asstring);
          adoquery1.Next;
      end;
      }
end;

procedure TForm1.Sumar_ButtonClick(Sender: TObject);
var ultimo:string;
begin
     ultimo:=EmptyStr;


           try
              StrToFloat(Monto_edit.Text);
           except on E : Exception do
           begin
              ShowMessage('Monto invalido : '+E.Message);
              Monto_edit.SetFocus;
              abort;
           end;
           end;

      SENTENCIA(adoquery2,'select registro as ultimo  from cuota where prestamo='''+Prestamo_edit.Text+''' and estatus in(''original'',''abonada'')  order by numero desc','abrir');
      ultimo:=ADOQuery2.fieldbyname('ultimo').asstring;

      if(ultimo=EmptyStr)  then
      begin
          ShowMessage('El prestamo no encontrado') ;
          Prestamo_edit.setfocus;
          abort;
      end;

      SENTENCIA(adoquery2,'update cuota set capital=capital+ '''+Monto_edit.Text+''' where registro='''+ultimo+'''   ','ejecutar');

      ShowMessage('Capital sumado') ;
      Prestamo_edit.Clear;
      Monto_edit.Clear;
      Prestamo_edit.SetFocus;

end;

procedure TForm1.Restar_buttonClick(Sender: TObject);
var ultimo:string;
begin
     ultimo:=EmptyStr;


           try
              StrToFloat(Monto_edit.Text);
           except on E : Exception do
           begin
              ShowMessage('Monto invalido : '+E.Message);
              Monto_edit.SetFocus;
              abort;
           end;
           end;

      SENTENCIA(adoquery2,'select registro as ultimo  from cuota where prestamo='''+Prestamo_edit.Text+''' and estatus in(''original'',''abonada'')  order by numero desc','abrir');
      ultimo:=ADOQuery2.fieldbyname('ultimo').asstring;

      if(ultimo=EmptyStr)  then
      begin
          ShowMessage('El prestamo no encontrado') ;
          Prestamo_edit.setfocus;
          abort;
      end;

      SENTENCIA(adoquery2,'update cuota set capital=capital- '''+Monto_edit.Text+''' where registro='''+ultimo+'''   ','ejecutar');


      ShowMessage('Capital restado') ;
      Prestamo_edit.Clear;
      Monto_edit.Clear;
      Prestamo_edit.SetFocus;



end;






end.
