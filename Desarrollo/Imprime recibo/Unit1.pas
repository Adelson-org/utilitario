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
    Edit_recibo: TEdit;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Edit_reciboEnter(Sender: TObject);
    procedure Edit_reciboKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  recibo,prestamo,metodo:string;

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
var tipopago,estatusprestamo,fechaprestamo,CONCEPTO,fechapago,en_atraso:string;
r:double;
begin

     //si se entro al campo de recibo y se escribio un numero de recibo
     if(not(timer1.Enabled)) and (trim(Edit_recibo.Text)<>EmptyStr) then
     begin
          recibo:=trim(Edit_recibo.Text);
     end;


    //estos son los datos del recibo
    SENTENCIA(adoquery1,
    'select mp.numero mpnume, mp.efectivo+mp.comision efectivo, mp.capital,  mp.totalpagado totalpagado, mp.fecha fecha, mp.nota, '+
    'mp.notadecredito+mp.descuentointeres mpncre, '+
    'case p.metodo when ''americano'' then mp.capitalpendiente else mp.interespendiente + mp.capitalpendiente end totalpendiente, '+

    'cl.nombre clnomb, cl.sector clsector,cl.direccion cldireccion, '+

    ' p.metodo, p.fechainicio '+

    ' '+
    ''+
    ''+

    ''+
    'from maestrodepago mp, prestamo p, cliente cl '+
    'where mp.prestamo=p.numero and cl.numero=p.cliente '+
    'and mp.numero='+recibo
    ,'abrir');


    //cuotas en atrasos
    SENTENCIA(adoquery2,
    'SELECT count(c.numero) cuotas '+
    ' from cuota c where c.vencimiento <= now() and c.estatus in(''abonada'',''original'') and c.prestamo='''+prestamo+''''+
    ' group by c.prestamo '+
    '','abrir');

     en_atraso :='0';
     if adoquery2.recordcount>0 then//  .FieldByName('numero').Asinteger>0 then
     begin
         en_atraso :=adoquery2.FieldByName('cuotas').AsString;
     end;



    //preparar el concepto a mostrar en recibo
    SENTENCIA(adoquery2,
    'SELECT c.estatus estatus, '+
    ' (select count(numero) from cuota where prestamo=c.prestamo and estatus=''saldada'' ) cuota, '+
    ' (select  plazo from prestamo where numero=c.prestamo ) plazo, '+
    ' (select  METODO from prestamo where numero=c.prestamo ) METODO '+
    ' from cuota c where c.estatus in(''saldada'',''abonada'') and c.prestamo='''+prestamo+''''+
    ' group by c.prestamo '+
    '','abrir');


    
     qrmemo6.lines.Clear;
     if(Timer1.Enabled) then
     begin
            if adoquery2.recordcount>0 then
            begin
                  if(UpperCase( adoquery2.FieldByName('METODO').Asstring) <>'AMERICANO')   then
                  //if(UpperCase( adoquery2.FieldByName('estatus').Asstring) ='ABONADA')   then
                  begin
                       qrmemo6.lines.Text :='Has pagado '+adoquery2.FieldByName('cuota').AsString +' cuotas de '+adoquery2.FieldByName('plazo').Asstring +' y tienes '+en_atraso+' en atraso';
                  end ;
                 { else
                  begin
                       qrmemo6.lines.Text :='Has pagado '+inttostr( adoquery2.FieldByName('cuota').AsInteger -1 ) +' cuotas de '+adoquery2.FieldByName('plazo').Asstring +' y tienes '+en_atraso+' en atraso';
                  end;
                  }
            end else
            begin
                 qrmemo6.lines.Text :='Has saldado su prestamo #'+prestamo;
            end;
     end else qrmemo6.lines.Text:= ADOQuery1.fieldbyname('nota').AsString;


     //la pongo mayuscula la nota
     qrmemo6.lines.Text:=UpperCase(qrmemo6.lines.Text);


    metodo:=ADOQuery1.fieldbyname('metodo').AsString;




     //si el timer esta apagado, encenderlo, para que siga automatico
     if(timer1.Enabled) then
     begin
           SENTENCIA(adoquery2,'update maestrodepago set nota='''+qrmemo6.lines.Text+''' where numero='''+recibo+'''  '+
          '','ejecutar');

     end else
     begin
          Edit_recibo.Text:=EmptyStr;
          timer1.Enabled:=true;
          recibo:=EmptyStr;
     end;




      QuickRep1.Print;

end;




procedure TForm1.Timer1Timer(Sender: TObject);
begin

    SENTENCIA(adoquery1,'select numero,efectivo,capital,comision,prestamo from maestrodepago order by numero desc limit 1'
    ,'abrir');

    if adoquery1.RecordCount>0 then
    begin
           if (recibo=EmptyStr)
           then  begin
                  recibo:= adoquery1.FieldByName('numero').AsString;
                  prestamo:= adoquery1.FieldByName('prestamo').AsString;
                  abort;
           end;

           //imprime, si el recibo que se grabó, no se ha impreso
           if (recibo<> adoquery1.FieldByName('numero').AsString) then
           begin
                  //imprime, sino es un descuento con nota de credito
                  if (adoquery1.FieldByName('efectivo').AsFloat > 0 )or
                     (adoquery1.FieldByName('capital').AsFloat > 0) or
                     (adoquery1.FieldByName('comision').AsFloat > 0) then
                  begin
                      recibo:= adoquery1.FieldByName('numero').AsString;
                      prestamo:= adoquery1.FieldByName('prestamo').AsString;


                      Button1.Click;

                  end;
           end;

     end;


end;

procedure TForm1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
       if UpperCase(metodo)='AMERICANO' then
        begin
            QRLabel56.Caption:='Interes recibido:'   ;
            QRDBText33.DataField:='efectivo';

            QRLabel46.Caption:='Capital recibido:'   ;
            QRDBText27.DataField:='capital';

            QRLabel51.Caption:='Capital pendiente:'   ;
        end else
        begin
             QRLabel56.Caption:='Total pagado:'   ;
             QRDBText33.DataField:='totalpagado';

             QRLabel46.Caption:='Descuento:'   ;
             QRDBText27.DataField:='mpncre';

             QRLabel51.Caption:='Total pendiente:'   ;




        end;

end;

procedure TForm1.Edit_reciboEnter(Sender: TObject);
begin
       timer1.Enabled:=false;
end;

procedure TForm1.Edit_reciboKeyPress(Sender: TObject; var Key: Char);
begin
      if(key=#13) then
      begin
          Button1.Click;
      end;
end;

end.
