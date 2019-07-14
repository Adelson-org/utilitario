unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, QRCtrls, QuickRpt, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel40: TQRLabel;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    Button1: TButton;
    ADOQuery2: TADOQuery;
    ComboBox1: TComboBox;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRFormapago: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

end.
