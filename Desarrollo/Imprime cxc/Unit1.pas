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
    Timer1: TTimer;
    ComboBox1: TComboBox;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLVendedor: TQRLabel;
    QRShape1: TQRShape;
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
    ' SELECT cl.sector, cl.nombre cliente, p.`inicial` cuota,'+
    ' SUM(c.`InteresPendiente` + c.`CapitalPendiente`) pendiente '+
    ' FROM cliente cl, prestamo p, cuota c, vendedor v '+
    ' WHERE p.cliente=cl.numero AND p.vendedor=v.numero'+
    ' and v.nombre='''+ComboBox1.Text+''''+
    ' AND c.`Prestamo`=p.`Numero`'+
    '  AND p.`Estatus` IN(''original'',''abonado'')'+
    ' AND c.vencimiento<= NOW()'+
    ' AND c.`InteresPendiente` + c.`CapitalPendiente` > 8'+
    ' GROUP BY cl.sector,cl.nombre,p.numero'+
    ' ORDER BY cl.sector, cl.nombre'+
     ''
    ,'abrir');

    QRLVendedor.Caption:=ComboBox1.Text;

     QuickRep1.Print;


     //QuickRep1.Preview;


end;




procedure TForm1.FormCreate(Sender: TObject);
begin
      SENTENCIA(adoquery1,'select nombre from vendedor where comision>0 order by nombre asc','abrir');

      ComboBox1.Clear;
      if adoquery1.RecordCount>0 then
      while not adoquery1.Eof do
      begin
          ComboBox1.Items.Add(ADOQuery1.fieldbyname('nombre').asstring);
          adoquery1.Next;
      end;
end;

end.
