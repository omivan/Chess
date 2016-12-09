unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
      procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure DrawRects(row:Integer;col:Integer);
  end;

var
   img: array[1..14] of TBitmap;
  i,j,x,y:integer;
  pers,buf:TBitmap;
  path:string;
   wPole:Integer=15;
  hPole:Integer=10;
  min,sec,col,row:Integer;

  xShape:Integer;
  yShape:Integer;
  myMouseDown :Boolean=False;
  myMouseMove: Boolean=False;

  map: array[1..10,1..15] of Integer=
  ( (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,2,0,0,0,0,0,0,2,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,8,0,0,0,0,0,0),
    (0,0,0,0,8,0,4,0,0,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,2,0,0,0,0,0,0,2,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  );
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Timer1Timer(Sender: TObject);
begin
if map[y div 65+1,x div 65 +1 ]=2
  then map[y div 65+1,x div 65 +1 ]:=0;

  for j:=0 to hPole-1 do
    for i:=0 to wPole-1 do
    begin
        buf.Canvas.Draw(i*65,j*65,img[14]);//fon
      if map[j+1,i+1]=2
     then  buf.Canvas.Draw(i*65,j*65,img[6]);

    end;
  buf.Canvas.Draw(x,y,pers);
  for j:=0 to hPole-1 do
    for i:=0 to wPole-1 do
    begin
    if map[j+1,i+1]=2
     then  buf.Canvas.Draw(i*65,j*65,img[2]);
     if map[j+1,i+1]=3
     then  buf.Canvas.Draw(i*65,j*65,img[3]);
     if map[j+1,i+1]=4
     then  buf.Canvas.Draw(i*65,j*65,img[4]);
     if map[j+1,i+1]=5
     then  buf.Canvas.Draw(i*65,j*65,img[5]);
     if map[j+1,i+1]=6
     then  buf.Canvas.Draw(i*65,j*65,img[6]);
     if map[j+1,i+1]=7
     then  buf.Canvas.Draw(i*65,j*65,img[7]);
     if map[j+1,i+1]=8
     then  buf.Canvas.Draw(i*65,j*65,img[8]);
     if map[j+1,i+1]=9
     then  buf.Canvas.Draw(i*65,j*65,img[9]);
     if map[j+1,i+1]=10
     then  buf.Canvas.Draw(i*65,j*65,img[10]);
     if map[j+1,i+1]=11
     then  buf.Canvas.Draw(i*65,j*65,img[11]);
     if map[j+1,i+1]=12
     then  buf.Canvas.Draw(i*65,j*65,img[12]);
    end;

    if myMouseMove
    then buf.Canvas.Draw(xShape-32,yShape-32,img[map[row,col]]);

  //buf.Canvas.Draw(2*65,2*65,img[6]);
  Form1.Canvas.Draw(0,0,buf);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 x:=0;
  y:=0;
  path:=ExtractFileDir(Application.ExeName) ;

   min:=5;
   sec:=0;
   // hou:=0;
    img[1]:=TBitmap.Create;
    img[1].TransparentColor:=clWhite;
    img[1].Transparent:=True;
    img[1].LoadFromFile(path+'/img/doska.bmp'); //1
      img[2]:=TBitmap.Create;
    img[2].TransparentColor:=clWhite;
    img[2].Transparent:=True;
    img[2].LoadFromFile(path+'/img/ferzB.bmp'); //2
      img[3]:=TBitmap.Create;
    img[3].TransparentColor:=clWhite;
    img[3].Transparent:=True;
    img[3].LoadFromFile(path+'/img/ferzW.bmp'); //3
      img[4]:=TBitmap.Create;
    img[4].TransparentColor:=clWhite;
    img[4].Transparent:=True;
    img[4].LoadFromFile(path+'/img/konB.bmp'); //4
      img[5]:=TBitmap.Create;
    img[5].TransparentColor:=clWhite;
    img[5].Transparent:=True;
    img[5].LoadFromFile(path+'/img/konW.bmp'); //5
      img[6]:=TBitmap.Create;
    img[6].TransparentColor:=clWhite;
    img[6].Transparent:=True;
    img[6].LoadFromFile(path+'/img/korolB.bmp'); //6
      img[7]:=TBitmap.Create;
    img[7].TransparentColor:=clWhite;
    img[7].Transparent:=True;
    img[7].LoadFromFile(path+'/img/korolW.bmp'); //7
      img[8]:=TBitmap.Create;
    img[8].TransparentColor:=clWhite;
    img[8].Transparent:=True;
    img[8].LoadFromFile(path+'/img/ladiaW.bmp'); //8
      img[9]:=TBitmap.Create;
    img[9].TransparentColor:=clWhite;
    img[9].Transparent:=True;
    img[9].LoadFromFile(path+'/img/lagiaB.bmp'); //9
      img[10]:=TBitmap.Create;
    img[10].TransparentColor:=clWhite;
    img[10].Transparent:=True;
    img[10].LoadFromFile(path+'/img/peshkaB.bmp'); //10
      img[11]:=TBitmap.Create;
    img[11].TransparentColor:=clWhite;
    img[11].Transparent:=True;
    img[11].LoadFromFile(path+'/img/peshkaW.bmp'); //11
      img[12]:=TBitmap.Create;
    img[12].TransparentColor:=clWhite;
    img[12].Transparent:=True;
    img[12].LoadFromFile(path+'/img/slonB.bmp'); //12
      img[13]:=TBitmap.Create;
    img[13].TransparentColor:=clWhite;
    img[13].Transparent:=True;
    img[13].LoadFromFile(path+'/img/slonW.bmp'); //13
      img[14]:=TBitmap.Create;
    img[14].TransparentColor:=clWhite;
    img[14].Transparent:=True;
    img[14].LoadFromFile(path+'/img/fon.bmp'); //14


  pers:=img[1];     //doska
  buf:=TBitmap.Create;
  Form1.ClientWidth:=wPole*65;
  Form1.ClientHeight:=hPole*65;
  buf.Width:=Form1.ClientWidth;
  buf.Height:=Form1.ClientHeight;
end;



procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
  col:=x div 65+1;
  row:=y div 65+1;
  Canvas.TextOut(10,10,'map['+IntToStr(row-1)+', '+IntToStr(col-1)+']='+IntToStr(MAP[row,col]));
  if (map[row,col]<>0) and  (col<=9)   and  (col>=2)
  then begin
    DrawRects(row,col);
  end;
  myMouseDown:=True;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//
  xShape:=x;
  yShape:=y;
  if myMouseDown
  then myMouseMove:=True;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
  myMouseDown :=False;
  myMouseMove :=False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);


