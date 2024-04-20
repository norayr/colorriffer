unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  hald_clut, img : TBitmap;
implementation
   uses haldclut;



{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;

begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := 'PNG Image|*.png';
    if OpenDialog.Execute then
    begin
      hald_clut := TBitmap.Create;
      try
        hald_clut.LoadFromFile(OpenDialog.FileName);
        // Now the PNG is loaded into memory, and you can manipulate it as needed.
        // If you want to display it in an FMX TImage component:
       // Image1.Bitmap.Assign(PNG);
      except
        on E: Exception do
          ShowMessage('Error occurred: ' + E.Message);
      end;
      //hald_clut.Free;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;

begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := 'JPG Image|*.jpg';
    if OpenDialog.Execute then
    begin
      img := TBitmap.Create;
      try
        img.LoadFromFile(OpenDialog.FileName);
        // Now the PNG is loaded into memory, and you can manipulate it as needed.
        // If you want to display it in an FMX TImage component:
        Image1.Bitmap.Assign(img);
      except
        on E: Exception do
          ShowMessage('Error occurred: ' + E.Message);
      end;
      //img.Free;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  haldclut.apply(img, hald_clut);
  Image1.Bitmap.Assign(img);
end;

end.
