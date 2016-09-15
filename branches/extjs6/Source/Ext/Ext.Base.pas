unit Ext.Base;

interface

uses
  Classes, StrUtils, Ext.Util, Kitto.Ext, Kitto.JS.Types;

type
  TExtKeyMap = class;
  TExtFx = class;
  TExtLoaderSingleton = class;
  TExtKeyNav = class;
  TExtFlashProxySingleton = class;
  TExtEventManagerSingleton = class;
  TExtError = class;
  TExtProgressWaitConfig = class;
  TExtEventObjectSingleton = class;
  TExtLoadMask = class;
  TExtSplitBarBasicLayoutAdapter = class;
  TExtTemplate = class;
  TExtUpdaterBasicRenderer = class;
  TExtShadow = class;
  TExtShowConfig = class;
  TExtMessageBoxSingleton = class;
  TExtQuickTipsSingleton = class;
  TExtWindowGroup = class;
  TExtElement = class;
  TExtBackground = class;
  TExtBorder = class;
  TExtFont = class;
  TExtDataTip = class;
  TExtCompositeElementLite = class;
  TFusionCharts = class;
  TExtDomHelperSingleton = class;
  TExtAction = class;
  TExtDirectTransaction = class;
  TExtSplitBar = class;
  TExtResizable = class;
  TExtSplitBarAbsoluteLayoutAdapter = class;
  TExtUpdater = class;
  TExtComponent = class;
  TExtLayer = class;
  TExtCompositeElement = class;
  TExtWindowMgrSingleton = class;
  TExtXTemplate = class;
  TExtEditor = class;
  TExtColorPalette = class;
  TExtDatePicker = class;
  TExtBoxComponent = class;
  TExtToolbarItem = class;
  TExtFlashComponent = class;
  TExtProgressBar = class;
  TExtSpacer = class;
  TExtContainer = class;
  TExtButton = class;
  TExtDataView = class;
  TExtViewport = class;
  TExtPanel = class;
  TExtSplitButton = class;
  TExtToolbarSpacer = class;
  TExtToolbarTextItem = class;
  TExtToolbar = class;
  TExtToolbarSeparator = class;
  TExtTip = class;
  TExtToolbarFill = class;
  TExtButtonGroup = class;
  TExtCycleButton = class;
  TExtWindow = class;
  TExtTabPanel = class;
  TExtPagingToolbar = class;
  TExtToolTip = class;
  TExtQuickTip = class;
  TExtFormField = TExtBoxComponent;
  TExtMenuCheckItem = TExtComponent;
  TExtMenuMenu = TExtContainer;
  TExtDirectProvider = TExtUtilObservable;
  TExtDataStore = TExtUtilObservable;
  TExtDataConnection = TExtUtilObservable;
  TExtDataRecord = TExtObject;

  TExtKeyMap = class(TExtFunction)
  private
    FStopEvent: Boolean;
    procedure SetFStopEvent(Value: Boolean);
  public
    class function JSClassName: string; override;

    function AddBinding(Config: TExtObject = nil): TExtFunction; overload;
    function AddBinding(Config: TExtObjectList): TExtFunction; overload;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function IsEnabled: TExtFunction;
    function &On(Key: Integer; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function &On(Key: TExtObjectList; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function &On(Key: TExtObject; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function SetDisabled(Disabled: Boolean): TExtFunction;
    property StopEvent: Boolean read FStopEvent write SetFStopEvent;
  end;

  TExtFx = class(TExtFunction)
  private
    FAfterCls: string;
    FAfterStyle: string;
    FAfterStyleObject: TExtObject;
    FAfterStyleFunction: TExtFunction;
    FBlock: Boolean;
    FCallback: TExtFunction;
    FConcurrent: Boolean;
    FDuration: Integer;
    FEasing: string;
    FEndOpacity: Integer;
    FRemove: Boolean;
    FScope: TExtObject;
    FStopFx: Boolean;
    FUseDisplay: Boolean;
    procedure SetFAfterCls(Value: string);
    procedure SetFAfterStyle(Value: string);
    procedure SetFAfterStyleObject(Value: TExtObject);
    procedure SetFAfterStyleFunction(Value: TExtFunction);
    procedure SetFBlock(Value: Boolean);
    procedure SetFCallback(Value: TExtFunction);
    procedure SetFConcurrent(Value: Boolean);
    procedure SetFDuration(Value: Integer);
    procedure SetFEasing(Value: string);
    procedure SetFEndOpacity(Value: Integer);
    procedure SetFRemove(Value: Boolean);
    procedure SetFScope(Value: TExtObject);
    procedure SetFStopFx(Value: Boolean);
    procedure SetFUseDisplay(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function FadeIn(Options: TExtObject = nil): TExtFunction;
    function FadeOut(Options: TExtObject = nil): TExtFunction;
    function Frame(Color: string = ''; Count: Integer = 0; Options: TExtObject = nil)
      : TExtFunction;
    function Ghost(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
    function HasActiveFx: TExtFunction;
    function HasFxBlock: TExtFunction;
    function Highlight(Color: string = ''; Options: TExtObject = nil): TExtFunction;
    function Pause(Seconds: Integer): TExtFunction;
    function Puff(Options: TExtObject = nil): TExtFunction;
    function Scale(Width: Integer; Height: Integer; Options: TExtObject = nil)
      : TExtFunction;
    function SequenceFx: TExtFunction;
    function Shift(Options: TExtObject): TExtFunction;
    function SlideIn(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
    function SlideOut(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
    function StopFx_: TExtFunction;
    function SwitchOff(Options: TExtObject = nil): TExtFunction;
    function SyncFx: TExtFunction;
    property AfterCls: string read FAfterCls write SetFAfterCls;
    property AfterStyle: string read FAfterStyle write SetFAfterStyle;
    property AfterStyleObject: TExtObject read FAfterStyleObject
      write SetFAfterStyleObject;
    property AfterStyleFunction: TExtFunction read FAfterStyleFunction
      write SetFAfterStyleFunction;
    property Block: Boolean read FBlock write SetFBlock;
    property Callback: TExtFunction read FCallback write SetFCallback;
    property Concurrent: Boolean read FConcurrent write SetFConcurrent;
    property Duration: Integer read FDuration write SetFDuration;
    property Easing: string read FEasing write SetFEasing;
    property EndOpacity: Integer read FEndOpacity write SetFEndOpacity;
    property Remove: Boolean read FRemove write SetFRemove;
    property Scope: TExtObject read FScope write SetFScope;
    property StopFx: Boolean read FStopFx write SetFStopFx;
    property UseDisplay: Boolean read FUseDisplay write SetFUseDisplay;
  end;

  TExtLoaderSingleton = class(TExtFunction)
  private
    FVarJS: TExtObject;
    FVarJS_: TExtObject;
    procedure SetFVarJS(Value: TExtObject);
    procedure SetFVarJS_(Value: TExtObject);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Load(FileList: TExtObjectList; Callback: TExtFunction; Scope: TExtObject;
      PreserveOrder: Boolean): TExtFunction;
    property VarJS: TExtObject read FVarJS write SetFVarJS;
    property VarJS_: TExtObject read FVarJS_ write SetFVarJS_;
  end;

  TExtKeyNav = class(TExtFunction)
  private
    FDefaultEventAction: string; // 'stopEvent'
    FDisabled: Boolean;
    FForceKeyDown: Boolean;
    procedure SetFDefaultEventAction(Value: string);
    procedure _SetDisabled(const AValue: Boolean);
    procedure SetFForceKeyDown(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function SetDisabled(const ADisabled: Boolean): TExtFunction;
    property DefaultEventAction: string read FDefaultEventAction
      write SetFDefaultEventAction;
    property Disabled: Boolean read FDisabled write _SetDisabled;
    property ForceKeyDown: Boolean read FForceKeyDown write SetFForceKeyDown;
  end;

  TExtFlashProxySingleton = class(TExtFunction)
  public
    class function JSClassName: string; override;
  end;

  TExtEventManagerSingleton = class(TExtFunction)
  private
    FFireDocReady: TExtObject;
    FIeDeferSrc: TExtObject;
    FTextResizeInterval: TExtObject;
    procedure SetFFireDocReady(Value: TExtObject);
    procedure SetFIeDeferSrc(Value: TExtObject);
    procedure SetFTextResizeInterval(Value: TExtObject);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    class function A: Integer;
    class function ALT: Integer;
    class function B: Integer;
    class function BACKSPACE: Integer;
    class function C: Integer;
    class function CAPS_LOCK: Integer;
    class function CONTEXT_MENU: Integer;
    class function CTRL: Integer;
    class function D: Integer;
    class function DELETE: Integer;
    class function DOWN: Integer;
    class function E: Integer;
    class function EIGHT: Integer;
    class function ENDJS: Integer;
    class function ENTER: Integer;
    class function ESC: Integer;
    class function F: Integer;
    class function F1: Integer;
    class function F10: Integer;
    class function F11: Integer;
    class function F12: Integer;
    class function F2: Integer;
    class function F3: Integer;
    class function F4: Integer;
    class function F5: Integer;
    class function F6: Integer;
    class function F7: Integer;
    class function F8: Integer;
    class function F9: Integer;
    class function FIVE: Integer;
    class function FOUR: Integer;
    class function G: Integer;
    class function H: Integer;
    class function HOME: Integer;
    class function I: Integer;
    class function INSERT: Integer;
    class function J: Integer;
    class function K: Integer;
    class function L: Integer;
    class function LEFT: Integer;
    class function M: Integer;
    class function N: Integer;
    class function NINE: Integer;
    class function NUM_CENTER: Integer;
    class function NUM_DIVISION: Integer;
    class function NUM_EIGHT: Integer;
    class function NUM_FIVE: Integer;
    class function NUM_FOUR: Integer;
    class function NUM_MINUS: Integer;
    class function NUM_MULTIPLY: Integer;
    class function NUM_NINE: Integer;
    class function NUM_ONE: Integer;
    class function NUM_PERIOD: Integer;
    class function NUM_PLUS: Integer;
    class function NUM_SEVEN: Integer;
    class function NUM_SIX: Integer;
    class function NUM_THREE: Integer;
    class function NUM_TWO: Integer;
    class function NUM_ZERO: Integer;
    class function O: Integer;
    class function ONE: Integer;
    class function P: Integer;
    class function PAGE_DOWN: Integer;
    class function PAGE_UP: Integer;
    class function Pause: Integer;
    class function PRINT_SCREEN: Integer;
    class function Q: Integer;
    class function R: Integer;
    class function RETURN: Integer;
    class function RIGHT: Integer;
    class function S: Integer;
    class function SEVEN: Integer;
    class function Shift: Integer;
    class function SIX: Integer;
    class function SPACE: Integer;
    class function T: Integer;
    class function TAB: Integer;
    class function THREE: Integer;
    class function TWO: Integer;
    class function U: Integer;
    class function UP: Integer;
    class function V: Integer;
    class function W: Integer;
    class function X: Integer;
    class function Y: Integer;
    class function Z: Integer;
    class function ZERO: Integer;
    function AddListener(El: string; EventName: string; Handler: TExtFunction;
      Scope: TExtObject = nil; Options: TExtObject = nil): TExtFunction; overload;
    function FunctionJS: TExtFunction;
    function HandleError(E: TExtObject): TExtFunction; overload;
    function HandleError(E: TExtError): TExtFunction; overload;
    function HasModifier: TExtFunction;
    function &On(El: string; EventName: string; Handler: TExtFunction;
      Scope: TExtObject = nil; Options: TExtObject = nil): TExtFunction; overload;
    function OnDocumentReady(Fn: TExtFunction; Scope: TExtObject = nil;
      Options: Boolean = false): TExtFunction;
    function OnTextResize(Fn: TExtFunction; Scope: TExtObject; Options: Boolean)
      : TExtFunction;
    function OnWindowResize(Fn: TExtFunction; Scope: TExtObject; Options: Boolean)
      : TExtFunction;
    function RemoveAll(El: string): TExtFunction; overload;
    function RemoveListener(El: string; EventName: string; Fn: TExtFunction;
      Scope: TExtObject): TExtFunction; overload;
    function RemoveResizeListener(Fn: TExtFunction; Scope: TExtObject): TExtFunction;
    function Un(El: string; EventName: string; Fn: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction; overload;
    property FireDocReady: TExtObject read FFireDocReady write SetFFireDocReady;
    property IeDeferSrc: TExtObject read FIeDeferSrc write SetFIeDeferSrc;
    property TextResizeInterval: TExtObject read FTextResizeInterval
      write SetFTextResizeInterval;
  end;

  TExtError = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function GetMessage: TExtFunction;
    function GetName: TExtFunction;
    function ToJson: TExtFunction;
  end;

  TExtProgressWaitConfig = class(TExtFunction)
  private
    FDuration: Integer;
    FInterval: Integer; // 1000
    FIncrement: Integer; // 10
    FFn: TExtFunction;
    FScope: TExtObject;
    procedure SetFDuration(Value: Integer);
    procedure SetFInterval(Value: Integer);
    procedure SetFIncrement(Value: Integer);
    procedure SetFFn(Value: TExtFunction);
    procedure SetFScope(Value: TExtObject);
  public
    class function JSClassName: string; override;
    property Duration: Integer read FDuration write SetFDuration;
    property Interval: Integer read FInterval write SetFInterval;
    property Increment: Integer read FIncrement write SetFIncrement;
    property Fn: TExtFunction read FFn write SetFFn;
    property Scope: TExtObject read FScope write SetFScope;
  end;

  TExtEventObjectSingleton = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function GetCharCode: TExtFunction;
    function GetKey: TExtFunction;
    function GetPageX: TExtFunction;
    function GetPageY: TExtFunction;
    function GetRelatedTarget: TExtFunction;
    function GetTarget(Selector: string = ''; MaxDepth: Integer = 0;
      ReturnEl: Boolean = false): TExtFunction; overload;
    function GetTarget(Selector: string; MaxDepth: string; ReturnEl: Boolean = false)
      : TExtFunction; overload;
    function GetWheelDelta: TExtFunction;
    function GetXY: TExtFunction;
    function PreventDefault: TExtFunction;
    function StopEvent: TExtFunction;
    function StopPropagation: TExtFunction;
    function Within(El: string; Related: Boolean = false; AllowEl: Boolean = false)
      : TExtFunction;
  end;

  TExtLoadMask = class(TExtFunction)
  private
    FMsg: string; // 'Loading...'
    FMsgCls: string; // 'x-mask-loading'
    FRemoveMask: Boolean;
    FStore: TExtDataStore;
    FDisabled: Boolean;
    procedure SetFMsg(Value: string);
    procedure SetFMsgCls(Value: string);
    procedure SetFRemoveMask(Value: Boolean);
    procedure SetFStore(Value: TExtDataStore);
    procedure SetFDisabled(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function Hide: TExtFunction;
    function Show: TExtFunction;
    property Msg: string read FMsg write SetFMsg;
    property MsgCls: string read FMsgCls write SetFMsgCls;
    property RemoveMask: Boolean read FRemoveMask write SetFRemoveMask;
    property Store: TExtDataStore read FStore write SetFStore;
    property Disabled: Boolean read FDisabled write SetFDisabled;
  end;

  TExtSplitBarBasicLayoutAdapter = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function GetElementSize(S: TExtSplitBar): TExtFunction;
    function SetElementSize(S: TExtSplitBar; NewSize: Integer; OnComplete: TExtFunction)
      : TExtFunction;
  end;

  TExtTemplate = class(TExtFunction)
  private
    FCompiled: Boolean;
    FDisableFormats: Boolean;
    FRe: string;
    FDisableFormats_: Boolean;
    FRe_: string;
    procedure SetFCompiled(Value: Boolean);
    procedure SetFDisableFormats(Value: Boolean);
    procedure SetFRe(Value: string);
    procedure SetFDisableFormats_(Value: Boolean);
    procedure SetFRe_(Value: string);
  public
    class function JSClassName: string; override;
    function TemplateFrom(El: string; Config: TExtObject = nil): TExtFunction; overload;
    function Append(El: string; Values: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function Append(El: string; Values: TExtObjectList; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function Apply(Values: TExtObject): TExtFunction; overload;
    function Apply(Values: TExtObjectList): TExtFunction; overload;
    function InsertAfter(El: string; Values: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function InsertAfter(El: string; Values: TExtObjectList;
      ReturnElement: Boolean = false): TExtFunction; overload;
    function InsertBefore(El: string; Values: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function InsertBefore(El: string; Values: TExtObjectList;
      ReturnElement: Boolean = false): TExtFunction; overload;
    function InsertFirst(El: string; Values: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function InsertFirst(El: string; Values: TExtObjectList;
      ReturnElement: Boolean = false): TExtFunction; overload;
    function Overwrite(El: string; Values: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function Overwrite(El: string; Values: TExtObjectList; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function SetJS(Html: string; Compile: Boolean = false): TExtFunction;
    property Compiled: Boolean read FCompiled write SetFCompiled;
    property DisableFormats: Boolean read FDisableFormats write SetFDisableFormats;
    property Re: string read FRe write SetFRe;
    property DisableFormats_: Boolean read FDisableFormats_ write SetFDisableFormats_;
    property Re_: string read FRe_ write SetFRe_;
  end;

  TExtUpdaterBasicRenderer = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function Render(El: TExtElement; Xhr: TExtObject; UpdateManager: TExtUpdater;
      Callback: TExtFunction): TExtFunction;
  end;

  TExtShadow = class(TExtFunction)
  private
    FMode: string;
    FOffset: string;
    procedure SetFMode(Value: string);
    procedure SetFOffset(Value: string);
  public
    class function JSClassName: string; override;
    function Hide: TExtFunction;
    function IsVisible: TExtFunction;
    function Realign(LEFT: Integer; Top: Integer; Width: Integer; Height: Integer)
      : TExtFunction;
    function SetZIndex(Zindex: Integer): TExtFunction;
    function Show(TargetEl: string): TExtFunction;
    property Mode: string read FMode write SetFMode;
    property Offset: string read FOffset write SetFOffset;
  end;

  TExtShowConfig = class(TExtFunction)
  private
    FAnimEl: string;
    FButtons: TExtObject;
    FClosable: Boolean; // true
    FCls: string;
    FDefaultTextHeight: Integer; // 75
    FFn: TExtFunction;
    FScope: TExtObject;
    FIcon: string;
    FIconCls: string;
    FMaxWidth: Integer; // 600
    FMinWidth: Integer; // 100
    FModal: Boolean; // true
    FMsg: string;
    FMultiline: Boolean;
    FProgress: Boolean;
    FProgressText: string;
    FPrompt: Boolean;
    FProxyDrag: Boolean;
    FTitle: string;
    FValue: string;
    FWait: Boolean;
    FWaitConfig: TExtProgressWaitConfig;
    FWidth: Integer;
    procedure SetFAnimEl(Value: string);
    procedure SetFButtons(Value: TExtObject);
    procedure SetFClosable(Value: Boolean);
    procedure SetFCls(Value: string);
    procedure SetFDefaultTextHeight(Value: Integer);
    procedure SetFFn(Value: TExtFunction);
    procedure SetFScope(Value: TExtObject);
    procedure SetFIcon(Value: string);
    procedure SetFIconCls(Value: string);
    procedure SetFMaxWidth(Value: Integer);
    procedure SetFMinWidth(Value: Integer);
    procedure SetModal(const AValue: Boolean);
    procedure SetFMsg(Value: string);
    procedure SetFMultiline(Value: Boolean);
    procedure SetFProgress(Value: Boolean);
    procedure SetFProgressText(Value: string);
    procedure SetFPrompt(Value: Boolean);
    procedure SetFProxyDrag(Value: Boolean);
    procedure SetFTitle(Value: string);
    procedure SetFValue(Value: string);
    procedure SetFWait(Value: Boolean);
    procedure SetFWaitConfig(Value: TExtProgressWaitConfig);
    procedure SetFWidth(Value: Integer);
  public
    class function JSClassName: string; override;
    property AnimEl: string read FAnimEl write SetFAnimEl;
    property Buttons: TExtObject read FButtons write SetFButtons;
    property Closable: Boolean read FClosable write SetFClosable;
    property Cls: string read FCls write SetFCls;
    property DefaultTextHeight: Integer read FDefaultTextHeight
      write SetFDefaultTextHeight;
    property Fn: TExtFunction read FFn write SetFFn;
    property Scope: TExtObject read FScope write SetFScope;
    property Icon: string read FIcon write SetFIcon;
    property IconCls: string read FIconCls write SetFIconCls;
    property MaxWidth: Integer read FMaxWidth write SetFMaxWidth;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
    property Modal: Boolean read FModal write SetModal;
    property Msg: string read FMsg write SetFMsg;
    property Multiline: Boolean read FMultiline write SetFMultiline;
    property Progress: Boolean read FProgress write SetFProgress;
    property ProgressText: string read FProgressText write SetFProgressText;
    property Prompt: Boolean read FPrompt write SetFPrompt;
    property ProxyDrag: Boolean read FProxyDrag write SetFProxyDrag;
    property Title: string read FTitle write SetFTitle;
    property Value: string read FValue write SetFValue;
    property Wait: Boolean read FWait write SetFWait;
    property WaitConfig: TExtProgressWaitConfig read FWaitConfig write SetFWaitConfig;
    property Width: Integer read FWidth write SetFWidth;
  end;

  TExtMessageBoxSingleton = class(TExtFunction)
  private
    FMsg: TExtObject;
    FButtonText: TExtObject;
    FDefaultTextHeight: Integer; // 75
    FMaxWidth: Integer; // 600
    FMinProgressWidth: Integer; // 250
    FMinPromptWidth: Integer; // 250
    FMinWidth: Integer; // 100
    procedure SetFMsg(Value: TExtObject);
    procedure SetFButtonText(Value: TExtObject);
    procedure SetFDefaultTextHeight(Value: Integer);
    procedure SetFMaxWidth(Value: Integer);
    procedure SetFMinProgressWidth(Value: Integer);
    procedure SetFMinPromptWidth(Value: Integer);
    procedure SetFMinWidth(Value: Integer);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    class function CANCEL: TExtObject;
    class function ERROR: string;
    class function INFO: string;
    class function OK: TExtObject;
    class function OKCANCEL: TExtObject;
    class function QUESTION: string;
    class function WARNING: string;
    class function YESNO: TExtObject;
    class function YESNOCANCEL: TExtObject;
    function Alert(const ATitle: string; const AMsg: string;
      const AFn: TExtFunction = nil; const AScope: TExtObject = nil): TExtFunction;
    function Confirm(Title: string; Msg: string; Fn: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction;
    function GetDialog: TExtFunction;
    function Hide: TExtFunction;
    function IsVisible: TExtFunction;
    function Progress(Title: string; Msg: string; ProgressText: string = '')
      : TExtFunction;
    function Prompt(Title: string; Msg: string; Fn: TExtFunction = nil;
      Scope: TExtObject = nil; Multiline: Boolean = false; Value: string = '')
      : TExtFunction; overload;
    function Prompt(Title: string; Msg: string; Fn: TExtFunction; Scope: TExtObject;
      Multiline: Integer; Value: string = ''): TExtFunction; overload;
    function SetIcon(Icon: string): TExtFunction;
    function Show(Config: TExtObject = nil): TExtFunction;
    function UpdateProgress(Value: Integer; ProgressText: string; Msg: string)
      : TExtFunction;
    function UpdateText(Text: string = ''): TExtFunction;
    function Wait(Msg: string; Title: string = ''; Config: TExtObject = nil)
      : TExtFunction;
    property Msg: TExtObject read FMsg write SetFMsg;
    property ButtonText: TExtObject read FButtonText write SetFButtonText;
    property DefaultTextHeight: Integer read FDefaultTextHeight
      write SetFDefaultTextHeight;
    property MaxWidth: Integer read FMaxWidth write SetFMaxWidth;
    property MinProgressWidth: Integer read FMinProgressWidth write SetFMinProgressWidth;
    property MinPromptWidth: Integer read FMinPromptWidth write SetFMinPromptWidth;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
  end;

  TExtQuickTipsSingleton = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function GetQuickTip: TExtFunction;
    function Init(const AAutoRender: Boolean): TExtFunction;
    function IsEnabled: TExtFunction;
    function Register(Config: TExtObject = nil): TExtFunction;
    function Tips(Config: TExtObject = nil): TExtFunction;
    function Unregister(El: string): TExtFunction; overload;
    function Unregister(El: TExtElement): TExtFunction; overload;
  end;

  TExtWindowGroup = class(TExtFunction)
  private
    FZseed: Integer; // 9000
    procedure SetFZseed(Value: Integer);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function BringToFront(Win: string): TExtFunction; overload;
    function BringToFront(Win: TExtObject): TExtFunction; overload;
    function Each(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function Get(Id: string): TExtFunction; overload;
    function Get(Id: TExtObject): TExtFunction; overload;
    function GetActive: TExtFunction;
    function GetBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function HideAll: TExtFunction;
    function Register(Win: TExtWindow): TExtFunction;
    function SendToBack(Win: string): TExtFunction; overload;
    function SendToBack(Win: TExtObject): TExtFunction; overload;
    function Unregister(Win: TExtWindow): TExtFunction;
    property Zseed: Integer read FZseed write SetFZseed;
  end;

  TExtElement = class(TExtFunction)
  private
    FAutoBoxAdjust: TExtObject;
    FDefaultUnit: TCSSUnit;
    FId: string;
    FOriginalDisplay: string;
    procedure SetFAutoBoxAdjust(Value: TExtObject);
    procedure SetFDefaultUnit(Value: TCSSUnit);
    procedure SetFId(Value: string);
    procedure SetFOriginalDisplay(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    class function DISPLAY: Integer;
    class function VISIBILITY: Integer;
    function AddClass(const AClassName: string): TExtFunction; overload;
    function AddClass(ClassName: TExtObjectList): TExtFunction; overload;
    function AddClassOnClick(ClassName: string): TExtFunction;
    function AddClassOnFocus(ClassName: string): TExtFunction;
    function AddClassOnOver(ClassName: string): TExtFunction;
    function AddKeyListener(Key: Integer; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function AddKeyListener(Key: TExtObjectList; Fn: TExtFunction;
      Scope: TExtObject = nil): TExtFunction; overload;
    function AddKeyListener(Key: TExtObject; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function AddKeyListener(Key: string; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction; overload;
    function AddKeyMap(Config: TExtObject = nil): TExtFunction;
    function AddListener(EventName: string; Fn: TExtFunction; Scope: TExtObject = nil;
      Options: TExtObject = nil): TExtFunction;
    function AlignTo(Element: string; Position: string; Offsets: TExtObjectList = nil;
      Animate: Boolean = false): TExtFunction; overload;
    function AlignTo(Element: string; Position: string; Offsets: TExtObjectList;
      Animate: TExtObject): TExtFunction; overload;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList = nil;
      Animate: Boolean = false; MonitorScroll: Boolean = false;
      Callback: TExtFunction = nil): TExtFunction; overload;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
      Animate: TExtObject; MonitorScroll: Boolean = false; Callback: TExtFunction = nil)
      : TExtFunction; overload;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
      Animate: TExtObject; MonitorScroll: Integer; Callback: TExtFunction)
      : TExtFunction; overload;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
      Animate: Boolean; MonitorScroll: Integer; Callback: TExtFunction)
      : TExtFunction; overload;
    function Animate(Args: TExtObject; Duration: Double = 0;
      OnComplete: TExtFunction = nil; Easing: string = ''; AnimType: string = '')
      : TExtFunction;
    function AppendChild(El: string): TExtFunction; overload;
    function AppendChild(El: TExtObjectList): TExtFunction; overload;
    function AppendChild(El: TExtElement): TExtFunction; overload;
    function AppendChild(El: TExtCompositeElement): TExtFunction; overload;
    function AppendTo(El: string): TExtFunction;
    function ApplyStyles(Styles: string): TExtFunction; overload;
    function ApplyStyles(Styles: TExtObject): TExtFunction; overload;
    function ApplyStyles(Styles: TExtFunction): TExtFunction; overload;
    function AutoHeight(Animate: Boolean = false; Duration: Double = 0;
      OnComplete: TExtFunction = nil; Easing: string = ''): TExtFunction;
    function Blur: TExtFunction;
    function BoxWrap(ClassJS: string = ''): TExtFunction;
    function Center(CenterIn: string = ''): TExtFunction;
    function Child(Selector: string; ReturnDom: Boolean = false): TExtFunction;
    function Clean(ForceReclean: Boolean = false): TExtFunction;
    function ClearOpacity: TExtFunction;
    function ClearPositioning(Value: string = ''): TExtFunction;
    function Clip: TExtFunction;
    function Contains(El: string): TExtFunction; overload;
    function CreateProxy(Config: string = ''; RenderTo: string = '';
      MatchBox: Boolean = false): TExtFunction; overload;
    function CreateProxy(Config: TExtObject; RenderTo: string = '';
      MatchBox: Boolean = false): TExtFunction; overload;
    function CreateShim: TExtFunction;
    function DOWN(Selector: string; ReturnDom: Boolean = false): TExtFunction;
    function EnableDisplayMode(DISPLAY: string = ''): TExtFunction;
    function FindParent(Selector: string; MaxDepth: Integer = 0;
      ReturnEl: Boolean = false): TExtFunction; overload;
    function FindParent(Selector: string; MaxDepth: string; ReturnEl: Boolean = false)
      : TExtFunction; overload;
    function FindParentNode(Selector: string; MaxDepth: Integer = 0;
      ReturnEl: Boolean = false): TExtFunction; overload;
    function FindParentNode(Selector: string; MaxDepth: string; ReturnEl: Boolean = false)
      : TExtFunction; overload;
    function First(Selector: string = ''; ReturnDom: Boolean = false): TExtFunction;
    function Fly(El: string; Named: string = ''): TExtFunction; overload;
    function Focus(Defer: Integer = 0): TExtFunction;
    function Get(El: string): TExtFunction;
    function GetAlignToXY(Element: string; Position: string;
      Offsets: TExtObjectList = nil): TExtFunction;
    function GetAnchorXY(Anchor: string = ''; Local: Boolean = false;
      Size: TExtObject = nil): TExtFunction;
    function GetAttribute(Name: string; Namespace: string = ''): TExtFunction;
    function GetAttributeNS(Namespace: string; Name: string): TExtFunction;
    function GetBorderWidth(Side: string): TExtFunction;
    function GetBottom(Local: Boolean): TExtFunction;
    function GetBox(ContentBox: Boolean = false; Local: Boolean = false): TExtFunction;
    function GetCenterXY: TExtFunction;
    function GetColor(Attr: string; DefaultValue: string; Prefix: string = '')
      : TExtFunction;
    function GetComputedHeight: TExtFunction;
    function GetComputedWidth: TExtFunction;
    function GetFrameWidth(Sides: string): TExtFunction;
    function GetHeight(ContentHeight: Boolean = false): TExtFunction;
    function GetLeft(Local: Boolean): TExtFunction;
    function GetMargins(Sides: string = ''): TExtFunction;
    function GetOffsetsTo(Element: string): TExtFunction;
    function GetPadding(Side: string): TExtFunction;
    function GetPositioning: TExtFunction;
    function GetRegion: TExtFunction;
    function GetRight(Local: Boolean): TExtFunction;
    function GetScroll: TExtFunction;
    function GetSize(ContentSize: Boolean = false): TExtFunction;
    function GetStyle(PropertyJS: string): TExtFunction;
    function GetStyleSize: TExtFunction;
    function GetStyles(Styles: TExtObjectList): TExtFunction;
    function GetTextWidth(Text: string; Min: Integer = 0; Max: Integer = 0): TExtFunction;
    function GetTop(Local: Boolean): TExtFunction;
    function GetUpdater: TExtFunction;
    function GetValue(AsNumber: Boolean): TExtFunction;
    function GetViewSize: TExtFunction;
    function GetWidth(ContentWidth: Boolean = false): TExtFunction;
    function GetX: TExtFunction;
    function GetXY: TExtFunction;
    function GetY: TExtFunction;
    function HasClass(ClassName: string): TExtFunction;
    function Hide(Animate: Boolean = false): TExtFunction; overload;
    function Hide(Animate: TExtObject): TExtFunction; overload;
    function Hover(OverFn: TExtFunction; OutFn: TExtFunction; Scope: TExtObject = nil;
      Options: TExtObject = nil): TExtFunction;
    function InitDD(Group: string; Config: TExtObject = nil; Overrides: TExtObject = nil)
      : TExtFunction;
    function InitDDProxy(Group: string; Config: TExtObject = nil;
      Overrides: TExtObject = nil): TExtFunction;
    function InitDDTarget(Group: string; Config: TExtObject = nil;
      Overrides: TExtObject = nil): TExtFunction;
    function InsertAfter(El: string): TExtFunction;
    function InsertBefore(El: string): TExtFunction;
    function InsertFirst(El: string): TExtFunction; overload;
    function InsertFirst(El: TExtObject): TExtFunction; overload;
    function InsertHtml(Where: string; Html: string; ReturnEl: Boolean = false)
      : TExtFunction;
    function InsertSibling(El: string; Where: string = ''; ReturnDom: Boolean = false)
      : TExtFunction; overload;
    function InsertSibling(El: TExtObject; Where: string = ''; ReturnDom: Boolean = false)
      : TExtFunction; overload;
    function InsertSibling(El: TExtObjectList; Where: string = '';
      ReturnDom: Boolean = false): TExtFunction; overload;
    function IsJS(Selector: string): TExtFunction;
    function IsBorderBox: TExtFunction;
    function IsDisplayed: TExtFunction;
    function IsMasked: TExtFunction;
    function IsScrollable: TExtFunction;
    function IsVisible(Deep: Boolean = false): TExtFunction;
    function Last(Selector: string = ''; ReturnDom: Boolean = false): TExtFunction;
    function Load: TExtFunction;
    function Mask(Msg: string = ''; MsgCls: string = ''): TExtFunction;
    function Move(Direction: string; Distance: Integer; Animate: Boolean = false)
      : TExtFunction; overload;
    function Move(Direction: string; Distance: Integer; Animate: TExtObject)
      : TExtFunction; overload;
    function MoveTo(X: Integer; Y: Integer; Animate: Boolean = false)
      : TExtFunction; overload;
    function MoveTo(X: Integer; Y: Integer; Animate: TExtObject): TExtFunction; overload;
    function Next(Selector: string = ''; ReturnDom: Boolean = false): TExtFunction;
    function &On(EventName: string; Fn: TExtFunction; Scope: TExtObject = nil;
      Options: TExtObject = nil): TExtFunction;
    function Parent(Selector: string = ''; ReturnDom: Boolean = false): TExtFunction;
    function Position(Pos: string = ''; Zindex: Integer = 0; X: Integer = 0;
      Y: Integer = 0): TExtFunction;
    function Prev(Selector: string = ''; ReturnDom: Boolean = false): TExtFunction;
    function PurgeAllListeners: TExtFunction;
    function Query(Selector: string): TExtFunction;
    function RadioClass(ClassName: string): TExtFunction; overload;
    function RadioClass(ClassName: TExtObjectList): TExtFunction; overload;
    function RelayEvent(EventName: string; ObjectJS: TExtObject): TExtFunction;
    function Remove: TExtFunction;
    function RemoveAllListeners: TExtFunction;
    function RemoveAnchor: TExtFunction;
    function RemoveClass(ClassName: string): TExtFunction; overload;
    function RemoveClass(ClassName: TExtObjectList): TExtFunction; overload;
    function RemoveListener(EventName: string; Fn: TExtFunction; Scope: TExtObject)
      : TExtFunction;
    function Repaint: TExtFunction;
    function Replace(El: string): TExtFunction;
    function ReplaceClass(OldClassName: string; NewClassName: string): TExtFunction;
    function ReplaceWith(El: string): TExtFunction; overload;
    function ReplaceWith(El: TExtObject): TExtFunction; overload;
    function Scroll(Direction: string; Distance: Integer; Animate: Boolean = false)
      : TExtFunction; overload;
    function Scroll(Direction: string; Distance: Integer; Animate: TExtObject)
      : TExtFunction; overload;
    function ScrollIntoView(Container: string = ''; Hscroll: Boolean = false)
      : TExtFunction;
    function ScrollTo(Side: string; Value: Integer; Animate: Boolean = false)
      : TExtFunction; overload;
    function ScrollTo(Side: string; Value: Integer; Animate: TExtObject)
      : TExtFunction; overload;
    function Select(Selector: TExtObjectList; Unique: Boolean; Root: string)
      : TExtFunction; overload;
    function Select(Selector: string; Unique: Boolean; Root: string)
      : TExtFunction; overload;
    function SetJS(O: TExtObject; UseSet: Boolean = false): TExtFunction;
    function SetBottom(Bottom: string): TExtFunction;
    function SetBounds(X: Integer; Y: Integer; Width: string; Height: string;
      Animate: Boolean = false): TExtFunction; overload;
    function SetBounds(X: Integer; Y: Integer; Width: string; Height: string;
      Animate: TExtObject): TExtFunction; overload;
    function SetBox(Box: TExtObject; Adjust: Boolean = false; Animate: Boolean = false)
      : TExtFunction; overload;
    function SetBox(Box: TExtObject; Adjust: Boolean; Animate: TExtObject)
      : TExtFunction; overload;
    function SetDisplayed(Value: string): TExtFunction;
    function SetHeight(Height: string; Animate: Boolean = false): TExtFunction; overload;
    function SetHeight(Height: string; Animate: TExtObject): TExtFunction; overload;
    function SetLeft(LEFT: string): TExtFunction;
    function SetLeftTop(LEFT: string; Top: string): TExtFunction;
    function SetLocation(X: Integer; Y: Integer; Animate: Boolean = false)
      : TExtFunction; overload;
    function SetLocation(X: Integer; Y: Integer; Animate: TExtObject)
      : TExtFunction; overload;
    function SetOpacity(Opacity: Double; Animate: Boolean = false): TExtFunction;
      overload;
    function SetOpacity(Opacity: Double; Animate: TExtObject): TExtFunction; overload;
    function SetPositioning(PosCfg: TExtObject): TExtFunction;
    function SetRegion(Region: string; Animate: Boolean = false)
      : TExtFunction; overload;
    function SetRegion(Region: string; Animate: TExtObject): TExtFunction;
      overload;
    function SetRight(RIGHT: string): TExtFunction;
    function SetSize(Width: string; Height: string; Animate: Boolean = false)
      : TExtFunction; overload;
    function SetSize(Width: string; Height: string; Animate: TExtObject)
      : TExtFunction; overload;
    function SetStyle(PropertyJS: string; Value: string = ''): TExtFunction; overload;
    function SetStyle(PropertyJS: TExtObject; Value: string = ''): TExtFunction; overload;
    function SetTop(Top: string): TExtFunction;
    function SetVisibilityMode(VisMode: Integer): TExtFunction;
    function SetVisible(Visible: Boolean; Animate: Boolean = false)
      : TExtFunction; overload;
    function SetVisible(Visible: Boolean; Animate: TExtObject): TExtFunction; overload;
    function SetWidth(Width: string; Animate: Boolean = false): TExtFunction; overload;
    function SetWidth(Width: string; Animate: TExtObject): TExtFunction; overload;
    function SetX(The: Integer; Animate: Boolean = false): TExtFunction; overload;
    function SetX(The: Integer; Animate: TExtObject): TExtFunction; overload;
    function SetXY(Pos: TExtObjectList; Animate: Boolean = false): TExtFunction; overload;
    function SetXY(Pos: TExtObjectList; Animate: TExtObject): TExtFunction; overload;
    function SetY(The: Integer; Animate: Boolean = false): TExtFunction; overload;
    function SetY(The: Integer; Animate: TExtObject): TExtFunction; overload;
    function Show(Animate: Boolean = false): TExtFunction; overload;
    function Show(Animate: TExtObject): TExtFunction; overload;
    function SwallowEvent(EventName: string; PreventDefault: Boolean = false)
      : TExtFunction; overload;
    function SwallowEvent(EventName: TExtObjectList; PreventDefault: Boolean = false)
      : TExtFunction; overload;
    function Toggle(Animate: Boolean = false): TExtFunction; overload;
    function Toggle(Animate: TExtObject): TExtFunction; overload;
    function ToggleClass(ClassName: string): TExtFunction;
    function TranslatePoints(X: Integer; Y: Integer = 0): TExtFunction; overload;
    function TranslatePoints(X: TExtObjectList; Y: Integer = 0): TExtFunction; overload;
    function Un(EventName: string; Fn: TExtFunction; Scope: TExtObject = nil)
      : TExtFunction;
    function Unclip: TExtFunction;
    function Unmask: TExtFunction;
    function Unselectable: TExtFunction;
    function UP(Selector: string; MaxDepth: Integer = 0): TExtFunction; overload;
    function UP(Selector: string; MaxDepth: string): TExtFunction; overload;
    function Update(Html: string; LoadScripts: Boolean = false;
      Callback: TExtFunction = nil): TExtFunction;
    function Wrap(Config: TExtObject = nil; ReturnDom: Boolean = false): TExtFunction;
    property AutoBoxAdjust: TExtObject read FAutoBoxAdjust write SetFAutoBoxAdjust;
    property DefaultUnit: TCSSUnit read FDefaultUnit write SetFDefaultUnit;
    property Id: string read FId write SetFId;
    property OriginalDisplay: string read FOriginalDisplay write SetFOriginalDisplay;
  end;

  TExtBackground = class(TExtFunction)
  private
    FColor: string;
    FAlpha: Double;
    procedure SetFColor(Value: string);
    procedure SetFAlpha(Value: Double);
  public
    class function JSClassName: string; override;
    property Color: string read FColor write SetFColor;
    property Alpha: Double read FAlpha write SetFAlpha;
  end;

  TExtBorder = class(TExtFunction)
  private
    FColor: string;
    FSize: Integer;
    procedure SetFColor(Value: string);
    procedure SetFSize(Value: Integer);
  public
    class function JSClassName: string; override;
    property Color: string read FColor write SetFColor;
    property Size: Integer read FSize write SetFSize;
  end;

  TExtFont = class(TExtFunction)
  private
    FName: string;
    FColor: string;
    FSize: Integer;
    FBold: Boolean;
    procedure SetFName(Value: string);
    procedure SetFColor(Value: string);
    procedure SetFSize(Value: Integer);
    procedure SetFBold(Value: Boolean);
  public
    class function JSClassName: string; override;
    property name: string read FName write SetFName;
    property Color: string read FColor write SetFColor;
    property Size: Integer read FSize write SetFSize;
    property Bold: Boolean read FBold write SetFBold;
  end;

  TExtDataTip = class(TExtFunction)
  private
    FPadding: Integer;
    FBorder: TExtBorder;
    FBackground: TExtBackground;
    FFont: TExtFont;
    procedure SetFPadding(Value: Integer);
    procedure SetFBorder(Value: TExtBorder);
    procedure SetFBackground(Value: TExtBackground);
    procedure SetFFont(Value: TExtFont);
  public
    class function JSClassName: string; override;
    property Padding: Integer read FPadding write SetFPadding;
    property Border: TExtBorder read FBorder write SetFBorder;
    property Background: TExtBackground read FBackground write SetFBackground;
    property Font: TExtFont read FFont write SetFFont;
  end;

  TExtCompositeElementLite = class(TExtFunction)
  private
    FElements: TExtObjectList;
    procedure SetFElements(Value: TExtObjectList);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Add(Els: string): TExtFunction;
    function Clear: TExtFunction;
    function Contains(El: string): TExtFunction;
    function Each(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function Fill(Els: string): TExtFunction;
    function Filter(Selector: string): TExtFunction; overload;
    function Filter(Selector: TExtFunction): TExtFunction; overload;
    function First: TExtFunction;
    function GetCount: TExtFunction;
    function IndexOf(El: string): TExtFunction;
    function Item(Index: Integer): TExtFunction;
    function Last: TExtFunction;
    function RemoveElement(El: string; RemoveDom: Boolean = false): TExtFunction;
    function ReplaceElement(El: string; Replacement: string; DomReplace: Boolean = false)
      : TExtFunction;
    property Elements: TExtObjectList read FElements write SetFElements;
  end;

  TFusionCharts = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function SetDataURL(XML: string): TExtFunction;
    function Render(Id: string): TExtFunction;
  end;

  TExtDomHelperSingleton = class(TExtFunction)
  private
    FUseDom: Boolean;
    procedure SetFUseDom(Value: Boolean);
  public
    class function JSClassName: string; override;
    function ApplyStyles(El: string; Styles: string): TExtFunction; overload;
    function ApplyStyles(El: string; Styles: TExtObject): TExtFunction; overload;
    function ApplyStyles(El: string; Styles: TExtFunction): TExtFunction; overload;
    function CreateDom(O: TExtObject): TExtFunction; overload;
    function CreateDom(O: string): TExtFunction; overload;
    function CreateTemplate(O: TExtObject): TExtFunction;
    function Markup(O: TExtObject): TExtFunction;
    function Overwrite(El: string; O: TExtObject; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    function Overwrite(El: string; O: string; ReturnElement: Boolean = false)
      : TExtFunction; overload;
    property UseDom: Boolean read FUseDom write SetFUseDom;
  end;

  TExtAction = class(TExtFunction)
  private
    FDisabled: Boolean;
    FHandler: TExtFunction;
    FHidden: Boolean;
    FIconCls: string;
    FItemId: string;
    FScope: TExtObject;
    FText: string;
    procedure _SetDisabled(const AValue: Boolean);
    procedure _SetHandler(const AValue: TExtFunction);
    procedure _SetHidden(const AValue: Boolean);
    procedure SetFIconCls(Value: string);
    procedure SetFItemId(Value: string);
    procedure SetFScope(Value: TExtObject);
    procedure _SetText(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Disable: TExtFunction;
    function Each(Fn: TExtFunction; Scope: TExtObject): TExtFunction;
    function Enable: TExtFunction;
    function Execute(Args: TExtObjectList = nil): TExtFunction;
    function GetIconClass: TExtFunction;
    function GetText: TExtFunction;
    function Hide: TExtFunction;
    function IsDisabled: TExtFunction;
    function IsHidden: TExtFunction;
    function SetDisabled(const ADisabled: Boolean): TExtFunction;
    function SetHandler(const AFn: TExtFunction; const AScope: TExtObject): TExtFunction;
    function SetHidden(const AHidden: Boolean): TExtFunction;
    function SetIconClass(Cls: string): TExtFunction;
    function SetText(const AText: string): TExtFunction;
    function Show: TExtFunction;
    property Disabled: Boolean read FDisabled write _SetDisabled;
    property Handler: TExtFunction read FHandler write _SetHandler;
    property Hidden: Boolean read FHidden write _SetHidden;
    property IconCls: string read FIconCls write SetFIconCls;
    property ItemId: string read FItemId write SetFItemId;
    property Scope: TExtObject read FScope write SetFScope;
    property Text: string read FText write _SetText;
  end;

  TExtDirectTransaction = class(TExtFunction)
  public
    class function JSClassName: string; override;
  end;

  // Procedural types for events TExtSplitBar
  TExtSplitBarOnBeforeresize = procedure(This: TExtSplitBar) of object;
  TExtSplitBarOnMoved = procedure(This: TExtSplitBar; NewSize: Integer) of object;
  TExtSplitBarOnResize = procedure(This: TExtSplitBar; NewSize: Integer) of object;

  TExtSplitBar = class(TExtUtilObservable)
  private
    FAnimate: Boolean;
    FMaxSize: Integer;
    FMinSize: Integer;
    FTickSize: Integer;
    FUseShim: Boolean;
    FOnBeforeresize: TExtSplitBarOnBeforeresize;
    FOnMoved: TExtSplitBarOnMoved;
    FOnResize: TExtSplitBarOnResize;
    procedure SetFAnimate(Value: Boolean);
    procedure SetFMaxSize(Value: Integer);
    procedure SetFMinSize(Value: Integer);
    procedure SetFTickSize(Value: Integer);
    procedure SetFUseShim(Value: Boolean);
    procedure SetFOnBeforeresize(Value: TExtSplitBarOnBeforeresize);
    procedure SetFOnMoved(Value: TExtSplitBarOnMoved);
    procedure SetFOnResize(Value: TExtSplitBarOnResize);
  protected
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetAdapter: TExtFunction;
    function GetMaximumSize: TExtFunction;
    function GetMinimumSize: TExtFunction;
    function SetAdapter(Adapter: TExtObject): TExtFunction;
    function SetCurrentSize(Size: Integer): TExtFunction;
    function SetMaximumSize(MaxSize: Integer): TExtFunction;
    function SetMinimumSize(MinSize: Integer): TExtFunction;
    property Animate: Boolean read FAnimate write SetFAnimate;
    property MaxSize: Integer read FMaxSize write SetFMaxSize;
    property MinSize: Integer read FMinSize write SetFMinSize;
    property TickSize: Integer read FTickSize write SetFTickSize;
    property UseShim: Boolean read FUseShim write SetFUseShim;
    property OnBeforeresize: TExtSplitBarOnBeforeresize read FOnBeforeresize
      write SetFOnBeforeresize;
    property OnMoved: TExtSplitBarOnMoved read FOnMoved write SetFOnMoved;
    property OnResize: TExtSplitBarOnResize read FOnResize write SetFOnResize;
  end;

  // Procedural types for events TExtResizable
  TExtResizableOnBeforeresize = procedure(This: TExtResizable;
    E: TExtEventObjectSingleton) of object;
  TExtResizableOnResize = procedure(This: TExtResizable; Width: Integer; Height: Integer;
    E: TExtEventObjectSingleton) of object;

  TExtResizable = class(TExtUtilObservable)
  private
    FAdjustments: TExtObjectList;
    FAdjustmentsString: string;
    FAnimate: Boolean;
    FConstrainTo: string;
    FDisableTrackOver: Boolean;
    FDraggable: Boolean;
    FDuration: Integer; // 0
    FDynamic: Boolean;
    FEasing: string; // 'easingOutStrong'
    FEnabled: Boolean; // true
    FHandleCls: string;
    FHandles: string;
    FHeight: Integer;
    FHeightIncrement: Integer;
    FMaxHeight: Integer; // 10000
    FMaxWidth: Integer; // 10000
    FMinHeight: Integer; // 5
    FMinWidth: Integer; // 5
    FMinX: Integer; // 0
    FMinY: Integer; // 0
    FMultiDirectional: Boolean;
    FPinned: Boolean;
    FPreserveRatio: Boolean;
    FResizeChild: Boolean;
    FResizeChildString: string;
    FResizeChildElement: TExtElement;
    FTransparent: Boolean;
    FWidth: Integer;
    FWidthIncrement: Integer;
    FWrap: Boolean;
    FEnabled_: Boolean;
    FProxy: TExtElement;
    FOnBeforeresize: TExtResizableOnBeforeresize;
    FOnResize: TExtResizableOnResize;
    procedure SetFAdjustments(Value: TExtObjectList);
    procedure SetFAdjustmentsString(Value: string);
    procedure SetFAnimate(Value: Boolean);
    procedure SetFConstrainTo(Value: string);
    procedure SetFDisableTrackOver(Value: Boolean);
    procedure SetFDraggable(Value: Boolean);
    procedure SetFDuration(Value: Integer);
    procedure SetFDynamic(Value: Boolean);
    procedure SetFEasing(Value: string);
    procedure SetFEnabled(Value: Boolean);
    procedure SetFHandleCls(Value: string);
    procedure SetFHandles(Value: string);
    procedure SetFHeight(Value: Integer);
    procedure SetFHeightIncrement(Value: Integer);
    procedure SetFMaxHeight(Value: Integer);
    procedure SetFMaxWidth(Value: Integer);
    procedure SetFMinHeight(Value: Integer);
    procedure SetFMinWidth(Value: Integer);
    procedure SetFMinX(Value: Integer);
    procedure SetFMinY(Value: Integer);
    procedure SetFMultiDirectional(Value: Boolean);
    procedure SetFPinned(Value: Boolean);
    procedure SetFPreserveRatio(Value: Boolean);
    procedure SetFResizeChild(Value: Boolean);
    procedure SetFResizeChildString(Value: string);
    procedure SetFResizeChildElement(Value: TExtElement);
    procedure SetFTransparent(Value: Boolean);
    procedure SetFWidth(Value: Integer);
    procedure SetFWidthIncrement(Value: Integer);
    procedure SetFWrap(Value: Boolean);
    procedure SetFEnabled_(Value: Boolean);
    procedure SetFProxy(Value: TExtElement);
    procedure SetFOnBeforeresize(Value: TExtResizableOnBeforeresize);
    procedure SetFOnResize(Value: TExtResizableOnResize);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetEl: TExtFunction;
    function GetResizeChild: TExtFunction;
    function ResizeElement: TExtFunction;
    function ResizeTo(Width: Integer; Height: Integer): TExtFunction;
    property Adjustments: TExtObjectList read FAdjustments write SetFAdjustments;
    property AdjustmentsString: string read FAdjustmentsString
      write SetFAdjustmentsString;
    property Animate: Boolean read FAnimate write SetFAnimate;
    property ConstrainTo: string read FConstrainTo write SetFConstrainTo;
    property DisableTrackOver: Boolean read FDisableTrackOver write SetFDisableTrackOver;
    property Draggable: Boolean read FDraggable write SetFDraggable;
    property Duration: Integer read FDuration write SetFDuration;
    property dynamic: Boolean read FDynamic write SetFDynamic;
    property Easing: string read FEasing write SetFEasing;
    property Enabled: Boolean read FEnabled write SetFEnabled;
    property HandleCls: string read FHandleCls write SetFHandleCls;
    property Handles: string read FHandles write SetFHandles;
    property Height: Integer read FHeight write SetFHeight;
    property HeightIncrement: Integer read FHeightIncrement write SetFHeightIncrement;
    property MaxHeight: Integer read FMaxHeight write SetFMaxHeight;
    property MaxWidth: Integer read FMaxWidth write SetFMaxWidth;
    property MinHeight: Integer read FMinHeight write SetFMinHeight;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
    property MinX: Integer read FMinX write SetFMinX;
    property MinY: Integer read FMinY write SetFMinY;
    property MultiDirectional: Boolean read FMultiDirectional write SetFMultiDirectional;
    property Pinned: Boolean read FPinned write SetFPinned;
    property PreserveRatio: Boolean read FPreserveRatio write SetFPreserveRatio;
    property ResizeChild: Boolean read FResizeChild write SetFResizeChild;
    property ResizeChildString: string read FResizeChildString
      write SetFResizeChildString;
    property ResizeChildElement: TExtElement read FResizeChildElement
      write SetFResizeChildElement;
    property Transparent: Boolean read FTransparent write SetFTransparent;
    property Width: Integer read FWidth write SetFWidth;
    property WidthIncrement: Integer read FWidthIncrement write SetFWidthIncrement;
    property Wrap: Boolean read FWrap write SetFWrap;
    property Enabled_: Boolean read FEnabled_ write SetFEnabled_;
    property Proxy: TExtElement read FProxy write SetFProxy;
    property OnBeforeresize: TExtResizableOnBeforeresize read FOnBeforeresize
      write SetFOnBeforeresize;
    property OnResize: TExtResizableOnResize read FOnResize write SetFOnResize;
  end;

  TExtSplitBarAbsoluteLayoutAdapter = class(TExtSplitBarBasicLayoutAdapter)
  private
  public
    class function JSClassName: string; override;
    class function Bottom: Integer;
    class function HORIZONTAL: Integer;
    class function LEFT: Integer;
    class function RIGHT: Integer;
    class function Top: Integer;
    class function VERTICAL: Integer;
  end;

  // Procedural types for events TExtUpdater
  TExtUpdaterOnBeforeupdate = procedure(El: TExtElement; Url: string; Params: string)
    of object;
  TExtUpdaterOnFailure = procedure(El: TExtElement; OResponseObject: TExtObject)
    of object;
  TExtUpdaterOnUpdate = procedure(El: TExtElement; OResponseObject: TExtObject) of object;

  TExtUpdater = class(TExtUtilObservable)
  private
    FDefaultUrl: string;
    FDisableCaching: Boolean;
    FEl: TExtElement;
    FFormUpdateDelegate: TExtFunction;
    FIndicatorText: string;
    // 'output/Ext.Updater.defaults.html#Ext.Updater.defaults-indicatorText'
    FLoadScripts: Boolean;
    FRefreshDelegate: TExtFunction;
    FShowLoadIndicator: string;
    // 'output/Ext.Updater.defaults.html#Ext.Updater.defaults-showLoadIndicator'
    FSslBlankUrl: string;
    // 'output/Ext.Updater.defaults.html#Ext.Updater.defaults-sslBlankUrl'
    FTimeout: Integer;
    FTransaction: TExtObject;
    FUpdateDelegate: TExtFunction;
    FOnBeforeupdate: TExtUpdaterOnBeforeupdate;
    FOnFailure: TExtUpdaterOnFailure;
    FOnUpdate: TExtUpdaterOnUpdate;
    procedure SetFDefaultUrl(Value: string);
    procedure SetFDisableCaching(Value: Boolean);
    procedure SetFEl(Value: TExtElement);
    procedure SetFFormUpdateDelegate(Value: TExtFunction);
    procedure SetFIndicatorText(Value: string);
    procedure SetFLoadScripts(Value: Boolean);
    procedure SetFRefreshDelegate(Value: TExtFunction);
    procedure SetFShowLoadIndicator(Value: string);
    procedure SetFSslBlankUrl(Value: string);
    procedure SetFTimeout(Value: Integer);
    procedure SetFTransaction(Value: TExtObject);
    procedure SetFUpdateDelegate(Value: TExtFunction);
    procedure SetFOnBeforeupdate(Value: TExtUpdaterOnBeforeupdate);
    procedure SetFOnFailure(Value: TExtUpdaterOnFailure);
    procedure SetFOnUpdate(Value: TExtUpdaterOnUpdate);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function UpdaterUpdateElement(El: string; Url: string; Params: string = '';
      Options: TExtObject = nil): TExtFunction; overload;
    function UpdaterUpdateElement(El: string; Url: string; Params: TExtObject;
      Options: TExtObject = nil): TExtFunction; overload;
    function Abort: TExtFunction;
    function FormUpdate(Form: string; Url: string = ''; Reset: Boolean = false;
      Callback: TExtFunction = nil): TExtFunction; overload;
    function GetDefaultRenderer: TExtFunction;
    function GetEl: TExtFunction;
    function GetRenderer: TExtFunction;
    function IsAutoRefreshing: TExtFunction;
    function IsUpdating: TExtFunction;
    function Refresh(Callback: TExtFunction = nil): TExtFunction;
    function SetDefaultUrl(DefaultUrl: string): TExtFunction; overload;
    function SetDefaultUrl(DefaultUrl: TExtFunction): TExtFunction; overload;
    function SetRenderer(Renderer: TExtObject): TExtFunction;
    function ShowLoading: TExtFunction;
    function StartAutoRefresh(Interval: Integer; Url: string = ''; Params: string = '';
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StartAutoRefresh(Interval: Integer; Url: TExtObject; Params: string = '';
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StartAutoRefresh(Interval: Integer; Url: TExtObject; Params: TExtObject;
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StartAutoRefresh(Interval: Integer; Url: TExtFunction; Params: string = '';
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StartAutoRefresh(Interval: Integer; Url: TExtFunction; Params: TExtObject;
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StartAutoRefresh(Interval: Integer; Url: string; Params: TExtObject;
      Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction; overload;
    function StopAutoRefresh: TExtFunction;
    function Update(Options: TExtObject): TExtFunction;
    property DefaultUrl: string read FDefaultUrl write SetFDefaultUrl;
    property DisableCaching: Boolean read FDisableCaching write SetFDisableCaching;
    property El: TExtElement read FEl write SetFEl;
    property FormUpdateDelegate: TExtFunction read FFormUpdateDelegate
      write SetFFormUpdateDelegate;
    property IndicatorText: string read FIndicatorText write SetFIndicatorText;
    property LoadScripts: Boolean read FLoadScripts write SetFLoadScripts;
    property RefreshDelegate: TExtFunction read FRefreshDelegate
      write SetFRefreshDelegate;
    property ShowLoadIndicator: string read FShowLoadIndicator
      write SetFShowLoadIndicator;
    property SslBlankUrl: string read FSslBlankUrl write SetFSslBlankUrl;
    property Timeout: Integer read FTimeout write SetFTimeout;
    property Transaction: TExtObject read FTransaction write SetFTransaction;
    property UpdateDelegate: TExtFunction read FUpdateDelegate write SetFUpdateDelegate;
    property OnBeforeupdate: TExtUpdaterOnBeforeupdate read FOnBeforeupdate
      write SetFOnBeforeupdate;
    property OnFailure: TExtUpdaterOnFailure read FOnFailure write SetFOnFailure;
    property OnUpdate: TExtUpdaterOnUpdate read FOnUpdate write SetFOnUpdate;
  end;

  // Procedural types for events TExtComponent
  TExtComponentOnAdded = procedure(This: TExtComponent; OwnerCt: TExtContainer;
    Index: Integer) of object;
  TExtComponentOnAfterrender = procedure(This: TExtComponent) of object;
  TExtComponentOnBeforedestroy = procedure(This: TExtComponent) of object;
  TExtComponentOnBeforehide = procedure(This: TExtComponent) of object;
  TExtComponentOnBeforerender = procedure(This: TExtComponent) of object;
  TExtComponentOnBeforeshow = procedure(This: TExtComponent) of object;
  TExtComponentOnBeforestaterestore = procedure(This: TExtComponent; State: TExtObject)
    of object;
  TExtComponentOnBeforestatesave = procedure(This: TExtComponent; State: TExtObject)
    of object;
  TExtComponentOnDestroyJS = procedure(This: TExtComponent) of object;
  TExtComponentOnDisable = procedure(This: TExtComponent) of object;
  TExtComponentOnEnable = procedure(This: TExtComponent) of object;
  TExtComponentOnHide = procedure(This: TExtComponent) of object;
  TExtComponentOnRemoved = procedure(This: TExtComponent; OwnerCt: TExtContainer)
    of object;
  TExtComponentOnRender = procedure(This: TExtComponent) of object;
  TExtComponentOnShow = procedure(This: TExtComponent) of object;
  TExtComponentOnStaterestore = procedure(This: TExtComponent; State: TExtObject)
    of object;
  TExtComponentOnStatesave = procedure(This: TExtComponent; State: TExtObject) of object;

  // Enumerated types for properties
  TExtComponentXtype = (xtBox, xtButton, xtButtonGroup, xtColorPalette, xtComponent,
    xtContainer, xtCycle, xtDataView, xtDatePicker, xtEditor, xtEditorGrid, xtFlash,
    xtGrid, xtListView, xtPaging, xtPanel, xtProgress, xtPropertyGrid, xtSlider, xtSpacer,
    xtSplitButton, xtStatusBar, xtTabPanel, xtTreePanel, xtViewPort, xtWindow, xtToolbar,
    xtTBButton, xtTBFill, xtTBItem, xtTBSeparator, xtTBSpacer, xtTBSplit, xtTBText,
    xtMenu, xtColorMenu, xtDateMenu, xtMenuBaseItem, xtMenuCheckItem, xtMenuItem,
    xtMenuSeparator, xtMenuTextItem, xtForm, xtCheckBox, xtCheckBoxGroup, xtCombo,
    xtDateField, xtDisplayField, xtField, xtFieldSet, xtHidden, xtHTMLEditor, xtLabel,
    xtNumberField, xtRadio, xtRadioGroup, xtTextArea, xtTextField, xtTimeField, xtTrigger,
    xtChart, xtBarChart, xtCartesianChart, xtColumnChart, xtLineChart, xtPieChart);

  TExtComponent = class(TExtUtilObservable)
  private
    FAllowDomMove: Boolean; // true
    FApplyTo: string;
    FAutoEl: TExtObject;
    FAutoShow: Boolean;
    FBubbleEvents: TExtObjectList;
    FClearCls: string; // 'x-form-clear-left'
    FCls: string;
    FContentEl: string;
    FCtCls: string;
    FData: string;
    FDisabled: Boolean;
    FDisabledClass: string; // 'x-item-disabled'
    FFieldLabel: string;
    FHidden: Boolean;
    FHideLabel: Boolean;
    FHideMode: string;
    FHideParent: Boolean;
    FHtml: string;
    FHtmlObject: TExtObject;
    FId: string;
    FItemCls: string;
    FItemId: string;
    FLabelSeparator: string; // ':'
    FLabelStyle: string;
    FOverCls: string;
    FPlugins: TExtObjectList;
    FPtype: string;
    FRef: string;
    FRenderTo: string;
    FStateEvents: TExtObjectList;
    FStateId: string;
    FStateful: Boolean;
    FStyle: string;
    FTpl: string;
    FTplWriteMode: string;
    FXtype: TExtComponentXtype;
    FDisabled_: Boolean;
    FEl: string;
    FHidden_: Boolean;
    FSplit: Boolean;
    FCollapseMode: string;
    FMinWidth: Integer;
    FMaxWidth: Integer;
    FMinSize: Integer;
    FMaxSize: Integer;
    FCmargins: string;
    FClosable: Boolean;
    FAnchor: string;
    FStyleExtObject: TExtObject;
    FOnAdded: TExtComponentOnAdded;
    FOnAfterrender: TExtComponentOnAfterrender;
    FOnBeforedestroy: TExtComponentOnBeforedestroy;
    FOnBeforehide: TExtComponentOnBeforehide;
    FOnBeforerender: TExtComponentOnBeforerender;
    FOnBeforeshow: TExtComponentOnBeforeshow;
    FOnBeforestaterestore: TExtComponentOnBeforestaterestore;
    FOnBeforestatesave: TExtComponentOnBeforestatesave;
    FOnDestroyJS: TExtComponentOnDestroyJS;
    FOnDisable: TExtComponentOnDisable;
    FOnEnable: TExtComponentOnEnable;
    FOnHide: TExtComponentOnHide;
    FOnRemoved: TExtComponentOnRemoved;
    FOnRender: TExtComponentOnRender;
    FOnShow: TExtComponentOnShow;
    FOnStaterestore: TExtComponentOnStaterestore;
    FOnStatesave: TExtComponentOnStatesave;
    FLoader: TExtObject;
    FPadding: string;
    procedure SetFAllowDomMove(Value: Boolean);
    procedure SetFApplyTo(Value: string);
    procedure SetFAutoEl(Value: TExtObject);
    procedure SetFAutoShow(Value: Boolean);
    procedure SetFBubbleEvents(Value: TExtObjectList);
    procedure SetFClearCls(Value: string);
    procedure SetCls(const AValue: string);
    procedure SetFContentEl(Value: string);
    procedure SetFCtCls(Value: string);
    procedure SetFData(Value: string);
    procedure _SetDisabled(const AValue: Boolean);
    procedure SetFDisabledClass(Value: string);
    procedure SetFieldLabel(const AValue: string);
    procedure SetHidden(const AValue: Boolean);
    procedure SetFHideLabel(Value: Boolean);
    procedure SetFHideMode(Value: string);
    procedure SetFHideParent(Value: Boolean);
    procedure SetHtml(const AValue: string);
    procedure SetFHtmlObject(Value: TExtObject);
    procedure SetId(const AValue: string);
    procedure SetItemCls(const AValue: string);
    procedure SetItemId(const AValue: string);
    procedure SetLabelSeparator(const AValue: string);
    procedure SetLabelStyle(const AValue: string);
    procedure SetOverCls(const AValue: string);
    procedure SetFPtype(Value: string);
    procedure SetFRef(Value: string);
    procedure SetFRenderTo(Value: string);
    procedure SetFStateEvents(Value: TExtObjectList);
    procedure SetFStateId(Value: string);
    procedure SetFStateful(Value: Boolean);
    procedure SetStyle(const AValue: string);
    procedure SetTpl(const AValue: string);
    procedure SetFTplWriteMode(Value: string);
    procedure SetFXtype(Value: TExtComponentXtype);
    procedure SetFDisabled_(Value: Boolean);
    procedure SetFEl(Value: string);
    procedure SetFHidden_(Value: Boolean);
    procedure SetSplit(const AValue: Boolean);
    procedure SetCollapseMode(const AValue: string);
    procedure SetMinWidth(const AValue: Integer);
    procedure SetMaxWidth(const AValue: Integer);
    procedure SetMinSize(const AValue: Integer);
    procedure SetMaxSize(const AValue: Integer);
    procedure SetFCmargins(Value: string);
    procedure SetFClosable(Value: Boolean);
    procedure SetFAnchor(Value: string);
    procedure SetFStyleExtObject(Value: TExtObject);
    procedure SetFOnAdded(Value: TExtComponentOnAdded);
    procedure SetFOnAfterrender(Value: TExtComponentOnAfterrender);
    procedure SetFOnBeforedestroy(Value: TExtComponentOnBeforedestroy);
    procedure SetFOnBeforehide(Value: TExtComponentOnBeforehide);
    procedure SetFOnBeforerender(Value: TExtComponentOnBeforerender);
    procedure SetFOnBeforeshow(Value: TExtComponentOnBeforeshow);
    procedure SetFOnBeforestaterestore(Value: TExtComponentOnBeforestaterestore);
    procedure SetFOnBeforestatesave(Value: TExtComponentOnBeforestatesave);
    procedure SetFOnDestroyJS(Value: TExtComponentOnDestroyJS);
    procedure SetFOnDisable(Value: TExtComponentOnDisable);
    procedure SetFOnEnable(Value: TExtComponentOnEnable);
    procedure SetFOnHide(Value: TExtComponentOnHide);
    procedure SetFOnRemoved(Value: TExtComponentOnRemoved);
    procedure SetFOnRender(Value: TExtComponentOnRender);
    procedure SetFOnShow(Value: TExtComponentOnShow);
    procedure SetFOnStaterestore(Value: TExtComponentOnStaterestore);
    procedure SetFOnStatesave(Value: TExtComponentOnStatesave);
    procedure SetPadding(const AValue: string);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function AddCls(const AClsName: string): TExtFunction;
    function AnElement(Cls: string): TExtFunction;
    function ApplyToMarkup(El: string): TExtFunction; overload;
    function CloneConfig(Overrides: TExtObject): TExtFunction;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function FindParentBy(Fn: TExtFunction): TExtFunction;
    function FindParentByType(Xtype: string): TExtFunction; overload;
    function FindParentByType(Xtype: TClass): TExtFunction; overload;
    function Focus(const ASelectText: Boolean = False; const ADelay: Boolean = False): TExtFunction; overload;
    function Focus(const ASelectText: Boolean; const ADelay: Integer): TExtFunction; overload;
    function GetBubbleTarget: TExtFunction;
    function GetEl: TExtFunction;
    function GetId: TExtFunction;
    function GetItemId: TExtFunction;
    function GetXType: TExtFunction;
    function GetXTypes: TExtFunction;
    function Hide: TExtFunction;
    function IsVisible: TExtFunction;
    function IsXType(Xtype: string; Shallow: Boolean = false): TExtFunction;
    function Mon(Item: TExtUtilObservable; Ename: TExtObject; Fn: TExtFunction;
      Scope: TExtObject; Opt: TExtObject): TExtFunction; overload;
    function Mon(Item: TExtElement; Ename: TExtObject; Fn: TExtFunction;
      Scope: TExtObject; Opt: TExtObject): TExtFunction; overload;
    function Mon(Item: TExtElement; Ename: string; Fn: TExtFunction; Scope: TExtObject;
      Opt: TExtObject): TExtFunction; overload;
    function Mon(Item: TExtUtilObservable; Ename: string; Fn: TExtFunction;
      Scope: TExtObject; Opt: TExtObject): TExtFunction; overload;
    function Mun(Item: TExtUtilObservable; Ename: TExtObject; Fn: TExtFunction;
      Scope: TExtObject): TExtFunction; overload;
    function Mun(Item: TExtElement; Ename: TExtObject; Fn: TExtFunction;
      Scope: TExtObject): TExtFunction; overload;
    function Mun(Item: TExtElement; Ename: string; Fn: TExtFunction; Scope: TExtObject)
      : TExtFunction; overload;
    function Mun(Item: TExtUtilObservable; Ename: string; Fn: TExtFunction;
      Scope: TExtObject): TExtFunction; overload;
    function NextSibling: TExtFunction;
    function PreviousSibling: TExtFunction;
    function RemoveClass(Cls: string): TExtFunction;
    function Render(Container: TExtElement = nil; Position: string = '')
      : TExtFunction; overload;
    function Render(Container: string; Position: string = ''): TExtFunction; overload;
    function Render(Container: string; Position: Integer): TExtFunction; overload;
    function Render(Container: TExtElement; Position: Integer): TExtFunction; overload;
    function SetDisabled(const AValue: Boolean): TExtFunction;
    function SetVisible(const AValue: Boolean): TExtFunction;
    function Show: TExtFunction;
    function Update(HtmlOrData: string; LoadScripts: Boolean = false;
      Callback: TExtFunction = nil): TExtFunction;
    property AllowDomMove: Boolean read FAllowDomMove write SetFAllowDomMove;
    property ApplyTo: string read FApplyTo write SetFApplyTo;
    property AutoEl: TExtObject read FAutoEl write SetFAutoEl;
    property AutoShow: Boolean read FAutoShow write SetFAutoShow;
    property BubbleEvents: TExtObjectList read FBubbleEvents write SetFBubbleEvents;
    property ClearCls: string read FClearCls write SetFClearCls;
    property Cls: string read FCls write SetCls;
    property ContentEl: string read FContentEl write SetFContentEl;
    property CtCls: string read FCtCls write SetFCtCls;
    property Data: string read FData write SetFData;
    property Disabled: Boolean read FDisabled write _SetDisabled;
    property DisabledClass: string read FDisabledClass write SetFDisabledClass;
    property FieldLabel: string read FFieldLabel write SetFieldLabel;
    property Hidden: Boolean read FHidden write SetHidden;
    property HideLabel: Boolean read FHideLabel write SetFHideLabel;
    property HideMode: string read FHideMode write SetFHideMode;
    property HideParent: Boolean read FHideParent write SetFHideParent;
    property Html: string read FHtml write SetHtml;
    property HtmlObject: TExtObject read FHtmlObject write SetFHtmlObject;
    property Id: string read FId write SetId;
    property ItemCls: string read FItemCls write SetItemCls;
    property ItemId: string read FItemId write SetItemId;
    property LabelSeparator: string read FLabelSeparator write SetLabelSeparator;
    property LabelStyle: string read FLabelStyle write SetLabelStyle;
    property Loader: TExtObject read FLoader;
    property OverCls: string read FOverCls write SetOverCls;
    property Padding: string read FPadding write SetPadding;
    property Plugins: TExtObjectList read FPlugins;
    property Ptype: string read FPtype write SetFPtype;
    property Ref: string read FRef write SetFRef;
    property RenderTo: string read FRenderTo write SetFRenderTo;
    property StateEvents: TExtObjectList read FStateEvents write SetFStateEvents;
    property StateId: string read FStateId write SetFStateId;
    property Stateful: Boolean read FStateful write SetFStateful;
    property Style: string read FStyle write SetStyle;
    property Tpl: string read FTpl write SetTpl;
    property TplWriteMode: string read FTplWriteMode write SetFTplWriteMode;
    property Xtype: TExtComponentXtype read FXtype write SetFXtype;
    property Disabled_: Boolean read FDisabled_ write SetFDisabled_;
    property El: string read FEl write SetFEl;
    property Hidden_: Boolean read FHidden_ write SetFHidden_;
    property Split: Boolean read FSplit write SetSplit;
    property CollapseMode: string read FCollapseMode write SetCollapseMode;
    property MinWidth: Integer read FMinWidth write SetMinWidth;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth;
    property MinSize: Integer read FMinSize write SetMinSize;
    property MaxSize: Integer read FMaxSize write SetMaxSize;
    property Cmargins: string read FCmargins write SetFCmargins;
    property Closable: Boolean read FClosable write SetFClosable;
    property Anchor: string read FAnchor write SetFAnchor;
    property StyleExtObject: TExtObject read FStyleExtObject write SetFStyleExtObject;
    property OnAdded: TExtComponentOnAdded read FOnAdded write SetFOnAdded;
    property OnAfterrender: TExtComponentOnAfterrender read FOnAfterrender
      write SetFOnAfterrender;
    property OnBeforedestroy: TExtComponentOnBeforedestroy read FOnBeforedestroy
      write SetFOnBeforedestroy;
    property OnBeforehide: TExtComponentOnBeforehide read FOnBeforehide
      write SetFOnBeforehide;
    property OnBeforerender: TExtComponentOnBeforerender read FOnBeforerender
      write SetFOnBeforerender;
    property OnBeforeshow: TExtComponentOnBeforeshow read FOnBeforeshow
      write SetFOnBeforeshow;
    property OnBeforestaterestore: TExtComponentOnBeforestaterestore
      read FOnBeforestaterestore write SetFOnBeforestaterestore;
    property OnBeforestatesave: TExtComponentOnBeforestatesave read FOnBeforestatesave
      write SetFOnBeforestatesave;
    property OnDestroyJS: TExtComponentOnDestroyJS read FOnDestroyJS
      write SetFOnDestroyJS;
    property OnDisable: TExtComponentOnDisable read FOnDisable write SetFOnDisable;
    property OnEnable: TExtComponentOnEnable read FOnEnable write SetFOnEnable;
    property OnHide: TExtComponentOnHide read FOnHide write SetFOnHide;
    property OnRemoved: TExtComponentOnRemoved read FOnRemoved write SetFOnRemoved;
    property OnRender: TExtComponentOnRender read FOnRender write SetFOnRender;
    property OnShow: TExtComponentOnShow read FOnShow write SetFOnShow;
    property OnStaterestore: TExtComponentOnStaterestore read FOnStaterestore
      write SetFOnStaterestore;
    property OnStatesave: TExtComponentOnStatesave read FOnStatesave
      write SetFOnStatesave;
  end;

  TExtLayer = class(TExtElement)
  private
    FCls: string;
    FConstrain: Boolean; // true
    FDh: TExtObject;
    FShadow: string;
    FShadowBoolean: Boolean;
    FShadowOffset: Integer; // 4
    FShim: Boolean; // true
    FUseDisplay: Boolean;
    FZindex: Integer; // 11000
    procedure SetFCls(Value: string);
    procedure SetFConstrain(Value: Boolean);
    procedure SetFDh(Value: TExtObject);
    procedure SetFShadow(Value: string);
    procedure SetFShadowBoolean(Value: Boolean);
    procedure SetFShadowOffset(Value: Integer);
    procedure SetFShim(Value: Boolean);
    procedure SetFUseDisplay(Value: Boolean);
    procedure _SetZindex(const AValue: Integer);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function SetZIndex(const AZindex: Integer): TExtFunction;
    property Cls: string read FCls write SetFCls;
    property Constrain: Boolean read FConstrain write SetFConstrain;
    property Dh: TExtObject read FDh write SetFDh;
    property Shadow: string read FShadow write SetFShadow;
    property ShadowBoolean: Boolean read FShadowBoolean write SetFShadowBoolean;
    property ShadowOffset: Integer read FShadowOffset write SetFShadowOffset;
    property Shim: Boolean read FShim write SetFShim;
    property UseDisplay: Boolean read FUseDisplay write SetFUseDisplay;
    property Zindex: Integer read FZindex write _SetZindex;
  end;

  TExtCompositeElement = class(TExtCompositeElementLite)
  public
    class function JSClassName: string; override;
  end;

  TExtWindowMgrSingleton = class(TExtWindowGroup)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  TExtXTemplate = class(TExtTemplate)
  public
    class function JSClassName: string; override;
    function XTemplateFrom(El: string): TExtFunction; overload;
    function Apply(Values: TExtObject): TExtFunction; overload;
    function Apply(Values: TExtObjectList): TExtFunction; overload;
    function ApplyTemplate(Values: TExtObject): TExtFunction;
    function Compile: TExtFunction;
  end;

  // Procedural types for events TExtEditor
  TExtEditorOnBeforecomplete = procedure(This: TExtEditor; Value: string;
    StartValue: string) of object;
  TExtEditorOnBeforestartedit = procedure(This: TExtEditor; BoundEl: TExtElement;
    Value: string) of object;
  TExtEditorOnCanceledit = procedure(This: TExtEditor; Value: string; StartValue: string)
    of object;
  TExtEditorOnComplete = procedure(This: TExtEditor; Value: string; StartValue: string)
    of object;
  TExtEditorOnSpecialkey = procedure(This: TExtEditor; E: TExtEventObjectSingleton)
    of object;
  TExtEditorOnStartedit = procedure(BoundEl: TExtElement; Value: string) of object;

  TExtEditor = class(TExtComponent)
  private
    FAlignment: string;
    FAllowBlur: Boolean;
    FAutoSize: Boolean;
    FAutoSizeString: string;
    FCancelOnEsc: Boolean;
    FCompleteOnEnter: Boolean;
    FConstrain: Boolean;
    FField: TExtFormField;
    FHideEl: Boolean; // true
    FIgnoreNoChange: Boolean;
    FOffsets: TExtObjectList;
    FRevertInvalid: Boolean; // true
    FShadow: Boolean;
    FShadowString: string;
    FSwallowKeys: Boolean; // true
    FUpdateEl: Boolean;
    FValue: string;
    FOnBeforecomplete: TExtEditorOnBeforecomplete;
    FOnBeforestartedit: TExtEditorOnBeforestartedit;
    FOnCanceledit: TExtEditorOnCanceledit;
    FOnComplete: TExtEditorOnComplete;
    FOnSpecialkey: TExtEditorOnSpecialkey;
    FOnStartedit: TExtEditorOnStartedit;
    procedure SetFAlignment(Value: string);
    procedure SetFAllowBlur(Value: Boolean);
    procedure SetFAutoSize(Value: Boolean);
    procedure SetFAutoSizeString(Value: string);
    procedure SetFCancelOnEsc(Value: Boolean);
    procedure SetFCompleteOnEnter(Value: Boolean);
    procedure SetFConstrain(Value: Boolean);
    procedure SetFField(Value: TExtFormField);
    procedure SetFHideEl(Value: Boolean);
    procedure SetFIgnoreNoChange(Value: Boolean);
    procedure SetFOffsets(Value: TExtObjectList);
    procedure SetFRevertInvalid(Value: Boolean);
    procedure SetFShadow(Value: Boolean);
    procedure SetFShadowString(Value: string);
    procedure SetFSwallowKeys(Value: Boolean);
    procedure SetFUpdateEl(Value: Boolean);
    procedure _SetValue(const AValue: string);
    procedure SetFOnBeforecomplete(Value: TExtEditorOnBeforecomplete);
    procedure SetFOnBeforestartedit(Value: TExtEditorOnBeforestartedit);
    procedure SetFOnCanceledit(Value: TExtEditorOnCanceledit);
    procedure SetFOnComplete(Value: TExtEditorOnComplete);
    procedure SetFOnSpecialkey(Value: TExtEditorOnSpecialkey);
    procedure SetFOnStartedit(Value: TExtEditorOnStartedit);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function CancelEdit(RemainVisible: Boolean): TExtFunction;
    function CompleteEdit(RemainVisible: Boolean): TExtFunction;
    function GetValue: TExtFunction;
    function Realign(AutoSize: Boolean = false): TExtFunction;
    function SetSize(Width: Integer; Height: Integer): TExtFunction;
    function SetValue(const AValue: string): TExtFunction;
    function StartEdit(El: string; Value: string = ''): TExtFunction;
    property Alignment: string read FAlignment write SetFAlignment;
    property AllowBlur: Boolean read FAllowBlur write SetFAllowBlur;
    property AutoSize: Boolean read FAutoSize write SetFAutoSize;
    property AutoSizeString: string read FAutoSizeString write SetFAutoSizeString;
    property CancelOnEsc: Boolean read FCancelOnEsc write SetFCancelOnEsc;
    property CompleteOnEnter: Boolean read FCompleteOnEnter write SetFCompleteOnEnter;
    property Constrain: Boolean read FConstrain write SetFConstrain;
    property Field: TExtFormField read FField write SetFField;
    property HideEl: Boolean read FHideEl write SetFHideEl;
    property IgnoreNoChange: Boolean read FIgnoreNoChange write SetFIgnoreNoChange;
    property Offsets: TExtObjectList read FOffsets write SetFOffsets;
    property RevertInvalid: Boolean read FRevertInvalid write SetFRevertInvalid;
    property Shadow: Boolean read FShadow write SetFShadow;
    property ShadowString: string read FShadowString write SetFShadowString;
    property SwallowKeys: Boolean read FSwallowKeys write SetFSwallowKeys;
    property UpdateEl: Boolean read FUpdateEl write SetFUpdateEl;
    property Value: string read FValue write _SetValue;
    property OnBeforecomplete: TExtEditorOnBeforecomplete read FOnBeforecomplete
      write SetFOnBeforecomplete;
    property OnBeforestartedit: TExtEditorOnBeforestartedit read FOnBeforestartedit
      write SetFOnBeforestartedit;
    property OnCanceledit: TExtEditorOnCanceledit read FOnCanceledit
      write SetFOnCanceledit;
    property OnComplete: TExtEditorOnComplete read FOnComplete write SetFOnComplete;
    property OnSpecialkey: TExtEditorOnSpecialkey read FOnSpecialkey
      write SetFOnSpecialkey;
    property OnStartedit: TExtEditorOnStartedit read FOnStartedit write SetFOnStartedit;
  end;

  // Procedural types for events TExtColorPalette
  TExtColorPaletteOnSelect = procedure(This: TExtColorPalette; Color: string) of object;

  TExtColorPalette = class(TExtComponent)
  private
    FAllowReselect: Boolean;
    FClickEvent: string;
    FHandler: TExtFunction;
    FItemCls: string; // 'x-color-palette'
    FScope: TExtObject;
    FTpl: string;
    FValue: string;
    FColors: TExtObjectList;
    FOnSelect: TExtColorPaletteOnSelect;
    procedure SetFAllowReselect(Value: Boolean);
    procedure SetFClickEvent(Value: string);
    procedure SetFHandler(Value: TExtFunction);
    procedure SetFItemCls(Value: string);
    procedure SetFScope(Value: TExtObject);
    procedure SetFTpl(Value: string);
    procedure SetFValue(Value: string);
    procedure SetFColors(Value: TExtObjectList);
    procedure SetFOnSelect(Value: TExtColorPaletteOnSelect);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function Select(Color: string; SuppressEvent: Boolean = false): TExtFunction;
    property AllowReselect: Boolean read FAllowReselect write SetFAllowReselect;
    property ClickEvent: string read FClickEvent write SetFClickEvent;
    property Handler: TExtFunction read FHandler write SetFHandler;
    property ItemCls: string read FItemCls write SetFItemCls;
    property Scope: TExtObject read FScope write SetFScope;
    property Tpl: string read FTpl write SetFTpl;
    property Value: string read FValue write SetFValue;
    property Colors: TExtObjectList read FColors write SetFColors;
    property OnSelect: TExtColorPaletteOnSelect read FOnSelect write SetFOnSelect;
  end;

  // Procedural types for events TExtDatePicker
  TExtDatePickerOnSelect = procedure(This: TExtDatePicker; Date: TDateTime) of object;

  TExtDatePicker = class(TExtComponent)
  private
    FCancelText: string; // 'Cancel'
    FDayNames: TExtObjectList;
    FFormat: string; // 'm/d/y'
    FHandler: TExtFunction;
    FMaxDate: TDateTime;
    FMaxText: string; // 'This date is after the maximum date'
    FMinDate: TDateTime;
    FMinText: string; // 'This date is before the minimum date'
    FMonthNames: TExtObjectList;
    FMonthYearText: string;
    FNextText: string;
    FOkText: string; // 'OK'
    FPrevText: string;
    FScope: TExtObject;
    FShowToday: Boolean; // true
    FStartDay: Integer; // 0
    FTodayText: string; // 'Today'
    FTodayTip: string;
    FOnSelect: TExtDatePickerOnSelect;
    procedure SetFCancelText(Value: string);
    procedure SetFDayNames(Value: TExtObjectList);
    procedure SetFFormat(Value: string);
    procedure SetFHandler(Value: TExtFunction);
    procedure _SetMaxDate(const AValue: TDateTime);
    procedure SetFMaxText(Value: string);
    procedure _SetMinDate(const AValue: TDateTime);
    procedure SetFMinText(Value: string);
    procedure SetFMonthNames(Value: TExtObjectList);
    procedure SetFMonthYearText(Value: string);
    procedure SetFNextText(Value: string);
    procedure SetFOkText(Value: string);
    procedure SetFPrevText(Value: string);
    procedure SetFScope(Value: TExtObject);
    procedure SetFShowToday(Value: Boolean);
    procedure SetFStartDay(Value: Integer);
    procedure SetFTodayText(Value: string);
    procedure SetFTodayTip(Value: string);
    procedure SetFOnSelect(Value: TExtDatePickerOnSelect);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetValue: TExtFunction;
    function SetMaxDate(const AValue: TDateTime): TExtFunction;
    function SetMinDate(const AValue: TDateTime): TExtFunction;
    function SetValue(Value: TDateTime): TExtFunction;
    property CancelText: string read FCancelText write SetFCancelText;
    property DayNames: TExtObjectList read FDayNames write SetFDayNames;
    property Format: string read FFormat write SetFFormat;
    property Handler: TExtFunction read FHandler write SetFHandler;
    property MaxDate: TDateTime read FMaxDate write _SetMaxDate;
    property MaxText: string read FMaxText write SetFMaxText;
    property MinDate: TDateTime read FMinDate write _SetMinDate;
    property MinText: string read FMinText write SetFMinText;
    property MonthNames: TExtObjectList read FMonthNames write SetFMonthNames;
    property MonthYearText: string read FMonthYearText write SetFMonthYearText;
    property NextText: string read FNextText write SetFNextText;
    property OkText: string read FOkText write SetFOkText;
    property PrevText: string read FPrevText write SetFPrevText;
    property Scope: TExtObject read FScope write SetFScope;
    property ShowToday: Boolean read FShowToday write SetFShowToday;
    property StartDay: Integer read FStartDay write SetFStartDay;
    property TodayText: string read FTodayText write SetFTodayText;
    property TodayTip: string read FTodayTip write SetFTodayTip;
    property OnSelect: TExtDatePickerOnSelect read FOnSelect write SetFOnSelect;
  end;

  // Procedural types for events TExtBoxComponent
  TExtBoxComponentOnMove = procedure(This: TExtBoxComponent; X: Integer; Y: Integer)
    of object;
  TExtBoxComponentOnResize = procedure(This: TExtBoxComponent; AdjWidth: Integer;
    AdjHeight: Integer; RawWidth: Integer; RawHeight: Integer) of object;

  // Enumerated types for properties
  TExtBoxComponentRegion = (rgCenter, rgNorth, rgEast, rgSouth, rgWest);

  TExtBoxComponent = class(TExtComponent)
  private
    FAnchor: string;
    FAutoHeight: Boolean;
    FAutoScroll: Boolean;
    FAutoWidth: Boolean;
    FBoxMaxHeight: Integer;
    FBoxMaxWidth: Integer;
    FBoxMinHeight: Integer;
    FBoxMinWidth: Integer;
    FFlex: Integer;
    FHeight: Integer;
    FMargins: string;
    FPageX: Integer;
    FPageY: Integer;
    FRegion: TExtBoxComponentRegion;
    FTabTip: string;
    FWidth: Integer;
    FX: Integer;
    FY: Integer;
    FOnMove: TExtBoxComponentOnMove;
    FOnResize: TExtBoxComponentOnResize;
    FWidthString: string;
    FHeightString: string;
    procedure SetAnchor(const AValue: string);
    procedure SetAutoHeight(const AValue: Boolean);
    procedure _SetAutoScroll(const AValue: Boolean);
    procedure SetAutoWidth(const AValue: Boolean);
    procedure SetFBoxMaxHeight(Value: Integer);
    procedure SetFBoxMaxWidth(Value: Integer);
    procedure SetFBoxMinHeight(Value: Integer);
    procedure SetFBoxMinWidth(Value: Integer);
    procedure SetFlex(const AValue: Integer);
    procedure SetHeight(const AValue: Integer);
    procedure SetMargins(AValue: string);
    procedure SetFPageX(Value: Integer);
    procedure SetFPageY(Value: Integer);
    procedure SetRegion(const AValue: TExtBoxComponentRegion);
    procedure SetFTabTip(Value: string);
    procedure SetWidth(const AValue: Integer);
    procedure SetFX(Value: Integer);
    procedure SetFY(Value: Integer);
    procedure SetFOnMove(Value: TExtBoxComponentOnMove);
    procedure SetFOnResize(Value: TExtBoxComponentOnResize);
    procedure SetHeightString(const AValue: string);
    procedure SetWidthString(const AValue: string);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetBox(Local: Boolean = false): TExtFunction;
    function GetHeight: TExtFunction;
    function GetOuterSize: TExtFunction;
    function GetPosition(Local: Boolean = false): TExtFunction;
    function GetResizeEl: TExtFunction;
    function GetSize: TExtFunction;
    function GetWidth: TExtFunction;
    function SetAutoScroll(Scroll: Boolean): TExtFunction;
    function SetPagePosition(X: Integer; Y: Integer): TExtFunction;
    function SetPosition(LEFT: Integer; Top: Integer): TExtFunction;
    function SetSize(Width: string; Height: string): TExtFunction;
    function SyncSize: TExtFunction;
    function UpdateBox(Box: TExtObject): TExtFunction;
    property Anchor: string read FAnchor write SetAnchor;
    property AutoHeight: Boolean read FAutoHeight write SetAutoHeight;
    property AutoScroll: Boolean read FAutoScroll write _SetAutoScroll;
    property AutoWidth: Boolean read FAutoWidth write SetAutoWidth;
    property BoxMaxHeight: Integer read FBoxMaxHeight write SetFBoxMaxHeight;
    property BoxMaxWidth: Integer read FBoxMaxWidth write SetFBoxMaxWidth;
    property BoxMinHeight: Integer read FBoxMinHeight write SetFBoxMinHeight;
    property BoxMinWidth: Integer read FBoxMinWidth write SetFBoxMinWidth;
    property Flex: Integer read FFlex write SetFlex;
    property Height: Integer read FHeight write SetHeight;
    property HeightString: string read FHeightString write SetHeightString;
    property Margins: string read FMargins write SetMargins;
    property PageX: Integer read FPageX write SetFPageX;
    property PageY: Integer read FPageY write SetFPageY;
    property Region: TExtBoxComponentRegion read FRegion write SetRegion;
    property TabTip: string read FTabTip write SetFTabTip;
    property Width: Integer read FWidth write SetWidth;
    property WidthString: string read FWidthString write SetWidthString;
    property X: Integer read FX write SetFX;
    property Y: Integer read FY write SetFY;
    property OnMove: TExtBoxComponentOnMove read FOnMove write SetFOnMove;
    property OnResize: TExtBoxComponentOnResize read FOnResize write SetFOnResize;
  end;

  TExtToolbarItem = class(TExtBoxComponent)
  private
    FOverflowText: string;
    procedure SetFOverflowText(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property OverflowText: string read FOverflowText write SetFOverflowText;
  end;

  // Procedural types for events TExtFlashComponent
  TExtFlashComponentOnInitialize = procedure(This: TExtFlashComponent) of object;

  TExtFlashComponent = class(TExtBoxComponent)
  private
    FBackgroundColor: string;
    FExpressInstall: Boolean;
    FFlashParams: TExtObject;
    FFlashVars: TExtObject;
    FFlashVersion: string;
    FUrl: string;
    FWmode: string;
    FOnInitialize: TExtFlashComponentOnInitialize;
    procedure SetFBackgroundColor(Value: string);
    procedure SetFExpressInstall(Value: Boolean);
    procedure SetFFlashParams(Value: TExtObject);
    procedure SetFFlashVars(Value: TExtObject);
    procedure SetFFlashVersion(Value: string);
    procedure SetFUrl(Value: string);
    procedure SetFWmode(Value: string);
    procedure SetFOnInitialize(Value: TExtFlashComponentOnInitialize);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    class function EXPRESS_INSTALL_URL: string;
    property BackgroundColor: string read FBackgroundColor write SetFBackgroundColor;
    property ExpressInstall: Boolean read FExpressInstall write SetFExpressInstall;
    property FlashParams: TExtObject read FFlashParams write SetFFlashParams;
    property FlashVars: TExtObject read FFlashVars write SetFFlashVars;
    property FlashVersion: string read FFlashVersion write SetFFlashVersion;
    property Url: string read FUrl write SetFUrl;
    property Wmode: string read FWmode write SetFWmode;
    property OnInitialize: TExtFlashComponentOnInitialize read FOnInitialize
      write SetFOnInitialize;
  end;

  // Procedural types for events TExtProgressBar
  TExtProgressBarOnUpdate = procedure(This: TExtProgressBar; The: Integer; The_: string)
    of object;

  TExtProgressBar = class(TExtBoxComponent)
  private
    FAnimate: Boolean;
    FBaseCls: string; // 'x-progress'
    FId: string;
    FText: string;
    FTextEl: string;
    FValue: Double;
    FOnUpdate: TExtProgressBarOnUpdate;
    procedure SetFAnimate(Value: Boolean);
    procedure SetFBaseCls(Value: string);
    procedure SetFId(Value: string);
    procedure SetFText(Value: string);
    procedure SetFTextEl(Value: string);
    procedure SetFValue(Value: Double);
    procedure SetFOnUpdate(Value: TExtProgressBarOnUpdate);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function IsWaiting: TExtFunction;
    function Reset(Hide: Boolean = false): TExtFunction;
    function SetSize(Width: Integer; Height: Integer): TExtFunction;
    function SyncProgressBar: TExtFunction;
    function UpdateProgress(Value: Double = 0; Text: string = '';
      Animate: Boolean = false): TExtFunction;
    function UpdateText(Text: string = ''): TExtFunction;
    function Wait(Config: TExtObject = nil): TExtFunction;
    property Animate: Boolean read FAnimate write SetFAnimate;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property Id: string read FId write SetFId;
    property Text: string read FText write SetFText;
    property TextEl: string read FTextEl write SetFTextEl;
    property Value: Double read FValue write SetFValue;
    property OnUpdate: TExtProgressBarOnUpdate read FOnUpdate write SetFOnUpdate;
  end;

  TExtSpacer = class(TExtBoxComponent)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  // Procedural types for events TExtContainer
  TExtContainerOnAdd = procedure(This: TExtContainer; Component: TExtComponent;
    Index: Integer) of object;
  TExtContainerOnAfterlayout = procedure(This: TExtContainer; Layout: TExtObject)
    of object;
  TExtContainerOnBeforeadd = procedure(This: TExtContainer; Component: TExtComponent;
    Index: Integer) of object;
  TExtContainerOnBeforeremove = procedure(This: TExtContainer; Component: TExtComponent)
    of object;
  TExtContainerOnRemove = procedure(This: TExtContainer; Component: TExtComponent)
    of object;

  // Enumerated types for properties
  TExtContainerLayout = (lyAuto, lyAbsolute, lyAccordion, lyAnchor, lyBody,
    lyBorder, lyBoundlist, lyBox, lyCard, lyCenter, lyCheckboxgroup,
    lyColumn, lyColumncomponent, lyContainer, lyDashboard, lyDock, lyEditor,
    lyFieldContainer, lyFieldset, lyFit, lyForm, lyGridcolumn, lyHbox,
    lyResponsivecolumn, lySegmentedbutton, lyTable, lyTableview, lyVbox);
  TExtContainerLabelAlign = (laLeft, laRight, laTop);

  TExtContainer = class(TExtBoxComponent)
  private
    FActiveItem: string;
    FActiveItemNumber: Integer;
    FAutoDestroy: Boolean; // true
    FBufferResize: Boolean;
    FBufferResizeNumber: Integer;
    FDefaultType: TExtComponentXtype;
    FDefaults: TExtObject;
    FDefaultsFunction: TExtFunction;
    FForceLayout: Boolean;
    FHideBorders: Boolean;
    FItems: TExtObjectList;
    FLayout: TExtContainerLayout;
    FLayoutObject: TExtObject;
    FLayoutConfig: TExtObject;
    FMonitorResize: Boolean;
    FResizeEvent: string;
    FColspan: Integer;
    FRowspan: Integer;
    FLayoutString: string;
    FColumnWidth: Double;
    FOnAdd: TExtContainerOnAdd;
    FOnAfterlayout: TExtContainerOnAfterlayout;
    FOnBeforeadd: TExtContainerOnBeforeadd;
    FOnBeforeremove: TExtContainerOnBeforeremove;
    FOnRemove: TExtContainerOnRemove;
    FLabelWidth: Integer;
    FLabelAlign: TExtContainerLabelAlign;
    procedure SetActiveItem(const AValue: string);
    procedure SetActiveItemNumber(const AValue: Integer);
    procedure SetFAutoDestroy(Value: Boolean);
    procedure SetFBufferResize(Value: Boolean);
    procedure SetFBufferResizeNumber(Value: Integer);
    procedure SetFDefaultType(Value: TExtComponentXtype);
//    procedure SetDefaults(const AValue: TExtObject);
    procedure SetFDefaultsFunction(Value: TExtFunction);
    procedure SetFForceLayout(Value: Boolean);
    procedure SetFHideBorders(Value: Boolean);
    procedure SetLayout(const AValue: TExtContainerLayout);
    procedure SetFLayoutObject(Value: TExtObject);
    procedure SetFLayoutConfig(Value: TExtObject);
    procedure SetFMonitorResize(Value: Boolean);
    procedure SetFResizeEvent(Value: string);
    procedure SetFColspan(Value: Integer);
    procedure SetFRowspan(Value: Integer);
    procedure SetFLayoutString(Value: string);
    procedure SetColumnWidth(const AValue: Double);
    procedure SetFOnAdd(Value: TExtContainerOnAdd);
    procedure SetFOnAfterlayout(Value: TExtContainerOnAfterlayout);
    procedure SetFOnBeforeadd(Value: TExtContainerOnBeforeadd);
    procedure SetFOnBeforeremove(Value: TExtContainerOnBeforeremove);
    procedure SetFOnRemove(Value: TExtContainerOnRemove);
    procedure SetLabelWidth(const AValue: Integer);
    procedure SetLabelAlign(const AValue: TExtContainerLabelAlign);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function Add(Component: TObject): TExtFunction; overload;
    function Add(Component: TExtObjectList): TExtFunction; overload;
    function Bubble(Fn: TExtFunction; Scope: TExtObject = nil; Args: TExtObjectList = nil)
      : TExtFunction;
    function Cascade(Fn: TExtFunction; Scope: TExtObject = nil;
      Args: TExtObjectList = nil): TExtFunction;
    function UpdateLayout(const AShallow: Boolean; const AForce: Boolean): TExtFunction; overload;
    function UpdateLayout: TExtFunction; overload;
    function Find(Prop: string; Value: string): TExtFunction;
    function FindBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function FindById(Id: string): TExtFunction;
    function FindByType(Xtype: string; Shallow: Boolean = false): TExtFunction; overload;
    function FindByType(Xtype: TClass; Shallow: Boolean = false): TExtFunction; overload;
    function Get(Key: string): TExtFunction; overload;
    function Get(Key: Integer): TExtFunction; overload;
    function GetComponent(Comp: string): TExtFunction; overload;
    function GetComponent(Comp: Integer): TExtFunction; overload;
    function GetLayout: TExtFunction;
    function GetLayoutTarget: TExtFunction;
    function INSERT(Index: Integer; Component: TExtComponent): TExtFunction;
    function Remove(const AComponent: TExtComponent; const AAutoDestroy: Boolean = False): TExtFunction; overload;
    function Remove(Component: string; AutoDestroy: Boolean = false)
      : TExtFunction; overload;
    function RemoveAll(AutoDestroy: Boolean = false): TExtFunction;
    property ActiveItem: string read FActiveItem write SetActiveItem;
    property ActiveItemNumber: Integer read FActiveItemNumber write SetActiveItemNumber;
    property AutoDestroy: Boolean read FAutoDestroy write SetFAutoDestroy;
    property BufferResize: Boolean read FBufferResize write SetFBufferResize;
    property BufferResizeNumber: Integer read FBufferResizeNumber
      write SetFBufferResizeNumber;
    property DefaultType: TExtComponentXtype read FDefaultType write SetFDefaultType;
    property Defaults: TExtObject read FDefaults;
    property DefaultsFunction: TExtFunction read FDefaultsFunction
      write SetFDefaultsFunction;
    property ForceLayout: Boolean read FForceLayout write SetFForceLayout;
    property HideBorders: Boolean read FHideBorders write SetFHideBorders;
    property Items: TExtObjectList read FItems;
    property LabelAlign: TExtContainerLabelAlign read FLabelAlign write SetLabelAlign;
    property LabelWidth: Integer read FLabelWidth write SetLabelWidth;
    property Layout: TExtContainerLayout read FLayout write SetLayout;
    property LayoutObject: TExtObject read FLayoutObject write SetFLayoutObject;
    property LayoutConfig: TExtObject read FLayoutConfig write SetFLayoutConfig;
    property MonitorResize: Boolean read FMonitorResize write SetFMonitorResize;
    property ResizeEvent: string read FResizeEvent write SetFResizeEvent;
    property Colspan: Integer read FColspan write SetFColspan;
    property Rowspan: Integer read FRowspan write SetFRowspan;
    property LayoutString: string read FLayoutString write SetFLayoutString;
    property ColumnWidth: Double read FColumnWidth write SetColumnWidth;
    property OnAdd: TExtContainerOnAdd read FOnAdd write SetFOnAdd;
    property OnAfterlayout: TExtContainerOnAfterlayout read FOnAfterlayout
      write SetFOnAfterlayout;
    property OnBeforeadd: TExtContainerOnBeforeadd read FOnBeforeadd
      write SetFOnBeforeadd;
    property OnBeforeremove: TExtContainerOnBeforeremove read FOnBeforeremove
      write SetFOnBeforeremove;
    property OnRemove: TExtContainerOnRemove read FOnRemove write SetFOnRemove;
  end;

  // Procedural types for events TExtButton
  TExtButtonOnClick = procedure(This: TExtButton; E: TExtEventObjectSingleton) of object;
  TExtButtonOnMenuhide = procedure(This: TExtButton; Menu: TExtObject) of object;
  TExtButtonOnMenushow = procedure(This: TExtButton; Menu: TExtObject) of object;
  TExtButtonOnMenutriggerout = procedure(This: TExtButton; Menu: TExtObject;
    E: TExtEventObjectSingleton) of object;
  TExtButtonOnMenutriggerover = procedure(This: TExtButton; Menu: TExtObject;
    E: TExtEventObjectSingleton) of object;
  TExtButtonOnToggle = procedure(This: TExtButton; Pressed: Boolean) of object;

  TExtButton = class(TExtBoxComponent)
  private
    FAllowDepress: Boolean;
    FArrowAlign: string;
    FAutoWidth: Boolean;
    FButtonSelector: string;
    FClickEvent: string;
    FCls: string;
    FDisabled: Boolean;
    FEnableToggle: Boolean;
    FFormBind: Boolean;
    FHandleMouseEvents: Boolean; // true
    FHandler: TExtFunction;
    FHidden: Boolean;
    FIcon: string;
    FIconAlign: string;
    FIconCls: string;
    FMenu: TExtUtilObservable;
    FMenuAlign: string;
    FMinWidth: Integer;
    FOverflowText: string;
    FPressed: Boolean;
    FRepeatJS: Boolean;
    FRepeatJSObject: TExtObject;
    FScale: string;
    FScope: TExtObject;
    FTabIndex: Integer;
    FTemplate: TExtTemplate;
    FText: string;
    FToggleGroup: string;
    FToggleHandler: TExtFunction;
    FTooltip: string;
    FTooltipObject: TExtObject;
    FTooltipType: string;
    FTypeJS: string;
    FBtnEl: TExtElement;
    FDisabled_: Boolean;
    FHidden_: Boolean;
    FMenu_: TExtMenuMenu;
    FOnClick: TExtButtonOnClick;
    FOnMenuhide: TExtButtonOnMenuhide;
    FOnMenushow: TExtButtonOnMenushow;
    FOnMenutriggerout: TExtButtonOnMenutriggerout;
    FOnMenutriggerover: TExtButtonOnMenutriggerover;
    FOnToggle: TExtButtonOnToggle;
    procedure SetAllowDepress(const AValue: Boolean);
    procedure SetFArrowAlign(Value: string);
    procedure SetFAutoWidth(Value: Boolean);
    procedure SetFButtonSelector(Value: string);
    procedure SetFClickEvent(Value: string);
    procedure SetFCls(Value: string);
    procedure SetDisabled(const AValue: Boolean);
    procedure SetEnableToggle(const AValue: Boolean);
    procedure SetFormBind(const AValue: Boolean);
    procedure SetFHandleMouseEvents(Value: Boolean);
    procedure _SetHandler(const AValue: TExtFunction);
    procedure SetHidden(const AValue: Boolean);
    procedure _SetIcon(const AValue: string);
    procedure SetFIconAlign(Value: string);
    procedure SetIconCls(const AValue: string);
    procedure SetMenu(AValue: TExtUtilObservable);
    procedure SetFMenuAlign(Value: string);
    procedure SetFMinWidth(const AValue: Integer);
    procedure SetFOverflowText(Value: string);
    procedure SetPressed(const AValue: Boolean);
    procedure SetFRepeatJS(Value: Boolean);
    procedure SetFRepeatJSObject(Value: TExtObject);
    procedure SetScale(const AValue: string);
    procedure SetFScope(Value: TExtObject);
    procedure SetFTabIndex(Value: Integer);
    procedure SetFTemplate(Value: TExtTemplate);
    procedure _SetText(const AValue: string);
    procedure SetToggleGroup(const AValue: string);
    procedure SetFToggleHandler(Value: TExtFunction);
    procedure _SetTooltip(const AValue: string);
    procedure SetFTooltipObject(Value: TExtObject);
    procedure SetFTooltipType(Value: string);
    procedure SetFTypeJS(Value: string);
    procedure SetFBtnEl(Value: TExtElement);
    procedure SetFDisabled_(Value: Boolean);
    procedure SetFHidden_(Value: Boolean);
    procedure SetFMenu_(Value: TExtMenuMenu);
    procedure SetFOnClick(Value: TExtButtonOnClick);
    procedure SetFOnMenuhide(Value: TExtButtonOnMenuhide);
    procedure SetFOnMenushow(Value: TExtButtonOnMenushow);
    procedure SetFOnMenutriggerout(Value: TExtButtonOnMenutriggerout);
    procedure SetFOnMenutriggerover(Value: TExtButtonOnMenutriggerover);
    procedure SetFOnToggle(Value: TExtButtonOnToggle);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetPressed(const AGroup: string): TExtFunction;
    function Pressed_: TExtFunction;
    function GetTemplateArgs: TExtFunction;
    function GetText: TExtFunction;
    function HasVisibleMenu: TExtFunction;
    function HideMenu: TExtFunction;
    function SetHandler(const AHandler: TExtFunction; const AScope: TExtObject = nil)
      : TExtFunction;
    function SetIcon(Icon: string): TExtFunction;
    function SetIconClass(Cls: string): TExtFunction;
    function SetText(const AText: string): TExtFunction;
    function SetTooltip(const ATooltip: string): TExtFunction; overload;
    function SetTooltip(const ATooltip: TExtObject): TExtFunction; overload;
    function ShowMenu: TExtFunction;
    function Toggle(State: Boolean = false; SupressEvent: Boolean = false): TExtFunction;
    property AllowDepress: Boolean read FAllowDepress write SetAllowDepress;
    property ArrowAlign: string read FArrowAlign write SetFArrowAlign;
    property AutoWidth: Boolean read FAutoWidth write SetFAutoWidth;
    property ButtonSelector: string read FButtonSelector write SetFButtonSelector;
    property ClickEvent: string read FClickEvent write SetFClickEvent;
    property Cls: string read FCls write SetFCls;
    property Disabled: Boolean read FDisabled write SetDisabled;
    property EnableToggle: Boolean read FEnableToggle write SetEnableToggle;
    property FormBind: Boolean read FFormBind write SetFormBind;
    property HandleMouseEvents: Boolean read FHandleMouseEvents
      write SetFHandleMouseEvents;
    property Handler: TExtFunction read FHandler write _SetHandler;
    property Hidden: Boolean read FHidden write SetHidden;
    property Icon: string read FIcon write _SetIcon;
    property IconAlign: string read FIconAlign write SetFIconAlign;
    property IconCls: string read FIconCls write SetIconCls;
    property Menu: TExtUtilObservable read FMenu write SetMenu;
    property MenuAlign: string read FMenuAlign write SetFMenuAlign;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
    property OverflowText: string read FOverflowText write SetFOverflowText;
    property Pressed: Boolean read FPressed write SetPressed;
    property RepeatJS: Boolean read FRepeatJS write SetFRepeatJS;
    property RepeatJSObject: TExtObject read FRepeatJSObject write SetFRepeatJSObject;
    property Scale: string read FScale write SetScale;
    property Scope: TExtObject read FScope write SetFScope;
    property TabIndex: Integer read FTabIndex write SetFTabIndex;
    property Template: TExtTemplate read FTemplate write SetFTemplate;
    property Text: string read FText write _SetText;
    property ToggleGroup: string read FToggleGroup write SetToggleGroup;
    property ToggleHandler: TExtFunction read FToggleHandler write SetFToggleHandler;
    property Tooltip: string read FTooltip write _SetTooltip;
    property TooltipObject: TExtObject read FTooltipObject write SetFTooltipObject;
    property TooltipType: string read FTooltipType write SetFTooltipType;
    property TypeJS: string read FTypeJS write SetFTypeJS;
    property BtnEl: TExtElement read FBtnEl write SetFBtnEl;
    property Disabled_: Boolean read FDisabled_ write SetFDisabled_;
    property Hidden_: Boolean read FHidden_ write SetFHidden_;
    property Menu_: TExtMenuMenu read FMenu_ write SetFMenu_;
    property OnClick: TExtButtonOnClick read FOnClick write SetFOnClick;
    property OnMenuhide: TExtButtonOnMenuhide read FOnMenuhide write SetFOnMenuhide;
    property OnMenushow: TExtButtonOnMenushow read FOnMenushow write SetFOnMenushow;
    property OnMenutriggerout: TExtButtonOnMenutriggerout read FOnMenutriggerout
      write SetFOnMenutriggerout;
    property OnMenutriggerover: TExtButtonOnMenutriggerover read FOnMenutriggerover
      write SetFOnMenutriggerover;
    property OnToggle: TExtButtonOnToggle read FOnToggle write SetFOnToggle;
    procedure PerformClick;
  end;

  // Procedural types for events TExtDataView
  TExtDataViewOnContainerclick = procedure(This: TExtDataView;
    E: TExtEventObjectSingleton) of object;
  TExtDataViewOnContainercontextmenu = procedure(This: TExtDataView;
    E: TExtEventObjectSingleton) of object;
  TExtDataViewOnSelectionchange = procedure(This: TExtDataView;
    Selections: TExtObjectList) of object;

  TExtDataView = class(TExtBoxComponent)
  private
    FBlockRefresh: Boolean;
    FDeferEmptyText: Boolean;
    FEmptyText: string;
    FItemSelector: string;
    FLoadingText: string;
    FMultiSelect: Boolean;
    FOverClass: string;
    FSelectedClass: string; // 'x-view-selected'
    FSimpleSelect: Boolean;
    FSingleSelect: Boolean;
    FStore: TExtDataStore;
    FTpl: string;
    FTplArray: TExtObjectList;
    FTrackOver: Boolean;
    FOnContainerclick: TExtDataViewOnContainerclick;
    FOnContainercontextmenu: TExtDataViewOnContainercontextmenu;
    FOnSelectionchange: TExtDataViewOnSelectionchange;
    FStoreArray: TExtObjectList;
    procedure SetFBlockRefresh(Value: Boolean);
    procedure SetFDeferEmptyText(Value: Boolean);
    procedure SetEmptyText(AValue: string);
    procedure SetItemSelector(const AValue: string);
    procedure SetFLoadingText(Value: string);
    procedure SetMultiSelect(const AValue: Boolean);
    procedure SetOverClass(const AValue: string);
    procedure SetFSelectedClass(Value: string);
    procedure SetFSimpleSelect(Value: Boolean);
    procedure SetSingleSelect(const AValue: Boolean);
    procedure _SetStore(const AValue: TExtDataStore);
    procedure SetTpl(AValue: string);
    procedure SetFTplArray(Value: TExtObjectList);
    procedure SetFTrackOver(Value: Boolean);
    procedure SetFOnContainerclick(Value: TExtDataViewOnContainerclick);
    procedure SetFOnContainercontextmenu(Value: TExtDataViewOnContainercontextmenu);
    procedure SetFOnSelectionchange(Value: TExtDataViewOnSelectionchange);
    procedure SetStoreArray(const AValue: TExtObjectList);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function BindStore(Store: TExtDataStore): TExtFunction;
    function ClearSelections(SuppressEvent: Boolean = false): TExtFunction;
    function CollectData(Records: TExtObjectList; StartIndex: Integer): TExtFunction;
    function Deselect(Node: Integer): TExtFunction; overload;
    function Deselect(Node: TExtDataRecord): TExtFunction; overload;
    function GetNode(NodeInfo: string): TExtFunction; overload;
    function GetNode(NodeInfo: Integer): TExtFunction; overload;
    function GetNode(NodeInfo: TExtDataRecord): TExtFunction; overload;
    function GetNodes(Start: Integer = 0; ENDJS: Integer = 0): TExtFunction;
    function GetRecords(Nodes: TExtObjectList): TExtFunction;
    function GetSelectedIndexes: TExtFunction;
    function GetSelectedNodes: TExtFunction;
    function GetSelectedRecords: TExtFunction;
    function GetSelectionCount: TExtFunction;
    function GetStore: TExtFunction;
    function IndexOf(NodeInfo: string): TExtFunction; overload;
    function IndexOf(NodeInfo: Integer): TExtFunction; overload;
    function IndexOf(NodeInfo: TExtDataRecord): TExtFunction; overload;
    function IsSelected(Node: Integer): TExtFunction; overload;
    function IsSelected(Node: TExtDataRecord): TExtFunction; overload;
    function PrepareData(Data: TExtObjectList; RecordIndex: Integer;
      RecordJS: TExtDataRecord): TExtFunction; overload;
    function PrepareData(Data: TExtObject; RecordIndex: Integer; RecordJS: TExtDataRecord)
      : TExtFunction; overload;
    function Refresh: TExtFunction;
    function RefreshNode(Index: Integer): TExtFunction;
    function Select(NodeInfo: TExtObjectList; KeepExisting: Boolean = false;
      SuppressEvent: Boolean = false): TExtFunction; overload;
    function Select(NodeInfo: string; KeepExisting: Boolean = false;
      SuppressEvent: Boolean = false): TExtFunction; overload;
    function Select(NodeInfo: Integer; KeepExisting: Boolean = false;
      SuppressEvent: Boolean = false): TExtFunction; overload;
    function Select(NodeInfo: TExtDataRecord; KeepExisting: Boolean = false;
      SuppressEvent: Boolean = false): TExtFunction; overload;
    function SelectRange(Start: Integer; ENDJS: Integer; KeepExisting: Boolean = false)
      : TExtFunction;
    function SetStore(const AStore: TExtDataStore): TExtFunction;
    property BlockRefresh: Boolean read FBlockRefresh write SetFBlockRefresh;
    property DeferEmptyText: Boolean read FDeferEmptyText write SetFDeferEmptyText;
    property EmptyText: string read FEmptyText write SetEmptyText;
    property ItemSelector: string read FItemSelector write SetItemSelector;
    property LoadingText: string read FLoadingText write SetFLoadingText;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
    property OverClass: string read FOverClass write SetOverClass;
    property SelectedClass: string read FSelectedClass write SetFSelectedClass;
    property SimpleSelect: Boolean read FSimpleSelect write SetFSimpleSelect;
    property SingleSelect: Boolean read FSingleSelect write SetSingleSelect;
    property Store: TExtDataStore read FStore write _SetStore;
    property StoreArray: TExtObjectList read FStoreArray write SetStoreArray;
    property Tpl: string read FTpl write SetTpl;
    property TplArray: TExtObjectList read FTplArray write SetFTplArray;
    property TrackOver: Boolean read FTrackOver write SetFTrackOver;
    property OnContainerclick: TExtDataViewOnContainerclick read FOnContainerclick
      write SetFOnContainerclick;
    property OnContainercontextmenu: TExtDataViewOnContainercontextmenu
      read FOnContainercontextmenu write SetFOnContainercontextmenu;
    property OnSelectionchange: TExtDataViewOnSelectionchange read FOnSelectionchange
      write SetFOnSelectionchange;
  end;

  TExtViewport = class(TExtContainer)
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
  end;

  // Procedural types for events TExtPanel
  TExtPanelOnActivate = procedure(P: TExtPanel) of object;
  TExtPanelOnBeforeclose = procedure(P: TExtPanel) of object;
  TExtPanelOnBeforecollapse = procedure(P: TExtPanel; Animate: Boolean) of object;
  TExtPanelOnBeforeexpand = procedure(P: TExtPanel; Animate: Boolean) of object;
  TExtPanelOnBodyresize = procedure(P: TExtPanel; Width: Integer; Height: Integer)
    of object;
  TExtPanelOnClose = procedure(P: TExtPanel) of object;
  TExtPanelOnCollapse = procedure(P: TExtPanel) of object;
  TExtPanelOnDeactivate = procedure(P: TExtPanel) of object;
  TExtPanelOnExpand = procedure(P: TExtPanel) of object;
  TExtPanelOnIconchange = procedure(P: TExtPanel; The: string; The_: string) of object;
  TExtPanelOnTitlechange = procedure(P: TExtPanel; The: string) of object;

  // Enumerated types for properties
  TExtPanelButtonAlign = (baRight, baLeft, baCenter);

  // Enumerated types for properties
  TExtGridColumnAlign = (caLeft, caRight, caCenter);

  TExtPanel = class(TExtContainer)
  private
    FAnimCollapse: Boolean; // true
    FApplyTo: string;
    FAutoHeight: Boolean;
    FAutoLoad: TExtObject;
    FAutoLoadString: string;
    FAutoLoadBoolean: Boolean;
    FAutoLoadFunction: TExtFunction;
    FBaseCls: string; // 'x-panel'
    FBbar: TExtObject;
    FBbarArray: TExtObjectList;
    FBbarCfg: TExtObject;
    FBodyBorder: Boolean; // true
    FBodyCfg: TExtObject;
    FBodyCssClass: string;
    FBodyCssClassObject: TExtObject;
    FBodyCssClassFunction: TExtFunction;
    FBodyStyle: string;
    FBodyStyleObject: TExtObject;
    FBodyStyleFunction: TExtFunction;
    FBorder: Boolean; // true
    FButtonAlign: TExtPanelButtonAlign; // 'right'
    FButtons: TExtObjectList;
    FBwrapCfg: TExtObject;
    FClosable: Boolean;
    FCollapseFirst: Boolean; // true
    FCollapsed: Boolean;
    FCollapsedCls: string; // 'x-panel-collapsed'
    FCollapsible: Boolean;
    FDisabled: Boolean;
    FDraggable: Boolean;
    FDraggableObject: TExtObject;
    FElements: string;
    FFbar: TExtObjectList;
    FFloating: string;
    FFooter: Boolean;
    FFooterCfg: TExtObject;
    FFrame: Boolean;
    FHeader: Boolean;
    FHeaderAsText: Boolean; // true
    FHeaderCfg: TExtObject;
    FHideCollapseTool: Boolean;
    FIconCls: string;
    FMaskDisabled: Boolean; // true
    FMinButtonWidth: Integer; // 75
    FPadding: Integer;
    FPaddingString: string;
    FPreventBodyReset: Boolean;
    FResizeEvent: string;
    FShadow: Boolean;
    FShadowString: string;
    FShadowOffset: Integer; // 4
    FShim: Boolean; // true
    FTbar: TExtObject;
    FTbarCfg: TExtObject;
    FTitle: string;
    FTitleCollapse: Boolean;
    FToolTemplate: TExtTemplate;
    FToolTemplateExtXTemplate: TExtXTemplate;
    FTools: TExtObjectList;
    FUnstyled: Boolean;
    FBody: TExtElement;
    FBwrap: TExtElement;
    FFooter_: TExtElement;
    FHeader_: TExtElement;
    FRowWidth: Double;
    FRowHeight: Double;
    FOnActivate: TExtPanelOnActivate;
    FOnBeforeclose: TExtPanelOnBeforeclose;
    FOnBeforecollapse: TExtPanelOnBeforecollapse;
    FOnBeforeexpand: TExtPanelOnBeforeexpand;
    FOnBodyresize: TExtPanelOnBodyresize;
    FOnClose: TExtPanelOnClose;
    FOnCollapse: TExtPanelOnCollapse;
    FOnDeactivate: TExtPanelOnDeactivate;
    FOnExpand: TExtPanelOnExpand;
    FOnIconchange: TExtPanelOnIconchange;
    FOnTitlechange: TExtPanelOnTitlechange;
    procedure SetFAnimCollapse(Value: Boolean);
    procedure SetFApplyTo(Value: string);
    procedure SetAutoHeight(const AValue: Boolean);
    procedure SetFAutoLoad(Value: TExtObject);
    procedure SetAutoLoadString(AValue: string);
    procedure SetAutoLoadBoolean(const AValue: Boolean);
    procedure SetFAutoLoadFunction(Value: TExtFunction);
    procedure SetFBaseCls(Value: string);
    procedure SetBbar(const AValue: TExtObject);
    procedure SetFBbarArray(Value: TExtObjectList);
    procedure SetFBbarCfg(Value: TExtObject);
    procedure SetFBodyBorder(Value: Boolean);
    procedure SetFBodyCfg(Value: TExtObject);
    procedure SetFBodyCssClass(Value: string);
    procedure SetFBodyCssClassObject(Value: TExtObject);
    procedure SetFBodyCssClassFunction(Value: TExtFunction);
    procedure SetBodyStyle(const AValue: string);
    procedure SetFBodyStyleObject(Value: TExtObject);
    procedure SetFBodyStyleFunction(Value: TExtFunction);
    procedure SetBorder(const AValue: Boolean);
    procedure SetFButtonAlign(Value: TExtPanelButtonAlign);
    procedure SetFButtons(Value: TExtObjectList);
    procedure SetFBwrapCfg(Value: TExtObject);
    procedure SetClosable(const AValue: Boolean);
    procedure SetFCollapseFirst(Value: Boolean);
    procedure SetFCollapsedCls(Value: string);
    procedure SetCollapsible(const AValue: Boolean);
    procedure SetFDisabled(Value: Boolean);
    procedure SetFDraggable(Value: Boolean);
    procedure SetFDraggableObject(Value: TExtObject);
    procedure SetFElements(Value: string);
    procedure SetFFloating(Value: string);
    procedure SetFooter(const AValue: Boolean);
    procedure SetFFooterCfg(Value: TExtObject);
    procedure SetFrame(const AValue: Boolean);
    procedure SetHeader(const AValue: Boolean);
    procedure SetFHeaderAsText(Value: Boolean);
    procedure SetFHeaderCfg(Value: TExtObject);
    procedure SetFHideCollapseTool(Value: Boolean);
    procedure SetIconCls(const AValue: string);
    procedure SetFMaskDisabled(Value: Boolean);
    procedure SetFMinButtonWidth(const AValue: Integer);
    procedure SetFPadding(Value: Integer);
    procedure SetPaddingString(const AValue: string);
    procedure SetFPreventBodyReset(Value: Boolean);
    procedure SetFResizeEvent(Value: string);
    procedure SetFShadow(Value: Boolean);
    procedure SetFShadowString(Value: string);
    procedure SetFShadowOffset(Value: Integer);
    procedure SetFShim(Value: Boolean);
    procedure SetFTbarCfg(Value: TExtObject);
    procedure _SetTitle(AValue: string);
    procedure SetFTitleCollapse(Value: Boolean);
    procedure SetFToolTemplate(Value: TExtTemplate);
    procedure SetFToolTemplateExtXTemplate(Value: TExtXTemplate);
    procedure SetFTools(Value: TExtObjectList);
    procedure SetFUnstyled(Value: Boolean);
    procedure SetFBody(Value: TExtElement);
    procedure SetFBwrap(Value: TExtElement);
    procedure SetCollapsed(const AValue: Boolean);
    procedure SetFFooter_(Value: TExtElement);
    procedure SetFHeader_(Value: TExtElement);
    procedure SetFRowWidth(Value: Double);
    procedure SetFRowHeight(Value: Double);
    procedure SetFOnActivate(Value: TExtPanelOnActivate);
    procedure SetFOnBeforeclose(Value: TExtPanelOnBeforeclose);
    procedure SetFOnBeforecollapse(Value: TExtPanelOnBeforecollapse);
    procedure SetFOnBeforeexpand(Value: TExtPanelOnBeforeexpand);
    procedure SetFOnBodyresize(Value: TExtPanelOnBodyresize);
    procedure SetFOnClose(Value: TExtPanelOnClose);
    procedure SetFOnCollapse(Value: TExtPanelOnCollapse);
    procedure SetFOnDeactivate(Value: TExtPanelOnDeactivate);
    procedure SetFOnExpand(Value: TExtPanelOnExpand);
    procedure SetFOnIconchange(Value: TExtPanelOnIconchange);
    procedure SetFOnTitlechange(Value: TExtPanelOnTitlechange);
    procedure SetTbar(const AValue: TExtObject);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function AddButton(Config: string = ''; Handler: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction; overload;
    function AddButton(Config: TExtObject; Handler: TExtFunction; Scope: TExtObject)
      : TExtFunction; overload;
    function Collapse(const AAnimate: Boolean): TExtFunction;
    function Expand(const AAnimate: Boolean): TExtFunction;
    function GetBottomToolbar: TExtFunction;
    function GetFooterToolbar: TExtFunction;
    function GetFrameHeight: TExtFunction;
    function GetFrameWidth: TExtFunction;
    function GetInnerHeight: TExtFunction;
    function GetInnerWidth: TExtFunction;
    function GetTool(Id: string): TExtFunction;
    function GetTopToolbar: TExtFunction;
    function GetUpdater: TExtFunction;
    function SetIconClass(Cls: string): TExtFunction;
    function SetTitle(const ATitle: string; const AIconCls: string = ''): TExtFunction;
    function ToggleCollapse(Animate: Boolean): TExtFunction;
    property AnimCollapse: Boolean read FAnimCollapse write SetFAnimCollapse;
    property ApplyTo: string read FApplyTo write SetFApplyTo;
    property AutoHeight: Boolean read FAutoHeight write SetAutoHeight;
    property AutoLoad: TExtObject read FAutoLoad write SetFAutoLoad;
    property AutoLoadString: string read FAutoLoadString write SetAutoLoadString;
    property AutoLoadBoolean: Boolean read FAutoLoadBoolean write SetAutoLoadBoolean;
    property AutoLoadFunction: TExtFunction read FAutoLoadFunction
      write SetFAutoLoadFunction;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property Bbar: TExtObject read FBbar write SetBbar;
    property BbarArray: TExtObjectList read FBbarArray write SetFBbarArray;
    property BbarCfg: TExtObject read FBbarCfg write SetFBbarCfg;
    property BodyBorder: Boolean read FBodyBorder write SetFBodyBorder;
    property BodyCfg: TExtObject read FBodyCfg write SetFBodyCfg;
    property BodyCssClass: string read FBodyCssClass write SetFBodyCssClass;
    property BodyCssClassObject: TExtObject read FBodyCssClassObject
      write SetFBodyCssClassObject;
    property BodyCssClassFunction: TExtFunction read FBodyCssClassFunction
      write SetFBodyCssClassFunction;
    property BodyStyle: string read FBodyStyle write SetBodyStyle;
    property BodyStyleObject: TExtObject read FBodyStyleObject write SetFBodyStyleObject;
    property BodyStyleFunction: TExtFunction read FBodyStyleFunction
      write SetFBodyStyleFunction;
    property Border: Boolean read FBorder write SetBorder;
    property ButtonAlign: TExtPanelButtonAlign read FButtonAlign write SetFButtonAlign;
    property Buttons: TExtObjectList read FButtons write SetFButtons;
    property BwrapCfg: TExtObject read FBwrapCfg write SetFBwrapCfg;
    property Closable: Boolean read FClosable write SetClosable;
    property CollapseFirst: Boolean read FCollapseFirst write SetFCollapseFirst;
    property CollapsedCls: string read FCollapsedCls write SetFCollapsedCls;
    property Collapsible: Boolean read FCollapsible write SetCollapsible;
    property Collapsed: Boolean read FCollapsed write SetCollapsed;
    property Disabled: Boolean read FDisabled write SetFDisabled;
    property Draggable: Boolean read FDraggable write SetFDraggable;
    property DraggableObject: TExtObject read FDraggableObject write SetFDraggableObject;
    property Elements: string read FElements write SetFElements;
    property Fbar: TExtObjectList read FFbar;
    property Floating: string read FFloating write SetFFloating;
    property Footer: Boolean read FFooter write SetFooter;
    property FooterCfg: TExtObject read FFooterCfg write SetFFooterCfg;
    property Frame: Boolean read FFrame write SetFrame;
    property Header: Boolean read FHeader write SetHeader;
    property HeaderAsText: Boolean read FHeaderAsText write SetFHeaderAsText;
    property HeaderCfg: TExtObject read FHeaderCfg write SetFHeaderCfg;
    property HideCollapseTool: Boolean read FHideCollapseTool write SetFHideCollapseTool;
    property IconCls: string read FIconCls write SetIconCls;
    property MaskDisabled: Boolean read FMaskDisabled write SetFMaskDisabled;
    property MinButtonWidth: Integer read FMinButtonWidth write SetFMinButtonWidth;
    property Padding: Integer read FPadding write SetFPadding;
    property PaddingString: string read FPaddingString write SetPaddingString;
    property PreventBodyReset: Boolean read FPreventBodyReset write SetFPreventBodyReset;
    property ResizeEvent: string read FResizeEvent write SetFResizeEvent;
    property Shadow: Boolean read FShadow write SetFShadow;
    property ShadowString: string read FShadowString write SetFShadowString;
    property ShadowOffset: Integer read FShadowOffset write SetFShadowOffset;
    property Shim: Boolean read FShim write SetFShim;
    property Tbar: TExtObject read FTbar write SetTbar;
    property TbarCfg: TExtObject read FTbarCfg write SetFTbarCfg;
    property Title: string read FTitle write _SetTitle;
    property TitleCollapse: Boolean read FTitleCollapse write SetFTitleCollapse;
    property ToolTemplate: TExtTemplate read FToolTemplate write SetFToolTemplate;
    property ToolTemplateExtXTemplate: TExtXTemplate read FToolTemplateExtXTemplate
      write SetFToolTemplateExtXTemplate;
    property Tools: TExtObjectList read FTools write SetFTools;
    property Unstyled: Boolean read FUnstyled write SetFUnstyled;
    property Body: TExtElement read FBody write SetFBody;
    property Bwrap: TExtElement read FBwrap write SetFBwrap;
    property Footer_: TExtElement read FFooter_ write SetFFooter_;
    property Header_: TExtElement read FHeader_ write SetFHeader_;
    property RowWidth: Double read FRowWidth write SetFRowWidth;
    property RowHeight: Double read FRowHeight write SetFRowHeight;
    property OnActivate: TExtPanelOnActivate read FOnActivate write SetFOnActivate;
    property OnBeforeclose: TExtPanelOnBeforeclose read FOnBeforeclose
      write SetFOnBeforeclose;
    property OnBeforecollapse: TExtPanelOnBeforecollapse read FOnBeforecollapse
      write SetFOnBeforecollapse;
    property OnBeforeexpand: TExtPanelOnBeforeexpand read FOnBeforeexpand
      write SetFOnBeforeexpand;
    property OnBodyresize: TExtPanelOnBodyresize read FOnBodyresize
      write SetFOnBodyresize;
    property OnClose: TExtPanelOnClose read FOnClose write SetFOnClose;
    property OnCollapse: TExtPanelOnCollapse read FOnCollapse write SetFOnCollapse;
    property OnDeactivate: TExtPanelOnDeactivate read FOnDeactivate
      write SetFOnDeactivate;
    property OnExpand: TExtPanelOnExpand read FOnExpand write SetFOnExpand;
    property OnIconchange: TExtPanelOnIconchange read FOnIconchange
      write SetFOnIconchange;
    property OnTitlechange: TExtPanelOnTitlechange read FOnTitlechange
      write SetFOnTitlechange;
  end;

  // Procedural types for events TExtSplitButton
  TExtSplitButtonOnArrowclick = procedure(This: TExtSplitButton;
    E: TExtEventObjectSingleton) of object;

  TExtSplitButton = class(TExtButton)
  private
    FArrowHandler: TExtFunction;
    FArrowTooltip: string;
    FOnArrowclick: TExtSplitButtonOnArrowclick;
    procedure _SetArrowHandler(const AValue: TExtFunction);
    procedure SetFArrowTooltip(Value: string);
    procedure SetFOnArrowclick(Value: TExtSplitButtonOnArrowclick);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function SetArrowHandler(const AHandler: TExtFunction; const AScope: TExtObject = nil): TExtFunction;
    property ArrowHandler: TExtFunction read FArrowHandler write _SetArrowHandler;
    property ArrowTooltip: string read FArrowTooltip write SetFArrowTooltip;
    property OnArrowclick: TExtSplitButtonOnArrowclick read FOnArrowclick
      write SetFOnArrowclick;
  end;

  TExtToolbarSpacer = class(TExtToolbarItem)
  private
    FWidth: Integer; // 2
    procedure SetFWidth(Value: Integer);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    property Width: Integer read FWidth write SetFWidth;
  end;

  TExtToolbarTextItem = class(TExtToolbarItem)
  private
    FText: string;
    procedure _SetText(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function SetText(const AText: string): TExtFunction;
    property Text: string read FText write _SetText;
  end;

  // Procedural types for events TExtToolbar
  TExtToolbarOnOverflowchange = procedure(C: TExtObject; LastOverflow: Boolean) of object;

  TExtToolbar = class(TExtContainer)
  private
    FButtonAlign: string;
    FEnableOverflow: Boolean;
    FLayout: string;
    FLayoutObject: TExtObject;
    FOnOverflowchange: TExtToolbarOnOverflowchange;
    procedure SetFButtonAlign(Value: string);
    procedure SetFEnableOverflow(Value: Boolean);
    procedure SetFLayout(Value: string);
    procedure SetFLayoutObject(Value: TExtObject);
    procedure SetFOnOverflowchange(Value: TExtToolbarOnOverflowchange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function Add(Args: TExtObjectList): TExtFunction;
    function AddButton(Config: TExtObject = nil): TExtFunction; overload;
    function AddButton(Config: TExtObjectList): TExtFunction; overload;
    function AddDom(Config: TExtObject = nil): TExtFunction;
    function AddElement(El: string): TExtFunction;
    function AddField(Field: TExtFormField): TExtFunction;
    function AddFill: TExtFunction;
    function AddItem(Item: TExtToolbarItem): TExtFunction;
    function AddSeparator: TExtFunction;
    function AddSpacer: TExtFunction;
    function AddText(Text: string): TExtFunction;
    function InsertButton(Index: Integer; Item: TExtObject): TExtFunction; overload;
    function InsertButton(Index: Integer; Item: TExtToolbarItem): TExtFunction; overload;
    function InsertButton(Index: Integer; Item: TExtButton): TExtFunction; overload;
    function InsertButton(Index: Integer; Item: TExtObjectList): TExtFunction; overload;
    property ButtonAlign: string read FButtonAlign write SetFButtonAlign;
    property EnableOverflow: Boolean read FEnableOverflow write SetFEnableOverflow;
    property Layout: string read FLayout write SetFLayout;
    property LayoutObject: TExtObject read FLayoutObject write SetFLayoutObject;
    property OnOverflowchange: TExtToolbarOnOverflowchange read FOnOverflowchange
      write SetFOnOverflowchange;
  end;

  TExtToolbarSeparator = class(TExtToolbarItem)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  TExtTip = class(TExtPanel)
  private
    FClosable: Boolean;
    FDefaultAlign: string; // 'tl-bl?'
    FMaxWidth: Integer; // 300
    FMinWidth: Integer; // 40
    FShadow: Boolean;
    FShadowString: string;
    FWidth: Integer;
    procedure SetFClosable(Value: Boolean);
    procedure SetFDefaultAlign(Value: string);
    procedure SetFMaxWidth(Value: Integer);
    procedure SetFMinWidth(Value: Integer);
    procedure SetFShadow(Value: Boolean);
    procedure SetFShadowString(Value: string);
    procedure SetFWidth(Value: Integer);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function ShowAt(Xy: TExtObjectList): TExtFunction;
    function ShowBy(El: string; Position: string = ''): TExtFunction;
    property Closable: Boolean read FClosable write SetFClosable;
    property DefaultAlign: string read FDefaultAlign write SetFDefaultAlign;
    property MaxWidth: Integer read FMaxWidth write SetFMaxWidth;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
    property Shadow: Boolean read FShadow write SetFShadow;
    property ShadowString: string read FShadowString write SetFShadowString;
    property Width: Integer read FWidth write SetFWidth;
  end;

  TExtToolbarFill = class(TExtToolbarSpacer)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  TExtButtonGroup = class(TExtPanel)
  private
    FBaseCls: string;
    FColumns: Integer;
    FFrame: Boolean;
    FLayout: string;
    procedure SetFBaseCls(Value: string);
    procedure SetFColumns(Value: Integer);
    procedure SetFFrame(Value: Boolean);
    procedure SetFLayout(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property Columns: Integer read FColumns write SetFColumns;
    property Frame: Boolean read FFrame write SetFFrame;
    property Layout: string read FLayout write SetFLayout;
  end;

  // Procedural types for events TExtCycleButton
  TExtCycleButtonOnChange = procedure(This: TExtCycleButton; Item: TExtMenuCheckItem)
    of object;

  TExtCycleButton = class(TExtSplitButton)
  private
    FChangeHandler: TExtFunction;
    FForceIcon: string;
    FItems: TExtObjectList;
    FPrependText: string;
    FShowText: Boolean;
    FMenu: TExtMenuMenu;
    FOnChange: TExtCycleButtonOnChange;
    procedure SetFChangeHandler(Value: TExtFunction);
    procedure SetFForceIcon(Value: string);
    procedure SetFItems(Value: TExtObjectList);
    procedure SetFPrependText(Value: string);
    procedure SetFShowText(Value: Boolean);
    procedure SetFMenu(Value: TExtMenuMenu);
    procedure SetFOnChange(Value: TExtCycleButtonOnChange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetActiveItem: TExtFunction;
    function SetActiveItem(Item: TExtMenuCheckItem; SuppressEvent: Boolean): TExtFunction;
    function ToggleSelected: TExtFunction;
    property ChangeHandler: TExtFunction read FChangeHandler write SetFChangeHandler;
    property ForceIcon: string read FForceIcon write SetFForceIcon;
    property Items: TExtObjectList read FItems write SetFItems;
    property PrependText: string read FPrependText write SetFPrependText;
    property ShowText: Boolean read FShowText write SetFShowText;
    property Menu: TExtMenuMenu read FMenu write SetFMenu;
    property OnChange: TExtCycleButtonOnChange read FOnChange write SetFOnChange;
  end;

  // Procedural types for events TExtWindow
  TExtWindowOnActivate = procedure(This: TExtWindow) of object;
  TExtWindowOnDeactivate = procedure(This: TExtWindow) of object;
  TExtWindowOnMaximize = procedure(This: TExtWindow) of object;
  TExtWindowOnMinimize = procedure(This: TExtWindow) of object;
  TExtWindowOnResize = procedure(This: TExtWindow; Width: Integer; Height: Integer)
    of object;
  TExtWindowOnRestore = procedure(This: TExtWindow) of object;

  TExtWindow = class(TExtPanel)
  private
    FAnimateTarget: string;
    FAnimateTargetElement: TExtElement;
    FBaseCls: string; // 'x-window'
    FClosable: Boolean; // true
    FCloseAction: string;
    FCollapsed: Boolean;
    FConstrain: Boolean;
    FConstrainHeader: Boolean;
    FDefaultButton: string;
    FDefaultButtonNumber: Integer;
    FDefaultButtonComponent: TExtComponent;
    FDraggable: Boolean; // true
    FExpandOnShow: Boolean; // true
    FHidden: Boolean;
    FInitHidden: Boolean; // true
    FManager: TExtWindowGroup;
    FMaximizable: Boolean;
    FMaximized: Boolean;
    FMinHeight: Integer; // 100
    FMinWidth: Integer; // 200
    FMinimizable: Boolean;
    FModal: Boolean;
    FOnEsc: TExtFunction;
    FPlain: Boolean;
    FResizable: Boolean; // true
    FResizeHandles: string; // 'all'
    FX: Integer;
    FY: Integer;
    FOnHide: TExtObject;
    FOnShow: TExtObject;
    FOnActivate: TExtWindowOnActivate;
    FOnDeactivate: TExtWindowOnDeactivate;
    FOnMaximize: TExtWindowOnMaximize;
    FOnMinimize: TExtWindowOnMinimize;
    FOnResize: TExtWindowOnResize;
    FOnRestore: TExtWindowOnRestore;
    procedure _SetAnimateTarget(const AValue: string);
    procedure SetFAnimateTargetElement(Value: TExtElement);
    procedure SetFBaseCls(Value: string);
    procedure SetClosable(const AValue: Boolean);
    procedure SetFCloseAction(Value: string);
    procedure SetFCollapsed(Value: Boolean);
    procedure SetConstrain(const AValue: Boolean);
    procedure SetFConstrainHeader(Value: Boolean);
    procedure SetFDefaultButton(Value: string);
    procedure SetFDefaultButtonNumber(Value: Integer);
    procedure SetFDefaultButtonComponent(Value: TExtComponent);
    procedure SetDraggable(const AValue: Boolean);
    procedure SetFExpandOnShow(Value: Boolean);
    procedure SetFHidden(Value: Boolean);
    procedure SetFInitHidden(Value: Boolean);
    procedure SetFManager(Value: TExtWindowGroup);
    procedure SetMaximizable(const AValue: Boolean);
    procedure SetMaximized(const AValue: Boolean);
    procedure SetFMinHeight(Value: Integer);
    procedure SetFMinWidth(Value: Integer);
    procedure SetFMinimizable(Value: Boolean);
    procedure SetModal(const AValue: Boolean);
    procedure SetFOnEsc(Value: TExtFunction);
    procedure SetPlain(const AValue: Boolean);
    procedure SetResizable(const AValue: Boolean);
    procedure SetResizeHandles(const AValue: string);
    procedure SetFX(Value: Integer);
    procedure SetFY(Value: Integer);
    procedure SetFOnHide(Value: TExtObject);
    procedure SetFOnShow(Value: TExtObject);
    procedure SetFOnActivate(Value: TExtWindowOnActivate);
    procedure SetFOnDeactivate(Value: TExtWindowOnDeactivate);
    procedure SetFOnMaximize(Value: TExtWindowOnMaximize);
    procedure SetFOnMinimize(Value: TExtWindowOnMinimize);
    procedure SetFOnResize(Value: TExtWindowOnResize);
    procedure SetFOnRestore(Value: TExtWindowOnRestore);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function AlignTo(Element: string; Position: string; Offsets: TExtObjectList = nil)
      : TExtFunction;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList = nil;
      MonitorScroll: Boolean = false): TExtFunction; overload;
    function AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
      MonitorScroll: Integer): TExtFunction; overload;
    function Center: TExtFunction;
    function ClearAnchor: TExtFunction;
    function Close: TExtFunction;
    function Focus: TExtFunction;
    function Hide(AnimateTarget: string = ''; Callback: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction; overload;
    function Hide(AnimateTarget: TExtElement; Callback: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction; overload;
    function Maximize: TExtFunction;
    function Minimize: TExtFunction;
    function Restore: TExtFunction;
    function SetActive(Active: Boolean): TExtFunction;
    function SetAnimateTarget(const AElement: string): TExtFunction; overload;
    function Show(const AAnimateTarget: string = ''; const ACallback: TExtFunction = nil;
      const AScope: TExtObject = nil): TExtFunction; overload;
    function Show(const AAnimateTarget: TExtElement; const ACallback: TExtFunction = nil;
      const AScope: TExtObject = nil): TExtFunction; overload;
    function ToBack: TExtFunction;
    function ToFront(E: Boolean = false): TExtFunction;
    function ToggleMaximize: TExtFunction;
    property AnimateTarget: string read FAnimateTarget write _SetAnimateTarget;
    property AnimateTargetElement: TExtElement read FAnimateTargetElement
      write SetFAnimateTargetElement;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property Closable: Boolean read FClosable write SetClosable;
    property CloseAction: string read FCloseAction write SetFCloseAction;
    property Collapsed: Boolean read FCollapsed write SetFCollapsed;
    property Constrain: Boolean read FConstrain write SetConstrain;
    property ConstrainHeader: Boolean read FConstrainHeader write SetFConstrainHeader;
    property DefaultButton: string read FDefaultButton write SetFDefaultButton;
    property DefaultButtonNumber: Integer read FDefaultButtonNumber
      write SetFDefaultButtonNumber;
    property DefaultButtonComponent: TExtComponent read FDefaultButtonComponent
      write SetFDefaultButtonComponent;
    property Draggable: Boolean read FDraggable write SetDraggable;
    property ExpandOnShow: Boolean read FExpandOnShow write SetFExpandOnShow;
    property Hidden: Boolean read FHidden write SetFHidden;
    property InitHidden: Boolean read FInitHidden write SetFInitHidden;
    property Manager: TExtWindowGroup read FManager write SetFManager;
    property Maximizable: Boolean read FMaximizable write SetMaximizable;
    property Maximized: Boolean read FMaximized write SetMaximized;
    property MinHeight: Integer read FMinHeight write SetFMinHeight;
    property MinWidth: Integer read FMinWidth write SetFMinWidth;
    property Minimizable: Boolean read FMinimizable write SetFMinimizable;
    property Modal: Boolean read FModal write SetModal;
    property OnEsc: TExtFunction read FOnEsc write SetFOnEsc;
    property Plain: Boolean read FPlain write SetPlain;
    property Resizable: Boolean read FResizable write SetResizable;
    property ResizeHandles: string read FResizeHandles write SetResizeHandles;
    property X: Integer read FX write SetFX;
    property Y: Integer read FY write SetFY;
    property OnHide: TExtObject read FOnHide write SetFOnHide;
    property OnShow: TExtObject read FOnShow write SetFOnShow;
    property OnActivate: TExtWindowOnActivate read FOnActivate write SetFOnActivate;
    property OnDeactivate: TExtWindowOnDeactivate read FOnDeactivate
      write SetFOnDeactivate;
    property OnMaximize: TExtWindowOnMaximize read FOnMaximize write SetFOnMaximize;
    property OnMinimize: TExtWindowOnMinimize read FOnMinimize write SetFOnMinimize;
    property OnResize: TExtWindowOnResize read FOnResize write SetFOnResize;
    property OnRestore: TExtWindowOnRestore read FOnRestore write SetFOnRestore;
  end;

  // Procedural types for events TExtTabPanel
  TExtTabPanelOnBeforetabchange = procedure(This: TExtTabPanel; NewTab: TExtPanel;
    CurrentTab: TExtPanel) of object;
  TExtTabPanelOnContextmenu = procedure(This: TExtTabPanel; TAB: TExtPanel;
    E: TExtEventObjectSingleton) of object;
  TExtTabPanelOnTabchange = procedure(This: TExtTabPanel; Tab: TExtPanel) of object;

  TExtTabPanel = class(TExtPanel)
  private
    FActiveTab: string;
    FActiveTabNumber: Integer;
    FAnimScroll: Boolean; // true
    FAutoTabSelector: string; // 'div.x-tab'
    FAutoTabs: Boolean;
    FBaseCls: string; // 'x-tab-panel'
    FDeferredRender: Boolean;
    FEnableTabScroll: Boolean;
    FLayoutOnTabChange: Boolean;
    FMinTabWidth: Integer; // 30
    FPlain: Boolean;
    FResizeTabs: Boolean;
    FScrollDuration: Double; // 0.35
    FScrollIncrement: Integer; // 100
    FScrollRepeatInterval: Integer; // 400
    FTabCls: string;
    FTabMargin: Integer; // 2
    FTabPosition: string; // 'top'
    FTabWidth: Integer; // 120
    FWheelIncrement: Integer; // 20
    FOnBeforetabchange: TExtTabPanelOnBeforetabchange;
    FOnContextmenu: TExtTabPanelOnContextmenu;
    FOnTabChange: TExtTabPanelOnTabchange;
    procedure _SetActiveTab(const AValue: string);
    procedure SetActiveTabNumber(const AValue: Integer);
    procedure SetFAnimScroll(Value: Boolean);
    procedure SetFAutoTabSelector(Value: string);
    procedure SetFAutoTabs(Value: Boolean);
    procedure SetFBaseCls(Value: string);
    procedure SetDeferredRender(const AValue: Boolean);
    procedure SetEnableTabScroll(const AValue: Boolean);
    procedure SetLayoutOnTabChange(const AValue: Boolean);
    procedure SetFMinTabWidth(Value: Integer);
    procedure SetFPlain(Value: Boolean);
    procedure SetFResizeTabs(Value: Boolean);
    procedure SetFScrollDuration(Value: Double);
    procedure SetFScrollIncrement(Value: Integer);
    procedure SetFScrollRepeatInterval(Value: Integer);
    procedure SetFTabCls(Value: string);
    procedure SetFTabMargin(Value: Integer);
    procedure SetFTabPosition(Value: string);
    procedure SetFTabWidth(Value: Integer);
    procedure SetFWheelIncrement(Value: Integer);
    procedure SetFOnBeforetabchange(Value: TExtTabPanelOnBeforetabchange);
    procedure SetFOnContextmenu(Value: TExtTabPanelOnContextmenu);
    procedure SetOnTabChange(const AValue: TExtTabPanelOnTabchange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function Activate(TAB: string): TExtFunction; overload;
    function Activate(TAB: TExtPanel): TExtFunction; overload;
    function BeginUpdate: TExtFunction;
    function EndUpdate: TExtFunction;
    function GetActiveTab: TExtFunction;
    function GetItem(Id: string): TExtFunction;
    function GetTabEl(TAB: TExtPanel): TExtFunction; overload;
    function GetTabEl(TAB: Integer): TExtFunction; overload;
    function GetTabEl(TAB: string): TExtFunction; overload;
    function GetTemplateArgs(Item: TExtBoxComponent): TExtFunction;
    function HideTabStripItem(Item: Integer): TExtFunction; overload;
    function HideTabStripItem(Item: string): TExtFunction; overload;
    function HideTabStripItem(Item: TExtPanel): TExtFunction; overload;
    function ReadTabs(RemoveExisting: Boolean): TExtFunction;
    function ScrollToTab(Item: TExtPanel; Animate: Boolean): TExtFunction;
    function SetActiveTab(const AItem: string): TExtFunction; overload;
    function SetActiveTab(const AItem: Integer): TExtFunction; overload;
    function UnhideTabStripItem(Item: Integer): TExtFunction; overload;
    function UnhideTabStripItem(Item: string): TExtFunction; overload;
    function UnhideTabStripItem(Item: TExtPanel): TExtFunction; overload;
    property ActiveTab: string read FActiveTab write _SetActiveTab;
    property ActiveTabNumber: Integer read FActiveTabNumber write SetActiveTabNumber;
    property AnimScroll: Boolean read FAnimScroll write SetFAnimScroll;
    property AutoTabSelector: string read FAutoTabSelector write SetFAutoTabSelector;
    property AutoTabs: Boolean read FAutoTabs write SetFAutoTabs;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property DeferredRender: Boolean read FDeferredRender write SetDeferredRender;
    property EnableTabScroll: Boolean read FEnableTabScroll write SetEnableTabScroll;
    property LayoutOnTabChange: Boolean read FLayoutOnTabChange
      write SetLayoutOnTabChange;
    property MinTabWidth: Integer read FMinTabWidth write SetFMinTabWidth;
    property Plain: Boolean read FPlain write SetFPlain;
    property ResizeTabs: Boolean read FResizeTabs write SetFResizeTabs;
    property ScrollDuration: Double read FScrollDuration write SetFScrollDuration;
    property ScrollIncrement: Integer read FScrollIncrement write SetFScrollIncrement;
    property ScrollRepeatInterval: Integer read FScrollRepeatInterval
      write SetFScrollRepeatInterval;
    property TabCls: string read FTabCls write SetFTabCls;
    property TabMargin: Integer read FTabMargin write SetFTabMargin;
    property TabPosition: string read FTabPosition write SetFTabPosition;
    property TabWidth: Integer read FTabWidth write SetFTabWidth;
    property WheelIncrement: Integer read FWheelIncrement write SetFWheelIncrement;
    property OnBeforetabchange: TExtTabPanelOnBeforetabchange read FOnBeforetabchange
      write SetFOnBeforetabchange;
    property OnContextmenu: TExtTabPanelOnContextmenu read FOnContextmenu
      write SetFOnContextmenu;
    property OnTabchange: TExtTabPanelOnTabchange read FOnTabChange write SetOnTabChange;
  end;

  // Procedural types for events TExtPagingToolbar
  TExtPagingToolbarOnBeforechange = procedure(This: TExtPagingToolbar; Params: TExtObject)
    of object;
  TExtPagingToolbarOnChange = procedure(This: TExtPagingToolbar; PageData: TExtObject)
    of object;

  TExtPagingToolbar = class(TExtToolbar)
  private
    FAfterPageText: string; // 'of {0}'
    FBeforePageText: string; // 'Page'
    FDisplayInfo: Boolean;
    FDisplayMsg: string; // 'Displaying {0} - {1} of {2}'
    FEmptyMsg: string; // 'No data to display'
    FFirstText: string; // 'First Page'
    FLastText: string; // 'Last Page'
    FNextText: string; // 'Next Page'
    FPageSize: Integer; // 20
    FPrependButtons: Boolean;
    FPrevText: string; // 'Previous Page'
    FRefreshText: string; // 'Refresh'
    FStore: TExtDataStore;
    FCursor: Integer;
    FPageSize_: Integer;
    FParamNames: TExtObject;
    FOnBeforechange: TExtPagingToolbarOnBeforechange;
    FOnChange: TExtPagingToolbarOnChange;
    procedure SetFAfterPageText(Value: string);
    procedure SetFBeforePageText(Value: string);
    procedure SetDisplayInfo(const AValue: Boolean);
    procedure SetFDisplayMsg(Value: string);
    procedure SetFEmptyMsg(Value: string);
    procedure SetFFirstText(Value: string);
    procedure SetFLastText(Value: string);
    procedure SetFNextText(Value: string);
    procedure SetPageSize(const AValue: Integer);
    procedure SetFPrependButtons(Value: Boolean);
    procedure SetFPrevText(Value: string);
    procedure SetFRefreshText(Value: string);
    procedure SetStore(const AValue: TExtDataStore);
    procedure SetFCursor(Value: Integer);
    procedure SetFPageSize_(Value: Integer);
    procedure SetFParamNames(Value: TExtObject);
    procedure SetFOnBeforechange(Value: TExtPagingToolbarOnBeforechange);
    procedure SetFOnChange(Value: TExtPagingToolbarOnChange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function Bind(Store: TExtDataStore): TExtFunction;
    function BindStore(Store: TExtDataStore; Initial: Boolean = false): TExtFunction;
    function ChangePage(Page: Integer): TExtFunction;
    function DoRefresh: TExtFunction;
    function MoveFirst: TExtFunction;
    function MoveLast: TExtFunction;
    function MoveNext: TExtFunction;
    function MovePrevious: TExtFunction;
    function Unbind(Store: TExtDataStore): TExtFunction;
    property AfterPageText: string read FAfterPageText write SetFAfterPageText;
    property BeforePageText: string read FBeforePageText write SetFBeforePageText;
    property DisplayInfo: Boolean read FDisplayInfo write SetDisplayInfo;
    property DisplayMsg: string read FDisplayMsg write SetFDisplayMsg;
    property EmptyMsg: string read FEmptyMsg write SetFEmptyMsg;
    property FirstText: string read FFirstText write SetFFirstText;
    property LastText: string read FLastText write SetFLastText;
    property NextText: string read FNextText write SetFNextText;
    property PageSize: Integer read FPageSize write SetPageSize;
    property PrependButtons: Boolean read FPrependButtons write SetFPrependButtons;
    property PrevText: string read FPrevText write SetFPrevText;
    property RefreshText: string read FRefreshText write SetFRefreshText;
    property Store: TExtDataStore read FStore write SetStore;
    property Cursor: Integer read FCursor write SetFCursor;
    property PageSize_: Integer read FPageSize_ write SetFPageSize_;
    property ParamNames: TExtObject read FParamNames write SetFParamNames;
    property OnBeforechange: TExtPagingToolbarOnBeforechange read FOnBeforechange
      write SetFOnBeforechange;
    property OnChange: TExtPagingToolbarOnChange read FOnChange write SetFOnChange;
  end;

  TExtToolTip = class(TExtTip)
  private
    FAnchorOffset: Integer; // 0
    FAnchorToTarget: Boolean; // true
    FAutoHide: Boolean; // true
    FDelegate: string;
    FDismissDelay: Integer; // 5000
    FHideDelay: Integer; // 200
    FMouseOffset: TExtObjectList;
    FShowDelay: Integer; // 500
    FTarget: string;
    FTrackMouse: Boolean;
    procedure SetFAnchorOffset(Value: Integer);
    procedure SetFAnchorToTarget(Value: Boolean);
    procedure SetFAutoHide(Value: Boolean);
    procedure SetFDelegate(Value: string);
    procedure SetFDismissDelay(Value: Integer);
    procedure SetFHideDelay(Value: Integer);
    procedure SetFMouseOffset(Value: TExtObjectList);
    procedure SetFShowDelay(Value: Integer);
    procedure SetFTarget(Value: string);
    procedure SetFTrackMouse(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Hide: TExtFunction;
    function InitTarget(T: string): TExtFunction;
    function Show: TExtFunction;
    property AnchorOffset: Integer read FAnchorOffset write SetFAnchorOffset;
    property AnchorToTarget: Boolean read FAnchorToTarget write SetFAnchorToTarget;
    property AutoHide: Boolean read FAutoHide write SetFAutoHide;
    property Delegate: string read FDelegate write SetFDelegate;
    property DismissDelay: Integer read FDismissDelay write SetFDismissDelay;
    property HideDelay: Integer read FHideDelay write SetFHideDelay;
    property MouseOffset: TExtObjectList read FMouseOffset write SetFMouseOffset;
    property ShowDelay: Integer read FShowDelay write SetFShowDelay;
    property Target: string read FTarget write SetFTarget;
    property TrackMouse: Boolean read FTrackMouse write SetFTrackMouse;
  end;

  TExtQuickTip = class(TExtToolTip)
  private
    FInterceptTitles: Boolean;
    FTarget: string;
    procedure SetFInterceptTitles(Value: Boolean);
    procedure SetFTarget(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function CancelShow(El: string): TExtFunction; overload;
    function CancelShow(El: TExtElement): TExtFunction; overload;
    function Register(Config: TExtObject = nil): TExtFunction;
    function Unregister(El: string): TExtFunction; overload;
    function Unregister(El: TExtElement): TExtFunction; overload;
    property InterceptTitles: Boolean read FInterceptTitles write SetFInterceptTitles;
    property Target: string read FTarget write SetFTarget;
  end;

  TExtPluginAbstract = class(TExtObject)
  end;

function ExtLoader: TExtLoaderSingleton;
function ExtFlashProxy: TExtFlashProxySingleton;
function ExtEventManager: TExtEventManagerSingleton;
function ExtEventObject: TExtEventObjectSingleton;
function ExtMessageBox: TExtMessageBoxSingleton;
function ExtQuickTips: TExtQuickTipsSingleton;
function ExtDomHelper: TExtDomHelperSingleton;
function ExtWindowMgr: TExtWindowMgrSingleton;
function LabelAlignAsOption(const AValue: TExtContainerLabelAlign): string;

implementation

uses
  SysUtils, KItto.JS;

function ExtLoader: TExtLoaderSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtLoaderSingleton>(TExtLoaderSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtFlashProxy: TExtFlashProxySingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtFlashProxySingleton>(TExtFlashProxySingleton.JSClassName)
  else
    Result := nil;
end;

function ExtEventManager: TExtEventManagerSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtEventManagerSingleton>(TExtEventManagerSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtEventObject: TExtEventObjectSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtEventObjectSingleton>(TExtEventObjectSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtMessageBox: TExtMessageBoxSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtMessageBoxSingleton>(TExtMessageBoxSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtQuickTips: TExtQuickTipsSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtQuickTipsSingleton>(TExtQuickTipsSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtDomHelper: TExtDomHelperSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtDomHelperSingleton>(TExtDomHelperSingleton.JSClassName)
  else
    Result := nil;
end;

function ExtWindowMgr: TExtWindowMgrSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtWindowMgrSingleton>(TExtWindowMgrSingleton.JSClassName)
  else
    Result := nil;
end;


function LabelAlignAsOption(const AValue: TExtContainerLabelAlign): string;
begin
  case AValue of
    laLeft : Result := 'left';
    laTop : Result := 'top';
    laRight : Result := 'right';
  end;
end;

procedure TExtKeyMap.SetFStopEvent(Value: Boolean);
begin
  FStopEvent := Value;
  JSCodeBlock(JSName + '.stopEvent=' + VarToJSON([Value]) + ';');
end;

class function TExtKeyMap.JSClassName: string;
begin
  Result := 'Ext.KeyMap';
end;

function TExtKeyMap.AddBinding(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addBinding(' + VarToJSON([Config, false]) + ');', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.AddBinding(Config: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.addBinding(' + VarToJSON(Config) + ');', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.IsEnabled: TExtFunction;
begin
  JSCode(JSName + '.isEnabled();', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.On(Key: Integer; Fn: TExtFunction; Scope: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.on(' + VarToJSON([Key, Fn, true, Scope, false]) + ');', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.On(Key: TExtObjectList; Fn: TExtFunction; Scope: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.on(' + VarToJSON(Key) + ',' + VarToJSON([Fn, true, Scope, false]) +
    ');', 'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.On(Key: TExtObject; Fn: TExtFunction; Scope: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.on(' + VarToJSON([Key, false, Fn, true, Scope, false]) + ');',
    'TExtKeyMap');
  Result := Self;
end;

function TExtKeyMap.SetDisabled(Disabled: Boolean): TExtFunction;
begin
  JSCode(JSName + '.setDisabled(' + VarToJSON([Disabled]) + ');', 'TExtKeyMap');
  Result := Self;
end;

procedure TExtFx.SetFAfterCls(Value: string);
begin
  FAfterCls := Value;
  JSCodeBlock('afterCls:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFAfterStyle(Value: string);
begin
  FAfterStyle := Value;
  JSCodeBlock('afterStyle:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFAfterStyleObject(Value: TExtObject);
begin
  FAfterStyleObject := Value;
  JSCodeBlock('afterStyle:' + VarToJSON([Value, false]));
end;

procedure TExtFx.SetFAfterStyleFunction(Value: TExtFunction);
begin
  FAfterStyleFunction := Value;
  JSCodeBlock('afterStyle:' + VarToJSON([Value, true]));
end;

procedure TExtFx.SetFBlock(Value: Boolean);
begin
  FBlock := Value;
  JSCodeBlock('block:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFCallback(Value: TExtFunction);
begin
  FCallback := Value;
  JSCodeBlock('callback:' + VarToJSON([Value, true]));
end;

procedure TExtFx.SetFConcurrent(Value: Boolean);
begin
  FConcurrent := Value;
  JSCodeBlock('concurrent:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFDuration(Value: Integer);
begin
  FDuration := Value;
  JSCodeBlock('duration:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFEasing(Value: string);
begin
  FEasing := Value;
  JSCodeBlock('easing:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFEndOpacity(Value: Integer);
begin
  FEndOpacity := Value;
  JSCodeBlock('endOpacity:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFRemove(Value: Boolean);
begin
  FRemove := Value;
  JSCodeBlock('remove:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtFx.SetFStopFx(Value: Boolean);
begin
  FStopFx := Value;
  JSCodeBlock('stopFx:' + VarToJSON([Value]));
end;

procedure TExtFx.SetFUseDisplay(Value: Boolean);
begin
  FUseDisplay := Value;
  JSCodeBlock('useDisplay:' + VarToJSON([Value]));
end;

class function TExtFx.JSClassName: string;
begin
  Result := 'Ext.Fx';
end;

procedure TExtFx.InitDefaults;
begin
  inherited;
  FAfterStyleObject := TExtObject.CreateInternal(Self, 'afterStyle');
  FScope := TExtObject.CreateInternal(Self, 'scope');
end;

function TExtFx.FadeIn(Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.fadeIn(' + VarToJSON([Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.FadeOut(Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.fadeOut(' + VarToJSON([Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.Frame(Color: string = ''; Count: Integer = 0; Options: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.frame(' + VarToJSON([Color, Count, Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.Ghost(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.ghost(' + VarToJSON([Anchor, Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.HasActiveFx: TExtFunction;
begin
  JSCode(JSName + '.hasActiveFx();', 'TExtFx');
  Result := Self;
end;

function TExtFx.HasFxBlock: TExtFunction;
begin
  JSCode(JSName + '.hasFxBlock();', 'TExtFx');
  Result := Self;
end;

function TExtFx.Highlight(Color: string = ''; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.highlight(' + VarToJSON([Color, Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.Pause(Seconds: Integer): TExtFunction;
begin
  JSCode(JSName + '.pause(' + VarToJSON([Seconds]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.Puff(Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.puff(' + VarToJSON([Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.Scale(Width: Integer; Height: Integer; Options: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.scale(' + VarToJSON([Width, Height, Options, false]) + ');',
    'TExtFx');
  Result := Self;
end;

function TExtFx.SequenceFx: TExtFunction;
begin
  JSCode(JSName + '.sequenceFx();', 'TExtFx');
  Result := Self;
end;

function TExtFx.Shift(Options: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.shift(' + VarToJSON([Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.SlideIn(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.slideIn(' + VarToJSON([Anchor, Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.SlideOut(Anchor: string = ''; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.slideOut(' + VarToJSON([Anchor, Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.StopFx_: TExtFunction;
begin
  JSCode(JSName + '.stopFx();', 'TExtFx');
  Result := Self;
end;

function TExtFx.SwitchOff(Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.switchOff(' + VarToJSON([Options, false]) + ');', 'TExtFx');
  Result := Self;
end;

function TExtFx.SyncFx: TExtFunction;
begin
  JSCode(JSName + '.syncFx();', 'TExtFx');
  Result := Self;
end;

procedure TExtLoaderSingleton.SetFVarJS(Value: TExtObject);
begin
  FVarJS := Value;
  JSCodeBlock(JSName + '.varJS=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtLoaderSingleton.SetFVarJS_(Value: TExtObject);
begin
  FVarJS_ := Value;
  JSCodeBlock(JSName + '.varJS=' + VarToJSON([Value, false]) + ';');
end;

class function TExtLoaderSingleton.JSClassName: string;
begin
  Result := 'Ext.Loader';
end;

procedure TExtLoaderSingleton.InitDefaults;
begin
  inherited;
  FVarJS := TExtObject.CreateInternal(Self, 'varJS');
  FVarJS_ := TExtObject.CreateInternal(Self, 'varJS');
end;

function TExtLoaderSingleton.Load(FileList: TExtObjectList; Callback: TExtFunction;
  Scope: TExtObject; PreserveOrder: Boolean): TExtFunction;
begin
  JSCode(JSName + '.load(' + VarToJSON(FileList) + ',' + VarToJSON([Callback, true, Scope,
    false, PreserveOrder]) + ');', 'TExtLoaderSingleton');
  Result := Self;
end;

procedure TExtKeyNav.SetFDefaultEventAction(Value: string);
begin
  FDefaultEventAction := Value;
  JSCodeBlock('defaultEventAction:' + VarToJSON([Value]));
end;

procedure TExtKeyNav._SetDisabled(const AValue: Boolean);
begin
  FDisabled := SetConfigItem('disabled', 'setDisabled', AValue);
end;

procedure TExtKeyNav.SetFForceKeyDown(Value: Boolean);
begin
  FForceKeyDown := Value;
  JSCodeBlock('forceKeyDown:' + VarToJSON([Value]));
end;

class function TExtKeyNav.JSClassName: string;
begin
  Result := 'Ext.KeyNav';
end;

procedure TExtKeyNav.InitDefaults;
begin
  inherited;
  FDefaultEventAction := 'stopEvent';
end;

function TExtKeyNav.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtKeyNav');
  Result := Self;
end;

function TExtKeyNav.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtKeyNav');
  Result := Self;
end;

function TExtKeyNav.SetDisabled(const ADisabled: Boolean): TExtFunction;
begin
  FDisabled := ADisabled;
  Result := CallMethod('setDisabled', [ADisabled]);
end;

class function TExtFlashProxySingleton.JSClassName: string;
begin
  Result := 'Ext.FlashProxy';
end;

procedure TExtEventManagerSingleton.SetFFireDocReady(Value: TExtObject);
begin
  FFireDocReady := Value;
  JSCodeBlock(JSName + '.fireDocReady=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtEventManagerSingleton.SetFIeDeferSrc(Value: TExtObject);
begin
  FIeDeferSrc := Value;
  JSCodeBlock(JSName + '.ieDeferSrc=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtEventManagerSingleton.SetFTextResizeInterval(Value: TExtObject);
begin
  FTextResizeInterval := Value;
  JSCodeBlock(JSName + '.textResizeInterval=' + VarToJSON([Value, false]) + ';');
end;

class function TExtEventManagerSingleton.JSClassName: string;
begin
  Result := 'Ext.EventManager';
end;

class function TExtEventManagerSingleton.A: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ALT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.B: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.BACKSPACE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.C: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.CAPS_LOCK: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.CONTEXT_MENU: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.CTRL: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.D: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.DELETE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.DOWN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.E: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.EIGHT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ENDJS: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ENTER: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ESC: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F1: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F10: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F11: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F12: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F2: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F3: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F4: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F5: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F6: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F7: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F8: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.F9: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.FIVE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.FOUR: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.G: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.H: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.HOME: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.I: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.INSERT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.J: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.K: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.L: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.LEFT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.M: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.N: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NINE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_CENTER: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_DIVISION: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_EIGHT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_FIVE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_FOUR: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_MINUS: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_MULTIPLY: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_NINE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_ONE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_PERIOD: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_PLUS: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_SEVEN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_SIX: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_THREE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_TWO: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.NUM_ZERO: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.O: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ONE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.P: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.PAGE_DOWN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.PAGE_UP: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.Pause: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.PRINT_SCREEN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.Q: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.R: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.RETURN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.RIGHT: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.S: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.SEVEN: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.Shift: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.SIX: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.SPACE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.T: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.TAB: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.THREE: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.TWO: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.U: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.UP: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.V: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.W: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.X: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.Y: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.Z: Integer;
begin
  Result := 0
end;

class function TExtEventManagerSingleton.ZERO: Integer;
begin
  Result := 0
end;

procedure TExtEventManagerSingleton.InitDefaults;
begin
  inherited;
  FFireDocReady := TExtObject.CreateInternal(Self, 'fireDocReady');
  FIeDeferSrc := TExtObject.CreateInternal(Self, 'ieDeferSrc');
  FTextResizeInterval := TExtObject.CreateInternal(Self, 'textResizeInterval');
end;

function TExtEventManagerSingleton.AddListener(El: string; EventName: string;
  Handler: TExtFunction; Scope: TExtObject = nil; Options: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.addListener(' + VarToJSON([El, EventName, Handler, true, Scope, false,
    Options, false]) + ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.FunctionJS: TExtFunction;
begin
  JSCode(JSName + '.function();', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.HandleError(E: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.handleError(' + VarToJSON([E, false]) + ');',
    'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.HandleError(E: TExtError): TExtFunction;
begin
  JSCode(JSName + '.handleError(' + VarToJSON([E, false]) + ');',
    'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.HasModifier: TExtFunction;
begin
  JSCode(JSName + '.hasModifier();', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.On(El: string; EventName: string;
  Handler: TExtFunction; Scope: TExtObject = nil; Options: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.on(' + VarToJSON([El, EventName, Handler, true, Scope, false, Options,
    false]) + ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.OnDocumentReady(Fn: TExtFunction;
  Scope: TExtObject = nil; Options: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.onDocumentReady(' + VarToJSON([Fn, true, Scope, false, Options]) +
    ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.OnTextResize(Fn: TExtFunction; Scope: TExtObject;
  Options: Boolean): TExtFunction;
begin
  JSCode(JSName + '.onTextResize(' + VarToJSON([Fn, true, Scope, false, Options]) + ');',
    'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.OnWindowResize(Fn: TExtFunction; Scope: TExtObject;
  Options: Boolean): TExtFunction;
begin
  JSCode(JSName + '.onWindowResize(' + VarToJSON([Fn, true, Scope, false, Options]) +
    ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.RemoveAll(El: string): TExtFunction;
begin
  JSCode(JSName + '.removeAll(' + VarToJSON([El]) + ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.RemoveListener(El: string; EventName: string;
  Fn: TExtFunction; Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.removeListener(' + VarToJSON([El, EventName, Fn, true, Scope, false])
    + ');', 'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.RemoveResizeListener(Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.removeResizeListener(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtEventManagerSingleton');
  Result := Self;
end;

function TExtEventManagerSingleton.Un(El: string; EventName: string;
  Fn: TExtFunction = nil; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.un(' + VarToJSON([El, EventName, Fn, true, Scope, false]) + ');',
    'TExtEventManagerSingleton');
  Result := Self;
end;

class function TExtError.JSClassName: string;
begin
  Result := 'Ext.Error';
end;

function TExtError.GetMessage: TExtFunction;
begin
  JSCode(JSName + '.getMessage();', 'TExtError');
  Result := Self;
end;

function TExtError.GetName: TExtFunction;
begin
  JSCode(JSName + '.getName();', 'TExtError');
  Result := Self;
end;

function TExtError.ToJson: TExtFunction;
begin
  JSCode(JSName + '.toJson();', 'TExtError');
  Result := Self;
end;

procedure TExtProgressWaitConfig.SetFDuration(Value: Integer);
begin
  FDuration := Value;
  JSCodeBlock('duration:' + VarToJSON([Value]));
end;

procedure TExtProgressWaitConfig.SetFInterval(Value: Integer);
begin
  FInterval := Value;
  JSCodeBlock('interval:' + VarToJSON([Value]));
end;

procedure TExtProgressWaitConfig.SetFIncrement(Value: Integer);
begin
  FIncrement := Value;
  JSCodeBlock('increment:' + VarToJSON([Value]));
end;

procedure TExtProgressWaitConfig.SetFFn(Value: TExtFunction);
begin
  FFn := Value;
  JSCodeBlock('fn:' + VarToJSON([Value, true]));
end;

procedure TExtProgressWaitConfig.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

class function TExtProgressWaitConfig.JSClassName: string;
begin
  Result := 'Object';
end;

class function TExtEventObjectSingleton.JSClassName: string;
begin
  Result := 'Ext.EventObject';
end;

function TExtEventObjectSingleton.GetCharCode: TExtFunction;
begin
  JSCode(JSName + '.getCharCode();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetKey: TExtFunction;
begin
  JSCode(JSName + '.getKey();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetPageX: TExtFunction;
begin
  JSCode(JSName + '.getPageX();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetPageY: TExtFunction;
begin
  JSCode(JSName + '.getPageY();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetRelatedTarget: TExtFunction;
begin
  JSCode(JSName + '.getRelatedTarget();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetTarget(Selector: string = ''; MaxDepth: Integer = 0;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getTarget(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetTarget(Selector: string; MaxDepth: string;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getTarget(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetWheelDelta: TExtFunction;
begin
  JSCode(JSName + '.getWheelDelta();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.GetXY: TExtFunction;
begin
  JSCode(JSName + '.getXY();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.PreventDefault: TExtFunction;
begin
  JSCode(JSName + '.preventDefault();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.StopEvent: TExtFunction;
begin
  JSCode(JSName + '.stopEvent();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.StopPropagation: TExtFunction;
begin
  JSCode(JSName + '.stopPropagation();', 'TExtEventObjectSingleton');
  Result := Self;
end;

function TExtEventObjectSingleton.Within(El: string; Related: Boolean = false;
  AllowEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.within(' + VarToJSON([El, Related, AllowEl]) + ');',
    'TExtEventObjectSingleton');
  Result := Self;
end;

procedure TExtLoadMask.SetFMsg(Value: string);
begin
  FMsg := Value;
  JSCodeBlock('msg:' + VarToJSON([Value]));
end;

procedure TExtLoadMask.SetFMsgCls(Value: string);
begin
  FMsgCls := Value;
  JSCodeBlock('msgCls:' + VarToJSON([Value]));
end;

procedure TExtLoadMask.SetFRemoveMask(Value: Boolean);
begin
  FRemoveMask := Value;
  JSCodeBlock('removeMask:' + VarToJSON([Value]));
end;

procedure TExtLoadMask.SetFStore(Value: TExtDataStore);
begin
  FStore := Value;
  JSCodeBlock('store:' + VarToJSON([Value, false]));
end;

procedure TExtLoadMask.SetFDisabled(Value: Boolean);
begin
  FDisabled := Value;
  JSCodeBlock(JSName + '.disabled=' + VarToJSON([Value]) + ';');
end;

class function TExtLoadMask.JSClassName: string;
begin
  Result := 'Ext.LoadMask';
end;

procedure TExtLoadMask.InitDefaults;
begin
  inherited;
  FMsg := 'Loading...';
  FMsgCls := 'x-mask-loading';
  FStore := TExtDataStore.CreateInternal(Self, 'store');
end;

function TExtLoadMask.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtLoadMask');
  Result := Self;
end;

function TExtLoadMask.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtLoadMask');
  Result := Self;
end;

function TExtLoadMask.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtLoadMask');
  Result := Self;
end;

function TExtLoadMask.Show: TExtFunction;
begin
  JSCode(JSName + '.show();', 'TExtLoadMask');
  Result := Self;
end;

class function TExtSplitBarBasicLayoutAdapter.JSClassName: string;
begin
  Result := 'Ext.SplitBar.BasicLayoutAdapter';
end;

function TExtSplitBarBasicLayoutAdapter.GetElementSize(S: TExtSplitBar): TExtFunction;
begin
  JSCode(JSName + '.getElementSize(' + VarToJSON([S, false]) + ');',
    'TExtSplitBarBasicLayoutAdapter');
  Result := Self;
end;

function TExtSplitBarBasicLayoutAdapter.SetElementSize(S: TExtSplitBar; NewSize: Integer;
  OnComplete: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.setElementSize(' + VarToJSON([S, false, NewSize, OnComplete, true]) +
    ');', 'TExtSplitBarBasicLayoutAdapter');
  Result := Self;
end;

procedure TExtTemplate.SetFCompiled(Value: Boolean);
begin
  FCompiled := Value;
  JSCodeBlock('compiled:' + VarToJSON([Value]));
end;

procedure TExtTemplate.SetFDisableFormats(Value: Boolean);
begin
  FDisableFormats := Value;
  JSCodeBlock('disableFormats:' + VarToJSON([Value]));
end;

procedure TExtTemplate.SetFRe(Value: string);
begin
  FRe := Value;
  JSCodeBlock('re:' + VarToJSON([#3 + Value]));
end;

procedure TExtTemplate.SetFDisableFormats_(Value: Boolean);
begin
  FDisableFormats_ := Value;
  JSCodeBlock(JSName + '.disableFormats=' + VarToJSON([Value]) + ';');
end;

procedure TExtTemplate.SetFRe_(Value: string);
begin
  FRe_ := Value;
  JSCodeBlock(JSName + '.re=' + VarToJSON([#3 + Value]) + ';');
end;

class function TExtTemplate.JSClassName: string;
begin
  Result := 'Ext.Template';
end;

function TExtTemplate.TemplateFrom(El: string; Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.Template.from(' + VarToJSON([El, Config, false]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Append(El: string; Values: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.append(' + VarToJSON([El, Values, false, ReturnElement]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Append(El: string; Values: TExtObjectList;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.append(' + VarToJSON([El]) + ',' + VarToJSON(Values) + ',' +
    VarToJSON([ReturnElement]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Apply(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.apply(' + VarToJSON([Values, false]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Apply(Values: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.apply(' + VarToJSON(Values) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertAfter(El: string; Values: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertAfter(' + VarToJSON([El, Values, false, ReturnElement]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertAfter(El: string; Values: TExtObjectList;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertAfter(' + VarToJSON([El]) + ',' + VarToJSON(Values) + ',' +
    VarToJSON([ReturnElement]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertBefore(El: string; Values: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertBefore(' + VarToJSON([El, Values, false, ReturnElement]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertBefore(El: string; Values: TExtObjectList;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertBefore(' + VarToJSON([El]) + ',' + VarToJSON(Values) + ',' +
    VarToJSON([ReturnElement]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertFirst(El: string; Values: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertFirst(' + VarToJSON([El, Values, false, ReturnElement]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.InsertFirst(El: string; Values: TExtObjectList;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertFirst(' + VarToJSON([El]) + ',' + VarToJSON(Values) + ',' +
    VarToJSON([ReturnElement]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Overwrite(El: string; Values: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.overwrite(' + VarToJSON([El, Values, false, ReturnElement]) + ');',
    'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.Overwrite(El: string; Values: TExtObjectList;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.overwrite(' + VarToJSON([El]) + ',' + VarToJSON(Values) + ',' +
    VarToJSON([ReturnElement]) + ');', 'TExtTemplate');
  Result := Self;
end;

function TExtTemplate.SetJS(Html: string; Compile: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.set(' + VarToJSON([Html, Compile]) + ');', 'TExtTemplate');
  Result := Self;
end;

class function TExtUpdaterBasicRenderer.JSClassName: string;
begin
  Result := 'Ext.Updater.BasicRenderer';
end;

function TExtUpdaterBasicRenderer.Render(El: TExtElement; Xhr: TExtObject;
  UpdateManager: TExtUpdater; Callback: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([El, false, Xhr, false, UpdateManager, false,
    Callback, true]) + ');', 'TExtUpdaterBasicRenderer');
  Result := Self;
end;

procedure TExtShadow.SetFMode(Value: string);
begin
  FMode := Value;
  JSCodeBlock('mode:' + VarToJSON([Value]));
end;

procedure TExtShadow.SetFOffset(Value: string);
begin
  FOffset := Value;
  JSCodeBlock('offset:' + VarToJSON([Value]));
end;

class function TExtShadow.JSClassName: string;
begin
  Result := 'Ext.Shadow';
end;

function TExtShadow.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtShadow');
  Result := Self;
end;

function TExtShadow.IsVisible: TExtFunction;
begin
  JSCode(JSName + '.isVisible();', 'TExtShadow');
  Result := Self;
end;

function TExtShadow.Realign(LEFT: Integer; Top: Integer; Width: Integer; Height: Integer)
  : TExtFunction;
begin
  JSCode(JSName + '.realign(' + VarToJSON([LEFT, Top, Width, Height]) + ');',
    'TExtShadow');
  Result := Self;
end;

function TExtShadow.SetZIndex(Zindex: Integer): TExtFunction;
begin
  JSCode(JSName + '.setZIndex(' + VarToJSON([Zindex]) + ');', 'TExtShadow');
  Result := Self;
end;

function TExtShadow.Show(TargetEl: string): TExtFunction;
begin
  JSCode(JSName + '.show(' + VarToJSON([TargetEl]) + ');', 'TExtShadow');
  Result := Self;
end;

procedure TExtShowConfig.SetFAnimEl(Value: string);
begin
  FAnimEl := Value;
  JSCodeBlock('animEl:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFButtons(Value: TExtObject);
begin
  FButtons := Value;
  JSCodeBlock('buttons:' + VarToJSON([Value, false]));
end;

procedure TExtShowConfig.SetFClosable(Value: Boolean);
begin
  FClosable := Value;
  JSCodeBlock('closable:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFCls(Value: string);
begin
  FCls := Value;
  JSCodeBlock('cls:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFDefaultTextHeight(Value: Integer);
begin
  FDefaultTextHeight := Value;
  JSCodeBlock('defaultTextHeight:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFFn(Value: TExtFunction);
begin
  FFn := Value;
  JSCodeBlock('fn:' + VarToJSON([Value, true]));
end;

procedure TExtShowConfig.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtShowConfig.SetFIcon(Value: string);
begin
  FIcon := Value;
  JSCodeBlock('icon:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFIconCls(Value: string);
begin
  FIconCls := Value;
  JSCodeBlock('iconCls:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFMaxWidth(Value: Integer);
begin
  FMaxWidth := Value;
  JSCodeBlock('maxWidth:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFMinWidth(Value: Integer);
begin
  FMinWidth := Value;
  JSCodeBlock('minWidth:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetModal(const AValue: Boolean);
begin
  FModal := SetConfigItem('modal', AValue);
end;

procedure TExtShowConfig.SetFMsg(Value: string);
begin
  FMsg := Value;
  JSCodeBlock('msg:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFMultiline(Value: Boolean);
begin
  FMultiline := Value;
  JSCodeBlock('multiline:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFProgress(Value: Boolean);
begin
  FProgress := Value;
  JSCodeBlock('progress:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFProgressText(Value: string);
begin
  FProgressText := Value;
  JSCodeBlock('progressText:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFPrompt(Value: Boolean);
begin
  FPrompt := Value;
  JSCodeBlock('prompt:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFProxyDrag(Value: Boolean);
begin
  FProxyDrag := Value;
  JSCodeBlock('proxyDrag:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFTitle(Value: string);
begin
  FTitle := Value;
  JSCodeBlock('title:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFValue(Value: string);
begin
  FValue := Value;
  JSCodeBlock('value:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFWait(Value: Boolean);
begin
  FWait := Value;
  JSCodeBlock('wait:' + VarToJSON([Value]));
end;

procedure TExtShowConfig.SetFWaitConfig(Value: TExtProgressWaitConfig);
begin
  FWaitConfig := Value;
  JSCodeBlock('waitConfig:' + VarToJSON([Value, false]));
end;

procedure TExtShowConfig.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCodeBlock('width:' + VarToJSON([Value]));
end;

class function TExtShowConfig.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtMessageBoxSingleton.SetFMsg(Value: TExtObject);
begin
  FMsg := Value;
  JSCodeBlock(JSName + '.msg=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFButtonText(Value: TExtObject);
begin
  FButtonText := Value;
  JSCodeBlock(JSName + '.buttonText=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFDefaultTextHeight(Value: Integer);
begin
  FDefaultTextHeight := Value;
  JSCodeBlock(JSName + '.defaultTextHeight=' + VarToJSON([Value]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFMaxWidth(Value: Integer);
begin
  FMaxWidth := Value;
  JSCodeBlock(JSName + '.maxWidth=' + VarToJSON([Value]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFMinProgressWidth(Value: Integer);
begin
  FMinProgressWidth := Value;
  JSCodeBlock(JSName + '.minProgressWidth=' + VarToJSON([Value]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFMinPromptWidth(Value: Integer);
begin
  FMinPromptWidth := Value;
  JSCodeBlock(JSName + '.minPromptWidth=' + VarToJSON([Value]) + ';');
end;

procedure TExtMessageBoxSingleton.SetFMinWidth(Value: Integer);
begin
  FMinWidth := Value;
  JSCodeBlock(JSName + '.minWidth=' + VarToJSON([Value]) + ';');
end;

class function TExtMessageBoxSingleton.JSClassName: string;
begin
  Result := 'Ext.MessageBox';
end;

class function TExtMessageBoxSingleton.CANCEL: TExtObject;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtObject>('Ext.MessageBox.CANCEL')
  else
    Result := nil;
end;

class function TExtMessageBoxSingleton.ERROR: string;
begin
  Result := 'ext-mb-error'
end;

class function TExtMessageBoxSingleton.INFO: string;
begin
  Result := 'ext-mb-info'
end;

class function TExtMessageBoxSingleton.OK: TExtObject;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtObject>('Ext.MessageBox.OK')
  else
    Result := nil;
end;

class function TExtMessageBoxSingleton.OKCANCEL: TExtObject;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtObject>('Ext.MessageBox.OKCANCEL')
  else
    Result := nil;
end;

class function TExtMessageBoxSingleton.QUESTION: string;
begin
  Result := 'ext-mb-question'
end;

class function TExtMessageBoxSingleton.WARNING: string;
begin
  Result := 'ext-mb-warning'
end;

class function TExtMessageBoxSingleton.YESNO: TExtObject;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtObject>('Ext.MessageBox.YESNO')
  else
    Result := nil;
end;

class function TExtMessageBoxSingleton.YESNOCANCEL: TExtObject;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtObject>('Ext.MessageBox.YESNOCANCEL')
  else
    Result := nil;
end;

procedure TExtMessageBoxSingleton.InitDefaults;
begin
  inherited;
  FMsg := TExtObject.CreateInternal(Self, 'msg');
  FButtonText := TExtObject.CreateInternal(Self, 'buttonText');
  FDefaultTextHeight := 75;
  FMaxWidth := 600;
  FMinProgressWidth := 250;
  FMinPromptWidth := 250;
  FMinWidth := 100;
end;

function TExtMessageBoxSingleton.Alert(const ATitle: string; const AMsg: string;
  const AFn: TExtFunction = nil; const AScope: TExtObject = nil): TExtFunction;
begin
  Result := CallMethod('alert', [ATitle, AMsg, AFn, True, AScope, False]);
end;

function TExtMessageBoxSingleton.Confirm(Title: string; Msg: string;
  Fn: TExtFunction = nil; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.confirm(' + VarToJSON([Title, Msg, Fn, true, Scope, false]) + ');',
    'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.GetDialog: TExtFunction;
begin
  JSCode(JSName + '.getDialog();', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.IsVisible: TExtFunction;
begin
  JSCode(JSName + '.isVisible();', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Progress(Title: string; Msg: string;
  ProgressText: string = ''): TExtFunction;
begin
  JSCode(JSName + '.progress(' + VarToJSON([Title, Msg, ProgressText]) + ');',
    'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Prompt(Title: string; Msg: string;
  Fn: TExtFunction = nil; Scope: TExtObject = nil; Multiline: Boolean = false;
  Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.prompt(' + VarToJSON([Title, Msg, Fn, true, Scope, false, Multiline,
    Value]) + ');', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Prompt(Title: string; Msg: string; Fn: TExtFunction;
  Scope: TExtObject; Multiline: Integer; Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.prompt(' + VarToJSON([Title, Msg, Fn, true, Scope, false, Multiline,
    Value]) + ');', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.SetIcon(Icon: string): TExtFunction;
begin
  JSCode(JSName + '.setIcon(' + VarToJSON([Icon]) + ');', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Show(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.show(' + VarToJSON([Config, false]) + ');',
    'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.UpdateProgress(Value: Integer; ProgressText: string;
  Msg: string): TExtFunction;
begin
  JSCode(JSName + '.updateProgress(' + VarToJSON([Value, ProgressText, Msg]) + ');',
    'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.UpdateText(Text: string = ''): TExtFunction;
begin
  JSCode(JSName + '.updateText(' + VarToJSON([Text]) + ');', 'TExtMessageBoxSingleton');
  Result := Self;
end;

function TExtMessageBoxSingleton.Wait(Msg: string; Title: string = '';
  Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.wait(' + VarToJSON([Msg, Title, Config, false]) + ');',
    'TExtMessageBoxSingleton');
  Result := Self;
end;

class function TExtQuickTipsSingleton.JSClassName: string;
begin
  Result := 'Ext.QuickTips';
end;

function TExtQuickTipsSingleton.Disable: TExtFunction;
begin
  Result := CallMethod('disable', []);
end;

function TExtQuickTipsSingleton.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.GetQuickTip: TExtFunction;
begin
  JSCode(JSName + '.getQuickTip();', 'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.Init(const AAutoRender: Boolean): TExtFunction;
begin
  Result := CallMethod('init', AAutoRender);
end;

function TExtQuickTipsSingleton.IsEnabled: TExtFunction;
begin
  JSCode(JSName + '.isEnabled();', 'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.Register(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.register(' + VarToJSON([Config, false]) + ');',
    'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.Tips(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.tips(' + VarToJSON([Config, false]) + ');', 'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.Unregister(El: string): TExtFunction;
begin
  JSCode(JSName + '.unregister(' + VarToJSON([El]) + ');', 'TExtQuickTipsSingleton');
  Result := Self;
end;

function TExtQuickTipsSingleton.Unregister(El: TExtElement): TExtFunction;
begin
  JSCode(JSName + '.unregister(' + VarToJSON([El, false]) + ');',
    'TExtQuickTipsSingleton');
  Result := Self;
end;

procedure TExtWindowGroup.SetFZseed(Value: Integer);
begin
  FZseed := Value;
  JSCodeBlock(JSName + '.zseed=' + VarToJSON([Value]) + ';');
end;

class function TExtWindowGroup.JSClassName: string;
begin
  Result := 'Ext.WindowGroup';
end;

procedure TExtWindowGroup.InitDefaults;
begin
  inherited;
  FZseed := 9000;
end;

function TExtWindowGroup.BringToFront(Win: string): TExtFunction;
begin
  JSCode(JSName + '.bringToFront(' + VarToJSON([Win]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.BringToFront(Win: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.bringToFront(' + VarToJSON([Win, false]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.Each(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.each(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.Get(Id: string): TExtFunction;
begin
  JSCode(JSName + '.get(' + VarToJSON([Id]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.Get(Id: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.get(' + VarToJSON([Id, false]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.GetActive: TExtFunction;
begin
  JSCode(JSName + '.getActive();', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.GetBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.getBy(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.HideAll: TExtFunction;
begin
  JSCode(JSName + '.hideAll();', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.Register(Win: TExtWindow): TExtFunction;
begin
  JSCode(JSName + '.register(' + VarToJSON([Win, false]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.SendToBack(Win: string): TExtFunction;
begin
  JSCode(JSName + '.sendToBack(' + VarToJSON([Win]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.SendToBack(Win: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.sendToBack(' + VarToJSON([Win, false]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

function TExtWindowGroup.Unregister(Win: TExtWindow): TExtFunction;
begin
  JSCode(JSName + '.unregister(' + VarToJSON([Win, false]) + ');', 'TExtWindowGroup');
  Result := Self;
end;

procedure TExtElement.SetFAutoBoxAdjust(Value: TExtObject);
begin
  FAutoBoxAdjust := Value;
  JSCodeBlock(JSName + '.autoBoxAdjust=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtElement.SetFDefaultUnit(Value: TCSSUnit);
begin
  FDefaultUnit := Value;
  JSCodeBlock(JSName + '.defaultUnit="' + TJS.EnumToJSString(TypeInfo(TCSSUnit),
    ord(Value)) + '";');
end;

procedure TExtElement.SetFId(Value: string);
begin
  FId := Value;
  JSCodeBlock(JSName + '.id=' + VarToJSON([Value]) + ';');
end;

procedure TExtElement.SetFOriginalDisplay(Value: string);
begin
  FOriginalDisplay := Value;
  JSCodeBlock(JSName + '.originalDisplay=' + VarToJSON([Value]) + ';');
end;

class function TExtElement.JSClassName: string;
begin
  Result := 'Ext.Element';
end;

class function TExtElement.DISPLAY: Integer;
begin
  Result := 0
end;

class function TExtElement.VISIBILITY: Integer;
begin
  Result := 0
end;

procedure TExtElement.InitDefaults;
begin
  inherited;
  FAutoBoxAdjust := TExtObject.CreateInternal(Self, 'autoBoxAdjust');
end;

function TExtElement.AddClass(const AClassName: string): TExtFunction;
begin
  Result := CallMethod('addClass', AClassName);
end;

function TExtElement.AddClass(ClassName: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.addClass(' + VarToJSON(ClassName) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddClassOnClick(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.addClassOnClick(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddClassOnFocus(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.addClassOnFocus(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddClassOnOver(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.addClassOnOver(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddKeyListener(Key: Integer; Fn: TExtFunction;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addKeyListener(' + VarToJSON([Key, Fn, true, Scope, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.AddKeyListener(Key: TExtObjectList; Fn: TExtFunction;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addKeyListener(' + VarToJSON(Key) + ',' + VarToJSON([Fn, true, Scope,
    false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddKeyListener(Key: TExtObject; Fn: TExtFunction;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addKeyListener(' + VarToJSON([Key, false, Fn, true, Scope, false]) +
    ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddKeyListener(Key: string; Fn: TExtFunction;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addKeyListener(' + VarToJSON([Key, Fn, true, Scope, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.AddKeyMap(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addKeyMap(' + VarToJSON([Config, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AddListener(EventName: string; Fn: TExtFunction;
  Scope: TExtObject = nil; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addListener(' + VarToJSON([EventName, Fn, true, Scope, false, Options,
    false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AlignTo(Element: string; Position: string;
  Offsets: TExtObjectList = nil; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.alignTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AlignTo(Element: string; Position: string; Offsets: TExtObjectList;
  Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.alignTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AnchorTo(Element: string; Position: string;
  Offsets: TExtObjectList = nil; Animate: Boolean = false; MonitorScroll: Boolean = false;
  Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate, MonitorScroll, Callback, true]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
  Animate: TExtObject; MonitorScroll: Boolean = false; Callback: TExtFunction = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate, false, MonitorScroll, Callback, true]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
  Animate: TExtObject; MonitorScroll: Integer; Callback: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate, false, MonitorScroll, Callback, true]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
  Animate: Boolean; MonitorScroll: Integer; Callback: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([Animate, MonitorScroll, Callback, true]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Animate(Args: TExtObject; Duration: Double = 0;
  OnComplete: TExtFunction = nil; Easing: string = ''; AnimType: string = '')
  : TExtFunction;
begin
  JSCode(JSName + '.animate(' + VarToJSON([Args, false, Duration, OnComplete, true,
    Easing, AnimType]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AppendChild(El: string): TExtFunction;
begin
  JSCode(JSName + '.appendChild(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AppendChild(El: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.appendChild(' + VarToJSON(El) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AppendChild(El: TExtElement): TExtFunction;
begin
  JSCode(JSName + '.appendChild(' + VarToJSON([El, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AppendChild(El: TExtCompositeElement): TExtFunction;
begin
  JSCode(JSName + '.appendChild(' + VarToJSON([El, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AppendTo(El: string): TExtFunction;
begin
  JSCode(JSName + '.appendTo(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ApplyStyles(Styles: string): TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([Styles]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ApplyStyles(Styles: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([Styles, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ApplyStyles(Styles: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([Styles, true]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.AutoHeight(Animate: Boolean = false; Duration: Double = 0;
  OnComplete: TExtFunction = nil; Easing: string = ''): TExtFunction;
begin
  JSCode(JSName + '.autoHeight(' + VarToJSON([Animate, Duration, OnComplete, true, Easing]
    ) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Blur: TExtFunction;
begin
  JSCode(JSName + '.blur();', 'TExtElement');
  Result := Self;
end;

function TExtElement.BoxWrap(ClassJS: string = ''): TExtFunction;
begin
  JSCode(JSName + '.boxWrap(' + VarToJSON([ClassJS]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Center(CenterIn: string = ''): TExtFunction;
begin
  JSCode(JSName + '.center(' + VarToJSON([CenterIn]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Child(Selector: string; ReturnDom: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.child(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Clean(ForceReclean: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.clean(' + VarToJSON([ForceReclean]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ClearOpacity: TExtFunction;
begin
  JSCode(JSName + '.clearOpacity();', 'TExtElement');
  Result := Self;
end;

function TExtElement.ClearPositioning(Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.clearPositioning(' + VarToJSON([Value]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Clip: TExtFunction;
begin
  JSCode(JSName + '.clip();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Contains(El: string): TExtFunction;
begin
  JSCode(JSName + '.contains(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.CreateProxy(Config: string = ''; RenderTo: string = '';
  MatchBox: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.createProxy(' + VarToJSON([Config, RenderTo, MatchBox]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.CreateProxy(Config: TExtObject; RenderTo: string = '';
  MatchBox: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.createProxy(' + VarToJSON([Config, false, RenderTo, MatchBox]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.CreateShim: TExtFunction;
begin
  JSCode(JSName + '.createShim();', 'TExtElement');
  Result := Self;
end;

function TExtElement.DOWN(Selector: string; ReturnDom: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.down(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.EnableDisplayMode(DISPLAY: string = ''): TExtFunction;
begin
  JSCode(JSName + '.enableDisplayMode(' + VarToJSON([DISPLAY]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.FindParent(Selector: string; MaxDepth: Integer = 0;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findParent(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.FindParent(Selector: string; MaxDepth: string;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findParent(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.FindParentNode(Selector: string; MaxDepth: Integer = 0;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findParentNode(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.FindParentNode(Selector: string; MaxDepth: string;
  ReturnEl: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findParentNode(' + VarToJSON([Selector, MaxDepth, ReturnEl]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.First(Selector: string = ''; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.first(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Fly(El: string; Named: string = ''): TExtFunction;
begin
  JSCode(JSName + '.fly(' + VarToJSON([El, Named]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Focus(Defer: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.focus(' + VarToJSON([Defer]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Get(El: string): TExtFunction;
begin
  JSCode(JSName + '.get(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetAlignToXY(Element: string; Position: string;
  Offsets: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.getAlignToXY(' + VarToJSON([Element, Position]) + ',' +
    VarToJSON(Offsets) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetAnchorXY(Anchor: string = ''; Local: Boolean = false;
  Size: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.getAnchorXY(' + VarToJSON([Anchor, local, Size, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.GetAttribute(Name: string; Namespace: string = ''): TExtFunction;
begin
  JSCode(JSName + '.getAttribute(' + VarToJSON([name, Namespace]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetAttributeNS(Namespace: string; Name: string): TExtFunction;
begin
  JSCode(JSName + '.getAttributeNS(' + VarToJSON([Namespace, name]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.GetBorderWidth(Side: string): TExtFunction;
begin
  JSCode(JSName + '.getBorderWidth(' + VarToJSON([Side]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetBottom(Local: Boolean): TExtFunction;
begin
  JSCode(JSName + '.getBottom(' + VarToJSON([local]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetBox(ContentBox: Boolean = false; Local: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.getBox(' + VarToJSON([ContentBox, local]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetCenterXY: TExtFunction;
begin
  JSCode(JSName + '.getCenterXY();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetColor(Attr: string; DefaultValue: string; Prefix: string = '')
  : TExtFunction;
begin
  JSCode(JSName + '.getColor(' + VarToJSON([Attr, DefaultValue, Prefix]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.GetComputedHeight: TExtFunction;
begin
  JSCode(JSName + '.getComputedHeight();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetComputedWidth: TExtFunction;
begin
  JSCode(JSName + '.getComputedWidth();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetFrameWidth(Sides: string): TExtFunction;
begin
  JSCode(JSName + '.getFrameWidth(' + VarToJSON([Sides]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetHeight(ContentHeight: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getHeight(' + VarToJSON([ContentHeight]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetLeft(Local: Boolean): TExtFunction;
begin
  JSCode(JSName + '.getLeft(' + VarToJSON([local]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetMargins(Sides: string = ''): TExtFunction;
begin
  JSCode(JSName + '.getMargins(' + VarToJSON([Sides]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetOffsetsTo(Element: string): TExtFunction;
begin
  JSCode(JSName + '.getOffsetsTo(' + VarToJSON([Element]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetPadding(Side: string): TExtFunction;
begin
  JSCode(JSName + '.getPadding(' + VarToJSON([Side]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetPositioning: TExtFunction;
begin
  JSCode(JSName + '.getPositioning();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetRegion: TExtFunction;
begin
  JSCode(JSName + '.getRegion();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetRight(Local: Boolean): TExtFunction;
begin
  JSCode(JSName + '.getRight(' + VarToJSON([local]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetScroll: TExtFunction;
begin
  JSCode(JSName + '.getScroll();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetSize(ContentSize: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getSize(' + VarToJSON([ContentSize]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetStyle(PropertyJS: string): TExtFunction;
begin
  JSCode(JSName + '.getStyle(' + VarToJSON([PropertyJS]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetStyleSize: TExtFunction;
begin
  JSCode(JSName + '.getStyleSize();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetStyles(Styles: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.getStyles(' + VarToJSON(Styles) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetTextWidth(Text: string; Min: Integer = 0; Max: Integer = 0)
  : TExtFunction;
begin
  JSCode(JSName + '.getTextWidth(' + VarToJSON([Text, Min, Max]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetTop(Local: Boolean): TExtFunction;
begin
  JSCode(JSName + '.getTop(' + VarToJSON([local]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetUpdater: TExtFunction;
begin
  JSCode(JSName + '.getUpdater();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetValue(AsNumber: Boolean): TExtFunction;
begin
  JSCode(JSName + '.getValue(' + VarToJSON([AsNumber]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetViewSize: TExtFunction;
begin
  JSCode(JSName + '.getViewSize();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetWidth(ContentWidth: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getWidth(' + VarToJSON([ContentWidth]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetX: TExtFunction;
begin
  JSCode(JSName + '.getX();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetXY: TExtFunction;
begin
  JSCode(JSName + '.getXY();', 'TExtElement');
  Result := Self;
end;

function TExtElement.GetY: TExtFunction;
begin
  JSCode(JSName + '.getY();', 'TExtElement');
  Result := Self;
end;

function TExtElement.HasClass(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.hasClass(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Hide(Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.hide(' + VarToJSON([Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Hide(Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.hide(' + VarToJSON([Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Hover(OverFn: TExtFunction; OutFn: TExtFunction;
  Scope: TExtObject = nil; Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.hover(' + VarToJSON([OverFn, true, OutFn, true, Scope, false, Options,
    false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InitDD(Group: string; Config: TExtObject = nil;
  Overrides: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.initDD(' + VarToJSON([Group, Config, false, Overrides, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.InitDDProxy(Group: string; Config: TExtObject = nil;
  Overrides: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.initDDProxy(' + VarToJSON([Group, Config, false, Overrides, false]) +
    ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InitDDTarget(Group: string; Config: TExtObject = nil;
  Overrides: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.initDDTarget(' + VarToJSON([Group, Config, false, Overrides, false]) +
    ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InsertAfter(El: string): TExtFunction;
begin
  JSCode(JSName + '.insertAfter(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InsertBefore(El: string): TExtFunction;
begin
  JSCode(JSName + '.insertBefore(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InsertFirst(El: string): TExtFunction;
begin
  JSCode(JSName + '.insertFirst(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InsertFirst(El: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.insertFirst(' + VarToJSON([El, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.InsertHtml(Where: string; Html: string; ReturnEl: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.insertHtml(' + VarToJSON([Where, Html, ReturnEl]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.InsertSibling(El: string; Where: string = '';
  ReturnDom: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertSibling(' + VarToJSON([El, Where, ReturnDom]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.InsertSibling(El: TExtObject; Where: string = '';
  ReturnDom: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertSibling(' + VarToJSON([El, false, Where, ReturnDom]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.InsertSibling(El: TExtObjectList; Where: string = '';
  ReturnDom: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.insertSibling(' + VarToJSON(El) + ',' + VarToJSON([Where, ReturnDom])
    + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsJS(Selector: string): TExtFunction;
begin
  JSCode(JSName + '.is(' + VarToJSON([Selector]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsBorderBox: TExtFunction;
begin
  JSCode(JSName + '.isBorderBox();', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsDisplayed: TExtFunction;
begin
  JSCode(JSName + '.isDisplayed();', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsMasked: TExtFunction;
begin
  JSCode(JSName + '.isMasked();', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsScrollable: TExtFunction;
begin
  JSCode(JSName + '.isScrollable();', 'TExtElement');
  Result := Self;
end;

function TExtElement.IsVisible(Deep: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.isVisible(' + VarToJSON([Deep]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Last(Selector: string = ''; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.last(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Load: TExtFunction;
begin
  JSCode(JSName + '.load();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Mask(Msg: string = ''; MsgCls: string = ''): TExtFunction;
begin
  JSCode(JSName + '.mask(' + VarToJSON([Msg, MsgCls]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Move(Direction: string; Distance: Integer; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.move(' + VarToJSON([Direction, Distance, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Move(Direction: string; Distance: Integer; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.move(' + VarToJSON([Direction, Distance, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.MoveTo(X: Integer; Y: Integer; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.moveTo(' + VarToJSON([X, Y, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.MoveTo(X: Integer; Y: Integer; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.moveTo(' + VarToJSON([X, Y, Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Next(Selector: string = ''; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.next(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.On(EventName: string; Fn: TExtFunction; Scope: TExtObject = nil;
  Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.on(' + VarToJSON([EventName, Fn, true, Scope, false, Options, false])
    + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Parent(Selector: string = ''; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.parent(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Position(Pos: string = ''; Zindex: Integer = 0; X: Integer = 0;
  Y: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.position(' + VarToJSON([Pos, Zindex, X, Y]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Prev(Selector: string = ''; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.prev(' + VarToJSON([Selector, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.PurgeAllListeners: TExtFunction;
begin
  JSCode(JSName + '.purgeAllListeners();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Query(Selector: string): TExtFunction;
begin
  JSCode(JSName + '.query(' + VarToJSON([Selector]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.RadioClass(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.radioClass(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.RadioClass(ClassName: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.radioClass(' + VarToJSON(ClassName) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.RelayEvent(EventName: string; ObjectJS: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.relayEvent(' + VarToJSON([EventName, ObjectJS, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Remove: TExtFunction;
begin
  JSCode(JSName + '.remove();', 'TExtElement');
  Result := Self;
end;

function TExtElement.RemoveAllListeners: TExtFunction;
begin
  JSCode(JSName + '.removeAllListeners();', 'TExtElement');
  Result := Self;
end;

function TExtElement.RemoveAnchor: TExtFunction;
begin
  JSCode(JSName + '.removeAnchor();', 'TExtElement');
  Result := Self;
end;

function TExtElement.RemoveClass(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.removeClass(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.RemoveClass(ClassName: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.removeClass(' + VarToJSON(ClassName) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.RemoveListener(EventName: string; Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.removeListener(' + VarToJSON([EventName, Fn, true, Scope, false]) +
    ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Repaint: TExtFunction;
begin
  JSCode(JSName + '.repaint();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Replace(El: string): TExtFunction;
begin
  JSCode(JSName + '.replace(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ReplaceClass(OldClassName: string; NewClassName: string)
  : TExtFunction;
begin
  JSCode(JSName + '.replaceClass(' + VarToJSON([OldClassName, NewClassName]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.ReplaceWith(El: string): TExtFunction;
begin
  JSCode(JSName + '.replaceWith(' + VarToJSON([El]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ReplaceWith(El: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.replaceWith(' + VarToJSON([El, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Scroll(Direction: string; Distance: Integer;
  Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.scroll(' + VarToJSON([Direction, Distance, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Scroll(Direction: string; Distance: Integer; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.scroll(' + VarToJSON([Direction, Distance, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.ScrollIntoView(Container: string = ''; Hscroll: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.scrollIntoView(' + VarToJSON([Container, Hscroll]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.ScrollTo(Side: string; Value: Integer; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.scrollTo(' + VarToJSON([Side, Value, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ScrollTo(Side: string; Value: Integer; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.scrollTo(' + VarToJSON([Side, Value, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Select(Selector: TExtObjectList; Unique: Boolean; Root: string)
  : TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON(Selector) + ',' + VarToJSON([Unique, Root]) +
    ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Select(Selector: string; Unique: Boolean; Root: string)
  : TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([Selector, Unique, Root]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetJS(O: TExtObject; UseSet: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.set(' + VarToJSON([O, false, UseSet]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetBottom(Bottom: string): TExtFunction;
begin
  JSCode(JSName + '.setBottom(' + VarToJSON([Bottom]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetBounds(X: Integer; Y: Integer; Width: string; Height: string;
  Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setBounds(' + VarToJSON([X, Y, Width, Height, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetBounds(X: Integer; Y: Integer; Width: string; Height: string;
  Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setBounds(' + VarToJSON([X, Y, Width, Height, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetBox(Box: TExtObject; Adjust: Boolean = false;
  Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setBox(' + VarToJSON([Box, false, Adjust, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetBox(Box: TExtObject; Adjust: Boolean; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.setBox(' + VarToJSON([Box, false, Adjust, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetDisplayed(Value: string): TExtFunction;
begin
  JSCode(JSName + '.setDisplayed(' + VarToJSON([Value]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetHeight(Height: string; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setHeight(' + VarToJSON([Height, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetHeight(Height: string; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setHeight(' + VarToJSON([Height, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetLeft(LEFT: string): TExtFunction;
begin
  JSCode(JSName + '.setLeft(' + VarToJSON([LEFT]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetLeftTop(LEFT: string; Top: string): TExtFunction;
begin
  JSCode(JSName + '.setLeftTop(' + VarToJSON([LEFT, Top]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetLocation(X: Integer; Y: Integer; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.setLocation(' + VarToJSON([X, Y, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetLocation(X: Integer; Y: Integer; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.setLocation(' + VarToJSON([X, Y, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetOpacity(Opacity: Double; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setOpacity(' + VarToJSON([Opacity, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetOpacity(Opacity: Double; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setOpacity(' + VarToJSON([Opacity, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetPositioning(PosCfg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setPositioning(' + VarToJSON([PosCfg, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetRegion(Region: string; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.setRegion(' + VarToJSON([Region, false, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetRegion(Region: string; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setRegion(' + VarToJSON([Region, false, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetRight(RIGHT: string): TExtFunction;
begin
  JSCode(JSName + '.setRight(' + VarToJSON([RIGHT]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetSize(Width: string; Height: string; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.setSize(' + VarToJSON([Width, Height, Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetSize(Width: string; Height: string; Animate: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.setSize(' + VarToJSON([Width, Height, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetStyle(PropertyJS: string; Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.setStyle(' + VarToJSON([PropertyJS, Value]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetStyle(PropertyJS: TExtObject; Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.setStyle(' + VarToJSON([PropertyJS, false, Value]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetTop(Top: string): TExtFunction;
begin
  JSCode(JSName + '.setTop(' + VarToJSON([Top]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetVisibilityMode(VisMode: Integer): TExtFunction;
begin
  JSCode(JSName + '.setVisibilityMode(' + VarToJSON([VisMode]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetVisible(Visible: Boolean; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setVisible(' + VarToJSON([Visible, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetVisible(Visible: Boolean; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setVisible(' + VarToJSON([Visible, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetWidth(Width: string; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setWidth(' + VarToJSON([Width, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetWidth(Width: string; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setWidth(' + VarToJSON([Width, Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetX(The: Integer; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setX(' + VarToJSON([The, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetX(The: Integer; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setX(' + VarToJSON([The, Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetXY(Pos: TExtObjectList; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setXY(' + VarToJSON(Pos) + ',' + VarToJSON([Animate]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetXY(Pos: TExtObjectList; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setXY(' + VarToJSON(Pos) + ',' + VarToJSON([Animate, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SetY(The: Integer; Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setY(' + VarToJSON([The, Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SetY(The: Integer; Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setY(' + VarToJSON([The, Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Show(Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.show(' + VarToJSON([Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Show(Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.show(' + VarToJSON([Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.SwallowEvent(EventName: string; PreventDefault: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.swallowEvent(' + VarToJSON([EventName, PreventDefault]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.SwallowEvent(EventName: TExtObjectList;
  PreventDefault: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.swallowEvent(' + VarToJSON(EventName) + ',' +
    VarToJSON([PreventDefault]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Toggle(Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.toggle(' + VarToJSON([Animate]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Toggle(Animate: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.toggle(' + VarToJSON([Animate, false]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.ToggleClass(ClassName: string): TExtFunction;
begin
  JSCode(JSName + '.toggleClass(' + VarToJSON([ClassName]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.TranslatePoints(X: Integer; Y: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.translatePoints(' + VarToJSON([X, Y]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.TranslatePoints(X: TExtObjectList; Y: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.translatePoints(' + VarToJSON(X) + ',' + VarToJSON([Y]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Un(EventName: string; Fn: TExtFunction; Scope: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.un(' + VarToJSON([EventName, Fn, true, Scope, false]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Unclip: TExtFunction;
begin
  JSCode(JSName + '.unclip();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Unmask: TExtFunction;
begin
  JSCode(JSName + '.unmask();', 'TExtElement');
  Result := Self;
end;

function TExtElement.Unselectable: TExtFunction;
begin
  JSCode(JSName + '.unselectable();', 'TExtElement');
  Result := Self;
end;

function TExtElement.UP(Selector: string; MaxDepth: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.up(' + VarToJSON([Selector, MaxDepth]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.UP(Selector: string; MaxDepth: string): TExtFunction;
begin
  JSCode(JSName + '.up(' + VarToJSON([Selector, MaxDepth]) + ');', 'TExtElement');
  Result := Self;
end;

function TExtElement.Update(Html: string; LoadScripts: Boolean = false;
  Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON([Html, LoadScripts, Callback, true]) + ');',
    'TExtElement');
  Result := Self;
end;

function TExtElement.Wrap(Config: TExtObject = nil; ReturnDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.wrap(' + VarToJSON([Config, false, ReturnDom]) + ');', 'TExtElement');
  Result := Self;
end;

procedure TExtBackground.SetFColor(Value: string);
begin
  FColor := Value;
  JSCodeBlock('color:' + VarToJSON([Value]));
end;

procedure TExtBackground.SetFAlpha(Value: Double);
begin
  FAlpha := Value;
  JSCodeBlock('alpha:' + VarToJSON([Value]));
end;

class function TExtBackground.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtBorder.SetFColor(Value: string);
begin
  FColor := Value;
  JSCodeBlock('color:' + VarToJSON([Value]));
end;

procedure TExtBorder.SetFSize(Value: Integer);
begin
  FSize := Value;
  JSCodeBlock('size:' + VarToJSON([Value]));
end;

class function TExtBorder.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtFont.SetFName(Value: string);
begin
  FName := Value;
  JSCodeBlock('name:' + VarToJSON([Value]));
end;

procedure TExtFont.SetFColor(Value: string);
begin
  FColor := Value;
  JSCodeBlock('color:' + VarToJSON([Value]));
end;

procedure TExtFont.SetFSize(Value: Integer);
begin
  FSize := Value;
  JSCodeBlock('size:' + VarToJSON([Value]));
end;

procedure TExtFont.SetFBold(Value: Boolean);
begin
  FBold := Value;
  JSCodeBlock('bold:' + VarToJSON([Value]));
end;

class function TExtFont.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtDataTip.SetFPadding(Value: Integer);
begin
  FPadding := Value;
  JSCodeBlock('padding:' + VarToJSON([Value]));
end;

procedure TExtDataTip.SetFBorder(Value: TExtBorder);
begin
  FBorder := Value;
  JSCodeBlock('border:' + VarToJSON([Value, false]));
end;

procedure TExtDataTip.SetFBackground(Value: TExtBackground);
begin
  FBackground := Value;
  JSCodeBlock('background:' + VarToJSON([Value, false]));
end;

procedure TExtDataTip.SetFFont(Value: TExtFont);
begin
  FFont := Value;
  JSCodeBlock('font:' + VarToJSON([Value, false]));
end;

class function TExtDataTip.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtCompositeElementLite.SetFElements(Value: TExtObjectList);
begin
  FElements := Value;
  JSCodeBlock(JSName + '.elements=' + VarToJSON([Value, false]) + ';');
end;

class function TExtCompositeElementLite.JSClassName: string;
begin
  Result := 'Ext.CompositeElementLite';
end;

procedure TExtCompositeElementLite.InitDefaults;
begin
  inherited;
  FElements := TExtObjectList.CreateInternal(Self, 'elements');
end;

function TExtCompositeElementLite.Add(Els: string): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON([Els]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Clear: TExtFunction;
begin
  JSCode(JSName + '.clear();', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Contains(El: string): TExtFunction;
begin
  JSCode(JSName + '.contains(' + VarToJSON([El]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Each(Fn: TExtFunction; Scope: TExtObject = nil)
  : TExtFunction;
begin
  JSCode(JSName + '.each(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Fill(Els: string): TExtFunction;
begin
  JSCode(JSName + '.fill(' + VarToJSON([Els]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Filter(Selector: string): TExtFunction;
begin
  JSCode(JSName + '.filter(' + VarToJSON([Selector]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Filter(Selector: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.filter(' + VarToJSON([Selector, true]) + ');',
    'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.First: TExtFunction;
begin
  JSCode(JSName + '.first();', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.GetCount: TExtFunction;
begin
  JSCode(JSName + '.getCount();', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.IndexOf(El: string): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([El]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Item(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.item(' + VarToJSON([index]) + ');', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.Last: TExtFunction;
begin
  JSCode(JSName + '.last();', 'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.RemoveElement(El: string; RemoveDom: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.removeElement(' + VarToJSON([El, RemoveDom]) + ');',
    'TExtCompositeElementLite');
  Result := Self;
end;

function TExtCompositeElementLite.ReplaceElement(El: string; Replacement: string;
  DomReplace: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.replaceElement(' + VarToJSON([El, Replacement, DomReplace]) + ');',
    'TExtCompositeElementLite');
  Result := Self;
end;

class function TFusionCharts.JSClassName: string;
begin
  Result := 'FusionCharts';
end;

function TFusionCharts.SetDataURL(XML: string): TExtFunction;
begin
  JSCode(JSName + '.setDataURL(' + VarToJSON([XML]) + ');', 'TFusionCharts');
  Result := Self;
end;

function TFusionCharts.Render(Id: string): TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([Id]) + ');', 'TFusionCharts');
  Result := Self;
end;

procedure TExtDomHelperSingleton.SetFUseDom(Value: Boolean);
begin
  FUseDom := Value;
  JSCodeBlock(JSName + '.useDom=' + VarToJSON([Value]) + ';');
end;

class function TExtDomHelperSingleton.JSClassName: string;
begin
  Result := 'Ext.DomHelper';
end;

function TExtDomHelperSingleton.ApplyStyles(El: string; Styles: string): TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([El, Styles]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.ApplyStyles(El: string; Styles: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([El, Styles, false]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.ApplyStyles(El: string; Styles: TExtFunction)
  : TExtFunction;
begin
  JSCode(JSName + '.applyStyles(' + VarToJSON([El, Styles, true]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.CreateDom(O: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.createDom(' + VarToJSON([O, false]) + ');', 'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.CreateDom(O: string): TExtFunction;
begin
  JSCode(JSName + '.createDom(' + VarToJSON([O]) + ');', 'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.CreateTemplate(O: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.createTemplate(' + VarToJSON([O, false]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.Markup(O: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.markup(' + VarToJSON([O, false]) + ');', 'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.Overwrite(El: string; O: TExtObject;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.overwrite(' + VarToJSON([El, O, false, ReturnElement]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

function TExtDomHelperSingleton.Overwrite(El: string; O: string;
  ReturnElement: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.overwrite(' + VarToJSON([El, O, ReturnElement]) + ');',
    'TExtDomHelperSingleton');
  Result := Self;
end;

procedure TExtAction._SetDisabled(const AValue: Boolean);
begin
  FDisabled := SetConfigItem('disabled', 'setDisabled', AValue);
end;

procedure TExtAction._SetHandler(const AValue: TExtFunction);
begin
  FHandler := SetFunctionConfigItem('handler', 'setHandler', AValue);
end;

procedure TExtAction._SetHidden(const AValue: Boolean);
begin
  FHidden := SetConfigItem('hidden', 'setHidden', AValue);
end;

procedure TExtAction.SetFIconCls(Value: string);
begin
  FIconCls := Value;
  JSCodeBlock('iconCls:' + VarToJSON([Value]));
end;

procedure TExtAction.SetFItemId(Value: string);
begin
  FItemId := Value;
  JSCodeBlock('itemId:' + VarToJSON([Value]));
end;

procedure TExtAction.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtAction._SetText(const AValue: string);
begin
  FText := SetConfigItem('text', 'setText', AValue);
end;

class function TExtAction.JSClassName: string;
begin
  Result := 'Ext.Action';
end;

procedure TExtAction.InitDefaults;
begin
  inherited;
  FScope := TExtObject.CreateInternal(Self, 'scope');
end;

function TExtAction.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtAction');
  Result := Self;
end;

function TExtAction.Each(Fn: TExtFunction; Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.each(' + VarToJSON([Fn, true, Scope, false]) + ');', 'TExtAction');
  Result := Self;
end;

function TExtAction.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtAction');
  Result := Self;
end;

function TExtAction.Execute(Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.execute(' + VarToJSON(Args) + ');', 'TExtAction');
  Result := Self;
end;

function TExtAction.GetIconClass: TExtFunction;
begin
  JSCode(JSName + '.getIconClass();', 'TExtAction');
  Result := Self;
end;

function TExtAction.GetText: TExtFunction;
begin
  JSCode(JSName + '.getText();', 'TExtAction');
  Result := Self;
end;

function TExtAction.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtAction');
  Result := Self;
end;

function TExtAction.IsDisabled: TExtFunction;
begin
  JSCode(JSName + '.isDisabled();', 'TExtAction');
  Result := Self;
end;

function TExtAction.IsHidden: TExtFunction;
begin
  JSCode(JSName + '.isHidden();', 'TExtAction');
  Result := Self;
end;

function TExtAction.SetDisabled(const ADisabled: Boolean): TExtFunction;
begin
  FDisabled := ADisabled;
  Result := CallMethod('setDisabled', ADisabled);
end;

function TExtAction.SetHandler(const AFn: TExtFunction; const AScope: TExtObject): TExtFunction;
begin
  FHandler := AFn;
  Result := CallMethod('setHandler', [AFn, True, AScope, False]);
end;

function TExtAction.SetHidden(const AHidden: Boolean): TExtFunction;
begin
  FHidden := AHidden;
  Result := CallMethod('setHidden', AHidden);
end;

function TExtAction.SetIconClass(Cls: string): TExtFunction;
begin
  JSCode(JSName + '.setIconClass(' + VarToJSON([Cls]) + ');', 'TExtAction');
  Result := Self;
end;

function TExtAction.SetText(const AText: string): TExtFunction;
begin
  FText := AText;
  Result := CallMethod('setText', AText);
end;

function TExtAction.Show: TExtFunction;
begin
  JSCode(JSName + '.show();', 'TExtAction');
  Result := Self;
end;

class function TExtDirectTransaction.JSClassName: string;
begin
  Result := 'Ext.Direct.Transaction';
end;

procedure TExtSplitBar.SetFAnimate(Value: Boolean);
begin
  FAnimate := Value;
  JSCodeBlock(JSName + '.animate=' + VarToJSON([Value]) + ';');
end;

procedure TExtSplitBar.SetFMaxSize(Value: Integer);
begin
  FMaxSize := Value;
  JSCodeBlock(JSName + '.maxSize=' + VarToJSON([Value]) + ';');
end;

procedure TExtSplitBar.SetFMinSize(Value: Integer);
begin
  FMinSize := Value;
  JSCodeBlock(JSName + '.minSize=' + VarToJSON([Value]) + ';');
end;

procedure TExtSplitBar.SetFTickSize(Value: Integer);
begin
  FTickSize := Value;
  JSCodeBlock(JSName + '.tickSize=' + VarToJSON([Value]) + ';');
end;

procedure TExtSplitBar.SetFUseShim(Value: Boolean);
begin
  FUseShim := Value;
  JSCodeBlock(JSName + '.useShim=' + VarToJSON([Value]) + ';');
end;

procedure TExtSplitBar.SetFOnBeforeresize(Value: TExtSplitBarOnBeforeresize);
begin
  if Assigned(FOnBeforeresize) then
    JSCodeBlock(JSName + '.events ["beforeresize"].listeners=[];');
  if Assigned(Value) then
    on('beforeresize', Ajax('beforeresize', ['This', '%0.nm'], true));
  FOnBeforeresize := Value;
end;

procedure TExtSplitBar.SetFOnMoved(Value: TExtSplitBarOnMoved);
begin
  if Assigned(FOnMoved) then
    JSCodeBlock(JSName + '.events ["moved"].listeners=[];');
  if Assigned(Value) then
    on('moved', Ajax('moved', ['This', '%0.nm', 'NewSize', '%1'], true));
  FOnMoved := Value;
end;

procedure TExtSplitBar.SetFOnResize(Value: TExtSplitBarOnResize);
begin
  if Assigned(FOnResize) then
    JSCodeBlock(JSName + '.events ["resize"].listeners=[];');
  if Assigned(Value) then
    on('resize', Ajax('resize', ['This', '%0.nm', 'NewSize', '%1'], true));
  FOnResize := Value;
end;

class function TExtSplitBar.JSClassName: string;
begin
  Result := 'Ext.SplitBar';
end;

function TExtSplitBar.GetAdapter: TExtFunction;
begin
  JSCode(JSName + '.getAdapter();', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.GetMaximumSize: TExtFunction;
begin
  JSCode(JSName + '.getMaximumSize();', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.GetMinimumSize: TExtFunction;
begin
  JSCode(JSName + '.getMinimumSize();', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.SetAdapter(Adapter: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setAdapter(' + VarToJSON([Adapter, false]) + ');', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.SetCurrentSize(Size: Integer): TExtFunction;
begin
  JSCode(JSName + '.setCurrentSize(' + VarToJSON([Size]) + ');', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.SetMaximumSize(MaxSize: Integer): TExtFunction;
begin
  JSCode(JSName + '.setMaximumSize(' + VarToJSON([MaxSize]) + ');', 'TExtSplitBar');
  Result := Self;
end;

function TExtSplitBar.SetMinimumSize(MinSize: Integer): TExtFunction;
begin
  JSCode(JSName + '.setMinimumSize(' + VarToJSON([MinSize]) + ');', 'TExtSplitBar');
  Result := Self;
end;

procedure TExtSplitBar.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeresize') and Assigned(FOnBeforeresize) then
    FOnBeforeresize(TExtSplitBar(ParamAsObject('This')))
  else if (AEvtName = 'moved') and Assigned(FOnMoved) then
    FOnMoved(TExtSplitBar(ParamAsObject('This')), ParamAsInteger('NewSize'))
  else if (AEvtName = 'resize') and Assigned(FOnResize) then
    FOnResize(TExtSplitBar(ParamAsObject('This')), ParamAsInteger('NewSize'));
end;

procedure TExtResizable.SetFAdjustments(Value: TExtObjectList);
begin
  FAdjustments := Value;
  JSCodeBlock('adjustments:' + VarToJSON([Value, false]));
end;

procedure TExtResizable.SetFAdjustmentsString(Value: string);
begin
  FAdjustmentsString := Value;
  JSCodeBlock('adjustments:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFAnimate(Value: Boolean);
begin
  FAnimate := Value;
  JSCodeBlock('animate:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFConstrainTo(Value: string);
begin
  FConstrainTo := Value;
  JSCodeBlock('constrainTo:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFDisableTrackOver(Value: Boolean);
begin
  FDisableTrackOver := Value;
  JSCodeBlock('disableTrackOver:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFDraggable(Value: Boolean);
begin
  FDraggable := Value;
  JSCodeBlock('draggable:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFDuration(Value: Integer);
begin
  FDuration := Value;
  JSCodeBlock('duration:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFDynamic(Value: Boolean);
begin
  FDynamic := Value;
  JSCodeBlock('dynamic:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFEasing(Value: string);
begin
  FEasing := Value;
  JSCodeBlock('easing:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFEnabled(Value: Boolean);
begin
  FEnabled := Value;
  JSCodeBlock('enabled:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFHandleCls(Value: string);
begin
  FHandleCls := Value;
  JSCodeBlock('handleCls:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFHandles(Value: string);
begin
  FHandles := Value;
  JSCodeBlock('handles:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFHeight(Value: Integer);
begin
  FHeight := Value;
  JSCodeBlock('height:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFHeightIncrement(Value: Integer);
begin
  FHeightIncrement := Value;
  JSCodeBlock('heightIncrement:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMaxHeight(Value: Integer);
begin
  FMaxHeight := Value;
  JSCodeBlock('maxHeight:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMaxWidth(Value: Integer);
begin
  FMaxWidth := Value;
  JSCodeBlock('maxWidth:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMinHeight(Value: Integer);
begin
  FMinHeight := Value;
  JSCodeBlock('minHeight:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMinWidth(Value: Integer);
begin
  FMinWidth := Value;
  JSCodeBlock('minWidth:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMinX(Value: Integer);
begin
  FMinX := Value;
  JSCodeBlock('minX:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMinY(Value: Integer);
begin
  FMinY := Value;
  JSCodeBlock('minY:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFMultiDirectional(Value: Boolean);
begin
  FMultiDirectional := Value;
  JSCodeBlock('multiDirectional:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFPinned(Value: Boolean);
begin
  FPinned := Value;
  JSCodeBlock('pinned:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFPreserveRatio(Value: Boolean);
begin
  FPreserveRatio := Value;
  JSCodeBlock('preserveRatio:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFResizeChild(Value: Boolean);
begin
  FResizeChild := Value;
  JSCodeBlock('resizeChild:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFResizeChildString(Value: string);
begin
  FResizeChildString := Value;
  JSCodeBlock('resizeChild:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFResizeChildElement(Value: TExtElement);
begin
  FResizeChildElement := Value;
  JSCodeBlock('resizeChild:' + VarToJSON([Value, false]));
end;

procedure TExtResizable.SetFTransparent(Value: Boolean);
begin
  FTransparent := Value;
  JSCodeBlock('transparent:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCodeBlock('width:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFWidthIncrement(Value: Integer);
begin
  FWidthIncrement := Value;
  JSCodeBlock('widthIncrement:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFWrap(Value: Boolean);
begin
  FWrap := Value;
  JSCodeBlock('wrap:' + VarToJSON([Value]));
end;

procedure TExtResizable.SetFEnabled_(Value: Boolean);
begin
  FEnabled_ := Value;
  JSCodeBlock(JSName + '.enabled=' + VarToJSON([Value]) + ';');
end;

procedure TExtResizable.SetFProxy(Value: TExtElement);
begin
  FProxy := Value;
  JSCodeBlock(JSName + '.proxy=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtResizable.SetFOnBeforeresize(Value: TExtResizableOnBeforeresize);
begin
  if Assigned(FOnBeforeresize) then
    JSCodeBlock(JSName + '.events ["beforeresize"].listeners=[];');
  if Assigned(Value) then
    on('beforeresize', Ajax('beforeresize', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnBeforeresize := Value;
end;

procedure TExtResizable.SetFOnResize(Value: TExtResizableOnResize);
begin
  if Assigned(FOnResize) then
    JSCodeBlock(JSName + '.events ["resize"].listeners=[];');
  if Assigned(Value) then
    on('resize', Ajax('resize', ['This', '%0.nm', 'Width', '%1', 'Height', '%2', 'E',
      '%3.nm'], true));
  FOnResize := Value;
end;

class function TExtResizable.JSClassName: string;
begin
  Result := 'Ext.Resizable';
end;

procedure TExtResizable.InitDefaults;
begin
  inherited;
  FAdjustments := TExtObjectList.CreateInternal(Self, 'adjustments');
  FDuration := 0;
  FEasing := 'easingOutStrong';
  FEnabled := true;
  FMaxHeight := 10000;
  FMaxWidth := 10000;
  FMinHeight := 5;
  FMinWidth := 5;
  FMinX := 0;
  FMinY := 0;
  FResizeChildElement := TExtElement.CreateInternal(Self, 'resizeChild');
  FProxy := TExtElement.CreateInternal(Self, 'proxy');
end;

function TExtResizable.GetEl: TExtFunction;
begin
  JSCode(JSName + '.getEl();', 'TExtResizable');
  Result := Self;
end;

function TExtResizable.GetResizeChild: TExtFunction;
begin
  JSCode(JSName + '.getResizeChild();', 'TExtResizable');
  Result := Self;
end;

function TExtResizable.ResizeElement: TExtFunction;
begin
  JSCode(JSName + '.resizeElement();', 'TExtResizable');
  Result := Self;
end;

function TExtResizable.ResizeTo(Width: Integer; Height: Integer): TExtFunction;
begin
  JSCode(JSName + '.resizeTo(' + VarToJSON([Width, Height]) + ');', 'TExtResizable');
  Result := Self;
end;

procedure TExtResizable.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeresize') and Assigned(FOnBeforeresize) then
    FOnBeforeresize(TExtResizable(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'resize') and Assigned(FOnResize) then
    FOnResize(TExtResizable(ParamAsObject('This')), ParamAsInteger('Width'),
      ParamAsInteger('Height'), ExtEventObject);
end;

class function TExtSplitBarAbsoluteLayoutAdapter.JSClassName: string;
begin
  Result := 'Ext.SplitBar.AbsoluteLayoutAdapter';
end;

class function TExtSplitBarAbsoluteLayoutAdapter.Bottom: Integer;
begin
  Result := 0
end;

class function TExtSplitBarAbsoluteLayoutAdapter.HORIZONTAL: Integer;
begin
  Result := 0
end;

class function TExtSplitBarAbsoluteLayoutAdapter.LEFT: Integer;
begin
  Result := 0
end;

class function TExtSplitBarAbsoluteLayoutAdapter.RIGHT: Integer;
begin
  Result := 0
end;

class function TExtSplitBarAbsoluteLayoutAdapter.Top: Integer;
begin
  Result := 0
end;

class function TExtSplitBarAbsoluteLayoutAdapter.VERTICAL: Integer;
begin
  Result := 0
end;

procedure TExtUpdater.SetFDefaultUrl(Value: string);
begin
  FDefaultUrl := Value;
  JSCodeBlock(JSName + '.defaultUrl=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFDisableCaching(Value: Boolean);
begin
  FDisableCaching := Value;
  JSCodeBlock(JSName + '.disableCaching=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFEl(Value: TExtElement);
begin
  FEl := Value;
  JSCodeBlock(JSName + '.el=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtUpdater.SetFFormUpdateDelegate(Value: TExtFunction);
begin
  FFormUpdateDelegate := Value;
  JSCodeBlock(JSName + '.formUpdateDelegate=' + VarToJSON([Value, true]) + ';');
end;

procedure TExtUpdater.SetFIndicatorText(Value: string);
begin
  FIndicatorText := Value;
  JSCodeBlock(JSName + '.indicatorText=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFLoadScripts(Value: Boolean);
begin
  FLoadScripts := Value;
  JSCodeBlock(JSName + '.loadScripts=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFRefreshDelegate(Value: TExtFunction);
begin
  FRefreshDelegate := Value;
  JSCodeBlock(JSName + '.refreshDelegate=' + VarToJSON([Value, true]) + ';');
end;

procedure TExtUpdater.SetFShowLoadIndicator(Value: string);
begin
  FShowLoadIndicator := Value;
  JSCodeBlock(JSName + '.showLoadIndicator=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFSslBlankUrl(Value: string);
begin
  FSslBlankUrl := Value;
  JSCodeBlock(JSName + '.sslBlankUrl=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFTimeout(Value: Integer);
begin
  FTimeout := Value;
  JSCodeBlock(JSName + '.timeout=' + VarToJSON([Value]) + ';');
end;

procedure TExtUpdater.SetFTransaction(Value: TExtObject);
begin
  FTransaction := Value;
  JSCodeBlock(JSName + '.transaction=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtUpdater.SetFUpdateDelegate(Value: TExtFunction);
begin
  FUpdateDelegate := Value;
  JSCodeBlock(JSName + '.updateDelegate=' + VarToJSON([Value, true]) + ';');
end;

procedure TExtUpdater.SetFOnBeforeupdate(Value: TExtUpdaterOnBeforeupdate);
begin
  if Assigned(FOnBeforeupdate) then
    JSCodeBlock(JSName + '.events ["beforeupdate"].listeners=[];');
  if Assigned(Value) then
    on('beforeupdate', Ajax('beforeupdate', ['El', '%0.nm', 'Url', '%1', 'Params',
      '%2'], true));
  FOnBeforeupdate := Value;
end;

procedure TExtUpdater.SetFOnFailure(Value: TExtUpdaterOnFailure);
begin
  if Assigned(FOnFailure) then
    JSCodeBlock(JSName + '.events ["failure"].listeners=[];');
  if Assigned(Value) then
    on('failure', Ajax('failure', ['El', '%0.nm', 'OResponseObject', '%1.nm'], true));
  FOnFailure := Value;
end;

procedure TExtUpdater.SetFOnUpdate(Value: TExtUpdaterOnUpdate);
begin
  if Assigned(FOnUpdate) then
    JSCodeBlock(JSName + '.events ["update"].listeners=[];');
  if Assigned(Value) then
    on('update', Ajax('update', ['El', '%0.nm', 'OResponseObject', '%1.nm'], true));
  FOnUpdate := Value;
end;

class function TExtUpdater.JSClassName: string;
begin
  Result := 'Ext.Updater';
end;

procedure TExtUpdater.InitDefaults;
begin
  inherited;
  FEl := TExtElement.CreateInternal(Self, 'el');
  FIndicatorText := 'output/Ext.Updater.defaults.html#Ext.Updater.defaults-indicatorText';
  FShowLoadIndicator :=
    'output/Ext.Updater.defaults.html#Ext.Updater.defaults-showLoadIndicator';
  FSslBlankUrl := 'output/Ext.Updater.defaults.html#Ext.Updater.defaults-sslBlankUrl';
  FTransaction := TExtObject.CreateInternal(Self, 'transaction');
end;

function TExtUpdater.UpdaterUpdateElement(El: string; Url: string; Params: string = '';
  Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.Updater.updateElement(' + VarToJSON([El, Url, Params, Options, false])
    + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.UpdaterUpdateElement(El: string; Url: string; Params: TExtObject;
  Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.Updater.updateElement(' + VarToJSON([El, Url, Params, false, Options,
    false]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.Abort: TExtFunction;
begin
  JSCode(JSName + '.abort();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.FormUpdate(Form: string; Url: string = ''; Reset: Boolean = false;
  Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.formUpdate(' + VarToJSON([Form, Url, Reset, Callback, true]) + ');',
    'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.GetDefaultRenderer: TExtFunction;
begin
  JSCode(JSName + '.getDefaultRenderer();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.GetEl: TExtFunction;
begin
  JSCode(JSName + '.getEl();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.GetRenderer: TExtFunction;
begin
  JSCode(JSName + '.getRenderer();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.IsAutoRefreshing: TExtFunction;
begin
  JSCode(JSName + '.isAutoRefreshing();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.IsUpdating: TExtFunction;
begin
  JSCode(JSName + '.isUpdating();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.Refresh(Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.refresh(' + VarToJSON([Callback, true]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.SetDefaultUrl(DefaultUrl: string): TExtFunction;
begin
  JSCode(JSName + '.setDefaultUrl(' + VarToJSON([DefaultUrl]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.SetDefaultUrl(DefaultUrl: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.setDefaultUrl(' + VarToJSON([DefaultUrl, true]) + ');',
    'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.SetRenderer(Renderer: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setRenderer(' + VarToJSON([Renderer, false]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.ShowLoading: TExtFunction;
begin
  JSCode(JSName + '.showLoading();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: string = '';
  Params: string = ''; Callback: TExtFunction = nil; RefreshNow: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, Params, Callback, true,
    RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: TExtObject;
  Params: string = ''; Callback: TExtFunction = nil; RefreshNow: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, false, Params,
    Callback, true, RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: TExtObject;
  Params: TExtObject; Callback: TExtFunction = nil; RefreshNow: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, false, Params, false,
    Callback, true, RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: TExtFunction;
  Params: string = ''; Callback: TExtFunction = nil; RefreshNow: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, true, Params, Callback,
    true, RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: TExtFunction;
  Params: TExtObject; Callback: TExtFunction = nil; RefreshNow: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, true, Params, false,
    Callback, true, RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StartAutoRefresh(Interval: Integer; Url: string; Params: TExtObject;
  Callback: TExtFunction = nil; RefreshNow: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.startAutoRefresh(' + VarToJSON([Interval, Url, Params, false,
    Callback, true, RefreshNow]) + ');', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.StopAutoRefresh: TExtFunction;
begin
  JSCode(JSName + '.stopAutoRefresh();', 'TExtUpdater');
  Result := Self;
end;

function TExtUpdater.Update(Options: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON([Options, false]) + ');', 'TExtUpdater');
  Result := Self;
end;

procedure TExtUpdater.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeupdate') and Assigned(FOnBeforeupdate) then
    FOnBeforeupdate(TExtElement(ParamAsObject('El')), ParamAsString('Url'),
      ParamAsString('Params'))
  else if (AEvtName = 'failure') and Assigned(FOnFailure) then
    FOnFailure(TExtElement(ParamAsObject('El')),
      TExtObject(ParamAsObject('OResponseObject')))
  else if (AEvtName = 'update') and Assigned(FOnUpdate) then
    FOnUpdate(TExtElement(ParamAsObject('El')),
      TExtObject(ParamAsObject('OResponseObject')));
end;

procedure TExtComponent.SetFAllowDomMove(Value: Boolean);
begin
  FAllowDomMove := Value;
  JSCodeBlock('allowDomMove:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFApplyTo(Value: string);
begin
  FApplyTo := Value;
  JSCodeBlock('applyTo:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFAutoEl(Value: TExtObject);
begin
  FAutoEl := Value;
  JSCodeBlock('autoEl:' + VarToJSON([Value, false]));
end;

procedure TExtComponent.SetFAutoShow(Value: Boolean);
begin
  FAutoShow := Value;
  JSCodeBlock('autoShow:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFBubbleEvents(Value: TExtObjectList);
begin
  FBubbleEvents := Value;
  JSCodeBlock('bubbleEvents:' + VarToJSON([Value, false]));
end;

procedure TExtComponent.SetFClearCls(Value: string);
begin
  FClearCls := Value;
  JSCodeBlock('clearCls:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetCls(const AValue: string);
begin
  FCls := SetConfigItem('cls', AValue);
end;

procedure TExtComponent.SetFContentEl(Value: string);
begin
  FContentEl := Value;
  JSCodeBlock('contentEl:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFCtCls(Value: string);
begin
  FCtCls := Value;
  JSCodeBlock('ctCls:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFData(Value: string);
begin
  FData := Value;
  JSCodeBlock('data:' + VarToJSON([Value]));
end;

procedure TExtComponent._SetDisabled(const AValue: Boolean);
begin
  FDisabled := SetConfigItem('disabled', 'setDisabled', AValue);
end;

procedure TExtComponent.SetFDisabledClass(Value: string);
begin
  FDisabledClass := Value;
  JSCodeBlock('disabledClass:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFieldLabel(const AValue: string);
begin
  FFieldLabel := SetConfigItem('fieldLabel', AValue);
end;

procedure TExtComponent.SetHidden(const AValue: Boolean);
begin
  FHidden := SetConfigItem('hidden', 'setHidden', AValue);
end;

procedure TExtComponent.SetFHideLabel(Value: Boolean);
begin
  FHideLabel := Value;
  JSCodeBlock('hideLabel:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFHideMode(Value: string);
begin
  FHideMode := Value;
  JSCodeBlock('hideMode:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFHideParent(Value: Boolean);
begin
  FHideParent := Value;
  JSCodeBlock('hideParent:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetHtml(const AValue: string);
begin
  FHtml := SetConfigItem('html', 'update', AValue);
end;

procedure TExtComponent.SetFHtmlObject(Value: TExtObject);
begin
  FHtmlObject := Value;
  JSCodeBlock('html:' + VarToJSON([Value, false]));
end;

procedure TExtComponent.SetId(const AValue: string);
begin
  FId := SetConfigItem('id', AValue);
end;

procedure TExtComponent.SetItemCls(const AValue: string);
begin
  FItemCls := SetConfigItem('itemCls', AValue);
end;

procedure TExtComponent.SetItemId(const AValue: string);
begin
  FItemId := SetConfigItem('itemId', AValue);
end;

procedure TExtComponent.SetLabelSeparator(const AValue: string);
begin
  FLabelSeparator := SetConfigItem('labelSeparator', AValue);
end;

procedure TExtComponent.SetLabelStyle(const AValue: string);
begin
  FLabelStyle := SetConfigItem('labelStyle', AValue);
end;

procedure TExtComponent.SetOverCls(const AValue: string);
begin
  FOverCls := SetConfigItem('overCls', AValue);
end;

procedure TExtComponent.SetPadding(const AValue: string);
begin
  FPadding := SetConfigItem('padding', AValue);
end;

procedure TExtComponent.SetFPtype(Value: string);
begin
  FPtype := Value;
  JSCodeBlock('ptype:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFRef(Value: string);
begin
  FRef := Value;
  JSCodeBlock('ref:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFRenderTo(Value: string);
begin
  FRenderTo := Value;
  JSCodeBlock('renderTo:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFStateEvents(Value: TExtObjectList);
begin
  FStateEvents := Value;
  JSCodeBlock('stateEvents:' + VarToJSON([Value, false]));
end;

procedure TExtComponent.SetFStateId(Value: string);
begin
  FStateId := Value;
  JSCodeBlock('stateId:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFStateful(Value: Boolean);
begin
  FStateful := Value;
  JSCodeBlock('stateful:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetStyle(const AValue: string);
begin
  FStyle := SetConfigItem('style', AValue);
end;

procedure TExtComponent.SetTpl(const AValue: string);
begin
  FTpl := SetConfigItem('tpl', AValue);
end;

procedure TExtComponent.SetFTplWriteMode(Value: string);
begin
  FTplWriteMode := Value;
  JSCodeBlock('tplWriteMode:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFXtype(Value: TExtComponentXtype);
begin
  FXtype := Value;
  JSCodeBlock('xtype:"' + TJS.EnumToJSString(TypeInfo(TExtComponentXtype), ord(Value)) + '"');
end;

procedure TExtComponent.SetFDisabled_(Value: Boolean);
begin
  FDisabled_ := Value;
  JSCodeBlock(JSName + '.disabled=' + VarToJSON([Value]) + ';');
end;

procedure TExtComponent.SetFEl(Value: string);
begin
  FEl := Value;
  JSCodeBlock('el:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFHidden_(Value: Boolean);
begin
  FHidden_ := Value;
  JSCodeBlock(JSName + '.hidden=' + VarToJSON([Value]) + ';');
end;

procedure TExtComponent.SetSplit(const AValue: Boolean);
begin
  FSplit := AValue;
  SetConfigItem('split', AValue);
end;

procedure TExtComponent.SetCollapseMode(const AValue: string);
begin
  FCollapseMode := AValue;
  SetConfigItem('collapseMode', AValue);
end;

procedure TExtComponent.SetMinWidth(const AValue: Integer);
begin
  FMinWidth := AValue;
  SetConfigItem('minWidth', AValue);
end;

procedure TExtComponent.SetMaxWidth(const AValue: Integer);
begin
  FMaxWidth := AValue;
  SetConfigItem('maxWidth', AValue);
end;

procedure TExtComponent.SetMinSize(const AValue: Integer);
begin
  FMinSize := AValue;
  SetConfigItem('minSize', AValue);
end;

procedure TExtComponent.SetMaxSize(const AValue: Integer);
begin
  FMaxSize := AValue;
  SetConfigItem('maxSize', AValue);
end;

procedure TExtComponent.SetFCmargins(Value: string);
begin
  FCmargins := Value;
  JSCodeBlock('cmargins:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFClosable(Value: Boolean);
begin
  FClosable := Value;
  JSCodeBlock('closable:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFAnchor(Value: string);
begin
  FAnchor := Value;
  JSCodeBlock('anchor:' + VarToJSON([Value]));
end;

procedure TExtComponent.SetFStyleExtObject(Value: TExtObject);
begin
  FStyleExtObject := Value;
  JSCodeBlock('style:' + VarToJSON([Value, false]));
end;

procedure TExtComponent.SetFOnAdded(Value: TExtComponentOnAdded);
begin
  if Assigned(FOnAdded) then
    JSCodeBlock(JSName + '.events ["added"].listeners=[];');
  if Assigned(Value) then
    on('added', Ajax('added', ['This', '%0.nm', 'OwnerCt', '%1.nm', 'Index',
      '%2'], true));
  FOnAdded := Value;
end;

procedure TExtComponent.SetFOnAfterrender(Value: TExtComponentOnAfterrender);
begin
  if Assigned(FOnAfterrender) then
    JSCodeBlock(JSName + '.events ["afterrender"].listeners=[];');
  if Assigned(Value) then
    on('afterrender', Ajax('afterrender', ['This', '%0.nm'], true));
  FOnAfterrender := Value;
end;

procedure TExtComponent.SetFOnBeforedestroy(Value: TExtComponentOnBeforedestroy);
begin
  if Assigned(FOnBeforedestroy) then
    JSCodeBlock(JSName + '.events ["beforedestroy"].listeners=[];');
  if Assigned(Value) then
    on('beforedestroy', Ajax('beforedestroy', ['This', '%0.nm'], true));
  FOnBeforedestroy := Value;
end;

procedure TExtComponent.SetFOnBeforehide(Value: TExtComponentOnBeforehide);
begin
  if Assigned(FOnBeforehide) then
    JSCodeBlock(JSName + '.events ["beforehide"].listeners=[];');
  if Assigned(Value) then
    on('beforehide', Ajax('beforehide', ['This', '%0.nm'], true));
  FOnBeforehide := Value;
end;

procedure TExtComponent.SetFOnBeforerender(Value: TExtComponentOnBeforerender);
begin
  if Assigned(FOnBeforerender) then
    JSCodeBlock(JSName + '.events ["beforerender"].listeners=[];');
  if Assigned(Value) then
    on('beforerender', Ajax('beforerender', ['This', '%0.nm'], true));
  FOnBeforerender := Value;
end;

procedure TExtComponent.SetFOnBeforeshow(Value: TExtComponentOnBeforeshow);
begin
  if Assigned(FOnBeforeshow) then
    JSCodeBlock(JSName + '.events ["beforeshow"].listeners=[];');
  if Assigned(Value) then
    on('beforeshow', Ajax('beforeshow', ['This', '%0.nm'], true));
  FOnBeforeshow := Value;
end;

procedure TExtComponent.SetFOnBeforestaterestore
  (Value: TExtComponentOnBeforestaterestore);
begin
  if Assigned(FOnBeforestaterestore) then
    JSCodeBlock(JSName + '.events ["beforestaterestore"].listeners=[];');
  if Assigned(Value) then
    on('beforestaterestore', Ajax('beforestaterestore', ['This', '%0.nm', 'State',
      '%1.nm'], true));
  FOnBeforestaterestore := Value;
end;

procedure TExtComponent.SetFOnBeforestatesave(Value: TExtComponentOnBeforestatesave);
begin
  if Assigned(FOnBeforestatesave) then
    JSCodeBlock(JSName + '.events ["beforestatesave"].listeners=[];');
  if Assigned(Value) then
    on('beforestatesave', Ajax('beforestatesave', ['This', '%0.nm', 'State',
      '%1.nm'], true));
  FOnBeforestatesave := Value;
end;

procedure TExtComponent.SetFOnDestroyJS(Value: TExtComponentOnDestroyJS);
begin
  if Assigned(FOnDestroyJS) then
    JSCodeBlock(JSName + '.events ["destroy"].listeners=[];');
  if Assigned(Value) then
    on('destroy', Ajax('destroy', ['This', '%0.nm'], true));
  FOnDestroyJS := Value;
end;

procedure TExtComponent.SetFOnDisable(Value: TExtComponentOnDisable);
begin
  if Assigned(FOnDisable) then
    JSCodeBlock(JSName + '.events ["disable"].listeners=[];');
  if Assigned(Value) then
    on('disable', Ajax('disable', ['This', '%0.nm'], true));
  FOnDisable := Value;
end;

procedure TExtComponent.SetFOnEnable(Value: TExtComponentOnEnable);
begin
  if Assigned(FOnEnable) then
    JSCodeBlock(JSName + '.events ["enable"].listeners=[];');
  if Assigned(Value) then
    on('enable', Ajax('enable', ['This', '%0.nm'], true));
  FOnEnable := Value;
end;

procedure TExtComponent.SetFOnHide(Value: TExtComponentOnHide);
begin
  if Assigned(FOnHide) then
    JSCodeBlock(JSName + '.events ["hide"].listeners=[];');
  if Assigned(Value) then
    on('hide', Ajax('hide', ['This', '%0.nm'], true));
  FOnHide := Value;
end;

procedure TExtComponent.SetFOnRemoved(Value: TExtComponentOnRemoved);
begin
  if Assigned(FOnRemoved) then
    JSCodeBlock(JSName + '.events ["removed"].listeners=[];');
  if Assigned(Value) then
    on('removed', Ajax('removed', ['This', '%0.nm', 'OwnerCt', '%1.nm'], true));
  FOnRemoved := Value;
end;

procedure TExtComponent.SetFOnRender(Value: TExtComponentOnRender);
begin
  if Assigned(FOnRender) then
    JSCodeBlock(JSName + '.events ["render"].listeners=[];');
  if Assigned(Value) then
    on('render', Ajax('render', ['This', '%0.nm'], true));
  FOnRender := Value;
end;

procedure TExtComponent.SetFOnShow(Value: TExtComponentOnShow);
begin
  if Assigned(FOnShow) then
    JSCodeBlock(JSName + '.events ["show"].listeners=[];');
  if Assigned(Value) then
    on('show', Ajax('show', ['This', '%0.nm'], true));
  FOnShow := Value;
end;

procedure TExtComponent.SetFOnStaterestore(Value: TExtComponentOnStaterestore);
begin
  if Assigned(FOnStaterestore) then
    JSCodeBlock(JSName + '.events ["staterestore"].listeners=[];');
  if Assigned(Value) then
    on('staterestore', Ajax('staterestore', ['This', '%0.nm', 'State', '%1.nm'], true));
  FOnStaterestore := Value;
end;

procedure TExtComponent.SetFOnStatesave(Value: TExtComponentOnStatesave);
begin
  if Assigned(FOnStatesave) then
    JSCodeBlock(JSName + '.events ["statesave"].listeners=[];');
  if Assigned(Value) then
    on('statesave', Ajax('statesave', ['This', '%0.nm', 'State', '%1.nm'], true));
  FOnStatesave := Value;
end;

class function TExtComponent.JSClassName: string;
begin
  Result := 'Ext.Component';
end;

procedure TExtComponent.InitDefaults;
begin
  inherited;
  FAllowDomMove := True;
  FBubbleEvents := TExtObjectList.CreateInternal(Self, 'bubbleEvents');
  FClearCls := 'x-form-clear-left';
  FDisabledClass := 'x-item-disabled';
  FLabelSeparator := ':';
  FPlugins := TExtObjectList.CreateInternal(Self, 'plugins');
  FStateEvents := TExtObjectList.CreateInternal(Self, 'stateEvents');
  FStyleExtObject := TExtObject.CreateInternal(Self, 'style');
  FLoader := TExtObject.CreateInternal(Self, 'loader');
end;

function TExtComponent.AddCls(const AClsName: string): TExtFunction;
begin
  Result := CallMethod('addCls', AClsName);
end;

function TExtComponent.AnElement(Cls: string): TExtFunction;
begin
  JSCode(JSName + '.an element(' + VarToJSON([Cls]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.ApplyToMarkup(El: string): TExtFunction;
begin
  JSCode(JSName + '.applyToMarkup(' + VarToJSON([El]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.CloneConfig(Overrides: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.cloneConfig(' + VarToJSON([Overrides, false]) + ');',
    'TExtComponent');
  Result := Self;
end;

function TExtComponent.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.FindParentBy(Fn: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.findParentBy(' + VarToJSON([Fn, true]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.FindParentByType(Xtype: string): TExtFunction;
begin
  JSCode(JSName + '.findParentByType(' + VarToJSON([Xtype]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.FindParentByType(Xtype: TClass): TExtFunction;
begin
  JSCode(JSName + '.findParentByType(' + VarToJSON([Xtype, false]) + ');',
    'TExtComponent');
  Result := Self;
end;

function TExtComponent.Focus(const ASelectText: Boolean; const ADelay: Boolean): TExtFunction;
begin
  Result := CallMethod('focus', [ASelectText, ADelay]);
end;

function TExtComponent.Focus(const ASelectText: Boolean; const ADelay: Integer): TExtFunction;
begin
  Result := CallMethod('focus', [ASelectText, ADelay]);
end;

function TExtComponent.GetBubbleTarget: TExtFunction;
begin
  JSCode(JSName + '.getBubbleTarget();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.GetEl: TExtFunction;
begin
  JSCode(JSName + '.getEl();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.GetId: TExtFunction;
begin
  JSCode(JSName + '.getId();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.GetItemId: TExtFunction;
begin
  JSCode(JSName + '.getItemId();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.GetXType: TExtFunction;
begin
  JSCode(JSName + '.getXType();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.GetXTypes: TExtFunction;
begin
  JSCode(JSName + '.getXTypes();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Hide: TExtFunction;
begin
  Result := CallMethod('hide', []);
end;

function TExtComponent.IsVisible: TExtFunction;
begin
  JSCode(JSName + '.isVisible();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.IsXType(Xtype: string; Shallow: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.isXType(' + VarToJSON([Xtype, Shallow]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mon(Item: TExtUtilObservable; Ename: TExtObject; Fn: TExtFunction;
  Scope: TExtObject; Opt: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mon(' + VarToJSON([Item, false, Ename, false, Fn, true, Scope, false,
    Opt, false]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mon(Item: TExtElement; Ename: TExtObject; Fn: TExtFunction;
  Scope: TExtObject; Opt: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mon(' + VarToJSON([Item, false, Ename, false, Fn, true, Scope, false,
    Opt, false]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mon(Item: TExtElement; Ename: string; Fn: TExtFunction;
  Scope: TExtObject; Opt: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mon(' + VarToJSON([Item, false, Ename, Fn, true, Scope, false, Opt,
    false]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mon(Item: TExtUtilObservable; Ename: string; Fn: TExtFunction;
  Scope: TExtObject; Opt: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mon(' + VarToJSON([Item, false, Ename, Fn, true, Scope, false, Opt,
    false]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mun(Item: TExtUtilObservable; Ename: TExtObject; Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mun(' + VarToJSON([Item, false, Ename, false, Fn, true, Scope, false])
    + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mun(Item: TExtElement; Ename: TExtObject; Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mun(' + VarToJSON([Item, false, Ename, false, Fn, true, Scope, false])
    + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mun(Item: TExtElement; Ename: string; Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mun(' + VarToJSON([Item, false, Ename, Fn, true, Scope, false]) +
    ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Mun(Item: TExtUtilObservable; Ename: string; Fn: TExtFunction;
  Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.mun(' + VarToJSON([Item, false, Ename, Fn, true, Scope, false]) +
    ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.NextSibling: TExtFunction;
begin
  JSCode(JSName + '.nextSibling();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.PreviousSibling: TExtFunction;
begin
  JSCode(JSName + '.previousSibling();', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.RemoveClass(Cls: string): TExtFunction;
begin
  JSCode(JSName + '.removeClass(' + VarToJSON([Cls]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Render(Container: TExtElement = nil; Position: string = '')
  : TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([Container, false, Position]) + ');',
    'TExtComponent');
  Result := Self;
end;

function TExtComponent.Render(Container: string; Position: string = ''): TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([Container, Position]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Render(Container: string; Position: Integer): TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([Container, Position]) + ');', 'TExtComponent');
  Result := Self;
end;

function TExtComponent.Render(Container: TExtElement; Position: Integer): TExtFunction;
begin
  JSCode(JSName + '.render(' + VarToJSON([Container, false, Position]) + ');',
    'TExtComponent');
  Result := Self;
end;

function TExtComponent.SetDisabled(const AValue: Boolean): TExtFunction;
begin
  Result := CallMethod('setDisabled', AValue);
end;

function TExtComponent.SetVisible(const AValue: Boolean): TExtFunction;
begin
  Result := CallMethod('setVisible', AValue);
end;

function TExtComponent.Show: TExtFunction;
begin
  Result := CallMethod('show');
end;

function TExtComponent.Update(HtmlOrData: string; LoadScripts: Boolean = false;
  Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON([HtmlOrData, LoadScripts, Callback, true]) +
    ');', 'TExtComponent');
  Result := Self;
end;

procedure TExtComponent.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'added') and Assigned(FOnAdded) then
    FOnAdded(TExtComponent(ParamAsObject('This')), TExtContainer(ParamAsObject('OwnerCt')
      ), ParamAsInteger('Index'))
  else if (AEvtName = 'afterrender') and Assigned(FOnAfterrender) then
    FOnAfterrender(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'beforedestroy') and Assigned(FOnBeforedestroy) then
    FOnBeforedestroy(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'beforehide') and Assigned(FOnBeforehide) then
    FOnBeforehide(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'beforerender') and Assigned(FOnBeforerender) then
    FOnBeforerender(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'beforeshow') and Assigned(FOnBeforeshow) then
    FOnBeforeshow(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'beforestaterestore') and Assigned(FOnBeforestaterestore) then
    FOnBeforestaterestore(TExtComponent(ParamAsObject('This')),
      TExtObject(ParamAsObject('State')))
  else if (AEvtName = 'beforestatesave') and Assigned(FOnBeforestatesave) then
    FOnBeforestatesave(TExtComponent(ParamAsObject('This')),
      TExtObject(ParamAsObject('State')))
  else if (AEvtName = 'destroy') and Assigned(FOnDestroyJS) then
    FOnDestroyJS(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'disable') and Assigned(FOnDisable) then
    FOnDisable(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'enable') and Assigned(FOnEnable) then
    FOnEnable(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'hide') and Assigned(FOnHide) then
    FOnHide(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'removed') and Assigned(FOnRemoved) then
    FOnRemoved(TExtComponent(ParamAsObject('This')),
      TExtContainer(ParamAsObject('OwnerCt')))
  else if (AEvtName = 'render') and Assigned(FOnRender) then
    FOnRender(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'show') and Assigned(FOnShow) then
    FOnShow(TExtComponent(ParamAsObject('This')))
  else if (AEvtName = 'staterestore') and Assigned(FOnStaterestore) then
    FOnStaterestore(TExtComponent(ParamAsObject('This')),
      TExtObject(ParamAsObject('State')))
  else if (AEvtName = 'statesave') and Assigned(FOnStatesave) then
    FOnStatesave(TExtComponent(ParamAsObject('This')),
      TExtObject(ParamAsObject('State')));
end;

procedure TExtLayer.SetFCls(Value: string);
begin
  FCls := Value;
  JSCodeBlock('cls:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFConstrain(Value: Boolean);
begin
  FConstrain := Value;
  JSCodeBlock('constrain:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFDh(Value: TExtObject);
begin
  FDh := Value;
  JSCodeBlock('dh:' + VarToJSON([Value, false]));
end;

procedure TExtLayer.SetFShadow(Value: string);
begin
  FShadow := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFShadowBoolean(Value: Boolean);
begin
  FShadowBoolean := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFShadowOffset(Value: Integer);
begin
  FShadowOffset := Value;
  JSCodeBlock('shadowOffset:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFShim(Value: Boolean);
begin
  FShim := Value;
  JSCodeBlock('shim:' + VarToJSON([Value]));
end;

procedure TExtLayer.SetFUseDisplay(Value: Boolean);
begin
  FUseDisplay := Value;
  JSCodeBlock('useDisplay:' + VarToJSON([Value]));
end;

procedure TExtLayer._SetZindex(const AValue: Integer);
begin
  SetConfigItem('zindex', 'setZindex', AValue);
  FZindex := AValue;
end;

class function TExtLayer.JSClassName: string;
begin
  Result := 'Ext.Layer';
end;

procedure TExtLayer.InitDefaults;
begin
  inherited;
  FConstrain := true;
  FDh := TExtObject.CreateInternal(Self, 'dh');
  FShadowOffset := 4;
  FShim := true;
  FZindex := 11000;
end;

function TExtLayer.SetZIndex(const AZindex: Integer): TExtFunction;
begin
  Result := CallMethod('setZindex', AZindex);
end;

class function TExtCompositeElement.JSClassName: string;
begin
  Result := 'Ext.CompositeElement';
end;

class function TExtWindowMgrSingleton.JSClassName: string;
begin
  Result := 'Ext.WindowMgr';
end;

procedure TExtWindowMgrSingleton.InitDefaults;
begin
  inherited;
end;

class function TExtXTemplate.JSClassName: string;
begin
  Result := 'Ext.XTemplate';
end;

function TExtXTemplate.XTemplateFrom(El: string): TExtFunction;
begin
  JSCode(JSName + '.XTemplate.from(' + VarToJSON([El]) + ');', 'TExtXTemplate');
  Result := Self;
end;

function TExtXTemplate.Apply(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.apply(' + VarToJSON([Values, false]) + ');', 'TExtXTemplate');
  Result := Self;
end;

function TExtXTemplate.Apply(Values: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.apply(' + VarToJSON(Values) + ');', 'TExtXTemplate');
  Result := Self;
end;

function TExtXTemplate.ApplyTemplate(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.applyTemplate(' + VarToJSON([Values, false]) + ');', 'TExtXTemplate');
  Result := Self;
end;

function TExtXTemplate.Compile: TExtFunction;
begin
  JSCode(JSName + '.compile();', 'TExtXTemplate');
  Result := Self;
end;

procedure TExtEditor.SetFAlignment(Value: string);
begin
  FAlignment := Value;
  JSCodeBlock('alignment:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFAllowBlur(Value: Boolean);
begin
  FAllowBlur := Value;
  JSCodeBlock('allowBlur:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFAutoSize(Value: Boolean);
begin
  FAutoSize := Value;
  JSCodeBlock('autoSize:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFAutoSizeString(Value: string);
begin
  FAutoSizeString := Value;
  JSCodeBlock('autoSize:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFCancelOnEsc(Value: Boolean);
begin
  FCancelOnEsc := Value;
  JSCodeBlock('cancelOnEsc:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFCompleteOnEnter(Value: Boolean);
begin
  FCompleteOnEnter := Value;
  JSCodeBlock('completeOnEnter:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFConstrain(Value: Boolean);
begin
  FConstrain := Value;
  JSCodeBlock('constrain:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFField(Value: TExtFormField);
begin
  FField := Value;
  JSCodeBlock('field:' + VarToJSON([Value, false]));
end;

procedure TExtEditor.SetFHideEl(Value: Boolean);
begin
  FHideEl := Value;
  JSCodeBlock('hideEl:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFIgnoreNoChange(Value: Boolean);
begin
  FIgnoreNoChange := Value;
  JSCodeBlock('ignoreNoChange:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFOffsets(Value: TExtObjectList);
begin
  FOffsets := Value;
  JSCodeBlock('offsets:' + VarToJSON([Value, false]));
end;

procedure TExtEditor.SetFRevertInvalid(Value: Boolean);
begin
  FRevertInvalid := Value;
  JSCodeBlock('revertInvalid:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFShadow(Value: Boolean);
begin
  FShadow := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFShadowString(Value: string);
begin
  FShadowString := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFSwallowKeys(Value: Boolean);
begin
  FSwallowKeys := Value;
  JSCodeBlock('swallowKeys:' + VarToJSON([Value]));
end;

procedure TExtEditor.SetFUpdateEl(Value: Boolean);
begin
  FUpdateEl := Value;
  JSCodeBlock('updateEl:' + VarToJSON([Value]));
end;

procedure TExtEditor._SetValue(const AValue: string);
begin
  FValue := AValue;
  SetConfigItem('value', 'setValue', AValue);
end;

procedure TExtEditor.SetFOnBeforecomplete(Value: TExtEditorOnBeforecomplete);
begin
  if Assigned(FOnBeforecomplete) then
    JSCodeBlock(JSName + '.events ["beforecomplete"].listeners=[];');
  if Assigned(Value) then
    on('beforecomplete', Ajax('beforecomplete', ['This', '%0.nm', 'Value', '%1',
      'StartValue', '%2'], true));
  FOnBeforecomplete := Value;
end;

procedure TExtEditor.SetFOnBeforestartedit(Value: TExtEditorOnBeforestartedit);
begin
  if Assigned(FOnBeforestartedit) then
    JSCodeBlock(JSName + '.events ["beforestartedit"].listeners=[];');
  if Assigned(Value) then
    on('beforestartedit', Ajax('beforestartedit', ['This', '%0.nm', 'BoundEl', '%1.nm',
      'Value', '%2'], true));
  FOnBeforestartedit := Value;
end;

procedure TExtEditor.SetFOnCanceledit(Value: TExtEditorOnCanceledit);
begin
  if Assigned(FOnCanceledit) then
    JSCodeBlock(JSName + '.events ["canceledit"].listeners=[];');
  if Assigned(Value) then
    on('canceledit', Ajax('canceledit', ['This', '%0.nm', 'Value', '%1', 'StartValue',
      '%2'], true));
  FOnCanceledit := Value;
end;

procedure TExtEditor.SetFOnComplete(Value: TExtEditorOnComplete);
begin
  if Assigned(FOnComplete) then
    JSCodeBlock(JSName + '.events ["complete"].listeners=[];');
  if Assigned(Value) then
    on('complete', Ajax('complete', ['This', '%0.nm', 'Value', '%1', 'StartValue',
      '%2'], true));
  FOnComplete := Value;
end;

procedure TExtEditor.SetFOnSpecialkey(Value: TExtEditorOnSpecialkey);
begin
  if Assigned(FOnSpecialkey) then
    JSCodeBlock(JSName + '.events ["specialkey"].listeners=[];');
  if Assigned(Value) then
    on('specialkey', Ajax('specialkey', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnSpecialkey := Value;
end;

procedure TExtEditor.SetFOnStartedit(Value: TExtEditorOnStartedit);
begin
  if Assigned(FOnStartedit) then
    JSCodeBlock(JSName + '.events ["startedit"].listeners=[];');
  if Assigned(Value) then
    on('startedit', Ajax('startedit', ['BoundEl', '%0.nm', 'Value', '%1'], true));
  FOnStartedit := Value;
end;

class function TExtEditor.JSClassName: string;
begin
  Result := 'Ext.Editor';
end;

procedure TExtEditor.InitDefaults;
begin
  inherited;
  FField := TExtFormField.CreateInternal(Self, 'field');
  FHideEl := true;
  FOffsets := TExtObjectList.CreateInternal(Self, 'offsets');
  FRevertInvalid := true;
  FSwallowKeys := true;
end;

function TExtEditor.CancelEdit(RemainVisible: Boolean): TExtFunction;
begin
  JSCode(JSName + '.cancelEdit(' + VarToJSON([RemainVisible]) + ');', 'TExtEditor');
  Result := Self;
end;

function TExtEditor.CompleteEdit(RemainVisible: Boolean): TExtFunction;
begin
  JSCode(JSName + '.completeEdit(' + VarToJSON([RemainVisible]) + ');', 'TExtEditor');
  Result := Self;
end;

function TExtEditor.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtEditor');
  Result := Self;
end;

function TExtEditor.Realign(AutoSize: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.realign(' + VarToJSON([AutoSize]) + ');', 'TExtEditor');
  Result := Self;
end;

function TExtEditor.SetSize(Width: Integer; Height: Integer): TExtFunction;
begin
  JSCode(JSName + '.setSize(' + VarToJSON([Width, Height]) + ');', 'TExtEditor');
  Result := Self;
end;

function TExtEditor.SetValue(const AValue: string): TExtFunction;
begin
  FValue := AValue;
  Result := CallMethod('setValue', AValue);
end;

function TExtEditor.StartEdit(El: string; Value: string = ''): TExtFunction;
begin
  JSCode(JSName + '.startEdit(' + VarToJSON([El, Value]) + ');', 'TExtEditor');
  Result := Self;
end;

procedure TExtEditor.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforecomplete') and Assigned(FOnBeforecomplete) then
    FOnBeforecomplete(TExtEditor(ParamAsObject('This')), ParamAsString('Value'),
      ParamAsString('StartValue'))
  else if (AEvtName = 'beforestartedit') and Assigned(FOnBeforestartedit) then
    FOnBeforestartedit(TExtEditor(ParamAsObject('This')),
      TExtElement(ParamAsObject('BoundEl')), ParamAsString('Value'))
  else if (AEvtName = 'canceledit') and Assigned(FOnCanceledit) then
    FOnCanceledit(TExtEditor(ParamAsObject('This')), ParamAsString('Value'),
      ParamAsString('StartValue'))
  else if (AEvtName = 'complete') and Assigned(FOnComplete) then
    FOnComplete(TExtEditor(ParamAsObject('This')), ParamAsString('Value'),
      ParamAsString('StartValue'))
  else if (AEvtName = 'specialkey') and Assigned(FOnSpecialkey) then
    FOnSpecialkey(TExtEditor(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'startedit') and Assigned(FOnStartedit) then
    FOnStartedit(TExtElement(ParamAsObject('BoundEl')), ParamAsString('Value'));
end;

procedure TExtColorPalette.SetFAllowReselect(Value: Boolean);
begin
  FAllowReselect := Value;
  JSCodeBlock('allowReselect:' + VarToJSON([Value]));
end;

procedure TExtColorPalette.SetFClickEvent(Value: string);
begin
  FClickEvent := Value;
  JSCodeBlock('clickEvent:' + VarToJSON([Value]));
end;

procedure TExtColorPalette.SetFHandler(Value: TExtFunction);
begin
  FHandler := Value;
  JSCodeBlock('handler:' + VarToJSON([Value, true]));
end;

procedure TExtColorPalette.SetFItemCls(Value: string);
begin
  FItemCls := Value;
  JSCodeBlock('itemCls:' + VarToJSON([Value]));
end;

procedure TExtColorPalette.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtColorPalette.SetFTpl(Value: string);
begin
  FTpl := Value;
  JSCodeBlock('tpl:' + VarToJSON([Value]));
end;

procedure TExtColorPalette.SetFValue(Value: string);
begin
  FValue := Value;
  JSCodeBlock('value:' + VarToJSON([Value]));
end;

procedure TExtColorPalette.SetFColors(Value: TExtObjectList);
begin
  FColors := Value;
  JSCodeBlock(JSName + '.colors=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtColorPalette.SetFOnSelect(Value: TExtColorPaletteOnSelect);
begin
  if Assigned(FOnSelect) then
    JSCodeBlock(JSName + '.events ["select"].listeners=[];');
  if Assigned(Value) then
    on('select', Ajax('select', ['This', '%0.nm', 'Color', '%1'], true));
  FOnSelect := Value;
end;

class function TExtColorPalette.JSClassName: string;
begin
  Result := 'Ext.ColorPalette';
end;

procedure TExtColorPalette.InitDefaults;
begin
  inherited;
  FItemCls := 'x-color-palette';
  FScope := TExtObject.CreateInternal(Self, 'scope');
  FColors := TExtObjectList.CreateInternal(Self, 'colors');
end;

function TExtColorPalette.Select(Color: string; SuppressEvent: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([Color, SuppressEvent]) + ');',
    'TExtColorPalette');
  Result := Self;
end;

procedure TExtColorPalette.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'select') and Assigned(FOnSelect) then
    FOnSelect(TExtColorPalette(ParamAsObject('This')), ParamAsString('Color'));
end;

procedure TExtDatePicker.SetFCancelText(Value: string);
begin
  FCancelText := Value;
  JSCodeBlock('cancelText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFDayNames(Value: TExtObjectList);
begin
  FDayNames := Value;
  JSCodeBlock('dayNames:' + VarToJSON([Value, false]));
end;

procedure TExtDatePicker.SetFFormat(Value: string);
begin
  FFormat := Value;
  JSCodeBlock('format:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFHandler(Value: TExtFunction);
begin
  FHandler := Value;
  JSCodeBlock('handler:' + VarToJSON([Value, true]));
end;

procedure TExtDatePicker._SetMaxDate(const AValue: TDateTime);
begin
  FMaxDate := AValue;
  SetConfigItem('maxDate', 'setMaxDate', AValue);
end;

procedure TExtDatePicker.SetFMaxText(Value: string);
begin
  FMaxText := Value;
  JSCodeBlock('maxText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker._SetMinDate(const AValue: TDateTime);
begin
  FMinDate := AValue;
  SetConfigItem('minDate', 'setMinDate', AValue);
end;

procedure TExtDatePicker.SetFMinText(Value: string);
begin
  FMinText := Value;
  JSCodeBlock('minText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFMonthNames(Value: TExtObjectList);
begin
  FMonthNames := Value;
  JSCodeBlock('monthNames:' + VarToJSON([Value, false]));
end;

procedure TExtDatePicker.SetFMonthYearText(Value: string);
begin
  FMonthYearText := Value;
  JSCodeBlock('monthYearText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFNextText(Value: string);
begin
  FNextText := Value;
  JSCodeBlock('nextText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFOkText(Value: string);
begin
  FOkText := Value;
  JSCodeBlock('okText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFPrevText(Value: string);
begin
  FPrevText := Value;
  JSCodeBlock('prevText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtDatePicker.SetFShowToday(Value: Boolean);
begin
  FShowToday := Value;
  JSCodeBlock('showToday:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFStartDay(Value: Integer);
begin
  FStartDay := Value;
  JSCodeBlock('startDay:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFTodayText(Value: string);
begin
  FTodayText := Value;
  JSCodeBlock('todayText:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFTodayTip(Value: string);
begin
  FTodayTip := Value;
  JSCodeBlock('todayTip:' + VarToJSON([Value]));
end;

procedure TExtDatePicker.SetFOnSelect(Value: TExtDatePickerOnSelect);
begin
  if Assigned(FOnSelect) then
    JSCodeBlock(JSName + '.events ["select"].listeners=[];');
  if Assigned(Value) then
    on('select', Ajax('select', ['This', '%0.nm', 'Date', '%1'], true));
  FOnSelect := Value;
end;

class function TExtDatePicker.JSClassName: string;
begin
  Result := 'Ext.DatePicker';
end;

procedure TExtDatePicker.InitDefaults;
begin
  inherited;
  FCancelText := 'Cancel';
  FDayNames := TExtObjectList.CreateInternal(Self, 'dayNames');
  FFormat := 'm/d/y';
  FMaxText := 'This date is after the maximum date';
  FMinText := 'This date is before the minimum date';
  FMonthNames := TExtObjectList.CreateInternal(Self, 'monthNames');
  FOkText := 'OK';
  FScope := TExtObject.CreateInternal(Self, 'scope');
  FShowToday := true;
  FStartDay := 0;
  FTodayText := 'Today';
end;

function TExtDatePicker.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtDatePicker');
  Result := Self;
end;

function TExtDatePicker.SetMaxDate(const AValue: TDateTime): TExtFunction;
begin
  FMaxDate := AValue;
  Result := CallMethod('setMaxDate', AValue);
end;

function TExtDatePicker.SetMinDate(const AValue: TDateTime): TExtFunction;
begin
  FMinDate := AValue;
  Result := CallMethod('setMinDate', AValue);
end;

function TExtDatePicker.SetValue(Value: TDateTime): TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([Value]) + ');', 'TExtDatePicker');
  Result := Self;
end;

procedure TExtDatePicker.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'select') and Assigned(FOnSelect) then
    FOnSelect(TExtDatePicker(ParamAsObject('This')), ParamAsDateTime('Date'));
end;

procedure TExtBoxComponent.SetAnchor(const AValue: string);
begin
  FAnchor := AValue;
  SetConfigItem('anchor', AValue);
end;

procedure TExtBoxComponent.SetAutoHeight(const AValue: Boolean);
begin
  FAutoHeight := AValue;
  SetConfigItem('autoHeight', AValue);
end;

procedure TExtBoxComponent._SetAutoScroll(const AValue: Boolean);
begin
  FAutoScroll := AValue;
  SetConfigItem('autoScroll', 'setAutoScroll', AValue);
end;

procedure TExtBoxComponent.SetAutoWidth(const AValue: Boolean);
begin
  FAutoWidth := AValue;
  SetConfigItem('autoWidth', AValue);
end;

procedure TExtBoxComponent.SetFBoxMaxHeight(Value: Integer);
begin
  FBoxMaxHeight := Value;
  JSCodeBlock('boxMaxHeight:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFBoxMaxWidth(Value: Integer);
begin
  FBoxMaxWidth := Value;
  JSCodeBlock('boxMaxWidth:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFBoxMinHeight(Value: Integer);
begin
  FBoxMinHeight := Value;
  JSCodeBlock('boxMinHeight:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFBoxMinWidth(Value: Integer);
begin
  FBoxMinWidth := Value;
  JSCodeBlock('boxMinWidth:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFlex(const AValue: Integer);
begin
  FFlex := AValue;
  SetConfigItem('flex', AValue);
end;

procedure TExtBoxComponent.SetHeight(const AValue: Integer);
begin
  FHeight := AValue;
  SetConfigItem('height', 'setHeight', AValue);
end;

procedure TExtBoxComponent.SetHeightString(const AValue: string);
begin
  FHeightString := AValue;
  SetConfigItem('height', 'setHeight', AValue);
end;

procedure TExtBoxComponent.SetMargins(AValue: string);
begin
  FMargins := AValue;
  SetConfigItem('margins', AValue);
end;

procedure TExtBoxComponent.SetFPageX(Value: Integer);
begin
  FPageX := Value;
  JSCodeBlock('pageX:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFPageY(Value: Integer);
begin
  FPageY := Value;
  JSCodeBlock('pageY:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetRegion(const AValue: TExtBoxComponentRegion);
begin
  FRegion := AValue;
  SetConfigItem('region', TJS.EnumToJSString(TypeInfo(TExtBoxComponentRegion), Ord(AValue)));
end;

procedure TExtBoxComponent.SetFTabTip(Value: string);
begin
  FTabTip := Value;
  JSCodeBlock('tabTip:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetWidth(const AValue: Integer);
begin
  FWidth := AValue;
  SetConfigItem('width', 'setWidth', AValue);
end;

procedure TExtBoxComponent.SetWidthString(const AValue: string);
begin
  FWidthString := AValue;
  SetConfigItem('width', 'setWidth', AValue);
end;

procedure TExtBoxComponent.SetFX(Value: Integer);
begin
  FX := Value;
  JSCodeBlock('x:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFY(Value: Integer);
begin
  FY := Value;
  JSCodeBlock('y:' + VarToJSON([Value]));
end;

procedure TExtBoxComponent.SetFOnMove(Value: TExtBoxComponentOnMove);
begin
  if Assigned(FOnMove) then
    JSCodeBlock(JSName + '.events ["move"].listeners=[];');
  if Assigned(Value) then
    on('move', Ajax('move', ['This', '%0.nm', 'X', '%1', 'Y', '%2'], true));
  FOnMove := Value;
end;

procedure TExtBoxComponent.SetFOnResize(Value: TExtBoxComponentOnResize);
begin
  if Assigned(FOnResize) then
    JSCodeBlock(JSName + '.events ["resize"].listeners=[];');
  if Assigned(Value) then
    on('resize', Ajax('resize', ['This', '%0.nm', 'AdjWidth', '%1', 'AdjHeight', '%2',
      'RawWidth', '%3', 'RawHeight', '%4'], true));
  FOnResize := Value;
end;

class function TExtBoxComponent.JSClassName: string;
begin
  Result := 'Ext.Component';
end;

procedure TExtBoxComponent.InitDefaults;
begin
  inherited;
end;

function TExtBoxComponent.GetBox(Local: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getBox(' + VarToJSON([local]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetHeight: TExtFunction;
begin
  JSCode(JSName + '.getHeight();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetOuterSize: TExtFunction;
begin
  JSCode(JSName + '.getOuterSize();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetPosition(Local: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.getPosition(' + VarToJSON([local]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetResizeEl: TExtFunction;
begin
  JSCode(JSName + '.getResizeEl();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetSize: TExtFunction;
begin
  JSCode(JSName + '.getSize();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.GetWidth: TExtFunction;
begin
  JSCode(JSName + '.getWidth();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.SetAutoScroll(Scroll: Boolean): TExtFunction;
begin
  JSCode(JSName + '.setAutoScroll(' + VarToJSON([Scroll]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.SetPagePosition(X: Integer; Y: Integer): TExtFunction;
begin
  JSCode(JSName + '.setPagePosition(' + VarToJSON([X, Y]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.SetPosition(LEFT: Integer; Top: Integer): TExtFunction;
begin
  JSCode(JSName + '.setPosition(' + VarToJSON([LEFT, Top]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.SetSize(Width: string; Height: string): TExtFunction;
begin
  JSCode(JSName + '.setSize(' + VarToJSON([Width, Height]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.SyncSize: TExtFunction;
begin
  JSCode(JSName + '.syncSize();', 'TExtBoxComponent');
  Result := Self;
end;

function TExtBoxComponent.UpdateBox(Box: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.updateBox(' + VarToJSON([Box, false]) + ');', 'TExtBoxComponent');
  Result := Self;
end;

procedure TExtBoxComponent.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'move') and Assigned(FOnMove) then
    FOnMove(TExtBoxComponent(ParamAsObject('This')), ParamAsInteger('X'),
      ParamAsInteger('Y'))
  else if (AEvtName = 'resize') and Assigned(FOnResize) then
    FOnResize(TExtBoxComponent(ParamAsObject('This')), ParamAsInteger('AdjWidth'),
      ParamAsInteger('AdjHeight'), ParamAsInteger('RawWidth'),
      ParamAsInteger('RawHeight'));
end;

procedure TExtToolbarItem.SetFOverflowText(Value: string);
begin
  FOverflowText := Value;
  JSCodeBlock('overflowText:' + VarToJSON([Value]));
end;

class function TExtToolbarItem.JSClassName: string;
begin
  Result := 'Ext.Toolbar.Item';
end;

procedure TExtToolbarItem.InitDefaults;
begin
  inherited;
end;

procedure TExtFlashComponent.SetFBackgroundColor(Value: string);
begin
  FBackgroundColor := Value;
  JSCodeBlock('backgroundColor:' + VarToJSON([Value]));
end;

procedure TExtFlashComponent.SetFExpressInstall(Value: Boolean);
begin
  FExpressInstall := Value;
  JSCodeBlock('expressInstall:' + VarToJSON([Value]));
end;

procedure TExtFlashComponent.SetFFlashParams(Value: TExtObject);
begin
  FFlashParams := Value;
  JSCodeBlock('flashParams:' + VarToJSON([Value, false]));
end;

procedure TExtFlashComponent.SetFFlashVars(Value: TExtObject);
begin
  FFlashVars := Value;
  JSCodeBlock('flashVars:' + VarToJSON([Value, false]));
end;

procedure TExtFlashComponent.SetFFlashVersion(Value: string);
begin
  FFlashVersion := Value;
  JSCodeBlock('flashVersion:' + VarToJSON([Value]));
end;

procedure TExtFlashComponent.SetFUrl(Value: string);
begin
  FUrl := Value;
  JSCodeBlock('url:' + VarToJSON([Value]));
end;

procedure TExtFlashComponent.SetFWmode(Value: string);
begin
  FWmode := Value;
  JSCodeBlock('wmode:' + VarToJSON([Value]));
end;

procedure TExtFlashComponent.SetFOnInitialize(Value: TExtFlashComponentOnInitialize);
begin
  if Assigned(FOnInitialize) then
    JSCodeBlock(JSName + '.events ["initialize"].listeners=[];');
  if Assigned(Value) then
    on('initialize', Ajax('initialize', ['This', '%0.nm'], true));
  FOnInitialize := Value;
end;

class function TExtFlashComponent.JSClassName: string;
begin
  Result := 'Ext.FlashComponent';
end;

class function TExtFlashComponent.EXPRESS_INSTALL_URL: string;
begin
  Result := ''
end;

procedure TExtFlashComponent.InitDefaults;
begin
  inherited;
  FFlashParams := TExtObject.CreateInternal(Self, 'flashParams');
  FFlashVars := TExtObject.CreateInternal(Self, 'flashVars');
end;

procedure TExtFlashComponent.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'initialize') and Assigned(FOnInitialize) then
    FOnInitialize(TExtFlashComponent(ParamAsObject('This')));
end;

procedure TExtProgressBar.SetFAnimate(Value: Boolean);
begin
  FAnimate := Value;
  JSCodeBlock('animate:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCodeBlock('baseCls:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFId(Value: string);
begin
  FId := Value;
  JSCodeBlock('id:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFText(Value: string);
begin
  FText := Value;
  JSCodeBlock('text:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFTextEl(Value: string);
begin
  FTextEl := Value;
  JSCodeBlock('textEl:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFValue(Value: Double);
begin
  FValue := Value;
  JSCodeBlock('value:' + VarToJSON([Value]));
end;

procedure TExtProgressBar.SetFOnUpdate(Value: TExtProgressBarOnUpdate);
begin
  if Assigned(FOnUpdate) then
    JSCodeBlock(JSName + '.events ["update"].listeners=[];');
  if Assigned(Value) then
    on('update', Ajax('update', ['This', '%0.nm', 'The', '%1', 'The_', '%2'], true));
  FOnUpdate := Value;
end;

class function TExtProgressBar.JSClassName: string;
begin
  Result := 'Ext.ProgressBar';
end;

procedure TExtProgressBar.InitDefaults;
begin
  inherited;
  FBaseCls := 'x-progress';
end;

function TExtProgressBar.IsWaiting: TExtFunction;
begin
  JSCode(JSName + '.isWaiting();', 'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.Reset(Hide: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.reset(' + VarToJSON([Hide]) + ');', 'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.SetSize(Width: Integer; Height: Integer): TExtFunction;
begin
  JSCode(JSName + '.setSize(' + VarToJSON([Width, Height]) + ');', 'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.SyncProgressBar: TExtFunction;
begin
  JSCode(JSName + '.syncProgressBar();', 'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.UpdateProgress(Value: Double = 0; Text: string = '';
  Animate: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.updateProgress(' + VarToJSON([Value, Text, Animate]) + ');',
    'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.UpdateText(Text: string = ''): TExtFunction;
begin
  JSCode(JSName + '.updateText(' + VarToJSON([Text]) + ');', 'TExtProgressBar');
  Result := Self;
end;

function TExtProgressBar.Wait(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.wait(' + VarToJSON([Config, false]) + ');', 'TExtProgressBar');
  Result := Self;
end;

procedure TExtProgressBar.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'update') and Assigned(FOnUpdate) then
    FOnUpdate(TExtProgressBar(ParamAsObject('This')), ParamAsInteger('The'),
      ParamAsString('The_'));
end;

class function TExtSpacer.JSClassName: string;
begin
  Result := 'Ext.Spacer';
end;

procedure TExtSpacer.InitDefaults;
begin
  inherited;
end;

procedure TExtContainer.SetActiveItem(const AValue: string);
begin
  FActiveItem := SetConfigItem('activeItem', AValue);
end;

procedure TExtContainer.SetActiveItemNumber(const AValue: Integer);
begin
  FActiveItemNumber := SetConfigItem('activeItemNumber', AValue);
end;

procedure TExtContainer.SetFAutoDestroy(Value: Boolean);
begin
  FAutoDestroy := Value;
  JSCodeBlock('autoDestroy:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFBufferResize(Value: Boolean);
begin
  FBufferResize := Value;
  JSCodeBlock('bufferResize:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFBufferResizeNumber(Value: Integer);
begin
  FBufferResizeNumber := Value;
  JSCodeBlock('bufferResize:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFDefaultType(Value: TExtComponentXtype);
begin
  FDefaultType := Value;
  JSCodeBlock('defaultType:"' + TJS.EnumToJSString(TypeInfo(TExtComponentXtype),
    ord(Value)) + '"');
end;

procedure TExtContainer.SetFDefaultsFunction(Value: TExtFunction);
begin
  FDefaultsFunction := Value;
  JSCodeBlock('defaults:' + VarToJSON([Value, true]));
end;

procedure TExtContainer.SetFForceLayout(Value: Boolean);
begin
  FForceLayout := Value;
  JSCodeBlock('forceLayout:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFHideBorders(Value: Boolean);
begin
  FHideBorders := Value;
  JSCodeBlock('hideBorders:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetLabelAlign(const AValue: TExtContainerLabelAlign);
begin
  FLabelAlign := AValue;
  Defaults.SetConfigItem('labelAlign', LabelAlignAsOption(AValue));
end;

procedure TExtContainer.SetLabelWidth(const AValue: Integer);
begin
  FLabelWidth := AValue;
  Defaults.SetConfigItem('labelWidth', AValue);
end;

procedure TExtContainer.SetLayout(const AValue: TExtContainerLayout);
begin
  FLayout := AValue;
  SetConfigItem('layout', TJS.EnumToJSString(TypeInfo(TExtContainerLayout), Ord(AValue)));
end;

procedure TExtContainer.SetFLayoutObject(Value: TExtObject);
begin
  FLayoutObject := Value;
  JSCodeBlock('layout:' + VarToJSON([Value, false]));
end;

procedure TExtContainer.SetFLayoutConfig(Value: TExtObject);
begin
  FLayoutConfig.Free;
  FLayoutConfig := Value;
  JSCodeBlock('layoutConfig:' + VarToJSON([Value, false]));
end;

procedure TExtContainer.SetFMonitorResize(Value: Boolean);
begin
  FMonitorResize := Value;
  JSCodeBlock('monitorResize:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFResizeEvent(Value: string);
begin
  FResizeEvent := Value;
  JSCodeBlock('resizeEvent:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFColspan(Value: Integer);
begin
  FColspan := Value;
  JSCodeBlock('colspan:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFRowspan(Value: Integer);
begin
  FRowspan := Value;
  JSCodeBlock('rowspan:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetFLayoutString(Value: string);
begin
  FLayoutString := Value;
  JSCodeBlock('layout:' + VarToJSON([Value]));
end;

procedure TExtContainer.SetColumnWidth(const AValue: Double);
begin
  FColumnWidth := SetConfigItem('columnWidth', AValue);
end;

procedure TExtContainer.SetFOnAdd(Value: TExtContainerOnAdd);
begin
  if Assigned(FOnAdd) then
    JSCodeBlock(JSName + '.events ["add"].listeners=[];');
  if Assigned(Value) then
    on('add', Ajax('add', ['This', '%0.nm', 'Component', '%1.nm', 'Index', '%2'], true));
  FOnAdd := Value;
end;

procedure TExtContainer.SetFOnAfterlayout(Value: TExtContainerOnAfterlayout);
begin
  if Assigned(FOnAfterlayout) then
    JSCodeBlock(JSName + '.events ["afterlayout"].listeners=[];');
  if Assigned(Value) then
    on('afterlayout', Ajax('afterlayout', ['This', '%0.nm', 'Layout', '%1.nm'], true));
  FOnAfterlayout := Value;
end;

procedure TExtContainer.SetFOnBeforeadd(Value: TExtContainerOnBeforeadd);
begin
  if Assigned(FOnBeforeadd) then
    JSCodeBlock(JSName + '.events ["beforeadd"].listeners=[];');
  if Assigned(Value) then
    on('beforeadd', Ajax('beforeadd', ['This', '%0.nm', 'Component', '%1.nm', 'Index',
      '%2'], true));
  FOnBeforeadd := Value;
end;

procedure TExtContainer.SetFOnBeforeremove(Value: TExtContainerOnBeforeremove);
begin
  if Assigned(FOnBeforeremove) then
    JSCodeBlock(JSName + '.events ["beforeremove"].listeners=[];');
  if Assigned(Value) then
    on('beforeremove', Ajax('beforeremove', ['This', '%0.nm', 'Component',
      '%1.nm'], true));
  FOnBeforeremove := Value;
end;

procedure TExtContainer.SetFOnRemove(Value: TExtContainerOnRemove);
begin
  if Assigned(FOnRemove) then
    JSCodeBlock(JSName + '.events ["remove"].listeners=[];');
  if Assigned(Value) then
    on('remove', Ajax('remove', ['This', '%0.nm', 'Component', '%1.nm'], true));
  FOnRemove := Value;
end;

class function TExtContainer.JSClassName: string;
begin
  Result := 'Ext.Container';
end;

procedure TExtContainer.InitDefaults;
begin
  inherited;
  FAutoDestroy := True;
  FDefaults := TExtObject.CreateInternal(Self, 'defaults');
  FItems := TExtObjectList.CreateInternal(Self, 'items');
  FLayoutObject := TExtObject.CreateInternal(Self, 'layout');
  FLayoutConfig := TExtObject.CreateInternal(Self, 'layoutConfig');
end;

function TExtContainer.Add(Component: TObject): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON([Component, false]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.Add(Component: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON(Component) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.Bubble(Fn: TExtFunction; Scope: TExtObject = nil;
  Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.bubble(' + VarToJSON([Fn, true, Scope, false]) + ',' + VarToJSON(Args)
    + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.Cascade(Fn: TExtFunction; Scope: TExtObject = nil;
  Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.cascade(' + VarToJSON([Fn, true, Scope, false]) + ',' +
    VarToJSON(Args) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.UpdateLayout: TExtFunction;
begin
  Result := UpdateLayout(False, False);
end;

function TExtContainer.UpdateLayout(const AShallow: Boolean; const AForce: Boolean): TExtFunction;
begin
  Result := CallMethod('updateLayout', [AShallow, AForce]);
end;

function TExtContainer.Find(Prop: string; Value: string): TExtFunction;
begin
  JSCode(JSName + '.find(' + VarToJSON([Prop, Value]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.FindBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.findBy(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtContainer');
  Result := Self;
end;

function TExtContainer.FindById(Id: string): TExtFunction;
begin
  JSCode(JSName + '.findById(' + VarToJSON([Id]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.FindByType(Xtype: string; Shallow: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findByType(' + VarToJSON([Xtype, Shallow]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.FindByType(Xtype: TClass; Shallow: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findByType(' + VarToJSON([Xtype, false, Shallow]) + ');',
    'TExtContainer');
  Result := Self;
end;

function TExtContainer.Get(Key: string): TExtFunction;
begin
  JSCode(JSName + '.get(' + VarToJSON([Key]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.Get(Key: Integer): TExtFunction;
begin
  JSCode(JSName + '.get(' + VarToJSON([Key]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.GetComponent(Comp: string): TExtFunction;
begin
  JSCode(JSName + '.getComponent(' + VarToJSON([Comp]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.GetComponent(Comp: Integer): TExtFunction;
begin
  JSCode(JSName + '.getComponent(' + VarToJSON([Comp]) + ');', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.GetLayout: TExtFunction;
begin
  JSCode(JSName + '.getLayout();', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.GetLayoutTarget: TExtFunction;
begin
  JSCode(JSName + '.getLayoutTarget();', 'TExtContainer');
  Result := Self;
end;

function TExtContainer.INSERT(Index: Integer; Component: TExtComponent): TExtFunction;
begin
  JSCode(JSName + '.insert(' + VarToJSON([index, Component, false]) + ');',
    'TExtContainer');
  Result := Self;
end;

function TExtContainer.Remove(const AComponent: TExtComponent; const AAutoDestroy: Boolean): TExtFunction;
begin
  Result := CallMethod('remove', [AComponent, False, AAutoDestroy]);
end;

function TExtContainer.Remove(Component: string; AutoDestroy: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.remove(' + VarToJSON([Component, AutoDestroy]) + ');',
    'TExtContainer');
  Result := Self;
end;

function TExtContainer.RemoveAll(AutoDestroy: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.removeAll(' + VarToJSON([AutoDestroy]) + ');', 'TExtContainer');
  Result := Self;
end;

procedure TExtContainer.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'add') and Assigned(FOnAdd) then
    FOnAdd(TExtContainer(ParamAsObject('This')), TExtComponent(ParamAsObject('Component')
      ), ParamAsInteger('Index'))
  else if (AEvtName = 'afterlayout') and Assigned(FOnAfterlayout) then
    FOnAfterlayout(TExtContainer(ParamAsObject('This')),
      TExtObject(ParamAsObject('Layout')))
  else if (AEvtName = 'beforeadd') and Assigned(FOnBeforeadd) then
    FOnBeforeadd(TExtContainer(ParamAsObject('This')),
      TExtComponent(ParamAsObject('Component')), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeremove') and Assigned(FOnBeforeremove) then
    FOnBeforeremove(TExtContainer(ParamAsObject('This')),
      TExtComponent(ParamAsObject('Component')))
  else if (AEvtName = 'remove') and Assigned(FOnRemove) then
    FOnRemove(TExtContainer(ParamAsObject('This')),
      TExtComponent(ParamAsObject('Component')));
end;

procedure TExtButton.SetAllowDepress(const AValue: Boolean);
begin
  FAllowDepress := AValue;
  SetConfigItem('allowDepress', AValue);
end;

procedure TExtButton.SetFArrowAlign(Value: string);
begin
  FArrowAlign := Value;
  JSCodeBlock('arrowAlign:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFAutoWidth(Value: Boolean);
begin
  FAutoWidth := Value;
  JSCodeBlock('autoWidth:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFButtonSelector(Value: string);
begin
  FButtonSelector := Value;
  JSCodeBlock('buttonSelector:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFClickEvent(Value: string);
begin
  FClickEvent := Value;
  JSCodeBlock('clickEvent:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFCls(Value: string);
begin
  FCls := Value;
  JSCodeBlock('cls:' + VarToJSON([Value]));
end;

procedure TExtButton.SetDisabled(const AValue: Boolean);
begin
  FDisabled := AValue;
  SetConfigItem('disabled', AValue);
end;

procedure TExtButton.SetEnableToggle(const AValue: Boolean);
begin
  FEnableToggle := AValue;
  SetConfigItem('enableToggle', AValue);
end;

procedure TExtButton.SetFormBind(const AValue: Boolean);
begin
  FFormBind := AValue;
  SetConfigItem('formBind', AValue);
end;

procedure TExtButton.SetFHandleMouseEvents(Value: Boolean);
begin
  FHandleMouseEvents := Value;
  JSCodeBlock('handleMouseEvents:' + VarToJSON([Value]));
end;

procedure TExtButton._SetHandler(const AValue: TExtFunction);
begin
  FHandler := AValue;
  SetFunctionConfigItem('handler', 'setHandler', AValue);
end;

procedure TExtButton.SetHidden(const AValue: Boolean);
begin
  FHidden := AValue;
  SetConfigItemOrProperty('hidden', AValue);
end;

procedure TExtButton._SetIcon(const AValue: string);
begin
  FIcon := AValue;
  SetConfigItem('icon', 'setIcon', AValue);
end;

procedure TExtButton.SetFIconAlign(Value: string);
begin
  FIconAlign := Value;
  JSCodeBlock('iconAlign:' + VarToJSON([Value]));
end;

procedure TExtButton.SetIconCls(const AValue: string);
begin
  FIconCls := AValue;
  SetConfigItem('iconCls', AValue);
end;

procedure TExtButton.SetMenu(AValue: TExtUtilObservable);
begin
  FMenu.Free;
  FMenu := AValue;
  SetConfigItem('menu', AValue);
end;

procedure TExtButton.SetFMenuAlign(Value: string);
begin
  FMenuAlign := Value;
  JSCodeBlock('menuAlign:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFMinWidth(const AValue: Integer);
begin
  FMinWidth := SetConfigItem('minWidth', AValue);
end;

procedure TExtButton.SetFOverflowText(Value: string);
begin
  FOverflowText := Value;
  JSCodeBlock('overflowText:' + VarToJSON([Value]));
end;

procedure TExtButton.SetPressed(const AValue: Boolean);
begin
  FPressed := SetConfigItemOrProperty('pressed', AValue);
end;

procedure TExtButton.SetFRepeatJS(Value: Boolean);
begin
  FRepeatJS := Value;
  JSCodeBlock('repeatJS:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFRepeatJSObject(Value: TExtObject);
begin
  FRepeatJSObject := Value;
  JSCodeBlock('repeatJS:' + VarToJSON([Value, false]));
end;

procedure TExtButton.SetScale(const AValue: string);
begin
  FScale := AValue;
  SetConfigItem('scale', AValue);
end;

procedure TExtButton.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCodeBlock('scope:' + VarToJSON([Value, false]));
end;

procedure TExtButton.SetFTabIndex(Value: Integer);
begin
  FTabIndex := Value;
  JSCodeBlock('tabIndex:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFTemplate(Value: TExtTemplate);
begin
  FTemplate := Value;
  JSCodeBlock('template:' + VarToJSON([Value, false]));
end;

procedure TExtButton._SetText(const AValue: string);
begin
  FText := AValue;
  SetConfigItem('text', 'setText', AValue);
end;

procedure TExtButton.SetToggleGroup(const AValue: string);
begin
  FToggleGroup := AValue;
  SetConfigItem('toggleGroup', AValue);
end;

procedure TExtButton.SetFToggleHandler(Value: TExtFunction);
begin
  FToggleHandler := Value;
  JSCodeBlock('toggleHandler:' + VarToJSON([Value, true]));
end;

procedure TExtButton._SetTooltip(const AValue: string);
begin
  FTooltip := AValue;
  SetConfigItem('tooltip', 'setTooltip', AValue);
end;

procedure TExtButton.SetFTooltipObject(Value: TExtObject);
begin
  FTooltipObject := Value;
  JSCodeBlock('tooltip:' + VarToJSON([Value, false]));
end;

procedure TExtButton.SetFTooltipType(Value: string);
begin
  FTooltipType := Value;
  JSCodeBlock('tooltipType:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFTypeJS(Value: string);
begin
  FTypeJS := Value;
  JSCodeBlock('typeJS:' + VarToJSON([Value]));
end;

procedure TExtButton.SetFBtnEl(Value: TExtElement);
begin
  FBtnEl := Value;
  JSCodeBlock(JSName + '.btnEl=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtButton.SetFDisabled_(Value: Boolean);
begin
  FDisabled_ := Value;
  JSCodeBlock(JSName + '.disabled=' + VarToJSON([Value]) + ';');
end;

procedure TExtButton.SetFHidden_(Value: Boolean);
begin
  FHidden_ := Value;
  JSCodeBlock(JSName + '.hidden=' + VarToJSON([Value]) + ';');
end;

procedure TExtButton.SetFMenu_(Value: TExtMenuMenu);
begin
  FMenu_ := Value;
  JSCodeBlock(JSName + '.menu=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtButton.SetFOnClick(Value: TExtButtonOnClick);
begin
  if Assigned(FOnClick) then
    JSCodeBlock(JSName + '.events ["click"].listeners=[];');
  if Assigned(Value) then
    on('click', Ajax('click', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnClick := Value;
end;

procedure TExtButton.SetFOnMenuhide(Value: TExtButtonOnMenuhide);
begin
  if Assigned(FOnMenuhide) then
    JSCodeBlock(JSName + '.events ["menuhide"].listeners=[];');
  if Assigned(Value) then
    on('menuhide', Ajax('menuhide', ['This', '%0.nm', 'Menu', '%1.nm'], true));
  FOnMenuhide := Value;
end;

procedure TExtButton.SetFOnMenushow(Value: TExtButtonOnMenushow);
begin
  if Assigned(FOnMenushow) then
    JSCodeBlock(JSName + '.events ["menushow"].listeners=[];');
  if Assigned(Value) then
    on('menushow', Ajax('menushow', ['This', '%0.nm', 'Menu', '%1.nm'], true));
  FOnMenushow := Value;
end;

procedure TExtButton.SetFOnMenutriggerout(Value: TExtButtonOnMenutriggerout);
begin
  if Assigned(FOnMenutriggerout) then
    JSCodeBlock(JSName + '.events ["menutriggerout"].listeners=[];');
  if Assigned(Value) then
    on('menutriggerout', Ajax('menutriggerout', ['This', '%0.nm', 'Menu', '%1.nm', 'E',
      '%2.nm'], true));
  FOnMenutriggerout := Value;
end;

procedure TExtButton.SetFOnMenutriggerover(Value: TExtButtonOnMenutriggerover);
begin
  if Assigned(FOnMenutriggerover) then
    JSCodeBlock(JSName + '.events ["menutriggerover"].listeners=[];');
  if Assigned(Value) then
    on('menutriggerover', Ajax('menutriggerover', ['This', '%0.nm', 'Menu', '%1.nm', 'E',
      '%2.nm'], true));
  FOnMenutriggerover := Value;
end;

procedure TExtButton.SetFOnToggle(Value: TExtButtonOnToggle);
begin
  if Assigned(FOnToggle) then
    JSCodeBlock(JSName + '.events ["toggle"].listeners=[];');
  if Assigned(Value) then
    on('toggle', Ajax('toggle', ['This', '%0.nm', 'Pressed', '%1'], true));
  FOnToggle := Value;
end;

class function TExtButton.JSClassName: string;
begin
  Result := 'Ext.Button';
end;

procedure TExtButton.InitDefaults;
begin
  inherited;
  FHandleMouseEvents := true;
  FMenu := TExtUtilObservable.CreateInternal(Self, 'menu');
  FRepeatJSObject := TExtObject.CreateInternal(Self, 'repeatJS');
  FScope := TExtObject.CreateInternal(Self, 'scope');
  FTemplate := TExtTemplate.CreateInternal(Self, 'template');
  FTooltipObject := TExtObject.CreateInternal(Self, 'tooltip');
  FBtnEl := TExtElement.CreateInternal(Self, 'btnEl');
//  FMenu_ := TExtMenuMenu.CreateInternal(Self, 'menu');
end;

function TExtButton.GetObjectNamePrefix: string;
begin
  Result := 'btn';
end;

function TExtButton.GetPressed(const AGroup: string): TExtFunction;
begin
  Result := CallMethod('getPressed', AGroup);
end;

procedure TExtButton.PerformClick;
begin
  FireEvent('click', nil);
end;

function TExtButton.Pressed_: TExtFunction;
begin
  GetSession.ResponseItems.GetProperty(Self, 'pressed');
  Result := Self;
end;

function TExtButton.GetTemplateArgs: TExtFunction;
begin
  Result := CallMethod('getTemplateArgs', []);
end;

function TExtButton.GetText: TExtFunction;
begin
  Result := CallMethod('getText', []);
end;

function TExtButton.HasVisibleMenu: TExtFunction;
begin
  Result := CallMethod('hasVisibleMenu', []);
end;

function TExtButton.HideMenu: TExtFunction;
begin
  Result := CallMethod('hideMenu', []);
end;

function TExtButton.SetHandler(const AHandler: TExtFunction; const AScope: TExtObject): TExtFunction;
begin
  FHandler := AHandler;
  Result := CallMethod('setHandler', [AHandler, True, AScope, False]);
end;

function TExtButton.SetIcon(Icon: string): TExtFunction;
begin
  JSCode(JSName + '.setIcon(' + VarToJSON([Icon]) + ');', 'TExtButton');
  Result := Self;
end;

function TExtButton.SetIconClass(Cls: string): TExtFunction;
begin
  JSCode(JSName + '.setIconClass(' + VarToJSON([Cls]) + ');', 'TExtButton');
  Result := Self;
end;

function TExtButton.SetText(const AText: string): TExtFunction;
begin
  FText := AText;
  Result := CallMethod('setText', AText);
end;

function TExtButton.SetTooltip(const ATooltip: string): TExtFunction;
begin
  FTooltip := ATooltip;
  Result := CallMethod('setTooltip', ATooltip);
end;

function TExtButton.SetTooltip(const ATooltip: TExtObject): TExtFunction;
begin
  Result := CallMethod('setTooltip', [ATooltip, False]);
end;

function TExtButton.ShowMenu: TExtFunction;
begin
  JSCode(JSName + '.showMenu();', 'TExtButton');
  Result := Self;
end;

function TExtButton.Toggle(State: Boolean = false; SupressEvent: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.toggle(' + VarToJSON([State, SupressEvent]) + ');', 'TExtButton');
  Result := Self;
end;

procedure TExtButton.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'click') and Assigned(FOnClick) then
    FOnClick(TExtButton(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'menuhide') and Assigned(FOnMenuhide) then
    FOnMenuhide(TExtButton(ParamAsObject('This')), TExtObject(ParamAsObject('Menu')))
  else if (AEvtName = 'menushow') and Assigned(FOnMenushow) then
    FOnMenushow(TExtButton(ParamAsObject('This')), TExtObject(ParamAsObject('Menu')))
  else if (AEvtName = 'menutriggerout') and Assigned(FOnMenutriggerout) then
    FOnMenutriggerout(TExtButton(ParamAsObject('This')), TExtObject(ParamAsObject('Menu')
      ), ExtEventObject)
  else if (AEvtName = 'menutriggerover') and Assigned(FOnMenutriggerover) then
    FOnMenutriggerover(TExtButton(ParamAsObject('This')), TExtObject(ParamAsObject('Menu')
      ), ExtEventObject)
  else if (AEvtName = 'toggle') and Assigned(FOnToggle) then
    FOnToggle(TExtButton(ParamAsObject('This')), ParamAsBoolean('Pressed'));
end;

procedure TExtDataView.SetFBlockRefresh(Value: Boolean);
begin
  FBlockRefresh := Value;
  JSCodeBlock('blockRefresh:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetFDeferEmptyText(Value: Boolean);
begin
  FDeferEmptyText := Value;
  JSCodeBlock('deferEmptyText:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetEmptyText(AValue: string);
begin
  FEmptyText := AValue;
  SetConfigItem('emptyText', AValue);
end;

procedure TExtDataView.SetItemSelector(const AValue: string);
begin
  FItemSelector := SetConfigItem('itemSelector', AValue);
end;

procedure TExtDataView.SetFLoadingText(Value: string);
begin
  FLoadingText := Value;
  JSCodeBlock('loadingText:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetMultiSelect(const AValue: Boolean);
begin
  FMultiSelect := SetConfigItem('multiSelect', AValue);
end;

procedure TExtDataView.SetOverClass(const AValue: string);
begin
  FOverClass := AValue;
  SetConfigItem('overClass', AValue);
end;

procedure TExtDataView.SetFSelectedClass(Value: string);
begin
  FSelectedClass := Value;
  JSCodeBlock('selectedClass:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetFSimpleSelect(Value: Boolean);
begin
  FSimpleSelect := Value;
  JSCodeBlock('simpleSelect:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetSingleSelect(const AValue: Boolean);
begin
  FSingleSelect := SetConfigItem('singleSelect', AValue);
end;

procedure TExtDataView._SetStore(const AValue: TExtDataStore);
begin
  FStore.Free;
  FStore := AValue;
  SetConfigItem('store', 'setStore', AValue);
end;

procedure TExtDataView.SetTpl(AValue: string);
begin
  FTpl := SetConfigItem('tpl', AValue);
end;

procedure TExtDataView.SetFTplArray(Value: TExtObjectList);
begin
  FTplArray := Value;
  JSCodeBlock('tpl:' + VarToJSON([Value, false]));
end;

procedure TExtDataView.SetFTrackOver(Value: Boolean);
begin
  FTrackOver := Value;
  JSCodeBlock('trackOver:' + VarToJSON([Value]));
end;

procedure TExtDataView.SetFOnContainerclick(Value: TExtDataViewOnContainerclick);
begin
  if Assigned(FOnContainerclick) then
    JSCodeBlock(JSName + '.events ["containerclick"].listeners=[];');
  if Assigned(Value) then
    on('containerclick', Ajax('containerclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContainerclick := Value;
end;

procedure TExtDataView.SetFOnContainercontextmenu
  (Value: TExtDataViewOnContainercontextmenu);
begin
  if Assigned(FOnContainercontextmenu) then
    JSCodeBlock(JSName + '.events ["containercontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('containercontextmenu', Ajax('containercontextmenu', ['This', '%0.nm', 'E',
      '%1.nm'], true));
  FOnContainercontextmenu := Value;
end;

procedure TExtDataView.SetFOnSelectionchange(Value: TExtDataViewOnSelectionchange);
begin
  if Assigned(FOnSelectionchange) then
    JSCodeBlock(JSName + '.events ["selectionchange"].listeners=[];');
  if Assigned(Value) then
    on('selectionchange', Ajax('selectionchange', ['This', '%0.nm', 'Selections',
      '%1.nm'], true));
  FOnSelectionchange := Value;
end;

class function TExtDataView.JSClassName: string;
begin
  Result := 'Ext.DataView';
end;

procedure TExtDataView.InitDefaults;
begin
  inherited;
  FSelectedClass := 'x-view-selected';
  FStore := TExtDataStore.CreateInternal(Self, 'store');
  FTplArray := TExtObjectList.CreateInternal(Self, 'tpl');
end;

function TExtDataView.BindStore(Store: TExtDataStore): TExtFunction;
begin
  JSCode(JSName + '.bindStore(' + VarToJSON([Store, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.ClearSelections(SuppressEvent: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.clearSelections(' + VarToJSON([SuppressEvent]) + ');',
    'TExtDataView');
  Result := Self;
end;

function TExtDataView.CollectData(Records: TExtObjectList; StartIndex: Integer)
  : TExtFunction;
begin
  JSCode(JSName + '.collectData(' + VarToJSON(Records) + ',' + VarToJSON([StartIndex]) +
    ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.Deselect(Node: Integer): TExtFunction;
begin
  JSCode(JSName + '.deselect(' + VarToJSON([Node]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.Deselect(Node: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.deselect(' + VarToJSON([Node, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetNode(NodeInfo: string): TExtFunction;
begin
  JSCode(JSName + '.getNode(' + VarToJSON([NodeInfo]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetNode(NodeInfo: Integer): TExtFunction;
begin
  JSCode(JSName + '.getNode(' + VarToJSON([NodeInfo]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetNode(NodeInfo: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.getNode(' + VarToJSON([NodeInfo, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetNodes(Start: Integer = 0; ENDJS: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.getNodes(' + VarToJSON([Start, ENDJS]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetRecords(Nodes: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.getRecords(' + VarToJSON(Nodes) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetSelectedIndexes: TExtFunction;
begin
  JSCode(JSName + '.getSelectedIndexes();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetSelectedNodes: TExtFunction;
begin
  JSCode(JSName + '.getSelectedNodes();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetSelectedRecords: TExtFunction;
begin
  JSCode(JSName + '.getSelectedRecords();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetSelectionCount: TExtFunction;
begin
  JSCode(JSName + '.getSelectionCount();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.GetStore: TExtFunction;
begin
  JSCode(JSName + '.getStore();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.IndexOf(NodeInfo: string): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([NodeInfo]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.IndexOf(NodeInfo: Integer): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([NodeInfo]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.IndexOf(NodeInfo: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([NodeInfo, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.IsSelected(Node: Integer): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([Node]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.IsSelected(Node: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([Node, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.PrepareData(Data: TExtObjectList; RecordIndex: Integer;
  RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.prepareData(' + VarToJSON(Data) + ',' + VarToJSON([RecordIndex,
    RecordJS, false]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.PrepareData(Data: TExtObject; RecordIndex: Integer;
  RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.prepareData(' + VarToJSON([Data, false, RecordIndex, RecordJS, false])
    + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.Refresh: TExtFunction;
begin
  JSCode(JSName + '.refresh();', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.RefreshNode(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.refreshNode(' + VarToJSON([index]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.Select(NodeInfo: TExtObjectList; KeepExisting: Boolean = false;
  SuppressEvent: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON(NodeInfo) + ',' + VarToJSON([KeepExisting,
    SuppressEvent]) + ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.Select(NodeInfo: string; KeepExisting: Boolean = false;
  SuppressEvent: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([NodeInfo, KeepExisting, SuppressEvent]) + ');',
    'TExtDataView');
  Result := Self;
end;

function TExtDataView.Select(NodeInfo: Integer; KeepExisting: Boolean = false;
  SuppressEvent: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([NodeInfo, KeepExisting, SuppressEvent]) + ');',
    'TExtDataView');
  Result := Self;
end;

function TExtDataView.Select(NodeInfo: TExtDataRecord; KeepExisting: Boolean = false;
  SuppressEvent: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([NodeInfo, false, KeepExisting, SuppressEvent]) +
    ');', 'TExtDataView');
  Result := Self;
end;

function TExtDataView.SelectRange(Start: Integer; ENDJS: Integer;
  KeepExisting: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.selectRange(' + VarToJSON([Start, ENDJS, KeepExisting]) + ');',
    'TExtDataView');
  Result := Self;
end;

function TExtDataView.SetStore(const AStore: TExtDataStore): TExtFunction;
begin
  FStore := AStore;
  Result := CallMethod('setStore', AStore);
end;

procedure TExtDataView.SetStoreArray(const AValue: TExtObjectList);
begin
  FStoreArray.Free;
  FStoreArray := AValue;
  SetConfigItem('store', AValue);
end;

procedure TExtDataView.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'containerclick') and Assigned(FOnContainerclick) then
    FOnContainerclick(TExtDataView(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containercontextmenu') and Assigned(FOnContainercontextmenu) then
    FOnContainercontextmenu(TExtDataView(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'selectionchange') and Assigned(FOnSelectionchange) then
    FOnSelectionchange(TExtDataView(ParamAsObject('This')),
      TExtObjectList(ParamAsObject('Selections')));
end;

class function TExtViewport.JSClassName: string;
begin
  Result := 'Ext.Viewport';
end;

function TExtViewport.GetObjectNamePrefix: string;
begin
  Result := 'vp';
end;

procedure TExtViewport.InitDefaults;
begin
  inherited;
end;

procedure TExtPanel.SetFAnimCollapse(Value: Boolean);
begin
  FAnimCollapse := Value;
  JSCodeBlock('animCollapse:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFApplyTo(Value: string);
begin
  FApplyTo := Value;
  JSCodeBlock('applyTo:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetAutoHeight(const AValue: Boolean);
begin
  FAutoHeight := AValue;
  SetConfigItem('autoHeight', AValue);
end;

procedure TExtPanel.SetFAutoLoad(Value: TExtObject);
begin
  FAutoLoad := Value;
  JSCodeBlock('autoLoad:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetAutoLoadString(AValue: string);
begin
  FAutoLoadString := AValue;
  SetConfigItem('autoLoad', AValue);
end;

procedure TExtPanel.SetAutoLoadBoolean(const AValue: Boolean);
begin
  FAutoLoadBoolean := AValue;
  SetConfigItem('autoLoad', AValue);
end;

procedure TExtPanel.SetFAutoLoadFunction(Value: TExtFunction);
begin
  FAutoLoadFunction := Value;
  JSCodeBlock('autoLoad:' + VarToJSON([Value, true]));
end;

procedure TExtPanel.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCodeBlock('baseCls:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetBbar(const AValue: TExtObject);
begin
  FBbar.Free;
  FBbar := AValue;
  SetConfigItem('bbar', AValue);
end;

procedure TExtPanel.SetFBbarArray(Value: TExtObjectList);
begin
  FBbarArray := Value;
  JSCodeBlock('bbar:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBbarCfg(Value: TExtObject);
begin
  FBbarCfg := Value;
  JSCodeBlock('bbarCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBodyBorder(Value: Boolean);
begin
  FBodyBorder := Value;
  JSCodeBlock('bodyBorder:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFBodyCfg(Value: TExtObject);
begin
  FBodyCfg := Value;
  JSCodeBlock('bodyCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBodyCssClass(Value: string);
begin
  FBodyCssClass := Value;
  JSCodeBlock('bodyCssClass:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFBodyCssClassObject(Value: TExtObject);
begin
  FBodyCssClassObject := Value;
  JSCodeBlock('bodyCssClass:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBodyCssClassFunction(Value: TExtFunction);
begin
  FBodyCssClassFunction := Value;
  JSCodeBlock('bodyCssClass:' + VarToJSON([Value, true]));
end;

procedure TExtPanel.SetBodyStyle(const AValue: string);
begin
  FBodyStyle := AValue;
  SetConfigItem('bodyStyle', AValue);
end;

procedure TExtPanel.SetFBodyStyleObject(Value: TExtObject);
begin
  FBodyStyleObject := Value;
  JSCodeBlock('bodyStyle:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBodyStyleFunction(Value: TExtFunction);
begin
  FBodyStyleFunction := Value;
  JSCodeBlock('bodyStyle:' + VarToJSON([Value, true]));
end;

procedure TExtPanel.SetBorder(const AValue: Boolean);
begin
  FBorder := AValue;
  SetConfigItem('border', AValue);
end;

procedure TExtPanel.SetFButtonAlign(Value: TExtPanelButtonAlign);
begin
  FButtonAlign := Value;
  JSCodeBlock('buttonAlign:"' + TJS.EnumToJSString(TypeInfo(TExtPanelButtonAlign),
    ord(Value)) + '"');
end;

procedure TExtPanel.SetFButtons(Value: TExtObjectList);
begin
  FButtons := Value;
  JSCodeBlock('buttons:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFBwrapCfg(Value: TExtObject);
begin
  FBwrapCfg := Value;
  JSCodeBlock('bwrapCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetClosable(const AValue: Boolean);
begin
  FClosable := AValue;
  SetConfigItem('closable', AValue);
end;

procedure TExtPanel.SetFCollapseFirst(Value: Boolean);
begin
  FCollapseFirst := Value;
  JSCodeBlock('collapseFirst:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFCollapsedCls(Value: string);
begin
  FCollapsedCls := Value;
  JSCodeBlock('collapsedCls:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetCollapsible(const AValue: Boolean);
begin
  FCollapsible := AValue;
  SetConfigItem('collapsible', AValue);
end;

procedure TExtPanel.SetFDisabled(Value: Boolean);
begin
  FDisabled := Value;
  JSCodeBlock('disabled:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFDraggable(Value: Boolean);
begin
  FDraggable := Value;
  JSCodeBlock('draggable:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFDraggableObject(Value: TExtObject);
begin
  FDraggableObject := Value;
  JSCodeBlock('draggable:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFElements(Value: string);
begin
  FElements := Value;
  JSCodeBlock('elements:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFFloating(Value: string);
begin
  FFloating := Value;
  JSCodeBlock('floating:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFooter(const AValue: Boolean);
begin
  FFooter := AValue;
  SetConfigItem('footer', AValue);
end;

procedure TExtPanel.SetFFooterCfg(Value: TExtObject);
begin
  FFooterCfg := Value;
  JSCodeBlock('footerCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFrame(const AValue: Boolean);
begin
  FFrame := AValue;
  SetConfigItem('frame', AValue);
end;

procedure TExtPanel.SetHeader(const AValue: Boolean);
begin
  FHeader := AValue;
  SetConfigItem('header', AValue);
end;

procedure TExtPanel.SetFHeaderAsText(Value: Boolean);
begin
  FHeaderAsText := Value;
  JSCodeBlock('headerAsText:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFHeaderCfg(Value: TExtObject);
begin
  FHeaderCfg := Value;
  JSCodeBlock('headerCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFHideCollapseTool(Value: Boolean);
begin
  FHideCollapseTool := Value;
  JSCodeBlock('hideCollapseTool:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetIconCls(const AValue: string);
begin
  FIconCls := AValue;
  SetConfigItem('iconCls', AValue);
end;

procedure TExtPanel.SetFMaskDisabled(Value: Boolean);
begin
  FMaskDisabled := Value;
  JSCodeBlock('maskDisabled:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFMinButtonWidth(const AValue: Integer);
begin
  FMinButtonWidth := AValue;
  SetConfigItem('minButtonWidth', AValue);
end;

procedure TExtPanel.SetFPadding(Value: Integer);
begin
  FPadding := Value;
  JSCodeBlock('padding:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetPaddingString(const AValue: string);
begin
  FPaddingString := AValue;
  SetConfigItem('padding', AValue);
end;

procedure TExtPanel.SetFPreventBodyReset(Value: Boolean);
begin
  FPreventBodyReset := Value;
  JSCodeBlock('preventBodyReset:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFResizeEvent(Value: string);
begin
  FResizeEvent := Value;
  JSCodeBlock('resizeEvent:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFShadow(Value: Boolean);
begin
  FShadow := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFShadowString(Value: string);
begin
  FShadowString := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFShadowOffset(Value: Integer);
begin
  FShadowOffset := Value;
  JSCodeBlock('shadowOffset:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFShim(Value: Boolean);
begin
  FShim := Value;
  JSCodeBlock('shim:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFTbarCfg(Value: TExtObject);
begin
  FTbarCfg := Value;
  JSCodeBlock('tbarCfg:' + VarToJSON([Value, false]));
end;

procedure TExtPanel._SetTitle(AValue: string);
begin
  FTitle := AValue;
  SetConfigItem('title', 'setTitle', AValue);
end;

procedure TExtPanel.SetFTitleCollapse(Value: Boolean);
begin
  FTitleCollapse := Value;
  JSCodeBlock('titleCollapse:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFToolTemplate(Value: TExtTemplate);
begin
  FToolTemplate := Value;
  JSCodeBlock('toolTemplate:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFToolTemplateExtXTemplate(Value: TExtXTemplate);
begin
  FToolTemplateExtXTemplate := Value;
  JSCodeBlock('toolTemplate:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFTools(Value: TExtObjectList);
begin
  FTools := Value;
  JSCodeBlock('tools:' + VarToJSON([Value, false]));
end;

procedure TExtPanel.SetFUnstyled(Value: Boolean);
begin
  FUnstyled := Value;
  JSCodeBlock('unstyled:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFBody(Value: TExtElement);
begin
  FBody := Value;
  JSCodeBlock(JSName + '.body=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtPanel.SetFBwrap(Value: TExtElement);
begin
  FBwrap := Value;
  JSCodeBlock(JSName + '.bwrap=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtPanel.SetCollapsed(const AValue: Boolean);
begin
  FCollapsed := SetConfigItemorProperty('collapsed', AValue);
end;

procedure TExtPanel.SetFFooter_(Value: TExtElement);
begin
  FFooter_ := Value;
  JSCodeBlock(JSName + '.footer=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtPanel.SetFHeader_(Value: TExtElement);
begin
  FHeader_ := Value;
  JSCodeBlock(JSName + '.header=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtPanel.SetFRowWidth(Value: Double);
begin
  FRowWidth := Value;
  JSCodeBlock('rowWidth:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFRowHeight(Value: Double);
begin
  FRowHeight := Value;
  JSCodeBlock('rowHeight:' + VarToJSON([Value]));
end;

procedure TExtPanel.SetFOnActivate(Value: TExtPanelOnActivate);
begin
  if Assigned(FOnActivate) then
    JSCodeBlock(JSName + '.events ["activate"].listeners=[];');
  if Assigned(Value) then
    on('activate', Ajax('activate', ['P', '%0.nm'], true));
  FOnActivate := Value;
end;

procedure TExtPanel.SetFOnBeforeclose(Value: TExtPanelOnBeforeclose);
begin
  if Assigned(FOnBeforeclose) then
    JSCodeBlock(JSName + '.events ["beforeclose"].listeners=[];');
  if Assigned(Value) then
    on('beforeclose', Ajax('beforeclose', ['P', '%0.nm'], true));
  FOnBeforeclose := Value;
end;

procedure TExtPanel.SetFOnBeforecollapse(Value: TExtPanelOnBeforecollapse);
begin
  if Assigned(FOnBeforecollapse) then
    JSCodeBlock(JSName + '.events ["beforecollapse"].listeners=[];');
  if Assigned(Value) then
    on('beforecollapse', Ajax('beforecollapse', ['P', '%0.nm', 'Animate', '%1'], true));
  FOnBeforecollapse := Value;
end;

procedure TExtPanel.SetFOnBeforeexpand(Value: TExtPanelOnBeforeexpand);
begin
  if Assigned(FOnBeforeexpand) then
    JSCodeBlock(JSName + '.events ["beforeexpand"].listeners=[];');
  if Assigned(Value) then
    on('beforeexpand', Ajax('beforeexpand', ['P', '%0.nm', 'Animate', '%1'], true));
  FOnBeforeexpand := Value;
end;

procedure TExtPanel.SetFOnBodyresize(Value: TExtPanelOnBodyresize);
begin
  if Assigned(FOnBodyresize) then
    JSCodeBlock(JSName + '.events ["bodyresize"].listeners=[];');
  if Assigned(Value) then
    on('bodyresize', Ajax('bodyresize', ['P', '%0.nm', 'Width', '%1', 'Height',
      '%2'], true));
  FOnBodyresize := Value;
end;

procedure TExtPanel.SetFOnClose(Value: TExtPanelOnClose);
begin
  if Assigned(FOnClose) then
    JSCodeBlock(JSName + '.events ["close"].listeners=[];');
  if Assigned(Value) then
    on('close', Ajax('close', ['P', '%0.nm'], true));
  FOnClose := Value;
end;

procedure TExtPanel.SetFOnCollapse(Value: TExtPanelOnCollapse);
begin
  if Assigned(FOnCollapse) then
    JSCodeBlock(JSName + '.events ["collapse"].listeners=[];');
  if Assigned(Value) then
    on('collapse', Ajax('collapse', ['P', '%0.nm'], true));
  FOnCollapse := Value;
end;

procedure TExtPanel.SetFOnDeactivate(Value: TExtPanelOnDeactivate);
begin
  if Assigned(FOnDeactivate) then
    JSCodeBlock(JSName + '.events ["deactivate"].listeners=[];');
  if Assigned(Value) then
    on('deactivate', Ajax('deactivate', ['P', '%0.nm'], true));
  FOnDeactivate := Value;
end;

procedure TExtPanel.SetFOnExpand(Value: TExtPanelOnExpand);
begin
  if Assigned(FOnExpand) then
    JSCodeBlock(JSName + '.events ["expand"].listeners=[];');
  if Assigned(Value) then
    on('expand', Ajax('expand', ['P', '%0.nm'], true));
  FOnExpand := Value;
end;

procedure TExtPanel.SetFOnIconchange(Value: TExtPanelOnIconchange);
begin
  if Assigned(FOnIconchange) then
    JSCodeBlock(JSName + '.events ["iconchange"].listeners=[];');
  if Assigned(Value) then
    on('iconchange', Ajax('iconchange', ['P', '%0.nm', 'The', '%1', 'The_', '%2'], true));
  FOnIconchange := Value;
end;

procedure TExtPanel.SetFOnTitlechange(Value: TExtPanelOnTitlechange);
begin
  if Assigned(FOnTitlechange) then
    JSCodeBlock(JSName + '.events ["titlechange"].listeners=[];');
  if Assigned(Value) then
    on('titlechange', Ajax('titlechange', ['P', '%0.nm', 'The', '%1'], true));
  FOnTitlechange := Value;
end;

class function TExtPanel.JSClassName: string;
begin
  Result := 'Ext.Panel';
end;

procedure TExtPanel.InitDefaults;
begin
  inherited;
  FAnimCollapse := true;
  FAutoLoad := TExtObject.CreateInternal(Self, 'autoLoad');
  FBaseCls := 'x-panel';
  FBbar := TExtObjectList.CreateInternal(Self, 'bbar');
  FBbarCfg := TExtObject.CreateInternal(Self, 'bbarCfg');
  FBodyBorder := true;
  FBodyCfg := TExtObject.CreateInternal(Self, 'bodyCfg');
  FBodyCssClassObject := TExtObject.CreateInternal(Self, 'bodyCssClass');
  FBodyStyleObject := TExtObject.CreateInternal(Self, 'bodyStyle');
  FBorder := true;
  FButtons := TExtObjectList.CreateInternal(Self, 'buttons');
  FBwrapCfg := TExtObject.CreateInternal(Self, 'bwrapCfg');
  FCollapseFirst := true;
  FCollapsedCls := 'x-panel-collapsed';
  FDraggableObject := TExtObject.CreateInternal(Self, 'draggable');
  FFbar := TExtObjectList.CreateInternal(Self, 'fbar');
  FFooterCfg := TExtObject.CreateInternal(Self, 'footerCfg');
  FHeaderAsText := true;
  FHeaderCfg := TExtObject.CreateInternal(Self, 'headerCfg');
  FMaskDisabled := true;
  FMinButtonWidth := 75;
  FShadowOffset := 4;
  FShim := true;
  FTbar := TExtObject.CreateInternal(Self, 'tbar');
  FTbarCfg := TExtObject.CreateInternal(Self, 'tbarCfg');
  FToolTemplate := TExtTemplate.CreateInternal(Self, 'toolTemplate');
//  FToolTemplateExtXTemplate := TExtXTemplate.CreateInternal(Self, 'toolTemplate');
  FTools := TExtObjectList.CreateInternal(Self, 'tools');
  FBody := TExtElement.CreateInternal(Self, 'body');
  FBwrap := TExtElement.CreateInternal(Self, 'bwrap');
  FFooter_ := TExtElement.CreateInternal(Self, 'footer');
  FHeader_ := TExtElement.CreateInternal(Self, 'header');
  FHeader := true;
end;

function TExtPanel.AddButton(Config: string = ''; Handler: TExtFunction = nil;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addButton(' + VarToJSON([Config, Handler, true, Scope, false]) + ');',
    'TExtPanel');
  Result := Self;
end;

function TExtPanel.AddButton(Config: TExtObject; Handler: TExtFunction; Scope: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.addButton(' + VarToJSON([Config, false, Handler, true, Scope, false])
    + ');', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.Collapse(const AAnimate: Boolean): TExtFunction;
begin
  Result := CallMethod('collapse', AAnimate);
end;

function TExtPanel.Expand(const AAnimate: Boolean): TExtFunction;
begin
  Result := CallMethod('expand', AAnimate);
end;

function TExtPanel.GetBottomToolbar: TExtFunction;
begin
  JSCode(JSName + '.getBottomToolbar();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetFooterToolbar: TExtFunction;
begin
  JSCode(JSName + '.getFooterToolbar();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetFrameHeight: TExtFunction;
begin
  JSCode(JSName + '.getFrameHeight();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetFrameWidth: TExtFunction;
begin
  JSCode(JSName + '.getFrameWidth();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetInnerHeight: TExtFunction;
begin
  JSCode(JSName + '.getInnerHeight();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetInnerWidth: TExtFunction;
begin
  JSCode(JSName + '.getInnerWidth();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetObjectNamePrefix: string;
begin
  Result := 'pnl';
end;

function TExtPanel.GetTool(Id: string): TExtFunction;
begin
  JSCode(JSName + '.getTool(' + VarToJSON([Id]) + ');', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetTopToolbar: TExtFunction;
begin
  JSCode(JSName + '.getTopToolbar();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.GetUpdater: TExtFunction;
begin
  JSCode(JSName + '.getUpdater();', 'TExtPanel');
  Result := Self;
end;

function TExtPanel.SetIconClass(Cls: string): TExtFunction;
begin
  JSCode(JSName + '.setIconClass(' + VarToJSON([Cls]) + ');', 'TExtPanel');
  Result := Self;
end;

procedure TExtPanel.SetTbar(const AValue: TExtObject);
begin
  FreeAndNil(FTbar);
  FTbar := AValue;
end;

function TExtPanel.SetTitle(const ATitle: string; const AIconCls: string): TExtFunction;
begin
  FTitle := ATitle;
  FIconCls := AIconCls;
  Result := CallMethod('setTitle', [ATitle, AIconCls]);
end;

function TExtPanel.ToggleCollapse(Animate: Boolean): TExtFunction;
begin
  JSCode(JSName + '.toggleCollapse(' + VarToJSON([Animate]) + ');', 'TExtPanel');
  Result := Self;
end;

procedure TExtPanel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'activate') and Assigned(FOnActivate) then
    FOnActivate(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'beforeclose') and Assigned(FOnBeforeclose) then
    FOnBeforeclose(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'beforecollapse') and Assigned(FOnBeforecollapse) then
    FOnBeforecollapse(TExtPanel(ParamAsObject('P')), ParamAsBoolean('Animate'))
  else if (AEvtName = 'beforeexpand') and Assigned(FOnBeforeexpand) then
    FOnBeforeexpand(TExtPanel(ParamAsObject('P')), ParamAsBoolean('Animate'))
  else if (AEvtName = 'bodyresize') and Assigned(FOnBodyresize) then
    FOnBodyresize(TExtPanel(ParamAsObject('P')), ParamAsInteger('Width'),
      ParamAsInteger('Height'))
  else if (AEvtName = 'close') and Assigned(FOnClose) then
    FOnClose(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'collapse') and Assigned(FOnCollapse) then
    FOnCollapse(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'deactivate') and Assigned(FOnDeactivate) then
    FOnDeactivate(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'expand') and Assigned(FOnExpand) then
    FOnExpand(TExtPanel(ParamAsObject('P')))
  else if (AEvtName = 'iconchange') and Assigned(FOnIconchange) then
    FOnIconchange(TExtPanel(ParamAsObject('P')), ParamAsString('The'),
      ParamAsString('The_'))
  else if (AEvtName = 'titlechange') and Assigned(FOnTitlechange) then
    FOnTitlechange(TExtPanel(ParamAsObject('P')), ParamAsString('The'));
end;

procedure TExtSplitButton._SetArrowHandler(const AValue: TExtFunction);
begin
  FArrowHandler := SetFunctionConfigItem('arrowHandler', 'setArrowHandler', AValue);
end;

procedure TExtSplitButton.SetFArrowTooltip(Value: string);
begin
  FArrowTooltip := Value;
  JSCodeBlock('arrowTooltip:' + VarToJSON([Value]));
end;

procedure TExtSplitButton.SetFOnArrowclick(Value: TExtSplitButtonOnArrowclick);
begin
  if Assigned(FOnArrowclick) then
    JSCodeBlock(JSName + '.events ["arrowclick"].listeners=[];');
  if Assigned(Value) then
    on('arrowclick', Ajax('arrowclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnArrowclick := Value;
end;

class function TExtSplitButton.JSClassName: string;
begin
  Result := 'Ext.SplitButton';
end;

procedure TExtSplitButton.InitDefaults;
begin
  inherited;
end;

function TExtSplitButton.SetArrowHandler(const AHandler: TExtFunction; const AScope: TExtObject): TExtFunction;
begin
  FArrowHandler := AHandler;
  Result := CallMethod('setArrowHandler', [AHandler, True, AScope, False]);
end;

procedure TExtSplitButton.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'arrowclick') and Assigned(FOnArrowclick) then
    FOnArrowclick(TExtSplitButton(ParamAsObject('This')), ExtEventObject);
end;

procedure TExtToolbarSpacer.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCodeBlock('width:' + VarToJSON([Value]));
end;

class function TExtToolbarSpacer.JSClassName: string;
begin
  Result := 'Ext.Toolbar.Spacer';
end;

function TExtToolbarSpacer.GetObjectNamePrefix: string;
begin
  Result := 'spacer';
end;

procedure TExtToolbarSpacer.InitDefaults;
begin
  inherited;
  FWidth := 2;
end;

procedure TExtToolbarTextItem._SetText(const AValue: string);
begin
  FText := AValue;
  SetConfigItem('text', 'setText', AValue);
end;

class function TExtToolbarTextItem.JSClassName: string;
begin
  Result := 'Ext.Toolbar.TextItem';
end;

procedure TExtToolbarTextItem.InitDefaults;
begin
  inherited;
end;

function TExtToolbarTextItem.SetText(const AText: string): TExtFunction;
begin
  FText := AText;
  Result := CallMethod('setText', AText);
end;

procedure TExtToolbar.SetFButtonAlign(Value: string);
begin
  FButtonAlign := Value;
  JSCodeBlock('buttonAlign:' + VarToJSON([Value]));
end;

procedure TExtToolbar.SetFEnableOverflow(Value: Boolean);
begin
  FEnableOverflow := Value;
  JSCodeBlock('enableOverflow:' + VarToJSON([Value]));
end;

procedure TExtToolbar.SetFLayout(Value: string);
begin
  FLayout := Value;
  JSCodeBlock('layout:' + VarToJSON([Value]));
end;

procedure TExtToolbar.SetFLayoutObject(Value: TExtObject);
begin
  FLayoutObject := Value;
  JSCodeBlock('layout:' + VarToJSON([Value, false]));
end;

procedure TExtToolbar.SetFOnOverflowchange(Value: TExtToolbarOnOverflowchange);
begin
  if Assigned(FOnOverflowchange) then
    JSCodeBlock(JSName + '.events ["overflowchange"].listeners=[];');
  if Assigned(Value) then
    on('overflowchange', Ajax('overflowchange', ['C', '%0.nm', 'LastOverflow',
      '%1'], true));
  FOnOverflowchange := Value;
end;

class function TExtToolbar.JSClassName: string;
begin
  Result := 'Ext.Toolbar';
end;

procedure TExtToolbar.InitDefaults;
begin
  inherited;
//  FLayoutObject := TExtObject.CreateInternal(Self, 'layout');
end;

function TExtToolbar.Add(Args: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON(Args) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddButton(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addButton(' + VarToJSON([Config, false]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddButton(Config: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.addButton(' + VarToJSON(Config) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddDom(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.addDom(' + VarToJSON([Config, false]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddElement(El: string): TExtFunction;
begin
  JSCode(JSName + '.addElement(' + VarToJSON([El]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddField(Field: TExtFormField): TExtFunction;
begin
  JSCode(JSName + '.addField(' + VarToJSON([Field, false]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddFill: TExtFunction;
begin
  JSCode(JSName + '.addFill();', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddItem(Item: TExtToolbarItem): TExtFunction;
begin
  JSCode(JSName + '.addItem(' + VarToJSON([Item, false]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddSeparator: TExtFunction;
begin
  JSCode(JSName + '.addSeparator();', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddSpacer: TExtFunction;
begin
  JSCode(JSName + '.addSpacer();', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.AddText(Text: string): TExtFunction;
begin
  JSCode(JSName + '.addText(' + VarToJSON([Text]) + ');', 'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.GetObjectNamePrefix: string;
begin
  Result := 'tb';
end;

function TExtToolbar.InsertButton(Index: Integer; Item: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.insertButton(' + VarToJSON([index, Item, false]) + ');',
    'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.InsertButton(Index: Integer; Item: TExtToolbarItem): TExtFunction;
begin
  JSCode(JSName + '.insertButton(' + VarToJSON([index, Item, false]) + ');',
    'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.InsertButton(Index: Integer; Item: TExtButton): TExtFunction;
begin
  JSCode(JSName + '.insertButton(' + VarToJSON([index, Item, false]) + ');',
    'TExtToolbar');
  Result := Self;
end;

function TExtToolbar.InsertButton(Index: Integer; Item: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.insertButton(' + VarToJSON([index]) + ',' + VarToJSON(Item) + ');',
    'TExtToolbar');
  Result := Self;
end;

procedure TExtToolbar.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'overflowchange') and Assigned(FOnOverflowchange) then
    FOnOverflowchange(TExtObject(ParamAsObject('C')), ParamAsBoolean('LastOverflow'));
end;

class function TExtToolbarSeparator.JSClassName: string;
begin
  Result := 'Ext.Toolbar.Separator';
end;

procedure TExtToolbarSeparator.InitDefaults;
begin
  inherited;
end;

procedure TExtTip.SetFClosable(Value: Boolean);
begin
  FClosable := Value;
  JSCodeBlock('closable:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFDefaultAlign(Value: string);
begin
  FDefaultAlign := Value;
  JSCodeBlock('defaultAlign:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFMaxWidth(Value: Integer);
begin
  FMaxWidth := Value;
  JSCodeBlock('maxWidth:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFMinWidth(Value: Integer);
begin
  FMinWidth := Value;
  JSCodeBlock('minWidth:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFShadow(Value: Boolean);
begin
  FShadow := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFShadowString(Value: string);
begin
  FShadowString := Value;
  JSCodeBlock('shadow:' + VarToJSON([Value]));
end;

procedure TExtTip.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCodeBlock('width:' + VarToJSON([Value]));
end;

class function TExtTip.JSClassName: string;
begin
  Result := 'Ext.Tip';
end;

procedure TExtTip.InitDefaults;
begin
  inherited;
  FDefaultAlign := 'tl-bl?';
  FMaxWidth := 300;
  FMinWidth := 40;
end;

function TExtTip.ShowAt(Xy: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.showAt(' + VarToJSON(Xy) + ');', 'TExtTip');
  Result := Self;
end;

function TExtTip.ShowBy(El: string; Position: string = ''): TExtFunction;
begin
  JSCode(JSName + '.showBy(' + VarToJSON([El, Position]) + ');', 'TExtTip');
  Result := Self;
end;

class function TExtToolbarFill.JSClassName: string;
begin
  Result := 'Ext.Toolbar.Fill';
end;

procedure TExtToolbarFill.InitDefaults;
begin
  inherited;
end;

procedure TExtButtonGroup.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCodeBlock('baseCls:' + VarToJSON([Value]));
end;

procedure TExtButtonGroup.SetFColumns(Value: Integer);
begin
  FColumns := Value;
  JSCodeBlock('columns:' + VarToJSON([Value]));
end;

procedure TExtButtonGroup.SetFFrame(Value: Boolean);
begin
  FFrame := Value;
  JSCodeBlock('frame:' + VarToJSON([Value]));
end;

procedure TExtButtonGroup.SetFLayout(Value: string);
begin
  FLayout := Value;
  JSCodeBlock('layout:' + VarToJSON([Value]));
end;

class function TExtButtonGroup.JSClassName: string;
begin
  Result := 'Ext.ButtonGroup';
end;

procedure TExtButtonGroup.InitDefaults;
begin
  inherited;
end;

procedure TExtCycleButton.SetFChangeHandler(Value: TExtFunction);
begin
  FChangeHandler := Value;
  JSCodeBlock('changeHandler:' + VarToJSON([Value, true]));
end;

procedure TExtCycleButton.SetFForceIcon(Value: string);
begin
  FForceIcon := Value;
  JSCodeBlock('forceIcon:' + VarToJSON([Value]));
end;

procedure TExtCycleButton.SetFItems(Value: TExtObjectList);
begin
  FItems := Value;
  JSCodeBlock('items:' + VarToJSON([Value, false]));
end;

procedure TExtCycleButton.SetFPrependText(Value: string);
begin
  FPrependText := Value;
  JSCodeBlock('prependText:' + VarToJSON([Value]));
end;

procedure TExtCycleButton.SetFShowText(Value: Boolean);
begin
  FShowText := Value;
  JSCodeBlock('showText:' + VarToJSON([Value]));
end;

procedure TExtCycleButton.SetFMenu(Value: TExtMenuMenu);
begin
  FMenu := Value;
  JSCodeBlock(JSName + '.menu=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtCycleButton.SetFOnChange(Value: TExtCycleButtonOnChange);
begin
  if Assigned(FOnChange) then
    JSCodeBlock(JSName + '.events ["change"].listeners=[];');
  if Assigned(Value) then
    on('change', Ajax('change', ['This', '%0.nm', 'Item', '%1.nm'], true));
  FOnChange := Value;
end;

class function TExtCycleButton.JSClassName: string;
begin
  Result := 'Ext.CycleButton';
end;

procedure TExtCycleButton.InitDefaults;
begin
  inherited;
  FItems := TExtObjectList.CreateInternal(Self, 'items');
  FMenu := TExtMenuMenu.CreateInternal(Self, 'menu');
end;

function TExtCycleButton.GetActiveItem: TExtFunction;
begin
  JSCode(JSName + '.getActiveItem();', 'TExtCycleButton');
  Result := Self;
end;

function TExtCycleButton.SetActiveItem(Item: TExtMenuCheckItem; SuppressEvent: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.setActiveItem(' + VarToJSON([Item, false, SuppressEvent]) + ');',
    'TExtCycleButton');
  Result := Self;
end;

function TExtCycleButton.ToggleSelected: TExtFunction;
begin
  JSCode(JSName + '.toggleSelected();', 'TExtCycleButton');
  Result := Self;
end;

procedure TExtCycleButton.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'change') and Assigned(FOnChange) then
    FOnChange(TExtCycleButton(ParamAsObject('This')),
      TExtMenuCheckItem(ParamAsObject('Item')));
end;

procedure TExtWindow._SetAnimateTarget(const AValue: string);
begin
  FAnimateTarget := AValue;
  SetConfigItem('animateTarget', 'setAnimateTarget', AValue);
end;

procedure TExtWindow.SetFAnimateTargetElement(Value: TExtElement);
begin
  FAnimateTargetElement := Value;
  JSCodeBlock('animateTarget:' + VarToJSON([Value, false]));
end;

procedure TExtWindow.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCodeBlock('baseCls:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetClosable(const AValue: Boolean);
begin
  FClosable := AValue;
  SetConfigItem('closable', AValue);
end;

procedure TExtWindow.SetFCloseAction(Value: string);
begin
  FCloseAction := Value;
  JSCodeBlock('closeAction:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFCollapsed(Value: Boolean);
begin
  FCollapsed := Value;
  JSCodeBlock('collapsed:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetConstrain(const AValue: Boolean);
begin
  FConstrain := AValue;
  SetConfigItem('constrain', AValue);
end;

procedure TExtWindow.SetFConstrainHeader(Value: Boolean);
begin
  FConstrainHeader := Value;
  JSCodeBlock('constrainHeader:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFDefaultButton(Value: string);
begin
  FDefaultButton := Value;
  JSCodeBlock('defaultButton:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFDefaultButtonNumber(Value: Integer);
begin
  FDefaultButtonNumber := Value;
  JSCodeBlock('defaultButton:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFDefaultButtonComponent(Value: TExtComponent);
begin
  FDefaultButtonComponent := Value;
  JSCodeBlock('defaultButton:' + VarToJSON([Value, false]));
end;

procedure TExtWindow.SetDraggable(const AValue: Boolean);
begin
  FDraggable := AValue;
  SetConfigItem('draggable', AValue);
end;

procedure TExtWindow.SetFExpandOnShow(Value: Boolean);
begin
  FExpandOnShow := Value;
  JSCodeBlock('expandOnShow:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFHidden(Value: Boolean);
begin
  FHidden := Value;
  JSCodeBlock('hidden:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFInitHidden(Value: Boolean);
begin
  FInitHidden := Value;
  JSCodeBlock('initHidden:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFManager(Value: TExtWindowGroup);
begin
  FManager := Value;
  JSCodeBlock('manager:' + VarToJSON([Value, false]));
end;

procedure TExtWindow.SetMaximizable(const AValue: Boolean);
begin
  FMaximizable := AValue;
  SetConfigItem('maximizable', AValue);
end;

procedure TExtWindow.SetMaximized(const AValue: Boolean);
begin
  FMaximized := SetConfigItem('maximized', AValue);
end;

procedure TExtWindow.SetFMinHeight(Value: Integer);
begin
  FMinHeight := Value;
  JSCodeBlock('minHeight:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFMinWidth(Value: Integer);
begin
  FMinWidth := Value;
  JSCodeBlock('minWidth:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFMinimizable(Value: Boolean);
begin
  FMinimizable := Value;
  JSCodeBlock('minimizable:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetModal(const AValue: Boolean);
begin
  FModal := SetConfigItem('modal', AValue);
end;

procedure TExtWindow.SetFOnEsc(Value: TExtFunction);
begin
  FOnEsc := Value;
  JSCodeBlock('onEsc:' + VarToJSON([Value, true]));
end;

procedure TExtWindow.SetPlain(const AValue: Boolean);
begin
  FPlain := SetConfigItem('plain', AValue);
end;

procedure TExtWindow.SetResizable(const AValue: Boolean);
begin
  FResizable := SetConfigItem('resizable', AValue);
end;

procedure TExtWindow.SetResizeHandles(const AValue: string);
begin
  FResizeHandles := SetConfigItem('resizeHandles', AValue);
end;

procedure TExtWindow.SetFX(Value: Integer);
begin
  FX := Value;
  JSCodeBlock('x:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFY(Value: Integer);
begin
  FY := Value;
  JSCodeBlock('y:' + VarToJSON([Value]));
end;

procedure TExtWindow.SetFOnHide(Value: TExtObject);
begin
  FOnHide := Value;
  JSCodeBlock(JSName + '.onHide=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtWindow.SetFOnShow(Value: TExtObject);
begin
  FOnShow := Value;
  JSCodeBlock(JSName + '.onShow=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtWindow.SetFOnActivate(Value: TExtWindowOnActivate);
begin
  if Assigned(FOnActivate) then
    JSCodeBlock(JSName + '.events ["activate"].listeners=[];');
  if Assigned(Value) then
    on('activate', Ajax('activate', ['This', '%0.nm'], true));
  FOnActivate := Value;
end;

procedure TExtWindow.SetFOnDeactivate(Value: TExtWindowOnDeactivate);
begin
  if Assigned(FOnDeactivate) then
    JSCodeBlock(JSName + '.events ["deactivate"].listeners=[];');
  if Assigned(Value) then
    on('deactivate', Ajax('deactivate', ['This', '%0.nm'], true));
  FOnDeactivate := Value;
end;

procedure TExtWindow.SetFOnMaximize(Value: TExtWindowOnMaximize);
begin
  if Assigned(FOnMaximize) then
    JSCodeBlock(JSName + '.events ["maximize"].listeners=[];');
  if Assigned(Value) then
    on('maximize', Ajax('maximize', ['This', '%0.nm'], true));
  FOnMaximize := Value;
end;

procedure TExtWindow.SetFOnMinimize(Value: TExtWindowOnMinimize);
begin
  if Assigned(FOnMinimize) then
    JSCodeBlock(JSName + '.events ["minimize"].listeners=[];');
  if Assigned(Value) then
    on('minimize', Ajax('minimize', ['This', '%0.nm'], true));
  FOnMinimize := Value;
end;

procedure TExtWindow.SetFOnResize(Value: TExtWindowOnResize);
begin
  if Assigned(FOnResize) then
    JSCodeBlock(JSName + '.events ["resize"].listeners=[];');
  if Assigned(Value) then
    on('resize', Ajax('resize', ['This', '%0.nm', 'Width', '%1', 'Height', '%2'], true));
  FOnResize := Value;
end;

procedure TExtWindow.SetFOnRestore(Value: TExtWindowOnRestore);
begin
  if Assigned(FOnRestore) then
    JSCodeBlock(JSName + '.events ["restore"].listeners=[];');
  if Assigned(Value) then
    on('restore', Ajax('restore', ['This', '%0.nm'], true));
  FOnRestore := Value;
end;

class function TExtWindow.JSClassName: string;
begin
  Result := 'Ext.Window';
end;

procedure TExtWindow.InitDefaults;
begin
  inherited;
  FAnimateTargetElement := TExtElement.CreateInternal(Self, 'animateTarget');
  FBaseCls := 'x-window';
  FClosable := true;
  FDefaultButtonComponent := TExtComponent.CreateInternal(Self, 'defaultButton');
  FDraggable := true;
  FExpandOnShow := true;
  FInitHidden := true;
  FManager := TExtWindowGroup.CreateInternal(Self, 'manager');
  FMinHeight := 100;
  FMinWidth := 200;
  FResizable := true;
  FResizeHandles := 'all';
//  FDd := TExtDdDD.CreateInternal(Self, 'dd');
  FOnHide := TExtObject.CreateInternal(Self, 'onHide');
  FOnShow := TExtObject.CreateInternal(Self, 'onShow');
  FBbar := TExtObjectList.CreateInternal(Self, 'bbar');
end;

function TExtWindow.AlignTo(Element: string; Position: string;
  Offsets: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.alignTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.AnchorTo(Element: string; Position: string;
  Offsets: TExtObjectList = nil; MonitorScroll: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([MonitorScroll]) + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.AnchorTo(Element: string; Position: string; Offsets: TExtObjectList;
  MonitorScroll: Integer): TExtFunction;
begin
  JSCode(JSName + '.anchorTo(' + VarToJSON([Element, Position]) + ',' + VarToJSON(Offsets)
    + ',' + VarToJSON([MonitorScroll]) + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Center: TExtFunction;
begin
  JSCode(JSName + '.center();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.ClearAnchor: TExtFunction;
begin
  JSCode(JSName + '.clearAnchor();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Close: TExtFunction;
begin
  Result := CallMethod('close', []);
end;

function TExtWindow.Focus: TExtFunction;
begin
  JSCode(JSName + '.focus();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Hide(AnimateTarget: string = ''; Callback: TExtFunction = nil;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.hide(' + VarToJSON([AnimateTarget, Callback, true, Scope, false]) +
    ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Hide(AnimateTarget: TExtElement; Callback: TExtFunction = nil;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.hide(' + VarToJSON([AnimateTarget, false, Callback, true, Scope,
    false]) + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Maximize: TExtFunction;
begin
  JSCode(JSName + '.maximize();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Minimize: TExtFunction;
begin
  JSCode(JSName + '.minimize();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.Restore: TExtFunction;
begin
  JSCode(JSName + '.restore();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.SetActive(Active: Boolean): TExtFunction;
begin
  JSCode(JSName + '.setActive(' + VarToJSON([Active]) + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.SetAnimateTarget(const AElement: string): TExtFunction;
begin
  FAnimateTarget := SetConfigItem('animateTarget', 'setAnimateTarget', AElement);
  Result := Self;
end;

function TExtWindow.Show(const AAnimateTarget: string; const ACallback: TExtFunction;
  const AScope: TExtObject): TExtFunction;
begin
  Result := CallMethod('show', [AAnimateTarget, ACallback, True, AScope, False]);
end;

function TExtWindow.Show(const AAnimateTarget: TExtElement; const ACallback: TExtFunction;
  const AScope: TExtObject): TExtFunction;
begin
  Result := CallMethod('show', [AAnimateTarget, ACallback, True, AScope, False]);
end;

function TExtWindow.ToBack: TExtFunction;
begin
  JSCode(JSName + '.toBack();', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.ToFront(E: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.toFront(' + VarToJSON([E]) + ');', 'TExtWindow');
  Result := Self;
end;

function TExtWindow.ToggleMaximize: TExtFunction;
begin
  JSCode(JSName + '.toggleMaximize();', 'TExtWindow');
  Result := Self;
end;

procedure TExtWindow.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'activate') and Assigned(FOnActivate) then
    FOnActivate(TExtWindow(ParamAsObject('This')))
  else if (AEvtName = 'deactivate') and Assigned(FOnDeactivate) then
    FOnDeactivate(TExtWindow(ParamAsObject('This')))
  else if (AEvtName = 'maximize') and Assigned(FOnMaximize) then
    FOnMaximize(TExtWindow(ParamAsObject('This')))
  else if (AEvtName = 'minimize') and Assigned(FOnMinimize) then
    FOnMinimize(TExtWindow(ParamAsObject('This')))
  else if (AEvtName = 'resize') and Assigned(FOnResize) then
    FOnResize(TExtWindow(ParamAsObject('This')), ParamAsInteger('Width'),
      ParamAsInteger('Height'))
  else if (AEvtName = 'restore') and Assigned(FOnRestore) then
    FOnRestore(TExtWindow(ParamAsObject('This')));
end;

function TExtWindow.GetObjectNamePrefix: string;
begin
  Result := 'win';
end;

procedure TExtTabPanel._SetActiveTab(const AValue: string);
begin
  FActiveTab := AValue;
  SetConfigItem('activeTab', 'setActiveTab', AValue);
end;

procedure TExtTabPanel.SetActiveTabNumber(const AValue: Integer);
begin
  FActiveTabNumber := AValue;
  SetConfigItem('activeTab', AValue);
end;

procedure TExtTabPanel.SetFAnimScroll(Value: Boolean);
begin
  FAnimScroll := Value;
  JSCodeBlock('animScroll:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFAutoTabSelector(Value: string);
begin
  FAutoTabSelector := Value;
  JSCodeBlock('autoTabSelector:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFAutoTabs(Value: Boolean);
begin
  FAutoTabs := Value;
  JSCodeBlock('autoTabs:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCodeBlock('baseCls:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetDeferredRender(const AValue: Boolean);
begin
  FDeferredRender := AValue;
  SetConfigItem('deferredRender', AValue);
end;

procedure TExtTabPanel.SetEnableTabScroll(const AValue: Boolean);
begin
  FEnableTabScroll := AValue;
  SetConfigItem('enableTabScroll', AValue);
end;

procedure TExtTabPanel.SetLayoutOnTabChange(const AValue: Boolean);
begin
  FLayoutOnTabChange := AValue;
  SetConfigItem('layoutOnTabChange', AValue);
end;

procedure TExtTabPanel.SetFMinTabWidth(Value: Integer);
begin
  FMinTabWidth := Value;
  JSCodeBlock('minTabWidth:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFPlain(Value: Boolean);
begin
  FPlain := Value;
  JSCodeBlock('plain:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFResizeTabs(Value: Boolean);
begin
  FResizeTabs := Value;
  JSCodeBlock('resizeTabs:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFScrollDuration(Value: Double);
begin
  FScrollDuration := Value;
  JSCodeBlock('scrollDuration:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFScrollIncrement(Value: Integer);
begin
  FScrollIncrement := Value;
  JSCodeBlock('scrollIncrement:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFScrollRepeatInterval(Value: Integer);
begin
  FScrollRepeatInterval := Value;
  JSCodeBlock('scrollRepeatInterval:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFTabCls(Value: string);
begin
  FTabCls := Value;
  JSCodeBlock('tabCls:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFTabMargin(Value: Integer);
begin
  FTabMargin := Value;
  JSCodeBlock('tabMargin:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFTabPosition(Value: string);
begin
  FTabPosition := Value;
  JSCodeBlock('tabPosition:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFTabWidth(Value: Integer);
begin
  FTabWidth := Value;
  JSCodeBlock('tabWidth:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFWheelIncrement(Value: Integer);
begin
  FWheelIncrement := Value;
  JSCodeBlock('wheelIncrement:' + VarToJSON([Value]));
end;

procedure TExtTabPanel.SetFOnBeforetabchange(Value: TExtTabPanelOnBeforetabchange);
begin
  if Assigned(FOnBeforetabchange) then
    JSCodeBlock(JSName + '.events ["beforetabchange"].listeners=[];');
  if Assigned(Value) then
    on('beforetabchange', Ajax('beforetabchange', ['This', '%0.nm', 'NewTab', '%1.nm',
      'CurrentTab', '%2.nm'], true));
  FOnBeforetabchange := Value;
end;

procedure TExtTabPanel.SetFOnContextmenu(Value: TExtTabPanelOnContextmenu);
begin
  if Assigned(FOnContextmenu) then
    JSCodeBlock(JSName + '.events ["contextmenu"].listeners=[];');
  if Assigned(Value) then
    on('contextmenu', Ajax('contextmenu', ['This', '%0.nm', 'Tab', '%1.nm', 'E',
      '%2.nm'], true));
  FOnContextmenu := Value;
end;

procedure TExtTabPanel.SetOnTabChange(const AValue: TExtTabPanelOnTabchange);
begin
  if Assigned(FOnTabChange) then
    GetSession.ResponseItems.ExecuteJSCode(Self, JSName + '.events["tabchange"].listeners=[];');
  if Assigned(AValue) then
    On('tabchange', Ajax('tabchange', ['This', '%0.nm', 'Tab', '(%1?%1.nm:null)'], True));
  FOnTabChange := AValue;
end;

class function TExtTabPanel.JSClassName: string;
begin
  Result := 'Ext.TabPanel';
end;

procedure TExtTabPanel.InitDefaults;
begin
  inherited;
  FAnimScroll := true;
  FAutoTabSelector := 'div.x-tab';
  FBaseCls := 'x-tab-panel';
  FMinTabWidth := 30;
  FScrollDuration := 0.35;
  FScrollIncrement := 100;
  FScrollRepeatInterval := 400;
  FTabMargin := 2;
  FTabPosition := 'top';
  FTabWidth := 120;
  FWheelIncrement := 20;
end;

function TExtTabPanel.Activate(TAB: string): TExtFunction;
begin
  JSCode(JSName + '.activate(' + VarToJSON([TAB]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.Activate(TAB: TExtPanel): TExtFunction;
begin
  JSCode(JSName + '.activate(' + VarToJSON([TAB, false]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.BeginUpdate: TExtFunction;
begin
  JSCode(JSName + '.beginUpdate();', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.EndUpdate: TExtFunction;
begin
  JSCode(JSName + '.endUpdate();', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.GetActiveTab: TExtFunction;
begin
  Result := CallMethod('getActiveTab', []);
end;

function TExtTabPanel.GetItem(Id: string): TExtFunction;
begin
  JSCode(JSName + '.getItem(' + VarToJSON([Id]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.GetObjectNamePrefix: string;
begin
  Result := 'tabpnl';
end;

function TExtTabPanel.GetTabEl(TAB: TExtPanel): TExtFunction;
begin
  JSCode(JSName + '.getTabEl(' + VarToJSON([TAB, false]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.GetTabEl(TAB: Integer): TExtFunction;
begin
  JSCode(JSName + '.getTabEl(' + VarToJSON([TAB]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.GetTabEl(TAB: string): TExtFunction;
begin
  JSCode(JSName + '.getTabEl(' + VarToJSON([TAB]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.GetTemplateArgs(Item: TExtBoxComponent): TExtFunction;
begin
  JSCode(JSName + '.getTemplateArgs(' + VarToJSON([Item, false]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.HideTabStripItem(Item: Integer): TExtFunction;
begin
  JSCode(JSName + '.hideTabStripItem(' + VarToJSON([Item]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.HideTabStripItem(Item: string): TExtFunction;
begin
  JSCode(JSName + '.hideTabStripItem(' + VarToJSON([Item]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.HideTabStripItem(Item: TExtPanel): TExtFunction;
begin
  JSCode(JSName + '.hideTabStripItem(' + VarToJSON([Item, false]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.ReadTabs(RemoveExisting: Boolean): TExtFunction;
begin
  JSCode(JSName + '.readTabs(' + VarToJSON([RemoveExisting]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.ScrollToTab(Item: TExtPanel; Animate: Boolean): TExtFunction;
begin
  JSCode(JSName + '.scrollToTab(' + VarToJSON([Item, false, Animate]) + ');',
    'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.SetActiveTab(const AItem: string): TExtFunction;
begin
  Result := CallMethod('setActiveTab', AItem);
end;

function TExtTabPanel.SetActiveTab(const AItem: Integer): TExtFunction;
begin
  Result := CallMethod('setActiveTab', AItem);
end;

function TExtTabPanel.UnhideTabStripItem(Item: Integer): TExtFunction;
begin
  JSCode(JSName + '.unhideTabStripItem(' + VarToJSON([Item]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.UnhideTabStripItem(Item: string): TExtFunction;
begin
  JSCode(JSName + '.unhideTabStripItem(' + VarToJSON([Item]) + ');', 'TExtTabPanel');
  Result := Self;
end;

function TExtTabPanel.UnhideTabStripItem(Item: TExtPanel): TExtFunction;
begin
  JSCode(JSName + '.unhideTabStripItem(' + VarToJSON([Item, false]) + ');',
    'TExtTabPanel');
  Result := Self;
end;

procedure TExtTabPanel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforetabchange') and Assigned(FOnBeforetabchange) then
    FOnBeforetabchange(TExtTabPanel(ParamAsObject('This')),
      TExtPanel(ParamAsObject('NewTab')), TExtPanel(ParamAsObject('CurrentTab')))
  else if (AEvtName = 'contextmenu') and Assigned(FOnContextmenu) then
    FOnContextmenu(TExtTabPanel(ParamAsObject('This')), TExtPanel(ParamAsObject('Tab')),
      ExtEventObject)
  else if (AEvtName = 'tabchange') and Assigned(FOnTabChange) then
    FOnTabChange(TExtTabPanel(ParamAsObject('This')), TExtPanel(ParamAsObject('Tab')));
end;

procedure TExtPagingToolbar.SetFAfterPageText(Value: string);
begin
  FAfterPageText := Value;
  JSCodeBlock('afterPageText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFBeforePageText(Value: string);
begin
  FBeforePageText := Value;
  JSCodeBlock('beforePageText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetDisplayInfo(const AValue: Boolean);
begin
  FDisplayInfo := AValue;
  SetConfigItem('displayInfo', AValue);
end;

procedure TExtPagingToolbar.SetFDisplayMsg(Value: string);
begin
  FDisplayMsg := Value;
  JSCodeBlock('displayMsg:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFEmptyMsg(Value: string);
begin
  FEmptyMsg := Value;
  JSCodeBlock('emptyMsg:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFFirstText(Value: string);
begin
  FFirstText := Value;
  JSCodeBlock('firstText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFLastText(Value: string);
begin
  FLastText := Value;
  JSCodeBlock('lastText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFNextText(Value: string);
begin
  FNextText := Value;
  JSCodeBlock('nextText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetPageSize(const AValue: Integer);
begin
  FPageSize := AValue;
  SetConfigItem('pageSize', AValue);
end;

procedure TExtPagingToolbar.SetFPrependButtons(Value: Boolean);
begin
  FPrependButtons := Value;
  JSCodeBlock('prependButtons:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFPrevText(Value: string);
begin
  FPrevText := Value;
  JSCodeBlock('prevText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetFRefreshText(Value: string);
begin
  FRefreshText := Value;
  JSCodeBlock('refreshText:' + VarToJSON([Value]));
end;

procedure TExtPagingToolbar.SetStore(const AValue: TExtDataStore);
begin
  FStore.Free;
  FStore := AValue;
  if FStore <> nil then
    SetConfigItem('store', AValue);
end;

procedure TExtPagingToolbar.SetFCursor(Value: Integer);
begin
  FCursor := Value;
  JSCodeBlock(JSName + '.cursor=' + VarToJSON([Value]) + ';');
end;

procedure TExtPagingToolbar.SetFPageSize_(Value: Integer);
begin
  FPageSize_ := Value;
  JSCodeBlock(JSName + '.pageSize=' + VarToJSON([Value]) + ';');
end;

procedure TExtPagingToolbar.SetFParamNames(Value: TExtObject);
begin
  FParamNames := Value;
  JSCodeBlock(JSName + '.paramNames=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtPagingToolbar.SetFOnBeforechange(Value: TExtPagingToolbarOnBeforechange);
begin
  if Assigned(FOnBeforechange) then
    JSCodeBlock(JSName + '.events ["beforechange"].listeners=[];');
  if Assigned(Value) then
    on('beforechange', Ajax('beforechange', ['This', '%0.nm', 'Params', '%1.nm'], true));
  FOnBeforechange := Value;
end;

procedure TExtPagingToolbar.SetFOnChange(Value: TExtPagingToolbarOnChange);
begin
  if Assigned(FOnChange) then
    JSCodeBlock(JSName + '.events ["change"].listeners=[];');
  if Assigned(Value) then
    on('change', Ajax('change', ['This', '%0.nm', 'PageData', '%1.nm'], true));
  FOnChange := Value;
end;

class function TExtPagingToolbar.JSClassName: string;
begin
  Result := 'Ext.PagingToolbar';
end;

procedure TExtPagingToolbar.InitDefaults;
begin
  inherited;
  FAfterPageText := 'of {0}';
  FBeforePageText := 'Page';
  FDisplayMsg := 'Displaying {0} - {1} of {2}';
  FEmptyMsg := 'No data to display';
  FFirstText := 'First Page';
  FLastText := 'Last Page';
  FNextText := 'Next Page';
  FPageSize := 20;
  FPrevText := 'Previous Page';
  FRefreshText := 'Refresh';
  FStore := TExtDataStore.CreateInternal(Self, 'store');
  FParamNames := TExtObject.CreateInternal(Self, 'paramNames');
end;

function TExtPagingToolbar.Bind(Store: TExtDataStore): TExtFunction;
begin
  JSCode(JSName + '.bind(' + VarToJSON([Store, false]) + ');', 'TExtPagingToolbar');
  Result := Self;
end;

function TExtPagingToolbar.BindStore(Store: TExtDataStore; Initial: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.bindStore(' + VarToJSON([Store, false, Initial]) + ');',
    'TExtPagingToolbar');
  Result := Self;
end;

function TExtPagingToolbar.ChangePage(Page: Integer): TExtFunction;
begin
  JSCode(JSName + '.changePage(' + VarToJSON([Page]) + ');', 'TExtPagingToolbar');
  Result := Self;
end;

function TExtPagingToolbar.DoRefresh: TExtFunction;
begin
  JSCode(JSName + '.doRefresh();', 'TExtPagingToolbar');
  Result := Self;
end;

function TExtPagingToolbar.MoveFirst: TExtFunction;
begin
  Result := CallMethod('moveFirst', []);
end;

function TExtPagingToolbar.MoveLast: TExtFunction;
begin
  Result := CallMethod('moveLast', []);
end;

function TExtPagingToolbar.MoveNext: TExtFunction;
begin
  Result := CallMethod('moveNext', []);
end;

function TExtPagingToolbar.MovePrevious: TExtFunction;
begin
  Result := CallMethod('movePrevious', []);
end;

function TExtPagingToolbar.Unbind(Store: TExtDataStore): TExtFunction;
begin
  JSCode(JSName + '.unbind(' + VarToJSON([Store, false]) + ');', 'TExtPagingToolbar');
  Result := Self;
end;

procedure TExtPagingToolbar.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforechange') and Assigned(FOnBeforechange) then
    FOnBeforechange(TExtPagingToolbar(ParamAsObject('This')),
      TExtObject(ParamAsObject('Params')))
  else if (AEvtName = 'change') and Assigned(FOnChange) then
    FOnChange(TExtPagingToolbar(ParamAsObject('This')),
      TExtObject(ParamAsObject('PageData')));
end;

procedure TExtToolTip.SetFAnchorOffset(Value: Integer);
begin
  FAnchorOffset := Value;
  JSCodeBlock('anchorOffset:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFAnchorToTarget(Value: Boolean);
begin
  FAnchorToTarget := Value;
  JSCodeBlock('anchorToTarget:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFAutoHide(Value: Boolean);
begin
  FAutoHide := Value;
  JSCodeBlock('autoHide:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFDelegate(Value: string);
begin
  FDelegate := Value;
  JSCodeBlock('delegate:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFDismissDelay(Value: Integer);
begin
  FDismissDelay := Value;
  JSCodeBlock('dismissDelay:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFHideDelay(Value: Integer);
begin
  FHideDelay := Value;
  JSCodeBlock('hideDelay:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFMouseOffset(Value: TExtObjectList);
begin
  FMouseOffset := Value;
  JSCodeBlock('mouseOffset:' + VarToJSON([Value, false]));
end;

procedure TExtToolTip.SetFShowDelay(Value: Integer);
begin
  FShowDelay := Value;
  JSCodeBlock('showDelay:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFTarget(Value: string);
begin
  FTarget := Value;
  JSCodeBlock('target:' + VarToJSON([Value]));
end;

procedure TExtToolTip.SetFTrackMouse(Value: Boolean);
begin
  FTrackMouse := Value;
  JSCodeBlock('trackMouse:' + VarToJSON([Value]));
end;

class function TExtToolTip.JSClassName: string;
begin
  Result := 'Ext.ToolTip';
end;

procedure TExtToolTip.InitDefaults;
begin
  inherited;
  FAnchorOffset := 0;
  FAnchorToTarget := true;
  FAutoHide := true;
  FDismissDelay := 5000;
  FHideDelay := 200;
  FMouseOffset := TExtObjectList.CreateInternal(Self, 'mouseOffset');
  FShowDelay := 500;
end;

function TExtToolTip.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtToolTip');
  Result := Self;
end;

function TExtToolTip.InitTarget(T: string): TExtFunction;
begin
  JSCode(JSName + '.initTarget(' + VarToJSON([T]) + ');', 'TExtToolTip');
  Result := Self;
end;

function TExtToolTip.Show: TExtFunction;
begin
  JSCode(JSName + '.show();', 'TExtToolTip');
  Result := Self;
end;

procedure TExtQuickTip.SetFInterceptTitles(Value: Boolean);
begin
  FInterceptTitles := Value;
  JSCodeBlock('interceptTitles:' + VarToJSON([Value]));
end;

procedure TExtQuickTip.SetFTarget(Value: string);
begin
  FTarget := Value;
  JSCodeBlock('target:' + VarToJSON([Value]));
end;

class function TExtQuickTip.JSClassName: string;
begin
  Result := 'Ext.QuickTip';
end;

procedure TExtQuickTip.InitDefaults;
begin
  inherited;
end;

function TExtQuickTip.CancelShow(El: string): TExtFunction;
begin
  JSCode(JSName + '.cancelShow(' + VarToJSON([El]) + ');', 'TExtQuickTip');
  Result := Self;
end;

function TExtQuickTip.CancelShow(El: TExtElement): TExtFunction;
begin
  JSCode(JSName + '.cancelShow(' + VarToJSON([El, false]) + ');', 'TExtQuickTip');
  Result := Self;
end;

function TExtQuickTip.Register(Config: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.register(' + VarToJSON([Config, false]) + ');', 'TExtQuickTip');
  Result := Self;
end;

function TExtQuickTip.Unregister(El: string): TExtFunction;
begin
  JSCode(JSName + '.unregister(' + VarToJSON([El]) + ');', 'TExtQuickTip');
  Result := Self;
end;

function TExtQuickTip.Unregister(El: TExtElement): TExtFunction;
begin
  JSCode(JSName + '.unregister(' + VarToJSON([El, false]) + ');', 'TExtQuickTip');
  Result := Self;
end;

end.

