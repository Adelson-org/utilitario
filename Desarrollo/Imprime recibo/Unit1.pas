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
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel40: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel46: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape6: TQRShape;
    QRLabel56: TQRLabel;
    QRDBText33: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRBand2: TQRBand;
    QRShape8: TQRShape;
    Button1: TButton;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    ADOQuery2: TADOQuery;
    QRShape1: TQRShape;
    QRShape7: TQRShape;
    QRLabel55: TQRLabel;
    QRMemo6: TQRMemo;
    QRLabel53: TQRLabel;
    QRShape13: TQRShape;
    QRImage1: TQRImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
var tipopago,estatusprestamo,fechaprestamo,CONCEPTO,metodo,fechapago:string;
r:double;
begin
     

     //esto es para la sumatoria de abajo del recibo
     //y el pendiente para el recibo
    SENTENCIA(adoquery1,
    'select mp.numero mpnume, mp.totalpagado-mp.notadecredito mptota, mp.fecha mpfech, '+
    'mp.notadecredito+mp.descuentointeres mpncre, '+
    'case p.metodo when ''americano'' then mp.capitalpendiente else mp.interespendiente + mp.capitalpendiente end ptota, '+

    'cl.nombre clnomb, cl.sector clsector,cl.direccion cldireccion '+
    ''+
    ''+
    'from maestrodepago mp, prestamo p, cliente cl '+
    'where mp.prestamo=p.numero and cl.numero=p.cliente '+
    'and mp.numero='+recibo
    ,'abrir');






    //preparar el concepto a mostrar en recibo
    SENTENCIA(adoquery2,
    'SELECT p.fecha fecha, P.PLAZO, hp.estatusPrestamo, MP.TIPODEPAGO, MP.TOTALPAGADO, mp.notadecredito,  mp.nota mpnota, '+
    ' dp.concepto,dp.cuota, sum(dp.interes+dp.capital) MONTO, dp.nota,'+
    ' s.nombre sucursal, s.direccion'+
    ' FROM HistorialPago hp, maestrodepago MP, prestamo p, detalledepago dp, sucursal s  '+
    ' WHERE hp.pago=mp.numero and p.numero=mp.prestamo and mp.numero=dp.maestrodepago and mp.NUMERO='+recibo+' and mp.sucursal=s.numero'+
    ' group by dp.cuota'
    ,'abrir');


           if adoquery2.recordcount>0 then//  .FieldByName('numero').Asinteger>0 then
           begin
                qrlabel40.Caption:=adoquery2.FieldByName('sucursal').Asstring;
                qrmemo4.lines.Text :=adoquery2.FieldByName('direccion').Asstring;
                qrmemo6.lines.Text :=adoquery2.FieldByName('mpnota').Asstring;
           end;


      QuickRep1.Print;

end;




procedure TForm1.Timer1Timer(Sender: TObject);
begin

    SENTENCIA(adoquery1,'select numero,nota from maestrodepago order by numero desc limit 1'
    ,'abrir');

    if adoquery1.RecordCount>0 then
    begin
           if (recibo=EmptyStr)
           then  begin
                  recibo:= adoquery1.FieldByName('numero').AsString;
                  abort;
           end;

           if (recibo<> adoquery1.FieldByName('numero').AsString) then
           begin
                  if trim( adoquery1.FieldByName('nota').AsString ) ='0' then
                    abort
                  else
                  begin
                      recibo:= adoquery1.FieldByName('numero').AsString;
                      Button1.Click;
                  end;
           end;

     end;


end;

end.
