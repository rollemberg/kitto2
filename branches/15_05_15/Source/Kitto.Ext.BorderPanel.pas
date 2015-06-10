{-------------------------------------------------------------------------------
   Copyright 2012 Ethea S.r.l.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-------------------------------------------------------------------------------}

unit Kitto.Ext.BorderPanel;

{$I Kitto.Defines.inc}

interface

uses
  SysUtils,
  Ext,
  EF.Tree,
  Kitto.Ext.Base, Kitto.Ext.Controller;

type
  TKExtBorderPanelController = class;

  TKExtBorderPanelControllerClass = class of TKExtBorderPanelController;

  TKExtBorderPanelController = class(TKExtPanelControllerBase)
  private
    FControllers: array[TExtBoxComponentRegion] of TObject;
    procedure CreateController(const ARegion: TExtBoxComponentRegion);
    function FindRegionControllerConfig(const ARegion: TExtBoxComponentRegion): TEFNode;
  protected
    procedure DoDisplay; override;
  public
    class function GetRegionDefaultControllerClass(const ARegion: TExtBoxComponentRegion): string; virtual;
    class function GetRegionName(const ARegion: TExtBoxComponentRegion): string; virtual;
    class function GetRegionViewNodeName(const ARegion: TExtBoxComponentRegion): string; virtual;
    class function GetRegionControllerNodeName(const ARegion: TExtBoxComponentRegion): string; virtual;
  end;

implementation

uses
  TypInfo,
  EF.Intf, EF.StrUtils,
  Kitto.Ext.Session, Kitto.Metadata.Views;

{ TKExtBorderPanelController }

class function TKExtBorderPanelController.GetRegionName(const ARegion: TExtBoxComponentRegion): string;
begin
  Result := StripPrefix(GetEnumName(TypeInfo(TExtBoxComponentRegion), Ord(ARegion)), 'rg');
end;

class function TKExtBorderPanelController.GetRegionViewNodeName(const ARegion: TExtBoxComponentRegion): string;
begin
  Result := GetRegionName(ARegion) + 'View';
end;

class function TKExtBorderPanelController.GetRegionControllerNodeName(const ARegion: TExtBoxComponentRegion): string;
begin
  Result := GetRegionName(ARegion) + 'Controller';
end;

class function TKExtBorderPanelController.GetRegionDefaultControllerClass(
  const ARegion: TExtBoxComponentRegion): string;
begin
  Result := '';
end;

function TKExtBorderPanelController.FindRegionControllerConfig(
  const ARegion: TExtBoxComponentRegion): TEFNode;
var
  LRegionControllerNodeName: string;
  LRegionDefaultControllerClass: string;
begin
  LRegionControllerNodeName := GetRegionControllerNodeName(ARegion);
  LRegionDefaultControllerClass := GetRegionDefaultControllerClass(ARegion);
  Assert(LRegionControllerNodeName <> '');
  Result := Config.FindNode(LRegionControllerNodeName);
  if not Assigned(Result) then
  begin
    LRegionControllerNodeName := TKExtBorderPanelController.GetRegionControllerNodeName(ARegion);
    Assert(LRegionControllerNodeName <> '');
    Result := Config.FindNode(LRegionControllerNodeName);
    if not Assigned(Result) then
    begin
      LRegionControllerNodeName := GetRegionControllerNodeName(ARegion);
      if LRegionDefaultControllerClass <> '' then
        Result := TEFNode.Create(LRegionControllerNodeName, LRegionDefaultControllerClass);
    end;
  end
  else
  begin
    if Result.Value = '' then
      Result.Value := LRegionDefaultControllerClass;
  end;
end;

procedure TKExtBorderPanelController.CreateController(const ARegion: TExtBoxComponentRegion);
var
  LSubView: TKView;
  LControllerConfig: TEFNode;
  LIntf: IKExtController;
begin
  Assert(Assigned(View));

  // If subcontrollers are specified, they inherit this controller's view.
  // If no subcontroller is configured for a given region, look for a subview.
  LControllerConfig := FindRegionControllerConfig(ARegion);
  if Assigned(LControllerConfig) then
  begin
    LSubView := View;
  end
  else
    LSubView := Session.Config.Views.FindViewByNode(Config.FindNode(GetRegionViewNodeName(ARegion)));
  if LSubView <> nil then
  begin
    FControllers[ARegion] := TKExtControllerFactory.Instance.CreateController(Self, LSubView, Self, LControllerConfig).AsObject;
    Assert(FControllers[ARegion] is TExtBoxComponent);
    TExtBoxComponent(FControllers[ARegion]).Region := ARegion;
    if Supports(FControllers[ARegion], IKExtController, LIntf) then
      InitSubController(LIntf);
    LIntf.Display;
  end;
end;

procedure TKExtBorderPanelController.DoDisplay;
var
  I: TExtBoxComponentRegion;
begin
  inherited;
  Layout := lyBorder;
  for I := Low(FControllers) to High(FControllers) do
    CreateController(I);
end;

initialization
  TKExtControllerRegistry.Instance.RegisterClass('BorderPanel', TKExtBorderPanelController);

finalization
  TKExtControllerRegistry.Instance.UnregisterClass('BorderPanel');

end.
