{*******************************************************************}
{                                                                   }
{   Kide2 Editor: GUI for Kitto2                                    }
{                                                                   }
{   Copyright (c) 2012-2017 Ethea S.r.l.                            }
{   ALL RIGHTS RESERVED / TUTTI I DIRITTI RISERVATI                 }
{                                                                   }
{*******************************************************************}
{                                                                   }
{   The entire contents of this file is protected by                }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM ETHEA S.R.L.                                }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}
{                                                                   }
{   Il contenuto di questo file � protetto dalle leggi              }
{   internazionali sul Copyright. Sono vietate la riproduzione, il  }
{   reverse-engineering e la distribuzione non autorizzate di tutto }
{   o parte del codice contenuto in questo file. Ogni infrazione    }
{   sar� perseguita civilmente e penalmente a termini di legge.     }
{                                                                   }
{   RESTRIZIONI                                                     }
{                                                                   }
{   SONO VIETATE, SENZA IL CONSENSO SCRITTO DA PARTE DI             }
{   ETHEA S.R.L., LA COPIA, LA VENDITA, LA DISTRIBUZIONE E IL       }
{   TRASFERIMENTO A TERZI, A QUALUNQUE TITOLO, DEL CODICE SORGENTE  }
{   CONTENUTO IN QUESTO FILE E ALTRI FILE AD ESSO COLLEGATI.        }
{                                                                   }
{   SI FACCIA RIFERIMENTO ALLA LICENZA D'USO PER INFORMAZIONI SU    }
{   EVENTUALI RESTRIZIONI ULTERIORI.                                }
{                                                                   }
{*******************************************************************}
unit KIDE.SendEmailToolDesignerFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, KIDE.EditNodeBaseFrameUnit,
  KIDE.BaseFrameUnit, KIDE.CodeEditorFrameUnit, Vcl.ExtCtrls, Vcl.Tabs,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  EF.Tree,
  KIDE.DataToolDesignerFrameUnit,
  Kitto.Ext.IndyTools, Kitto.Ext.Tools;

type
  TSendEmailToolDesignerFrame = class(TDataToolDesignerFrame)
    SendEmailToolGroupBox: TGroupBox;
    ServerPageControl: TPageControl;
    MessageTabSheet: TTabSheet;
    SMTPTabSheet: TTabSheet;
    SMTPPanel: TPanel;
    _SMTP: TComboBox;
    SMTPLabel: TLabel;
    SMTPHostGroupBox: TGroupBox;
    procedure _SMTPChange(Sender: TObject);
  private
    function GetConfigSMTPNode: TEFNode;
  protected
    procedure CleanupDefaultsToEditNode; override;
    procedure UpdateDesignPanel(const AForce: Boolean); override;
    procedure DesignPanelToEditNode; override;
  public
    class function SuitsNode(const ANode: TEFNode): Boolean; override;
    procedure Init(const ANode: TEFTree); override;
  end;

implementation

{$R *.dfm}

uses
  KIDE.Project,
  Kitto.Config, Kitto.Metadata.Views, Kitto.Ext.Controller,
  KIDE.SendEmailMessageNodeFrameUnit,
  KIDE.ConfigEmailSMTPServerNodeFrameUnit;

{ TDownloadFileToolDesignerFrame }

procedure TSendEmailToolDesignerFrame.CleanupDefaultsToEditNode;
begin
  inherited;
  CleanupTextNode('SMTP', 'Default');
end;

procedure TSendEmailToolDesignerFrame.DesignPanelToEditNode;
begin
  inherited;
  ServerPageControl.ActivePageIndex := 0;
end;

function TSendEmailToolDesignerFrame.GetConfigSMTPNode: TEFNode;
begin
  inherited;
  Result := TProject.CurrentProject.Config.Config.FindNode('Email/SMTP');
end;

procedure TSendEmailToolDesignerFrame.Init(const ANode: TEFTree);
begin
  inherited;
  EmbedEditNodeFrame(MessageTabSheet, TSendEmailMessageNodeFrame,
    EditNode.GetNode('Message', True));
end;

procedure TSendEmailToolDesignerFrame.UpdateDesignPanel(const AForce: Boolean);
var
  LSMTPNode: TEFNode;
begin
  inherited;
  ServerPageControl.ActivePageIndex := 0;
  LSMTPNode := GetConfigSMTPNode;
  if Assigned(LSMTPNode) then
    LSMTPNode.GetChildNames(_SMTP.Items);
  _SMTP.Text := EditNode.GetString('SMTP', 'Default');
  _SMTPChange(_SMTP);
end;

procedure TSendEmailToolDesignerFrame._SMTPChange(Sender: TObject);
var
  Frame: TConfigEmailSMTPServerNodeFrame;
  LConfigNode: TEFNode;
  LSMTPNode: TEFNode;
begin
  inherited;
  if _SMTP.Text <> '' then
  begin
    LSMTPNode := GetConfigSMTPNode;
    if Assigned(LSMTPNode) then
    begin
      LConfigNode := LSMTPNode.FindNode(_SMTP.Text);
      Frame := EmbedEditNodeFrame(SMTPHostGroupBox, TConfigEmailSMTPServerNodeFrame, LConfigNode)
        as TConfigEmailSMTPServerNodeFrame;
      if Assigned(Frame) then
      begin
        Frame.UpdateDesignPanel;
        Frame.Enabled := False;
      end;
    end;
  end;
  IsChanged := True;
end;

class function TSendEmailToolDesignerFrame.SuitsNode(
  const ANode: TEFNode): Boolean;
var
  LControllerClass: TClass;
begin
  Assert(Assigned(ANode));
  LControllerClass := GetControllerClass(ANode);
  Result := Assigned(LControllerClass) and
    LControllerClass.InheritsFrom(TSendEmailToolController);
end;

initialization
  TEditNodeFrameRegistry.Instance.RegisterClass(TSendEmailToolDesignerFrame.GetClassId, TSendEmailToolDesignerFrame);

finalization
  TEditNodeFrameRegistry.Instance.UnregisterClass(TSendEmailToolDesignerFrame.GetClassId);

end.
