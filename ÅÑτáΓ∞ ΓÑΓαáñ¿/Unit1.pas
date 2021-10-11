unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (Key < '0') or (Key > '9') then
 if Key <> '24' then
 if Key <> '' then
 if Key = #13 then Button1Click(Sender)
 else Key:= #0;
if (Key > '0') and (Key < '9') then BitBtn1.Enabled:=True
end;

procedure TForm1.Button1Click(Sender: TObject);
var a,k,i,q,n:integer;
begin
if Edit1.text = '' then Exit;
if (Length(Edit1.text)>4) or (StrtoInt(Edit1.text)>2577)  then
begin
Label2.Caption:= 'Число ' + Edit1.text + 'слишком большое, измените его.';
Edit2.Text:='Первая печать. Обложка.';
Edit3.Text:='Вторая печать. Внутренняя страница.';
StringGrid1.Cols[0].Clear;
StringGrid1.Cols[1].Clear;
StringGrid2.Cols[0].Clear;
StringGrid2.Cols[1].Clear;
Exit;
end;


if StrtoInt(Edit1.text) mod 4 <>0 then
  begin
  Label2.Caption:='Число страниц должно быть кратно 4'+#13+#13;
  for i:=1 to 4 do
   begin
   if (StrtoInt(Edit1.text)-I) mod 4 =0 then
     Label2.Caption:= Label2.Caption + 'Или уменьшите количество страниц до'+FloatToStr(StrtoInt(Edit1.text)-I)+#13+#13;
   if (StrtoInt(Edit1.text)+I) mod 4 =0 then
     Label2.Caption:= Label2.Caption + 'Или увеличьте количество страниц до'+FloatToStr(StrtoInt(Edit1.text)+I)+#13+#13;
   end;
  Exit;
  end;
a:=StrtoInt(Edit1.text);
Label2.Caption:= '  Количество листов ' + floattostr(a/4)+#13+#13;
Label2.Caption:= Label2.Caption + '   В зависимости от механики принтера Вам, возможно, потребуется перевернуть страницы в обратном порядке перед "Второю печатью".';
stringgrid1.RowCount:=a div 4+1;
stringgrid2.RowCount:=a div 4+1;
StringGrid1.Cells[0,0]:='Левая стр.';
StringGrid1.Cells[1,0]:='Права стр.';
StringGrid2.Cells[0,0]:='Левая стр.';
StringGrid2.Cells[1,0]:='Права стр.';


n:=a div 4;
k:=a;

for i:=1 to n+1 do if k>a/2 then
begin
StringGrid1.Cells[0,i]:=inttostr(k);
k:=k-2
end;


k:=1;
for i:=1 to n+1 do if k<a/2 then
begin
StringGrid1.Cells[1,i]:=inttostr(k);
k:=k+2;
end;

k:=2;
for i:=1 to n+1 do if k<=a/2 then
begin
StringGrid2.Cells[0,i]:=inttostr(k);
k:=k+2;
end;


k:=a-1;
for i:=1 to n+1 do if k>a/2 then
begin
StringGrid2.Cells[1,i]:=inttostr(k);
k:=k-2
end;

Edit2.Text:='';
Edit3.Text:='';


for i:=1 to n do
begin
for q:=0 to 1 do
begin
Edit2.Text:=Edit2.Text+StringGrid1.Cells[q,i];
If (i>= n) and (q=1) then Edit2.Text:=Edit2.Text
else  Edit2.Text:=Edit2.Text+',';
end;
end;


for i:=1 to n do
begin
for q:=0 to 1 do
begin
Edit3.Text:=Edit3.Text+StringGrid2.Cells[q,i];
If (i>= n) and (q=1) then Edit3.Text:=Edit3.Text
else  Edit3.Text:=Edit3.Text+',';
end;
end;

// увімкнення елементів

BitBtn2.Enabled:=True;
BitBtn3.Enabled:=True;
Edit2.Enabled:=True;
Edit3.Enabled:=True;
Label3.Enabled:=True;
Label4.Enabled:=True;
StringGrid1.Enabled:=True;
StringGrid2.Enabled:=True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form2.show
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Label2.Caption:= '   Справа находится две таблицы, в которых отображен способ печати:'+#13;
Label2.Caption:= Label2.Caption + ' - каждая таблица представляет собой сторону листа;'+#13;
Label2.Caption:= Label2.Caption + ' - каждая строка представляет собой две половинки страницы. На каждой половине печатается соответствующая страница (номер указан).'+#13+#13;
Label2.Caption:= Label2.Caption + '   Снизу указывается последовательность страниц для печати';

Edit1.Text:='';
Edit2.Text:='Первая печать. Обложка.';
Edit3.Text:='Вторая печать. Внутренняя страница.';
StringGrid1.Cols[0].Clear;
StringGrid1.Cols[1].Clear;
StringGrid2.Cols[0].Clear;
StringGrid2.Cols[1].Clear;
stringgrid1.RowCount:=2;
stringgrid2.RowCount:=2;
BitBtn1.Enabled:=False;
BitBtn2.Enabled:=False;
BitBtn3.Enabled:=False;
Edit2.Enabled:=False;
Edit3.Enabled:=False;
Label3.Enabled:=False;
Label4.Enabled:=False;
StringGrid1.Enabled:=False;
StringGrid2.Enabled:=False;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
edit2.SelectAll;
edit2.CopyToClipboard;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
edit3.SelectAll;
edit3.CopyToClipboard;
end;

end.