begin
  sec:=sec-1;
  if sec=-1
  then begin
    min:=min-1;
    sec:=59;
  end;
  label1.Caption:=(IntToStr(min)+':'+IntToStr(sec));
  if (min=0) and (sec=0)
  then begin
    Timer2.Enabled:=False;
    ShowMessage('Lose');
  end ;
end;

procedure TForm1.DrawRects( row,col: Integer);
var
  por,kor:Integer;
begin
  Canvas.Brush.Style:=bsClear;
  Canvas.Pen.Width:=4 ;
  
  // Конь
  if map[col,row]=4
  then  begin
  //Canvas.Rectangle(col*65,row*65,col*65+65,row*65+65);
   Canvas.Rectangle((col-1)*65,(row-1)*65,(col-1)*65+65,(row-1)*65+65);

  end;

 // Ладья

  if map[row,col]=8
  then  begin
    for kor:= 1 to 8 do
    begin
     Canvas.Rectangle((col-1)*65,kor*65,(col-1)*65+65,kor*65+65);
     Canvas.Rectangle(kor*65,(row-1)*65,kor*65+65,(row-1)*65+65);

    end;
  end;
   Canvas.Rectangle((col-1)*65,(row-1)*65,(col-1)*65+65,(row-1)*65+65);

 end;
end.
