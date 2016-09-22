unit Ext.Form;

interface

uses
  StrUtils, Kitto.Ext, Ext.Util, Ext.Base, Ext.Data;

type
  TExtFormAction = class;
  TExtFormVTypesSingleton = class;
  TExtFormBasicForm = class;
  TExtUxGridRecordForm = class;
  TExtFormActionSubmit = class;
  TExtFormActionLoad = class;
  TExtFormActionDirectLoad = class;
  TExtFormActionDirectSubmit = class;
  TExtFormField = class;
  TExtFormLabel = class;
  TExtFormHidden = class;
  TExtFormHtmlEditor = class;
  TExtUxCodePress = class;
  TExtFormTextField = class;
  TExtFormSliderField = class;
  TExtFormDisplayField = class;
  TExtFormCompositeField = class;
  TExtFormCheckbox = class;
  TExtFormCheckboxGroup = class;
  TExtFormTextArea = class;
  TExtFormTriggerField = class;
  TExtFormNumberField = class;
  TExtFormFieldContainer = class;
  TExtFormFieldSet = class;
  TExtFormFormPanel = class;
  TExtFormRadioGroup = class;
  TExtFormRadio = class;
  TExtFormDateField = class;
  TExtFormComboBox = class;
  TExtFormTwinTriggerField = class;
  TExtFormTimeField = class;
  TExtUxFormLovCombo = class;

  TExtFormAction = class(TExtFunction)
  private
    FFailure: TExtFunction;
    FMethod: string;
    FParams: string;
    FReset: Boolean;
    FScope: TExtObject;
    FSubmitEmptyText: Boolean;
    FSuccess: TExtFunction;
    FTimeout: Integer;
    FUrl: string;
    FWaitMsg: string;
    FWaitTitle: string;
    FFailureType: string;
    FResponse: TExtObject;
    FResultJS: TExtObject;
    FTypeJS: string;
    procedure SetFailure(const AValue: TExtFunction);
    procedure SetFMethod(Value: string);
    procedure SetFParams(Value: string);
    procedure SetFReset(Value: Boolean);
    procedure SetFScope(Value: TExtObject);
    procedure SetFSubmitEmptyText(Value: Boolean);
    procedure SetSuccess(const AValue: TExtFunction);
    procedure SetTimeout(const AValue: Integer);
    procedure SetUrl(const AValue: string);
    procedure SetWaitMsg(const AValue: string);
    procedure SetWaitTitle(const AValue: string);
    procedure SetFFailureType(Value: string);
    procedure SetFResponse(Value: TExtObject);
    procedure SetFResultJS(Value: TExtObject);
    procedure SetFTypeJS(Value: string);
  public
    class function JSClassName: string; override;
    class function CLIENT_INVALID: string;
    class function CONNECT_FAILURE: string;
    class function LOAD_FAILURE: string;
    class function SERVER_INVALID: string;
    property Failure: TExtFunction read FFailure write SetFailure;
    property Method: string read FMethod write SetFMethod;
    property Params: string read FParams write SetFParams;
    property Reset: Boolean read FReset write SetFReset;
    property Scope: TExtObject read FScope write SetFScope;
    property SubmitEmptyText: Boolean read FSubmitEmptyText
      write SetFSubmitEmptyText;
    property Success: TExtFunction read FSuccess write SetSuccess;
    property Timeout: Integer read FTimeout write SetTimeout;
    property Url: string read FUrl write SetUrl;
    property WaitMsg: string read FWaitMsg write SetWaitMsg;
    property WaitTitle: string read FWaitTitle write SetWaitTitle;
    property FailureType: string read FFailureType write SetFFailureType;
    property Response: TExtObject read FResponse write SetFResponse;
    property ResultJS: TExtObject read FResultJS write SetFResultJS;
    property TypeJS: string read FTypeJS write SetFTypeJS;
  end;

  TExtFormVTypesSingleton = class(TExtFunction)
  private
    FAlphaMask: string;
    FAlphaText: string;
    FAlphanumMask: string;
    FAlphanumText: string;
    FEmailMask: string;
    FEmailText: string;
    FUrlText: string;
    procedure SetFAlphaMask(Value: string);
    procedure SetFAlphaText(Value: string);
    procedure SetFAlphanumMask(Value: string);
    procedure SetFAlphanumText(Value: string);
    procedure SetFEmailMask(Value: string);
    procedure SetFEmailText(Value: string);
    procedure SetFUrlText(Value: string);
  public
    class function JSClassName: string; override;
    function Alpha(Value: string): TExtFunction;
    function Alphanum(Value: string): TExtFunction;
    function Email(Value: string): TExtFunction;
    function Url(Value: string): TExtFunction;
    property AlphaMask: string read FAlphaMask write SetFAlphaMask;
    property AlphaText: string read FAlphaText write SetFAlphaText;
    property AlphanumMask: string read FAlphanumMask write SetFAlphanumMask;
    property AlphanumText: string read FAlphanumText write SetFAlphanumText;
    property EmailMask: string read FEmailMask write SetFEmailMask;
    property EmailText: string read FEmailText write SetFEmailText;
    property UrlText: string read FUrlText write SetFUrlText;
  end;

  // Procedural types for events TExtFormBasicForm
  TExtFormBasicFormOnActioncomplete = procedure(This: TExtFormBasicForm;
    Action: TExtAction) of object;
  TExtFormBasicFormOnActionfailed = procedure(This: TExtFormBasicForm;
    Action: TExtAction) of object;
  TExtFormBasicFormOnBeforeaction = procedure(This: TExtFormBasicForm;
    Action: TExtAction) of object;

  TExtFormBasicForm = class(TExtUtilObservable)
  private
    FApi: TExtObject;
    FBaseParams: TExtObject;
    FErrorReader: TExtDataDataReader;
    FFileUpload: Boolean;
    FMethod: string;
    FParamOrder: TExtObjectList;
    FParamOrderString: string;
    FParamsAsHash: Boolean;
    FReader: TExtDataDataReader;
    FStandardSubmit: Boolean;
    FTimeout: Integer;
    FTrackResetOnLoad: Boolean;
    FUrl: string;
    FWaitTitle: string; // 'Please Wait...'
    FItems: TExtObjectList;
    FWaitMsgTarget: string;
    FOnActioncomplete: TExtFormBasicFormOnActioncomplete;
    FOnActionfailed: TExtFormBasicFormOnActionfailed;
    FOnBeforeaction: TExtFormBasicFormOnBeforeaction;
    procedure SetFApi(Value: TExtObject);
    procedure SetFBaseParams(Value: TExtObject);
    procedure SetFErrorReader(Value: TExtDataDataReader);
    procedure SetFFileUpload(Value: Boolean);
    procedure SetFMethod(Value: string);
    procedure SetFParamOrder(Value: TExtObjectList);
    procedure SetFParamOrderString(Value: string);
    procedure SetFParamsAsHash(Value: Boolean);
    procedure SetFReader(Value: TExtDataDataReader);
    procedure SetFStandardSubmit(Value: Boolean);
    procedure SetFTimeout(Value: Integer);
    procedure SetFTrackResetOnLoad(Value: Boolean);
    procedure SetUrl(const AValue: string);
    procedure SetFWaitTitle(Value: string);
    procedure SetFItems(Value: TExtObjectList);
    procedure SetFWaitMsgTarget(Value: string);
    procedure SetFOnActioncomplete(Value: TExtFormBasicFormOnActioncomplete);
    procedure SetFOnActionfailed(Value: TExtFormBasicFormOnActionfailed);
    procedure SetFOnBeforeaction(Value: TExtFormBasicFormOnBeforeaction);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function Add(Fields: TExtObjectList = nil): TExtFunction;
    function ApplyIfToFields(Values: TExtObject): TExtFunction;
    function ApplyToFields(Values: TExtObject): TExtFunction;
    function CleanDestroyed: TExtFunction;
    function ClearInvalid: TExtFunction;
    function DoAction(ActionName: string; Options: TExtObject = nil)
      : TExtFunction; overload;
    function DoAction(ActionName: TExtObject; Options: TExtObject = nil)
      : TExtFunction; overload;
    function FindField(Id: string): TExtFunction;
    function GetEl: TExtFunction;
    function GetFieldValues(const ADirtyOnly: Boolean = False): TExtFunction;
    function GetValues(const AAsString: Boolean = False): TExtFunction;
    function IsDirty: TExtFunction;
    function IsValid: TExtFunction;
    function Load(const AOptions: TExtObject): TExtFunction;
    function LoadRecord(RecordJS: TExtDataRecord): TExtFunction;
    function MarkInvalid(Errors: TExtObjectList): TExtFunction; overload;
    function MarkInvalid(Errors: TExtObject): TExtFunction; overload;
    function Remove(Field: TExtFormField): TExtFunction;
    function Render: TExtFunction;
    function Reset: TExtFunction;
    function SetValues(Values: TExtObjectList): TExtFunction; overload;
    function SetValues(Values: TExtObject): TExtFunction; overload;
    function Submit(const AOptions: TExtObject): TExtFunction;
    function UpdateRecord(RecordJS: TExtDataRecord): TExtFunction;
    property Api: TExtObject read FApi write SetFApi;
    property BaseParams: TExtObject read FBaseParams write SetFBaseParams;
    property ErrorReader: TExtDataDataReader read FErrorReader
      write SetFErrorReader;
    property FileUpload: Boolean read FFileUpload write SetFFileUpload;
    property Method: string read FMethod write SetFMethod;
    property ParamOrder: TExtObjectList read FParamOrder write SetFParamOrder;
    property ParamOrderString: string read FParamOrderString
      write SetFParamOrderString;
    property ParamsAsHash: Boolean read FParamsAsHash write SetFParamsAsHash;
    property Reader: TExtDataDataReader read FReader write SetFReader;
    property StandardSubmit: Boolean read FStandardSubmit
      write SetFStandardSubmit;
    property Timeout: Integer read FTimeout write SetFTimeout;
    property TrackResetOnLoad: Boolean read FTrackResetOnLoad
      write SetFTrackResetOnLoad;
    property Url: string read FUrl write SetUrl;
    property WaitTitle: string read FWaitTitle write SetFWaitTitle;
    property Items: TExtObjectList read FItems write SetFItems;
    property WaitMsgTarget: string read FWaitMsgTarget write SetFWaitMsgTarget;
    property OnActioncomplete: TExtFormBasicFormOnActioncomplete
      read FOnActioncomplete write SetFOnActioncomplete;
    property OnActionfailed: TExtFormBasicFormOnActionfailed
      read FOnActionfailed write SetFOnActionfailed;
    property OnBeforeaction: TExtFormBasicFormOnBeforeaction
      read FOnBeforeaction write SetFOnBeforeaction;
  end;

  TExtUxGridRecordForm = class(TExtUtilObservable)
  private
    FCancelIconCls: string; // 'icon-cancel'
    FCancelText: string; // 'Cancel'
    FColumnCount: Integer; // 1
    FDirtyRowCls: string; // 'ux-grid3-dirty-row'
    FIconCls: string;
    FOkIconCls: string; // 'icon-ok'
    FOkText: string; // 'OK'
    FNewRowCls: string; // 'ux-grid3-new-row'
    FTitle: string;
    FShowButtons: Boolean; // true
    FIgnoreFields: TExtObject;
    FReadonlyFields: TExtObject;
    FDisabledFields: TExtObject;
    FFormConfig: TExtObject;
    procedure SetFCancelIconCls(Value: string);
    procedure SetFCancelText(Value: string);
    procedure SetFColumnCount(Value: Integer);
    procedure SetFDirtyRowCls(Value: string);
    procedure SetFIconCls(Value: string);
    procedure SetFOkIconCls(Value: string);
    procedure SetFOkText(Value: string);
    procedure SetFNewRowCls(Value: string);
    procedure SetFTitle(Value: string);
    procedure SetFShowButtons(Value: Boolean);
    procedure SetFIgnoreFields(Value: TExtObject);
    procedure SetFReadonlyFields(Value: TExtObject);
    procedure SetFDisabledFields(Value: TExtObject);
    procedure SetFFormConfig(Value: TExtObject);
  public
    class function JSClassName: string; override;
    function Show(DataRecord: TExtDataRecord; AnimEl: TExtElement = nil)
      : TExtFunction;
    property CancelIconCls: string read FCancelIconCls write SetFCancelIconCls;
    property CancelText: string read FCancelText write SetFCancelText;
    property ColumnCount: Integer read FColumnCount write SetFColumnCount;
    property DirtyRowCls: string read FDirtyRowCls write SetFDirtyRowCls;
    property IconCls: string read FIconCls write SetFIconCls;
    property OkIconCls: string read FOkIconCls write SetFOkIconCls;
    property OkText: string read FOkText write SetFOkText;
    property NewRowCls: string read FNewRowCls write SetFNewRowCls;
    property Title: string read FTitle write SetFTitle;
    property ShowButtons: Boolean read FShowButtons write SetFShowButtons;
    property IgnoreFields: TExtObject read FIgnoreFields write SetFIgnoreFields;
    property ReadonlyFields: TExtObject read FReadonlyFields
      write SetFReadonlyFields;
    property DisabledFields: TExtObject read FDisabledFields
      write SetFDisabledFields;
    property FormConfig: TExtObject read FFormConfig write SetFFormConfig;
  end;

  TExtFormActionSubmit = class(TExtFormAction)
  private
    FClientValidation: Boolean;
    FErrorReader: TExtDataDataReader;
    procedure SetFClientValidation(Value: Boolean);
    procedure SetFErrorReader(Value: TExtDataDataReader);
  public
    class function JSClassName: string; override;
    property ClientValidation: Boolean read FClientValidation
      write SetFClientValidation;
    property ErrorReader: TExtDataDataReader read FErrorReader
      write SetFErrorReader;
  end;

  TExtFormActionLoad = class(TExtFormAction)
  public
    class function JSClassName: string; override;
  end;

  TExtFormActionDirectLoad = class(TExtFormActionLoad)
  public
    class function JSClassName: string; override;
  end;

  TExtFormActionDirectSubmit = class(TExtFormActionSubmit)
  public
    class function JSClassName: string; override;
  end;

  // Procedural types for events TExtFormField
  TExtFormFieldOnBlur = procedure(This: TExtFormField) of object;
  TExtFormFieldOnChange = procedure(This: TExtFormField; NewValue: string;
    OldValue: string) of object;
  TExtFormFieldOnFocus = procedure(This: TExtFormField) of object;
  TExtFormFieldOnInvalid = procedure(This: TExtFormField; Msg: string)
    of object;
  TExtFormFieldOnSpecialkey = procedure(This: TExtFormField;
    E: TExtEventObjectSingleton) of object;
  TExtFormFieldOnValid = procedure(This: TExtFormField) of object;

  // Enumerated types for properties
  TExtFormFieldInputType = (itText, itButton, itCheckbox, itFile, itHidden,
    itImage, itPassword, itRadio, itReset, itSubmit);

  TExtFormField = class(TExtBoxComponent)
  private
    FAutoCreate: string;
    FCls: string;
    FDisabled: Boolean;
    FFieldClass: string; // 'x-form-field'
    FFocusClass: string; // 'x-form-focus'
    FInputType: TExtFormFieldInputType; // 'text'
    FInvalidClass: string; // 'x-form-invalid'
    FInvalidText: string; // 'The value in this field is invalid'
    FMsgFx: string; // 'normal'
    FMsgTarget: string;
    FName: string;
    FPreventMark: Boolean;
    FReadOnly: Boolean;
    FSubmitValue: Boolean;
    FTabIndex: Integer;
    FValidateOnBlur: Boolean; // true
    FValidationDelay: Integer; // 250
    FValidationEvent: string; // 'keyup'
    FValidationEventBoolean: Boolean;
    FValue: string;
    FLabelJS: TExtElement;
    FOriginalValue: string;
    FStartValue: string;
    FOnBlur: TExtFormFieldOnBlur;
    FOnChange: TExtFormFieldOnChange;
    FOnFocus: TExtFormFieldOnFocus;
    FOnInvalid: TExtFormFieldOnInvalid;
    FOnSpecialkey: TExtFormFieldOnSpecialkey;
    FOnValid: TExtFormFieldOnValid;
    FLabelAlign: TExtContainerLabelAlign;
    FLabelWidth: Integer;
    procedure SetAutoCreate(const AValue: string);
    procedure SetCls(const AValue: string);
    procedure SetDisabled(const AValue: Boolean);
    procedure SetFFieldClass(Value: string);
    procedure SetFFocusClass(Value: string);
    procedure SetInputType(const AValue: TExtFormFieldInputType);
    procedure SetFInvalidClass(Value: string);
    procedure SetFInvalidText(Value: string);
    procedure SetFMsgFx(Value: string);
    procedure SetMsgTarget(const AValue: string);
    procedure _SetName(const AValue: string);
    procedure SetFPreventMark(Value: Boolean);
    procedure _SetReadOnly(const AValue: Boolean);
    procedure SetSubmitValue(const AValue: Boolean);
    procedure SetFTabIndex(Value: Integer);
    procedure SetFValidateOnBlur(Value: Boolean);
    procedure SetFValidationDelay(Value: Integer);
    procedure SetFValidationEvent(Value: string);
    procedure SetFValidationEventBoolean(Value: Boolean);
    procedure _SetValue(const AValue: string);
    procedure SetFLabelJS(Value: TExtElement);
    procedure SetFOriginalValue(Value: string);
    procedure SetStartValue(const AValue: string);
    procedure SetFOnBlur(Value: TExtFormFieldOnBlur);
    procedure SetOnChange(const AValue: TExtFormFieldOnChange);
    procedure SetFOnFocus(Value: TExtFormFieldOnFocus);
    procedure SetFOnInvalid(Value: TExtFormFieldOnInvalid);
    procedure SetFOnSpecialkey(Value: TExtFormFieldOnSpecialkey);
    procedure SetFOnValid(Value: TExtFormFieldOnValid);
    procedure SetLabelAlign(const AValue: TExtContainerLabelAlign);
    procedure SetLabelWidth(const AValue: Integer);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function ClearInvalid: TExtFunction;
    function GetActiveError: TExtFunction;
    function GetErrors: TExtFunction;
    function GetName: TExtFunction;
    function GetRawValue: TExtFunction;
    function GetValue: TExtFunction;
    function IsDirty: TExtFunction;
    function IsValid(PreventMark: Boolean): TExtFunction;
    function MarkInvalid(Msg: string = ''): TExtFunction;
    function ProcessValue(Value: string): TExtFunction;
    function Reset: TExtFunction;
    function SetActiveError(Msg: string; SuppressEvent: Boolean): TExtFunction;
    function SetRawValue(const AValue: string): TExtFunction;
    function SetReadOnly(const AReadOnly: Boolean): TExtFunction;
    function SetValue(const AValue: string): TExtFunction;
    function UnsetActiveError(SuppressEvent: Boolean): TExtFunction;
    function Validate: TExtFunction;
    function ValidateValue(The: string): TExtFunction;
    property AutoCreate: string read FAutoCreate write SetAutoCreate;
    property Cls: string read FCls write SetCls;
    property Disabled: Boolean read FDisabled write SetDisabled;
    property FieldClass: string read FFieldClass write SetFFieldClass;
    property FocusClass: string read FFocusClass write SetFFocusClass;
    property InputType: TExtFormFieldInputType read FInputType
      write SetInputType;
    property InvalidClass: string read FInvalidClass write SetFInvalidClass;
    property InvalidText: string read FInvalidText write SetFInvalidText;
    property LabelAlign: TExtContainerLabelAlign read FLabelAlign write SetLabelAlign;
    property LabelWidth: Integer read FLabelWidth write SetLabelWidth;
    property MsgFx: string read FMsgFx write SetFMsgFx;
    property MsgTarget: string read FMsgTarget write SetMsgTarget;
    property Name: string read FName write _SetName;
    property PreventMark: Boolean read FPreventMark write SetFPreventMark;
    property &ReadOnly: Boolean read FReadOnly write _SetReadOnly;
    property SubmitValue: Boolean read FSubmitValue write SetSubmitValue;
    property TabIndex: Integer read FTabIndex write SetFTabIndex;
    property ValidateOnBlur: Boolean read FValidateOnBlur
      write SetFValidateOnBlur;
    property ValidationDelay: Integer read FValidationDelay
      write SetFValidationDelay;
    property ValidationEvent: string read FValidationEvent
      write SetFValidationEvent;
    property ValidationEventBoolean: Boolean read FValidationEventBoolean
      write SetFValidationEventBoolean;
    property Value: string read FValue write _SetValue;
    property LabelJS: TExtElement read FLabelJS write SetFLabelJS;
    property OriginalValue: string read FOriginalValue write SetFOriginalValue;
    property StartValue: string read FStartValue write SetStartValue;
    property OnBlur: TExtFormFieldOnBlur read FOnBlur write SetFOnBlur;
    property OnChange: TExtFormFieldOnChange read FOnChange write SetOnChange;
    property OnFocus: TExtFormFieldOnFocus read FOnFocus write SetFOnFocus;
    property OnInvalid: TExtFormFieldOnInvalid read FOnInvalid
      write SetFOnInvalid;
    property OnSpecialkey: TExtFormFieldOnSpecialkey read FOnSpecialkey
      write SetFOnSpecialkey;
    property OnValid: TExtFormFieldOnValid read FOnValid write SetFOnValid;
  end;

  TExtFormLabel = class(TExtBoxComponent)
  private
    FForId: string;
    FHtml: string;
    FText: string;
    procedure SetFForId(Value: string);
    procedure SetHtml(AValue: string);
    procedure _SetText(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function SetText(const AText: string; const AEncode: Boolean = False): TExtFunction;
    property ForId: string read FForId write SetFForId;
    property Html: string read FHtml write SetHtml;
    property Text: string read FText write _SetText;
  end;

  TExtFormHidden = class(TExtFormField)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  // Procedural types for events TExtFormHtmlEditor
  TExtFormHtmlEditorOnActivate = procedure(This: TExtFormHtmlEditor) of object;
  TExtFormHtmlEditorOnBeforepush = procedure(This: TExtFormHtmlEditor;
    Html: string) of object;
  TExtFormHtmlEditorOnBeforesync = procedure(This: TExtFormHtmlEditor;
    Html: string) of object;
  TExtFormHtmlEditorOnEditmodechange = procedure(This: TExtFormHtmlEditor;
    SourceEdit: Boolean) of object;
  TExtFormHtmlEditorOnInitialize = procedure(This: TExtFormHtmlEditor)
    of object;
  TExtFormHtmlEditorOnPush = procedure(This: TExtFormHtmlEditor; Html: string)
    of object;
  TExtFormHtmlEditorOnSync = procedure(This: TExtFormHtmlEditor; Html: string)
    of object;

  TExtFormHtmlEditor = class(TExtFormField)
  private
    FCreateLinkText: string;
    FDefaultLinkValue: string;
    FDefaultValue: string;
    FEnableAlignments: Boolean; // true
    FEnableColors: Boolean; // true
    FEnableFont: Boolean; // true
    FEnableFontSize: Boolean; // true
    FEnableFormat: Boolean; // true
    FEnableLinks: Boolean; // true
    FEnableLists: Boolean; // true
    FEnableSourceEdit: Boolean; // true
    FFontFamilies: TExtObjectList;
    FButtonTips: TExtObject;
    FOnActivate: TExtFormHtmlEditorOnActivate;
    FOnBeforepush: TExtFormHtmlEditorOnBeforepush;
    FOnBeforesync: TExtFormHtmlEditorOnBeforesync;
    FOnEditmodechange: TExtFormHtmlEditorOnEditmodechange;
    FOnInitialize: TExtFormHtmlEditorOnInitialize;
    FOnPush: TExtFormHtmlEditorOnPush;
    FOnSync: TExtFormHtmlEditorOnSync;
    procedure SetFCreateLinkText(Value: string);
    procedure SetFDefaultLinkValue(Value: string);
    procedure SetFDefaultValue(Value: string);
    procedure SetFEnableAlignments(Value: Boolean);
    procedure SetFEnableColors(Value: Boolean);
    procedure SetFEnableFont(Value: Boolean);
    procedure SetFEnableFontSize(Value: Boolean);
    procedure SetFEnableFormat(Value: Boolean);
    procedure SetFEnableLinks(Value: Boolean);
    procedure SetFEnableLists(Value: Boolean);
    procedure SetFEnableSourceEdit(Value: Boolean);
    procedure SetFFontFamilies(Value: TExtObjectList);
    procedure SetFButtonTips(Value: TExtObject);
    procedure SetFOnActivate(Value: TExtFormHtmlEditorOnActivate);
    procedure SetFOnBeforepush(Value: TExtFormHtmlEditorOnBeforepush);
    procedure SetFOnBeforesync(Value: TExtFormHtmlEditorOnBeforesync);
    procedure SetFOnEditmodechange(Value: TExtFormHtmlEditorOnEditmodechange);
    procedure SetFOnInitialize(Value: TExtFormHtmlEditorOnInitialize);
    procedure SetFOnPush(Value: TExtFormHtmlEditorOnPush);
    procedure SetFOnSync(Value: TExtFormHtmlEditorOnSync);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function CleanHtml(Html: string): TExtFunction;
    function ExecCmd(Cmd: string; Value: string = ''): TExtFunction; overload;
    function ExecCmd(Cmd: string; Value: Boolean): TExtFunction; overload;
    function GetDocMarkup: TExtFunction;
    function GetToolbar: TExtFunction;
    function InsertAtCursor(Text: string): TExtFunction;
    function PushValue: TExtFunction;
    function RelayCmd(Cmd: string; Value: string = ''): TExtFunction; overload;
    function RelayCmd(Cmd: string; Value: Boolean): TExtFunction; overload;
    function SyncValue: TExtFunction;
    function ToggleSourceEdit(SourceEdit: Boolean = false): TExtFunction;
    function UpdateToolbar: TExtFunction;
    property CreateLinkText: string read FCreateLinkText
      write SetFCreateLinkText;
    property DefaultLinkValue: string read FDefaultLinkValue
      write SetFDefaultLinkValue;
    property DefaultValue: string read FDefaultValue write SetFDefaultValue;
    property EnableAlignments: Boolean read FEnableAlignments
      write SetFEnableAlignments;
    property EnableColors: Boolean read FEnableColors write SetFEnableColors;
    property EnableFont: Boolean read FEnableFont write SetFEnableFont;
    property EnableFontSize: Boolean read FEnableFontSize
      write SetFEnableFontSize;
    property EnableFormat: Boolean read FEnableFormat write SetFEnableFormat;
    property EnableLinks: Boolean read FEnableLinks write SetFEnableLinks;
    property EnableLists: Boolean read FEnableLists write SetFEnableLists;
    property EnableSourceEdit: Boolean read FEnableSourceEdit
      write SetFEnableSourceEdit;
    property FontFamilies: TExtObjectList read FFontFamilies
      write SetFFontFamilies;
    property ButtonTips: TExtObject read FButtonTips write SetFButtonTips;
    property OnActivate: TExtFormHtmlEditorOnActivate read FOnActivate
      write SetFOnActivate;
    property OnBeforepush: TExtFormHtmlEditorOnBeforepush read FOnBeforepush
      write SetFOnBeforepush;
    property OnBeforesync: TExtFormHtmlEditorOnBeforesync read FOnBeforesync
      write SetFOnBeforesync;
    property OnEditmodechange: TExtFormHtmlEditorOnEditmodechange
      read FOnEditmodechange write SetFOnEditmodechange;
    property OnInitialize: TExtFormHtmlEditorOnInitialize read FOnInitialize
      write SetFOnInitialize;
    property OnPush: TExtFormHtmlEditorOnPush read FOnPush write SetFOnPush;
    property OnSync: TExtFormHtmlEditorOnSync read FOnSync write SetFOnSync;
  end;

  TExtUxCodePress = class(TExtFormField)
  private
    FAutoComplete: Boolean; // true
    FAutoResize: Boolean; // true
    FCode: string;
    FHeight: Integer;
    FLanguage: string; // 'pascal'
    FLineNumbers: Boolean; // true
    FPath: string;
    FReadOnly: Boolean;
    FSourceEl: string;
    FTrim: Boolean; // true
    FUrl: string;
    FWidth: Integer;
    procedure SetFAutoComplete(Value: Boolean);
    procedure SetFAutoResize(Value: Boolean);
    procedure _SetCode(const AValue: string);
    procedure SetFHeight(Value: Integer);
    procedure SetFLanguage(Value: string);
    procedure SetFLineNumbers(Value: Boolean);
    procedure SetFPath(Value: string);
    procedure SetFReadOnly(Value: Boolean);
    procedure SetFSourceEl(Value: string);
    procedure SetFTrim(Value: Boolean);
    procedure SetFUrl(Value: string);
    procedure SetFWidth(Value: Integer);
  public
    class function JSClassName: string; override;
    function Edit(Obj: TExtObject; Language: string): TExtFunction;
    function SetCode(const ACode: string): TExtFunction;
    function GetCode: TExtFunction;
    function GetLanguage: TExtFunction;
    function SetValue(Code: string): TExtFunction;
    function GetValue: TExtFunction;
    function Resize: TExtFunction;
    function ToggleAutoComplete: TExtFunction;
    function ToggleReadOnly: TExtFunction;
    function ToggleLineNumbers: TExtFunction;
    function ToggleEditor: TExtFunction;
    property AutoComplete: Boolean read FAutoComplete write SetFAutoComplete;
    property AutoResize: Boolean read FAutoResize write SetFAutoResize;
    property Code: string read FCode write _SetCode;
    property Height: Integer read FHeight write SetFHeight;
    property Language: string read FLanguage write SetFLanguage;
    property LineNumbers: Boolean read FLineNumbers write SetFLineNumbers;
    property Path: string read FPath write SetFPath;
    property readonly: Boolean read FReadOnly write SetFReadOnly;
    property SourceEl: string read FSourceEl write SetFSourceEl;
    property Trim: Boolean read FTrim write SetFTrim;
    property Url: string read FUrl write SetFUrl;
    property Width: Integer read FWidth write SetFWidth;
  end;

  // Procedural types for events TExtFormTextField
  TExtFormTextFieldOnAutosize = procedure(This: TExtFormTextField;
    Width: Integer) of object;
  TExtFormTextFieldOnKeydown = procedure(This: TExtFormTextField;
    E: TExtEventObjectSingleton) of object;
  TExtFormTextFieldOnKeypress = procedure(This: TExtFormTextField;
    E: TExtEventObjectSingleton) of object;
  TExtFormTextFieldOnKeyup = procedure(This: TExtFormTextField;
    E: TExtEventObjectSingleton) of object;

  TExtFormTextField = class(TExtFormField)
  private
    FAllowBlank: Boolean; // true
    FBlankText: string; // 'This field is required'
    FDisableKeyFilter: Boolean;
    FEmptyClass: string; // 'x-form-empty-field'
    FEmptyText: string;
    FEnableKeyEvents: Boolean;
    FGrow: Boolean;
    FGrowMax: Integer; // 800
    FGrowMin: Integer; // 30
    FMaskRe: string;
    FMaxLength: Integer;
    FMaxLengthText: string;
    // 'The maximum length for this field is {maxLength}'
    FMinLength: Integer; // 0
    FMinLengthText: string;
    // 'The minimum length for this field is {minLength}'
    FRegex: string;
    FRegexText: string;
    FSelectOnFocus: Boolean;
    FStripCharsRe: string;
    FValidator: TExtFunction;
    FVtype: string;
    FVtypeText: string;
    FOnAutosize: TExtFormTextFieldOnAutosize;
    FOnKeydown: TExtFormTextFieldOnKeydown;
    FOnKeypress: TExtFormTextFieldOnKeypress;
    FOnKeyup: TExtFormTextFieldOnKeyup;
    procedure SetAllowBlank(const AValue: Boolean);
    procedure SetFBlankText(Value: string);
    procedure SetFDisableKeyFilter(Value: Boolean);
    procedure SetFEmptyClass(Value: string);
    procedure SetEmptyText(const AValue: string);
    procedure SetEnableKeyEvents(const AValue: Boolean);
    procedure SetGrow(const AValue: Boolean);
    procedure SetFGrowMax(Value: Integer);
    procedure SetFGrowMin(Value: Integer);
    procedure SetFMaskRe(Value: string);
    procedure SetMaxLength(const AValue: Integer);
    procedure SetMaxLengthText(const AValue: string);
    procedure SetMinLength(const AValue: Integer);
    procedure SetMinLengthText(const AValue: string);
    procedure SetFRegex(Value: string);
    procedure SetFRegexText(Value: string);
    procedure SetSelectOnFocus(const AValue: Boolean);
    procedure SetFStripCharsRe(Value: string);
    procedure SetFValidator(Value: TExtFunction);
    procedure SetVtype(const AValue: string);
    procedure SetFVtypeText(const AValue: string);
    procedure SetFOnAutosize(Value: TExtFormTextFieldOnAutosize);
    procedure SetFOnKeydown(Value: TExtFormTextFieldOnKeydown);
    procedure SetFOnKeypress(Value: TExtFormTextFieldOnKeypress);
    procedure SetFOnKeyup(Value: TExtFormTextFieldOnKeyup);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function AutoSize: TExtFunction;
    function GetErrors(Value: string): TExtFunction;
    function Reset: TExtFunction;
    function SelectText(Start: Integer = 0; EndJS: Integer = 0): TExtFunction;
    property AllowBlank: Boolean read FAllowBlank write SetAllowBlank;
    property BlankText: string read FBlankText write SetFBlankText;
    property DisableKeyFilter: Boolean read FDisableKeyFilter
      write SetFDisableKeyFilter;
    property EmptyClass: string read FEmptyClass write SetFEmptyClass;
    property EmptyText: string read FEmptyText write SetEmptyText;
    property EnableKeyEvents: Boolean read FEnableKeyEvents write SetEnableKeyEvents;
    property Grow: Boolean read FGrow write SetGrow;
    property GrowMax: Integer read FGrowMax write SetFGrowMax;
    property GrowMin: Integer read FGrowMin write SetFGrowMin;
    property MaskRe: string read FMaskRe write SetFMaskRe;
    property MaxLength: Integer read FMaxLength write SetMaxLength;
    property MaxLengthText: string read FMaxLengthText write SetMaxLengthText;
    property MinLength: Integer read FMinLength write SetMinLength;
    property MinLengthText: string read FMinLengthText write SetMinLengthText;
    property Regex: string read FRegex write SetFRegex;
    property RegexText: string read FRegexText write SetFRegexText;
    property SelectOnFocus: Boolean read FSelectOnFocus write SetSelectOnFocus;
    property StripCharsRe: string read FStripCharsRe write SetFStripCharsRe;
    property Validator: TExtFunction read FValidator write SetFValidator;
    property Vtype: string read FVtype write SetVtype;
    property VtypeText: string read FVtypeText write SetFVtypeText;
    property OnAutosize: TExtFormTextFieldOnAutosize read FOnAutosize
      write SetFOnAutosize;
    property OnKeydown: TExtFormTextFieldOnKeydown read FOnKeydown
      write SetFOnKeydown;
    property OnKeypress: TExtFormTextFieldOnKeypress read FOnKeypress
      write SetFOnKeypress;
    property OnKeyup: TExtFormTextFieldOnKeyup read FOnKeyup write SetFOnKeyup;
  end;

  TExtFormSliderField = class(TExtFormField)
  private
    FTipText: TExtFunction;
    FUseTips: Boolean;
    procedure SetFTipText(Value: TExtFunction);
    procedure SetFUseTips(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function GetValue: TExtFunction;
    function SetMaxValue(V: Integer): TExtFunction;
    function SetMinValue(V: Integer): TExtFunction;
    function SetValue(V: Integer; Animate: Boolean = false): TExtFunction;
    property TipText: TExtFunction read FTipText write SetFTipText;
    property UseTips: Boolean read FUseTips write SetFUseTips;
  end;

  TExtFormDisplayField = class(TExtFormField)
  private
    FFieldClass: string; // 'x-form-display-field'
    FHtmlEncode: Boolean;
    procedure SetFFieldClass(Value: string);
    procedure SetFHtmlEncode(Value: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property FieldClass: string read FFieldClass write SetFFieldClass;
    property HtmlEncode: Boolean read FHtmlEncode write SetFHtmlEncode;
  end;

  TExtFormCompositeField = class(TExtFormField)
  private
    FY: Integer;
    FDefaultMargins: string;
    FFieldErrors: TExtObjectList;
    FInnerCt: TExtContainer;
    FIsComposite: Boolean;
    FItems: TExtObjectList;
    FRendered: Boolean; // true
    procedure SetFY(Value: Integer);
    procedure SetFDefaultMargins(Value: string);
    procedure SetFFieldErrors(Value: TExtObjectList);
    procedure SetFInnerCt(Value: TExtContainer);
    procedure SetFIsComposite(Value: Boolean);
    procedure SetFItems(Value: TExtObjectList);
    procedure SetFRendered(Value: Boolean);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function BuildCombinedErrorMessage(Errors: TExtObjectList): TExtFunction;
    function BuildLabel(Segments: TExtObjectList): TExtFunction;
    function ClearInvalidChildren: TExtFunction;
    function IsDirty: TExtFunction;
    function OnFieldClearInvalid(Field: TExtFormField): TExtFunction;
    function OnFieldMarkInvalid(Field: TExtFormField; Message: string)
      : TExtFunction;
    function Reset: TExtFunction;
    function SortErrors: TExtFunction;
    function ValidateValue: TExtFunction;
    property Y: Integer read FY write SetFY;
    property DefaultMargins: string read FDefaultMargins
      write SetFDefaultMargins;
    property FieldErrors: TExtObjectList read FFieldErrors
      write SetFFieldErrors;
    property InnerCt: TExtContainer read FInnerCt write SetFInnerCt;
    property IsComposite: Boolean read FIsComposite write SetFIsComposite;
    property Items: TExtObjectList read FItems write SetFItems;
    property Rendered: Boolean read FRendered write SetFRendered;
  end;

  // Procedural types for events TExtFormCheckbox
  TExtFormCheckboxOnCheck = procedure(This: TExtFormCheckbox; Checked: Boolean)
    of object;

  TExtFormCheckbox = class(TExtFormField)
  private
    FAutoCreate: string; // 'input'
    FBoxLabel: string;
    FBoxLabel_: string;
    FChecked: Boolean;
    FFieldClass: string; // 'x-form-field'
    FFocusClass: string;
    FHandler: TExtFunction;
    FInputValue: string;
    FScope: TExtObject;
    FOnCheck: TExtFormCheckboxOnCheck;
    procedure SetFAutoCreate(Value: string);
    procedure SetBoxLabel(const AValue: string);
    procedure SetFBoxLabel_(Value: string);
    procedure SetChecked(const AValue: Boolean);
    procedure SetFFieldClass(Value: string);
    procedure SetFFocusClass(Value: string);
    procedure SetFHandler(Value: TExtFunction);
    procedure SetFInputValue(Value: string);
    procedure SetFScope(Value: TExtObject);
    procedure SetFOnCheck(Value: TExtFormCheckboxOnCheck);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetValue: TExtFunction;
    function SetValue(const AChecked: Boolean): TExtFunction; overload;
    function SetValue(const AChecked: string): TExtFunction; overload;
    property AutoCreate: string read FAutoCreate write SetFAutoCreate;
    property BoxLabel: string read FBoxLabel write SetBoxLabel;
    property BoxLabel_: string read FBoxLabel_ write SetFBoxLabel_;
    property Checked: Boolean read FChecked write SetChecked;
    property FieldClass: string read FFieldClass write SetFFieldClass;
    property FocusClass: string read FFocusClass write SetFFocusClass;
    property Handler: TExtFunction read FHandler write SetFHandler;
    property InputValue: string read FInputValue write SetFInputValue;
    property Scope: TExtObject read FScope write SetFScope;
    property OnCheck: TExtFormCheckboxOnCheck read FOnCheck write SetFOnCheck;
  end;

  // Procedural types for events TExtFormCheckboxGroup
  TExtFormCheckboxGroupOnChange = procedure(This: TExtFormCheckboxGroup;
    Checked: TExtObjectList) of object;

  TExtFormCheckboxGroup = class(TExtFormField)
  private
    FAllowBlank: Boolean; // true
    FBlankText: string; // 'You must select at least one item in this group'
    FColumns: string;
    FColumnsNumber: Integer;
    FColumnsArray: TExtObjectList;
    FItems: TExtObjectList;
    FVertical: Boolean;
    FOnChange: TExtFormCheckboxGroupOnChange;
    procedure SetFAllowBlank(Value: Boolean);
    procedure SetFBlankText(Value: string);
    procedure SetFColumns(Value: string);
    procedure SetFColumnsNumber(Value: Integer);
    procedure SetFColumnsArray(Value: TExtObjectList);
    procedure SetFItems(Value: TExtObjectList);
    procedure SetFVertical(Value: Boolean);
    procedure SetFOnChange(Value: TExtFormCheckboxGroupOnChange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetErrors: TExtFunction;
    function GetValue: TExtFunction;
    function SetValue(Id: string; Value: Boolean = false): TExtFunction;
    property AllowBlank: Boolean read FAllowBlank write SetFAllowBlank;
    property BlankText: string read FBlankText write SetFBlankText;
    property Columns: string read FColumns write SetFColumns;
    property ColumnsNumber: Integer read FColumnsNumber write SetFColumnsNumber;
    property ColumnsArray: TExtObjectList read FColumnsArray
      write SetFColumnsArray;
    property Items: TExtObjectList read FItems write SetFItems;
    property Vertical: Boolean read FVertical write SetFVertical;
    property OnChange: TExtFormCheckboxGroupOnChange read FOnChange
      write SetFOnChange;
  end;

  TExtFormTextArea = class(TExtFormTextField)
  private
    FAutoCreate: string;
    FGrowMax: Integer; // 1000
    FGrowMin: Integer; // 60
    FPreventScrollbars: Boolean;
    procedure SetFAutoCreate(Value: string);
    procedure SetFGrowMax(Value: Integer);
    procedure SetFGrowMin(Value: Integer);
    procedure SetFPreventScrollbars(Value: Boolean);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function AutoSize: TExtFunction;
    property AutoCreate: string read FAutoCreate write SetFAutoCreate;
    property GrowMax: Integer read FGrowMax write SetFGrowMax;
    property GrowMin: Integer read FGrowMin write SetFGrowMin;
    property PreventScrollbars: Boolean read FPreventScrollbars
      write SetFPreventScrollbars;
  end;

  TExtFormTriggerField = class(TExtFormTextField)
  private
    FAutoCreate: string;
    FEditable: Boolean; // true
    FHideTrigger: Boolean;
    FReadOnly: Boolean;
    FTriggerClass: string;
    FTriggerConfig: string;
    FWrapFocusClass: string;
    procedure SetFAutoCreate(Value: string);
    procedure _SetEditable(const AValue: Boolean);
    procedure SetFHideTrigger(Value: Boolean);
    procedure _SetReadOnly(const AValue: Boolean);
    procedure SetTriggerClass(const AValue: string);
    procedure SetFTriggerConfig(Value: string);
    procedure SetFWrapFocusClass(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function SetEditable(const AValue: Boolean): TExtFunction;
    function SetReadOnly(const AValue: Boolean): TExtFunction;
    property AutoCreate: string read FAutoCreate write SetFAutoCreate;
    property Editable: Boolean read FEditable write _SetEditable;
    property HideTrigger: Boolean read FHideTrigger write SetFHideTrigger;
    property ReadOnly: Boolean read FReadOnly write _SetReadOnly;
    property TriggerClass: string read FTriggerClass write SetTriggerClass;
    property TriggerConfig: string read FTriggerConfig write SetFTriggerConfig;
    property WrapFocusClass: string read FWrapFocusClass
      write SetFWrapFocusClass;
  end;

  TExtFormNumberField = class(TExtFormTextField)
  private
    FAllowDecimals: Boolean; // true
    FAllowNegative: Boolean; // true
    FBaseChars: string; // '0123456789'
    FDecimalPrecision: Integer; // 2
    FDecimalSeparator: string; // '.'
    FFieldClass: string; // 'x-form-field x-form-num-field'
    FMaxText: string; // 'The maximum value for this field is {maxValue}'
    FMaxValue: Integer;
    FMinText: string; // 'The minimum value for this field is {minValue}'
    FMinValue: Integer;
    FNanText: string; // '{value} is not a valid number'
    procedure SetAllowDecimals(const AValue: Boolean);
    procedure SetAllowNegative(AValue: Boolean);
    procedure SetFBaseChars(Value: string);
    procedure SetDecimalPrecision(const AValue: Integer);
    procedure SetDecimalSeparator(const AValue: string);
    procedure SetFFieldClass(Value: string);
    procedure SetMaxText(const AValue: string);
    procedure _SetMaxValue(const AValue: Integer);
    procedure SetMinText(const AValue: string);
    procedure _SetMinValue(const AValue: Integer);
    procedure SetNanText(const AValue: string);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetErrors(Value: string): TExtFunction;
    function SetMaxValue(const AValue: Integer): TExtFunction;
    function SetMinValue(const AValue: Integer): TExtFunction;
    property AllowDecimals: Boolean read FAllowDecimals write SetAllowDecimals;
    property AllowNegative: Boolean read FAllowNegative write SetAllowNegative;
    property BaseChars: string read FBaseChars write SetFBaseChars;
    property DecimalPrecision: Integer read FDecimalPrecision write SetDecimalPrecision;
    property DecimalSeparator: string read FDecimalSeparator write SetDecimalSeparator;
    property FieldClass: string read FFieldClass write SetFFieldClass;
    property MaxText: string read FMaxText write SetMaxText;
    property MaxValue: Integer read FMaxValue write _SetMaxValue;
    property MinText: string read FMinText write SetMinText;
    property MinValue: Integer read FMinValue write _SetMinValue;
    property NanText: string read FNanText write SetNanText;
  end;

  TExtFormFieldSet = class(TExtPanel)
  private
    FAnimCollapse: Boolean;
    FBaseCls: string; // 'x-fieldset'
    FCheckboxName: string; // '[checkbox id]-checkbox'
    FCheckboxToggle: string;
    FCollapsible: Boolean;
    FItemCls: string;
    FLabelWidth: Integer;
    FLayout: string; // 'form'
    procedure SetFAnimCollapse(Value: Boolean);
    procedure SetFBaseCls(Value: string);
    procedure SetFCheckboxName(Value: string);
    procedure SetFCheckboxToggle(Value: string);
    procedure SetCollapsible(const AValue: Boolean);
    procedure SetFItemCls(Value: string);
    procedure SetLabelWidth(AValue: Integer);
    procedure SetFLayout(Value: string);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function OnCheckClick: TExtFunction;
    property AnimCollapse: Boolean read FAnimCollapse write SetFAnimCollapse;
    property BaseCls: string read FBaseCls write SetFBaseCls;
    property CheckboxName: string read FCheckboxName write SetFCheckboxName;
    property CheckboxToggle: string read FCheckboxToggle
      write SetFCheckboxToggle;
    property Collapsible: Boolean read FCollapsible write SetCollapsible;
    property ItemCls: string read FItemCls write SetFItemCls;
    property LabelWidth: Integer read FLabelWidth write SetLabelWidth;
    property Layout: string read FLayout write SetFLayout;
  end;

  // Procedural types for events TExtFormFormPanel
  TExtFormFormPanelOnClientvalidation = procedure(This: TExtFormFormPanel;
    Valid: Boolean) of object;

  TExtFormFormPanel = class(TExtPanel)
  private
    FButtons: TExtObjectList;
    FForm: TExtFormBasicForm;
    FFormId: string;
    FHideLabels: Boolean;
    FItemCls: string;
    FLabelPad: Integer; // 5
    FLabelSeparator: string;
    FLayout: string;
    FMinButtonWidth: Integer; // 75
    FMonitorPoll: Integer; // 200
    FMonitorValid: Boolean;
    FFileUpload: Boolean;
    FOnClientvalidation: TExtFormFormPanelOnClientvalidation;
    procedure SetFButtons(Value: TExtObjectList);
    procedure SetFFormId(Value: string);
    procedure SetFHideLabels(Value: Boolean);
    procedure SetFItemCls(Value: string);
    procedure SetFLabelPad(Value: Integer);
    procedure SetLabelSeparator(const AValue: string);
    procedure SetFLayout(Value: string);
    procedure SetFMinButtonWidth(Value: Integer);
    procedure SetFMonitorPoll(Value: Integer);
    procedure SetMonitorValid(const AValue: Boolean);
    procedure SetFileUpload(const AValue: Boolean);
    procedure SetFOnClientvalidation
      (Value: TExtFormFormPanelOnClientvalidation);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetForm: TExtFormBasicForm;
    function Load(const AOptions: TExtObject): TExtFunction;
    function StartMonitoring: TExtFunction;
    function StopMonitoring: TExtFunction;
    property Buttons: TExtObjectList read FButtons write SetFButtons;
    property Form: TExtFormBasicForm read FForm;
    property FormId: string read FFormId write SetFFormId;
    property HideLabels: Boolean read FHideLabels write SetFHideLabels;
    property ItemCls: string read FItemCls write SetFItemCls;
    property LabelPad: Integer read FLabelPad write SetFLabelPad;
    property LabelSeparator: string read FLabelSeparator
      write SetLabelSeparator;
    property LayoutString: string read FLayout write SetFLayout;
    property MinButtonWidth: Integer read FMinButtonWidth
      write SetFMinButtonWidth;
    property MonitorPoll: Integer read FMonitorPoll write SetFMonitorPoll;
    property MonitorValid: Boolean read FMonitorValid write SetMonitorValid;
    property FileUpload: Boolean read FFileUpload write SetFileUpload;
    property OnClientvalidation: TExtFormFormPanelOnClientvalidation
      read FOnClientvalidation write SetFOnClientvalidation;
  end;

  // Procedural types for events TExtFormRadioGroup
  TExtFormRadioGroupOnChange = procedure(This: TExtFormRadioGroup;
    Checked: TExtFormRadio) of object;

  TExtFormRadioGroup = class(TExtFormCheckboxGroup)
  private
    FAllowBlank: Boolean; // true
    FBlankText: string; // 'You must select one item in this group'
    FItems: TExtObjectList;
    FOnChange: TExtFormRadioGroupOnChange;
    procedure SetFAllowBlank(Value: Boolean);
    procedure SetFBlankText(Value: string);
    procedure SetFItems(Value: TExtObjectList);
    procedure SetFOnChange(Value: TExtFormRadioGroupOnChange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetValue: TExtFunction;
    function OnSetValue(Id: string; Value: Boolean): TExtFunction; overload;
    function OnSetValue(Id: TExtFormRadio; Value: Boolean)
      : TExtFunction; overload;
    property AllowBlank: Boolean read FAllowBlank write SetFAllowBlank;
    property BlankText: string read FBlankText write SetFBlankText;
    property Items: TExtObjectList read FItems write SetFItems;
    property OnChange: TExtFormRadioGroupOnChange read FOnChange
      write SetFOnChange;
  end;

  TExtFormRadio = class(TExtFormCheckbox)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function GetGroupValue: TExtFunction;
    function SetValue(Value: string): TExtFunction; overload;
    function SetValue(Value: Boolean): TExtFunction; overload;
  end;

  // Procedural types for events TExtFormDateField
  TExtFormDateFieldOnSelect = procedure(This: TExtFormDateField;
    Date: TDateTime) of object;

  TExtFormDateField = class(TExtFormTriggerField)
  private
    FAltFormats: string;
    // 'm/d/Y/n/j/Y/n/j/y/m/j/y/n/d/y/m/j/Y/n/d/Y/m-d-y/m-d-Y/m/d/m-d/md/mdy/mdY/d/Y-m-d'
    FAutoCreate: string;
    FDisabledDates: TExtObjectList;
    FDisabledDatesText: string; // 'Disabled'
    FDisabledDays: TExtObjectList;
    FDisabledDaysText: string; // 'Disabled'
    FFormat: string; // 'm/d/Y'
    FInvalidText: string;
    // '{value} is not a valid date - it must be in the format {format}'
    FMaxText: string; // 'The date in this field must be before {maxValue}'
    FMaxValue: TDateTime;
    FMaxValueString: string;
    FMinText: string; // 'The date in this field must be after {minValue}'
    FMinValue: TDateTime;
    FMinValueString: string;
    FShowToday: Boolean; // true
    FTriggerClass: string; // 'x-form-date-trigger'
    FOnSelect: TExtFormDateFieldOnSelect;
    procedure SetAltFormats(const AValue: string);
    procedure SetFAutoCreate(Value: string);
    procedure _SetDisabledDates(const AValue: TExtObjectList);
    procedure SetFDisabledDatesText(Value: string);
    procedure _SetDisabledDays(const AValue: TExtObjectList);
    procedure SetFDisabledDaysText(Value: string);
    procedure SetFormat(const AValue: string);
    procedure SetFInvalidText(Value: string);
    procedure SetFMaxText(Value: string);
    procedure _SetMaxValue(const AValue: TDateTime);
    procedure SetFMaxValueString(Value: string);
    procedure SetFMinText(Value: string);
    procedure _SetMinValue(const AValue: TDateTime);
    procedure SetFMinValueString(Value: string);
    procedure SetFShowToday(Value: Boolean);
    procedure SetFTriggerClass(Value: string);
    procedure SetFOnSelect(Value: TExtFormDateFieldOnSelect);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetErrors(Value: string): TExtFunction;
    function GetValue: TExtFunction;
    function SetDisabledDates(const ADisabledDates: TExtObjectList): TExtFunction;
    function SetDisabledDays(const ADisabledDays: TExtObjectList): TExtFunction;
    function SetMaxValue(const AValue: TDateTime): TExtFunction;
    function SetMinValue(const AValue: TDateTime): TExtFunction;
    function SetValue(const ADate: string): TExtFunction; overload;
    function SetValue(const ADate: TDateTime): TExtFunction; overload;
    property AltFormats: string read FAltFormats write SetAltFormats;
    property AutoCreate: string read FAutoCreate write SetFAutoCreate;
    property DisabledDates: TExtObjectList read FDisabledDates
      write _SetDisabledDates;
    property DisabledDatesText: string read FDisabledDatesText
      write SetFDisabledDatesText;
    property DisabledDays: TExtObjectList read FDisabledDays
      write _SetDisabledDays;
    property DisabledDaysText: string read FDisabledDaysText
      write SetFDisabledDaysText;
    property Format: string read FFormat write SetFormat;
    property InvalidText: string read FInvalidText write SetFInvalidText;
    property MaxText: string read FMaxText write SetFMaxText;
    property MaxValue: TDateTime read FMaxValue write _SetMaxValue;
    property MaxValueString: string read FMaxValueString
      write SetFMaxValueString;
    property MinText: string read FMinText write SetFMinText;
    property MinValue: TDateTime read FMinValue write _SetMinValue;
    property MinValueString: string read FMinValueString
      write SetFMinValueString;
    property ShowToday: Boolean read FShowToday write SetFShowToday;
    property TriggerClass: string read FTriggerClass write SetFTriggerClass;
    property OnSelect: TExtFormDateFieldOnSelect read FOnSelect
      write SetFOnSelect;
  end;

  // Procedural types for events TExtFormComboBox
  TExtFormComboBoxOnBeforequery = procedure(QueryEvent: TExtObject) of object;
  TExtFormComboBoxOnBeforeselect = procedure(Combo: TExtFormComboBox;
    RecordJS: TExtDataRecord; Index: Integer) of object;
  TExtFormComboBoxOnCollapse = procedure(Combo: TExtFormComboBox) of object;
  TExtFormComboBoxOnExpand = procedure(Combo: TExtFormComboBox) of object;
  TExtFormComboBoxOnSelect = procedure(Combo: TExtFormComboBox;
    RecordJS: TExtDataRecord; Index: Integer) of object;

  TExtFormComboBox = class(TExtFormTriggerField)
  private
    FAllQuery: string;
    FAutoCreate: string;
    FAutoSelect: Boolean; // true
    FClearFilterOnReset: Boolean; // true
    FDisplayField: string;
    // 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-mode'
    FForceSelection: Boolean;
    FHandleHeight: Integer; // 8
    FHiddenId: string;
    // 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-hiddenName'
    FHiddenName: string;
    FHiddenValue: string;
    FItemSelector: string;
    FLazyInit: Boolean; // true
    FLazyRender: Boolean;
    FListAlign: string; // 'tl-bl?'
    FListAlignArray: TExtObjectList;
    FListClass: string;
    FListEmptyText: string;
    FListConfig: TExtObject;
    FListWidth: Integer;
    FLoadingText: string; // 'Loading...'
    FMaxHeight: Integer; // 300
    FMinChars: Integer; // 4
    FMinHeight: Integer; // 90
    FMinListWidth: Integer; // 70
    FMode: string;
    FPageSize: Integer; // 0
    FQueryDelay: Integer; // 500
    FQueryParam: string; // 'query'
    FSelectOnFocus: Boolean; // true
    FSelectedClass: string; // 'x-combo-selected'
    FShadow: Boolean;
    FShadowString: string;
    FStore: TExtDataStore;
    FStoreArray: TExtObjectList;
    FTitle: string;
    FTpl: string;
    FTplExtXTemplate: TExtXTemplate;
    FTransform: string;
    FTriggerAction: string;
    FTriggerClass: string; // 'x-form-arrow-trigger'
    FTypeAhead: Boolean;
    FTypeAheadDelay: Integer; // 250
    FValueField: string;
    // 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-mode'
    FValueNotFoundText: string;
    FKeyNav: TExtKeyNav;
    FLastQuery: string;
    FView: TExtDataView;
    FOnBeforequery: TExtFormComboBoxOnBeforequery;
    FOnBeforeselect: TExtFormComboBoxOnBeforeselect;
    FOnCollapse: TExtFormComboBoxOnCollapse;
    FOnExpand: TExtFormComboBoxOnExpand;
    FOnSelect: TExtFormComboBoxOnSelect;
    FMinHeightFunc: TExtFunction;
    FListWidthFunc: TExtFunction;
    procedure SetFAllQuery(Value: string);
    procedure SetFAutoCreate(Value: string);
    procedure SetAutoSelect(const AValue: Boolean);
    procedure SetFClearFilterOnReset(Value: Boolean);
    procedure SetDisplayField(const AValue: string);
    procedure SetForceSelection(const AValue: Boolean);
    procedure SetFHandleHeight(Value: Integer);
    procedure SetFHiddenId(Value: string);
    procedure SetHiddenName(const AValue: string);
    procedure SetHiddenValue(const AValue: string);
    procedure SetFItemSelector(Value: string);
    procedure SetFLazyInit(Value: Boolean);
    procedure SetLazyRender(const AValue: Boolean);
    procedure SetFListAlign(Value: string);
    procedure SetFListAlignArray(Value: TExtObjectList);
    procedure SetFListClass(Value: string);
    procedure SetFListEmptyText(Value: string);
    procedure SetListWidth(const AValue: Integer);
    procedure SetFLoadingText(Value: string);
    procedure SetFMaxHeight(Value: Integer);
    procedure SetMinChars(const AValue: Integer);
    procedure SetMinHeight(const AValue: Integer);
    procedure SetMinListWidth(const AValue: Integer);
    procedure SetMode(const AValue: string);
    procedure SetPageSize(const AValue: Integer);
    procedure SetQueryDelay(const AValue: Integer);
    procedure SetQueryParam(const AValue: string);
    procedure SetSelectOnFocus(const AValue: Boolean);
    procedure SetSelectedClass(const AValue: string);
    procedure SetFShadow(Value: Boolean);
    procedure SetFShadowString(Value: string);
    procedure SetStore(const AValue: TExtDataStore);
    procedure SetStoreArray(const AValue: TExtObjectList);
    procedure SetFTitle(Value: string);
    procedure SetFTpl(Value: string);
    procedure SetFTplExtXTemplate(Value: TExtXTemplate);
    procedure SetFTransform(Value: string);
    procedure SetTriggerAction(const AValue: string);
    procedure SetFTriggerClass(Value: string);
    procedure SetTypeAhead(const AValue: Boolean);
    procedure SetTypeAheadDelay(const AValue: Integer);
    procedure SetValueField(const AValue: string);
    procedure SetValueNotFoundText(const AValue: string);
    procedure SetFKeyNav(Value: TExtKeyNav);
    procedure SetFLastQuery(Value: string);
    procedure SetFView(Value: TExtDataView);
    procedure SetFOnBeforequery(Value: TExtFormComboBoxOnBeforequery);
    procedure SetFOnBeforeselect(Value: TExtFormComboBoxOnBeforeselect);
    procedure SetFOnCollapse(Value: TExtFormComboBoxOnCollapse);
    procedure SetFOnExpand(Value: TExtFormComboBoxOnExpand);
    procedure SetFOnSelect(Value: TExtFormComboBoxOnSelect);
    procedure SetMinHeightFunc(const AValue: TExtFunction);
    procedure SetListWidthFunc(const AValue: TExtFunction);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function ClearValue: TExtFunction;
    function Collapse: TExtFunction;
    function DoQuery(Query: string; ForceAll: Boolean): TExtFunction;
    function Expand: TExtFunction;
    function GetListParent: TExtFunction;
    function GetStore: TExtFunction;
    function GetValue: TExtFunction;
    function IsExpanded: TExtFunction;
    function Select(Index: Integer; ScrollIntoView: Boolean): TExtFunction;
    function SelectByValue(Value: string; ScrollIntoView: Boolean)
      : TExtFunction;
    function SetValue(const AValue: string): TExtFunction;
    property AllQuery: string read FAllQuery write SetFAllQuery;
    property AutoCreate: string read FAutoCreate write SetFAutoCreate;
    property AutoSelect: Boolean read FAutoSelect write SetAutoSelect;
    property ClearFilterOnReset: Boolean read FClearFilterOnReset
      write SetFClearFilterOnReset;
    property DisplayField: string read FDisplayField write SetDisplayField;
    property ForceSelection: Boolean read FForceSelection write SetForceSelection;
    property HandleHeight: Integer read FHandleHeight write SetFHandleHeight;
    property HiddenId: string read FHiddenId write SetFHiddenId;
    property HiddenName: string read FHiddenName write SetHiddenName;
    property HiddenValue: string read FHiddenValue write SetHiddenValue;
    property ItemSelector: string read FItemSelector write SetFItemSelector;
    property LazyInit: Boolean read FLazyInit write SetFLazyInit;
    property LazyRender: Boolean read FLazyRender write SetLazyRender;
    property ListAlign: string read FListAlign write SetFListAlign;
    property ListAlignArray: TExtObjectList read FListAlignArray
      write SetFListAlignArray;
    property ListClass: string read FListClass write SetFListClass;
    property ListConfig: TExtObject read FListConfig;
    property ListEmptyText: string read FListEmptyText write SetFListEmptyText;
    property ListWidth: Integer read FListWidth write SetListWidth;
    property ListWidthFunc: TExtFunction read FListWidthFunc write SetListWidthFunc;
    property LoadingText: string read FLoadingText write SetFLoadingText;
    property MaxHeight: Integer read FMaxHeight write SetFMaxHeight;
    property MinChars: Integer read FMinChars write SetMinChars;
    property MinHeight: Integer read FMinHeight write SetMinHeight;
    property MinHeightFunc: TExtFunction read FMinHeightFunc write SetMinHeightFunc;
    property MinListWidth: Integer read FMinListWidth write SetMinListWidth;
    property Mode: string read FMode write SetMode;
    property PageSize: Integer read FPageSize write SetPageSize;
    property QueryDelay: Integer read FQueryDelay write SetQueryDelay;
    property QueryParam: string read FQueryParam write SetQueryParam;
    property SelectOnFocus: Boolean read FSelectOnFocus write SetSelectOnFocus;
    property SelectedClass: string read FSelectedClass write SetSelectedClass;
    property Shadow: Boolean read FShadow write SetFShadow;
    property ShadowString: string read FShadowString write SetFShadowString;
    property Store: TExtDataStore read FStore write SetStore;
    property StoreArray: TExtObjectList read FStoreArray write SetStoreArray;
    property Title: string read FTitle write SetFTitle;
    property Tpl: string read FTpl write SetFTpl;
    property TplExtXTemplate: TExtXTemplate read FTplExtXTemplate
      write SetFTplExtXTemplate;
    property Transform: string read FTransform write SetFTransform;
    property TriggerAction: string read FTriggerAction write SetTriggerAction;
    property TriggerClass: string read FTriggerClass write SetFTriggerClass;
    property TypeAhead: Boolean read FTypeAhead write SetTypeAhead;
    property TypeAheadDelay: Integer read FTypeAheadDelay
      write SetTypeAheadDelay;
    property ValueField: string read FValueField write SetValueField;
    property ValueNotFoundText: string read FValueNotFoundText
      write SetValueNotFoundText;
    property KeyNav: TExtKeyNav read FKeyNav write SetFKeyNav;
    property LastQuery: string read FLastQuery write SetFLastQuery;
    property View: TExtDataView read FView write SetFView;
    property OnBeforequery: TExtFormComboBoxOnBeforequery read FOnBeforequery
      write SetFOnBeforequery;
    property OnBeforeselect: TExtFormComboBoxOnBeforeselect read FOnBeforeselect
      write SetFOnBeforeselect;
    property OnCollapse: TExtFormComboBoxOnCollapse read FOnCollapse
      write SetFOnCollapse;
    property OnExpand: TExtFormComboBoxOnExpand read FOnExpand
      write SetFOnExpand;
    property OnSelect: TExtFormComboBoxOnSelect read FOnSelect
      write SetFOnSelect;
  end;

  TExtFormTwinTriggerField = class(TExtFormTriggerField)
  private
    FTrigger1Class: string;
    FTrigger2Class: string;
    FTriggerConfig: string;
    procedure SetTrigger1Class(const AValue: string);
    procedure SetTrigger2Class(const AValue: string);
    procedure SetFTriggerConfig(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property Trigger1Class: string read FTrigger1Class write SetTrigger1Class;
    property Trigger2Class: string read FTrigger2Class write SetTrigger2Class;
    property TriggerConfig: string read FTriggerConfig write SetFTriggerConfig;
  end;

  TExtFormTimeField = class(TExtFormComboBox)
  private
    FAltFormats: string;
    // 'g:ia/g:iA/g:i a/g:i A/h:i/g:i/H:i/ga/ha/gA/h a/g a/g A/gi/hi/gia/hia/g/H/gi a/hi a/giA/hiA/gi A/hi A'
    FFormat: string; // 'g:i A'
    FIncrement: Integer; // 15
    FInvalidText: string; // '{value} is not a valid time'
    FMaxText: string; // 'The time in this field must be equal to or before {0}'
    FMaxValue: TDateTime;
    FMaxValueString: string;
    FMinText: string; // 'The time in this field must be equal to or after {0}'
    FMinValue: TDateTime;
    FMinValueString: string;
    procedure SetAltFormats(const AValue: string);
    procedure SetFormat(const AValue: string);
    procedure SetFIncrement(Value: Integer);
    procedure SetFInvalidText(Value: string);
    procedure SetFMaxText(Value: string);
    procedure _SetMaxValue(const AValue: TDateTime);
    procedure SetFMaxValueString(Value: string);
    procedure SetFMinText(Value: string);
    procedure _SetMinValue(const AValue: TDateTime);
    procedure SetFMinValueString(Value: string);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function SetMaxValue(const AValue: TDateTime): TExtFunction; overload;
    function SetMaxValue(Value: string): TExtFunction; overload;
    function SetMinValue(const AValue: TDateTime): TExtFunction; overload;
    function SetMinValue(Value: string): TExtFunction; overload;
    property AltFormats: string read FAltFormats write SetAltFormats;
    property Format: string read FFormat write SetFormat;
    property Increment: Integer read FIncrement write SetFIncrement;
    property InvalidText: string read FInvalidText write SetFInvalidText;
    property MaxText: string read FMaxText write SetFMaxText;
    property MaxValue: TDateTime read FMaxValue write _SetMaxValue;
    property MaxValueString: string read FMaxValueString
      write SetFMaxValueString;
    property MinText: string read FMinText write SetFMinText;
    property MinValue: TDateTime read FMinValue write _SetMinValue;
    property MinValueString: string read FMinValueString
      write SetFMinValueString;
  end;

  TExtUxFormLovCombo = class(TExtFormComboBox)
  private
    FSeparator: string;
    procedure SetFSeparator(Value: string);
  public
    class function JSClassName: string; override;
    property Separator: string read FSeparator write SetFSeparator;
  end;

  TExtFormFieldContainer = class(TExtContainer)
  public
    class function JSClassName: string; override;
  end;

function ExtFormVTypes: TExtFormVTypesSingleton;

implementation

uses
  Kitto.JS;

function ExtFormVTypes: TExtFormVTypesSingleton;
begin
  if (GetSession <> nil) then
    Result := GetSession.GetSingleton<TExtFormVTypesSingleton>(TExtFormVTypesSingleton.JSClassName)
  else
    Result := nil;
end;

procedure TExtFormAction.SetFailure(const AValue: TExtFunction);
begin
  FFailure := SetFunctionConfigItem('failure', AValue);
end;

procedure TExtFormAction.SetFMethod(Value: string);
begin
  FMethod := Value;
  JSCode('method:' + VarToJSON([Value]));
end;

procedure TExtFormAction.SetFParams(Value: string);
begin
  FParams := Value;
  JSCode('params:' + VarToJSON([Value]));
end;

procedure TExtFormAction.SetFReset(Value: Boolean);
begin
  FReset := Value;
  JSCode('reset:' + VarToJSON([Value]));
end;

procedure TExtFormAction.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCode('scope:' + VarToJSON([Value, false]));
end;

procedure TExtFormAction.SetFSubmitEmptyText(Value: Boolean);
begin
  FSubmitEmptyText := Value;
  JSCode('submitEmptyText:' + VarToJSON([Value]));
end;

procedure TExtFormAction.SetSuccess(const AValue: TExtFunction);
begin
  FSuccess := SetFunctionConfigItem('success', AValue);
end;

procedure TExtFormAction.SetTimeout(const AValue: Integer);
begin
  FTimeout := SetConfigItem('timeout', AValue);
end;

procedure TExtFormAction.SetUrl(const AValue: string);
begin
  FUrl := SetConfigItem('url', AValue);
end;

procedure TExtFormAction.SetWaitMsg(const AValue: string);
begin
  FWaitMsg := SetConfigItem('waitMsg', AValue);
end;

procedure TExtFormAction.SetWaitTitle(const AValue: string);
begin
  FWaitTitle := SetConfigItem('waitTitle', AValue);
end;

procedure TExtFormAction.SetFFailureType(Value: string);
begin
  FFailureType := Value;
  JSCode(JSName + '.failureType=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormAction.SetFResponse(Value: TExtObject);
begin
  FResponse := Value;
  JSCode(JSName + '.response=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormAction.SetFResultJS(Value: TExtObject);
begin
  FResultJS := Value;
  JSCode(JSName + '.resultJS=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormAction.SetFTypeJS(Value: string);
begin
  FTypeJS := Value;
  JSCode(JSName + '.typeJS=' + VarToJSON([Value]) + ';');
end;

class function TExtFormAction.JSClassName: string;
begin
  Result := '';
end;

class function TExtFormAction.CLIENT_INVALID: string;
begin
  Result := ''
end;

class function TExtFormAction.CONNECT_FAILURE: string;
begin
  Result := ''
end;

class function TExtFormAction.LOAD_FAILURE: string;
begin
  Result := ''
end;

class function TExtFormAction.SERVER_INVALID: string;
begin
  Result := ''
end;

procedure TExtFormVTypesSingleton.SetFAlphaMask(Value: string);
begin
  FAlphaMask := Value;
  JSCode(JSName + '.alphaMask=' + VarToJSON([#3 + Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFAlphaText(Value: string);
begin
  FAlphaText := Value;
  JSCode(JSName + '.alphaText=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFAlphanumMask(Value: string);
begin
  FAlphanumMask := Value;
  JSCode(JSName + '.alphanumMask=' + VarToJSON([#3 + Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFAlphanumText(Value: string);
begin
  FAlphanumText := Value;
  JSCode(JSName + '.alphanumText=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFEmailMask(Value: string);
begin
  FEmailMask := Value;
  JSCode(JSName + '.emailMask=' + VarToJSON([#3 + Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFEmailText(Value: string);
begin
  FEmailText := Value;
  JSCode(JSName + '.emailText=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormVTypesSingleton.SetFUrlText(Value: string);
begin
  FUrlText := Value;
  JSCode(JSName + '.urlText=' + VarToJSON([Value]) + ';');
end;

class function TExtFormVTypesSingleton.JSClassName: string;
begin
  Result := 'Ext.form.VTypes';
end;

function TExtFormVTypesSingleton.Alpha(Value: string): TExtFunction;
begin
  JSCode(JSName + '.alpha(' + VarToJSON([Value]) + ');',
    'TExtFormVTypesSingleton');
  Result := Self;
end;

function TExtFormVTypesSingleton.Alphanum(Value: string): TExtFunction;
begin
  JSCode(JSName + '.alphanum(' + VarToJSON([Value]) + ');',
    'TExtFormVTypesSingleton');
  Result := Self;
end;

function TExtFormVTypesSingleton.Email(Value: string): TExtFunction;
begin
  JSCode(JSName + '.email(' + VarToJSON([Value]) + ');',
    'TExtFormVTypesSingleton');
  Result := Self;
end;

function TExtFormVTypesSingleton.Url(Value: string): TExtFunction;
begin
  JSCode(JSName + '.url(' + VarToJSON([Value]) + ');',
    'TExtFormVTypesSingleton');
  Result := Self;
end;

procedure TExtFormBasicForm.SetFApi(Value: TExtObject);
begin
  FApi := Value;
  JSCode('api:' + VarToJSON([Value, false]));
end;

procedure TExtFormBasicForm.SetFBaseParams(Value: TExtObject);
begin
  FBaseParams := Value;
  JSCode('baseParams:' + VarToJSON([Value, false]));
end;

procedure TExtFormBasicForm.SetFErrorReader(Value: TExtDataDataReader);
begin
  FErrorReader := Value;
  JSCode('errorReader:' + VarToJSON([Value, false]));
end;

procedure TExtFormBasicForm.SetFFileUpload(Value: Boolean);
begin
  FFileUpload := Value;
  JSCode('fileUpload:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFMethod(Value: string);
begin
  FMethod := Value;
  JSCode('method:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFParamOrder(Value: TExtObjectList);
begin
  FParamOrder := Value;
  JSCode('paramOrder:' + VarToJSON([Value, false]));
end;

procedure TExtFormBasicForm.SetFParamOrderString(Value: string);
begin
  FParamOrderString := Value;
  JSCode('paramOrder:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFParamsAsHash(Value: Boolean);
begin
  FParamsAsHash := Value;
  JSCode('paramsAsHash:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFReader(Value: TExtDataDataReader);
begin
  FReader := Value;
  JSCode('reader:' + VarToJSON([Value, false]));
end;

procedure TExtFormBasicForm.SetFStandardSubmit(Value: Boolean);
begin
  FStandardSubmit := Value;
  JSCode('standardSubmit:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFTimeout(Value: Integer);
begin
  FTimeout := Value;
  JSCode('timeout:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFTrackResetOnLoad(Value: Boolean);
begin
  FTrackResetOnLoad := Value;
  JSCode('trackResetOnLoad:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetUrl(const AValue: string);
begin
  FUrl := SetConfigItem('url', AValue);
end;

procedure TExtFormBasicForm.SetFWaitTitle(Value: string);
begin
  FWaitTitle := Value;
  JSCode('waitTitle:' + VarToJSON([Value]));
end;

procedure TExtFormBasicForm.SetFItems(Value: TExtObjectList);
begin
  FItems := Value;
  JSCode(JSName + '.items=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormBasicForm.SetFWaitMsgTarget(Value: string);
begin
  FWaitMsgTarget := Value;
  JSCode(JSName + '.waitMsgTarget=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormBasicForm.SetFOnActioncomplete
  (Value: TExtFormBasicFormOnActioncomplete);
begin
  if Assigned(FOnActioncomplete) then
    JSCode(JSName + '.events ["actioncomplete"].listeners=[];');
  if Assigned(Value) then
    on('actioncomplete', Ajax('actioncomplete', ['This', '%0.nm', 'Action',
      '%1.nm'], true));
  FOnActioncomplete := Value;
end;

procedure TExtFormBasicForm.SetFOnActionfailed
  (Value: TExtFormBasicFormOnActionfailed);
begin
  if Assigned(FOnActionfailed) then
    JSCode(JSName + '.events ["actionfailed"].listeners=[];');
  if Assigned(Value) then
    on('actionfailed', Ajax('actionfailed', ['This', '%0.nm', 'Action',
      '%1.nm'], true));
  FOnActionfailed := Value;
end;

procedure TExtFormBasicForm.SetFOnBeforeaction
  (Value: TExtFormBasicFormOnBeforeaction);
begin
  if Assigned(FOnBeforeaction) then
    JSCode(JSName + '.events ["beforeaction"].listeners=[];');
  if Assigned(Value) then
    on('beforeaction', Ajax('beforeaction', ['This', '%0.nm', 'Action',
      '%1.nm'], true));
  FOnBeforeaction := Value;
end;

class function TExtFormBasicForm.JSClassName: string;
begin
  Result := 'Ext.form.BasicForm';
end;

procedure TExtFormBasicForm.InitDefaults;
begin
  inherited;
  FApi := TExtObject.CreateInternal(Self, 'api');
  FBaseParams := TExtObject.CreateInternal(Self, 'baseParams');
  FErrorReader := TExtDataDataReader.CreateInternal(Self, 'errorReader');
  FParamOrder := CreateConfigArray('paramOrder');
  FReader := TExtDataDataReader.CreateInternal(Self, 'reader');
  FWaitTitle := 'Please Wait...';
  FItems := CreateConfigArray('items');
end;

function TExtFormBasicForm.Add(Fields: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON(Fields) + ');', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.ApplyIfToFields(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.applyIfToFields(' + VarToJSON([Values, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.ApplyToFields(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.applyToFields(' + VarToJSON([Values, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.CleanDestroyed: TExtFunction;
begin
  JSCode(JSName + '.cleanDestroyed();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.ClearInvalid: TExtFunction;
begin
  JSCode(JSName + '.clearInvalid();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.DoAction(ActionName: string;
  Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.doAction(' + VarToJSON([ActionName, Options, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.DoAction(ActionName: TExtObject;
  Options: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.doAction(' + VarToJSON([ActionName, false, Options, false])
    + ');', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.FindField(Id: string): TExtFunction;
begin
  JSCode(JSName + '.findField(' + VarToJSON([Id]) + ');', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.GetEl: TExtFunction;
begin
  JSCode(JSName + '.getEl();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.GetFieldValues(const ADirtyOnly: Boolean): TExtFunction;
begin
  Result := CallMethod('getFieldValues', ADirtyOnly);
end;

function TExtFormBasicForm.GetValues(const AAsString: Boolean): TExtFunction;
begin
  Result := CallMethod('getValues', AAsString);
end;

function TExtFormBasicForm.IsDirty: TExtFunction;
begin
  JSCode(JSName + '.isDirty();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.IsValid: TExtFunction;
begin
  JSCode(JSName + '.isValid();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.Load(const AOptions: TExtObject): TExtFunction;
begin
  Result := CallMethod('load', AOptions);
end;

function TExtFormBasicForm.LoadRecord(RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.loadRecord(' + VarToJSON([RecordJS, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.MarkInvalid(Errors: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.markInvalid(' + VarToJSON(Errors) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.MarkInvalid(Errors: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.markInvalid(' + VarToJSON([Errors, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.Remove(Field: TExtFormField): TExtFunction;
begin
  JSCode(JSName + '.remove(' + VarToJSON([Field, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.Render: TExtFunction;
begin
  JSCode(JSName + '.render();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.Reset: TExtFunction;
begin
  JSCode(JSName + '.reset();', 'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.SetValues(Values: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.setValues(' + VarToJSON(Values) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.SetValues(Values: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.setValues(' + VarToJSON([Values, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

function TExtFormBasicForm.Submit(const AOptions: TExtObject): TExtFunction;
begin
  Result := CallMethod('submit', AOptions);
end;

function TExtFormBasicForm.UpdateRecord(RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.updateRecord(' + VarToJSON([RecordJS, false]) + ');',
    'TExtFormBasicForm');
  Result := Self;
end;

procedure TExtFormBasicForm.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'actioncomplete') and Assigned(FOnActioncomplete) then
    FOnActioncomplete(TExtFormBasicForm(ParamAsObject('This')),
      TExtAction(ParamAsObject('Action')))
  else if (AEvtName = 'actionfailed') and Assigned(FOnActionfailed) then
    FOnActionfailed(TExtFormBasicForm(ParamAsObject('This')),
      TExtAction(ParamAsObject('Action')))
  else if (AEvtName = 'beforeaction') and Assigned(FOnBeforeaction) then
    FOnBeforeaction(TExtFormBasicForm(ParamAsObject('This')),
      TExtAction(ParamAsObject('Action')));
end;

procedure TExtUxGridRecordForm.SetFCancelIconCls(Value: string);
begin
  FCancelIconCls := Value;
  JSCode('cancelIconCls:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFCancelText(Value: string);
begin
  FCancelText := Value;
  JSCode('cancelText:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFColumnCount(Value: Integer);
begin
  FColumnCount := Value;
  JSCode('columnCount:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFDirtyRowCls(Value: string);
begin
  FDirtyRowCls := Value;
  JSCode('dirtyRowCls:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFIconCls(Value: string);
begin
  FIconCls := Value;
  JSCode('iconCls:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFOkIconCls(Value: string);
begin
  FOkIconCls := Value;
  JSCode('okIconCls:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFOkText(Value: string);
begin
  FOkText := Value;
  JSCode('okText:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFNewRowCls(Value: string);
begin
  FNewRowCls := Value;
  JSCode('newRowCls:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFTitle(Value: string);
begin
  FTitle := Value;
  JSCode('title:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFShowButtons(Value: Boolean);
begin
  FShowButtons := Value;
  JSCode('showButtons:' + VarToJSON([Value]));
end;

procedure TExtUxGridRecordForm.SetFIgnoreFields(Value: TExtObject);
begin
  FIgnoreFields := Value;
  JSCode('ignoreFields:' + VarToJSON([Value, false]));
end;

procedure TExtUxGridRecordForm.SetFReadonlyFields(Value: TExtObject);
begin
  FReadonlyFields := Value;
  JSCode('readonlyFields:' + VarToJSON([Value, false]));
end;

procedure TExtUxGridRecordForm.SetFDisabledFields(Value: TExtObject);
begin
  FDisabledFields := Value;
  JSCode('disabledFields:' + VarToJSON([Value, false]));
end;

procedure TExtUxGridRecordForm.SetFFormConfig(Value: TExtObject);
begin
  FFormConfig := Value;
  JSCode('formConfig:' + VarToJSON([Value, false]));
end;

class function TExtUxGridRecordForm.JSClassName: string;
begin
  Result := 'Ext.ux.grid.RecordForm';
end;

function TExtUxGridRecordForm.Show(DataRecord: TExtDataRecord;
  AnimEl: TExtElement = nil): TExtFunction;
begin
  JSCode(JSName + '.show(' + VarToJSON([DataRecord, false, AnimEl, false]) +
    ');', 'TExtUxGridRecordForm');
  Result := Self;
end;

procedure TExtFormActionSubmit.SetFClientValidation(Value: Boolean);
begin
  FClientValidation := Value;
  JSCode('clientValidation:' + VarToJSON([Value]));
end;

procedure TExtFormActionSubmit.SetFErrorReader(Value: TExtDataDataReader);
begin
  FErrorReader := Value;
  JSCode('errorReader:' + VarToJSON([Value, false]));
end;

class function TExtFormActionSubmit.JSClassName: string;
begin
  // Don't use real class name. This object is never created
  // on the server: using object allows to create it as a JS generator helper.
  Result := 'Object';
end;

class function TExtFormActionLoad.JSClassName: string;
begin
  // Don't use real class name. This object is never created
  // on the server: using object allows to create it as a JS generator helper.
  Result := 'Object';
end;

class function TExtFormActionDirectLoad.JSClassName: string;
begin
  Result := 'Ext.form.Action.DirectLoad';
end;

class function TExtFormActionDirectSubmit.JSClassName: string;
begin
  Result := 'Ext.form.Action.DirectSubmit';
end;

procedure TExtFormField.SetCls(const AValue: string);
begin
  FCls := SetConfigItem('cls', AValue);
end;

procedure TExtFormField.SetDisabled(const AValue: Boolean);
begin
  FDisabled := SetConfigItem('disabled', 'setDisabled', AValue);
end;

procedure TExtFormField.SetAutoCreate(const AValue: string);
begin
  FAutoCreate := SetConfigItem('autoCreate', AValue);
end;

procedure TExtFormField.SetFFieldClass(Value: string);
begin
  FFieldClass := Value;
  JSCode('fieldClass:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFFocusClass(Value: string);
begin
  FFocusClass := Value;
  JSCode('focusClass:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetInputType(const AValue: TExtFormFieldInputType);
begin
  FInputType := AValue;
  SetConfigItem('inputType', TJS.EnumToJSString(TypeInfo(TExtFormFieldInputType), Ord(AValue)));
end;

procedure TExtFormField.SetLabelAlign(const AValue: TExtContainerLabelAlign);
begin
  FLabelAlign := AValue;
  SetConfigItem('labelAlign', TJS.EnumToJSString(TypeInfo(TExtContainerLabelAlign), Ord(AValue)));
end;

procedure TExtFormField.SetLabelWidth(const AValue: Integer);
begin
  FLabelWidth := SetConfigItem('labelWidth', AValue);
end;

procedure TExtFormField.SetFInvalidClass(Value: string);
begin
  FInvalidClass := Value;
  JSCode('invalidClass:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFInvalidText(Value: string);
begin
  FInvalidText := Value;
  JSCode('invalidText:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFMsgFx(Value: string);
begin
  FMsgFx := Value;
  JSCode('msgFx:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetMsgTarget(const AValue: string);
begin
  FMsgTarget := SetConfigItem('msgTarget', AValue);
end;

procedure TExtFormField._SetName(const AValue: string);
begin
  FName := SetConfigItem('name', AValue);
end;

procedure TExtFormField.SetFPreventMark(Value: Boolean);
begin
  FPreventMark := Value;
  JSCode('preventMark:' + VarToJSON([Value]));
end;

procedure TExtFormField._SetReadOnly(const AValue: Boolean);
begin
  FReadOnly := SetConfigItem('readOnly', 'setReadOnly', AValue);
end;

procedure TExtFormField.SetSubmitValue(const AValue: Boolean);
begin
  FSubmitValue := SetConfigItem('submitValue', AValue);
end;

procedure TExtFormField.SetFTabIndex(Value: Integer);
begin
  FTabIndex := Value;
  JSCode('tabIndex:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFValidateOnBlur(Value: Boolean);
begin
  FValidateOnBlur := Value;
  JSCode('validateOnBlur:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFValidationDelay(Value: Integer);
begin
  FValidationDelay := Value;
  JSCode('validationDelay:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFValidationEvent(Value: string);
begin
  FValidationEvent := Value;
  JSCode('validationEvent:' + VarToJSON([Value]));
end;

procedure TExtFormField.SetFValidationEventBoolean(Value: Boolean);
begin
  FValidationEventBoolean := Value;
  JSCode('validationEvent:' + VarToJSON([Value]));
end;

procedure TExtFormField._SetValue(const AValue: string);
begin
  FValue := SetConfigItem('value', 'setValue', AValue);
end;

procedure TExtFormField.SetFLabelJS(Value: TExtElement);
begin
  FLabelJS := Value;
  JSCode(JSName + '.labelJS=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormField.SetFOriginalValue(Value: string);
begin
  FOriginalValue := Value;
  JSCode(JSName + '.originalValue=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormField.SetStartValue(const AValue: string);
begin
  FStartValue := SetConfigItem('startValue', AValue);
end;

procedure TExtFormField.SetFOnBlur(Value: TExtFormFieldOnBlur);
begin
  if Assigned(FOnBlur) then
    JSCode(JSName + '.events ["blur"].listeners=[];');
  if Assigned(Value) then
    on('blur', Ajax('blur', ['This', '%0.nm'], true));
  FOnBlur := Value;
end;

procedure TExtFormField.SetOnChange(const AValue: TExtFormFieldOnChange);
begin
  if Assigned(FOnChange) then
    GetSession.ResponseItems.ExecuteJSCode(Self, JSName + '.events["change"].listeners=[];');
  if Assigned(AValue) then
    On('change', Ajax('change', ['This', '%0.nm', 'NewValue', '%1', 'OldValue', '%2'], True));
  FOnChange := AValue;
end;

procedure TExtFormField.SetFOnFocus(Value: TExtFormFieldOnFocus);
begin
  if Assigned(FOnFocus) then
    JSCode(JSName + '.events ["focus"].listeners=[];');
  if Assigned(Value) then
    on('focus', Ajax('focus', ['This', '%0.nm'], true));
  FOnFocus := Value;
end;

procedure TExtFormField.SetFOnInvalid(Value: TExtFormFieldOnInvalid);
begin
  if Assigned(FOnInvalid) then
    JSCode(JSName + '.events ["invalid"].listeners=[];');
  if Assigned(Value) then
    on('invalid', Ajax('invalid', ['This', '%0.nm', 'Msg', '%1'], true));
  FOnInvalid := Value;
end;

procedure TExtFormField.SetFOnSpecialkey(Value: TExtFormFieldOnSpecialkey);
begin
  if Assigned(FOnSpecialkey) then
    JSCode(JSName + '.events ["specialkey"].listeners=[];');
  if Assigned(Value) then
    on('specialkey', Ajax('specialkey', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnSpecialkey := Value;
end;

procedure TExtFormField.SetFOnValid(Value: TExtFormFieldOnValid);
begin
  if Assigned(FOnValid) then
    JSCode(JSName + '.events ["valid"].listeners=[];');
  if Assigned(Value) then
    on('valid', Ajax('valid', ['This', '%0.nm'], true));
  FOnValid := Value;
end;

class function TExtFormField.JSClassName: string;
begin
  Result := 'Ext.form.Field';
end;

procedure TExtFormField.InitDefaults;
begin
  inherited;
  FFieldClass := 'x-form-field';
  FFocusClass := 'x-form-focus';
  FInvalidClass := 'x-form-invalid';
  FInvalidText := 'The value in this field is invalid';
  FMsgFx := 'normal';
  FValidateOnBlur := true;
  FValidationDelay := 250;
  FValidationEvent := 'keyup';
  FLabelJS := TExtElement.CreateInternal(Self, 'labelJS');
end;

function TExtFormField.ClearInvalid: TExtFunction;
begin
  JSCode(JSName + '.clearInvalid();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.GetActiveError: TExtFunction;
begin
  JSCode(JSName + '.getActiveError();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.GetErrors: TExtFunction;
begin
  JSCode(JSName + '.getErrors();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.GetName: TExtFunction;
begin
  JSCode(JSName + '.getName();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.GetObjectNamePrefix: string;
begin
  Result := 'ffld';
end;

function TExtFormField.GetRawValue: TExtFunction;
begin
  Result := CallMethod('getRawValue', []);
end;

function TExtFormField.GetValue: TExtFunction;
begin
  Result := CallMethod('getValue', []);
end;

function TExtFormField.IsDirty: TExtFunction;
begin
  JSCode(JSName + '.isDirty();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.IsValid(PreventMark: Boolean): TExtFunction;
begin
  JSCode(JSName + '.isValid(' + VarToJSON([PreventMark]) + ');',
    'TExtFormField');
  Result := Self;
end;

function TExtFormField.MarkInvalid(Msg: string = ''): TExtFunction;
begin
  JSCode(JSName + '.markInvalid(' + VarToJSON([Msg]) + ');', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.ProcessValue(Value: string): TExtFunction;
begin
  JSCode(JSName + '.processValue(' + VarToJSON([Value]) + ');',
    'TExtFormField');
  Result := Self;
end;

function TExtFormField.Reset: TExtFunction;
begin
  JSCode(JSName + '.reset();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.SetActiveError(Msg: string; SuppressEvent: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.setActiveError(' + VarToJSON([Msg, SuppressEvent]) + ');',
    'TExtFormField');
  Result := Self;
end;

function TExtFormField.SetRawValue(const AValue: string): TExtFunction;
begin
  Result := CallMethod('setRawValue', AValue);
end;

function TExtFormField.SetReadOnly(const AReadOnly: Boolean): TExtFunction;
begin
  Result := CallMethod('setReadOnly', AReadOnly);
end;

function TExtFormField.SetValue(const AValue: string): TExtFunction;
begin
  Result := CallMethod('setValue', AValue);
end;

function TExtFormField.UnsetActiveError(SuppressEvent: Boolean): TExtFunction;
begin
  JSCode(JSName + '.unsetActiveError(' + VarToJSON([SuppressEvent]) + ');',
    'TExtFormField');
  Result := Self;
end;

function TExtFormField.Validate: TExtFunction;
begin
  JSCode(JSName + '.validate();', 'TExtFormField');
  Result := Self;
end;

function TExtFormField.ValidateValue(The: string): TExtFunction;
begin
  JSCode(JSName + '.validateValue(' + VarToJSON([The]) + ');', 'TExtFormField');
  Result := Self;
end;

procedure TExtFormField.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'blur') and Assigned(FOnBlur) then
    FOnBlur(TExtFormField(ParamAsObject('This')))
  else if (AEvtName = 'change') and Assigned(FOnChange) then
    FOnChange(TExtFormField(ParamAsObject('This')), ParamAsString('NewValue'),
      ParamAsString('OldValue'))
  else if (AEvtName = 'focus') and Assigned(FOnFocus) then
    FOnFocus(TExtFormField(ParamAsObject('This')))
  else if (AEvtName = 'invalid') and Assigned(FOnInvalid) then
    FOnInvalid(TExtFormField(ParamAsObject('This')), ParamAsString('Msg'))
  else if (AEvtName = 'specialkey') and Assigned(FOnSpecialkey) then
    FOnSpecialkey(TExtFormField(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'valid') and Assigned(FOnValid) then
    FOnValid(TExtFormField(ParamAsObject('This')));
end;

procedure TExtFormLabel.SetFForId(Value: string);
begin
  FForId := Value;
  JSCode('forId:' + VarToJSON([Value]));
end;

procedure TExtFormLabel.SetHtml(AValue: string);
begin
  FHtml := AValue;
  SetConfigItem('html', AValue);
end;

procedure TExtFormLabel._SetText(const AValue: string);
begin
  FText := AValue;
  SetConfigItem('text', 'setText', AValue);
end;

class function TExtFormLabel.JSClassName: string;
begin
  Result := 'Ext.form.Label';
end;

procedure TExtFormLabel.InitDefaults;
begin
  inherited;
end;

function TExtFormLabel.SetText(const AText: string; const AEncode: Boolean): TExtFunction;
begin
  FText := AText;
  Result := CallMethod('setText', [AText, AEncode]);
end;

class function TExtFormHidden.JSClassName: string;
begin
  Result := 'Ext.form.Hidden';
end;

procedure TExtFormHidden.InitDefaults;
begin
  inherited;
end;

procedure TExtFormHtmlEditor.SetFCreateLinkText(Value: string);
begin
  FCreateLinkText := Value;
  JSCode('createLinkText:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFDefaultLinkValue(Value: string);
begin
  FDefaultLinkValue := Value;
  JSCode('defaultLinkValue:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFDefaultValue(Value: string);
begin
  FDefaultValue := Value;
  JSCode('defaultValue:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableAlignments(Value: Boolean);
begin
  FEnableAlignments := Value;
  JSCode('enableAlignments:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableColors(Value: Boolean);
begin
  FEnableColors := Value;
  JSCode('enableColors:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableFont(Value: Boolean);
begin
  FEnableFont := Value;
  JSCode('enableFont:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableFontSize(Value: Boolean);
begin
  FEnableFontSize := Value;
  JSCode('enableFontSize:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableFormat(Value: Boolean);
begin
  FEnableFormat := Value;
  JSCode('enableFormat:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableLinks(Value: Boolean);
begin
  FEnableLinks := Value;
  JSCode('enableLinks:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableLists(Value: Boolean);
begin
  FEnableLists := Value;
  JSCode('enableLists:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFEnableSourceEdit(Value: Boolean);
begin
  FEnableSourceEdit := Value;
  JSCode('enableSourceEdit:' + VarToJSON([Value]));
end;

procedure TExtFormHtmlEditor.SetFFontFamilies(Value: TExtObjectList);
begin
  FFontFamilies := Value;
  JSCode('fontFamilies:' + VarToJSON([Value, false]));
end;

procedure TExtFormHtmlEditor.SetFButtonTips(Value: TExtObject);
begin
  FButtonTips := Value;
  JSCode(JSName + '.buttonTips=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormHtmlEditor.SetFOnActivate
  (Value: TExtFormHtmlEditorOnActivate);
begin
  if Assigned(FOnActivate) then
    JSCode(JSName + '.events ["activate"].listeners=[];');
  if Assigned(Value) then
    on('activate', Ajax('activate', ['This', '%0.nm'], true));
  FOnActivate := Value;
end;

procedure TExtFormHtmlEditor.SetFOnBeforepush
  (Value: TExtFormHtmlEditorOnBeforepush);
begin
  if Assigned(FOnBeforepush) then
    JSCode(JSName + '.events ["beforepush"].listeners=[];');
  if Assigned(Value) then
    on('beforepush', Ajax('beforepush', ['This', '%0.nm', 'Html', '%1'], true));
  FOnBeforepush := Value;
end;

procedure TExtFormHtmlEditor.SetFOnBeforesync
  (Value: TExtFormHtmlEditorOnBeforesync);
begin
  if Assigned(FOnBeforesync) then
    JSCode(JSName + '.events ["beforesync"].listeners=[];');
  if Assigned(Value) then
    on('beforesync', Ajax('beforesync', ['This', '%0.nm', 'Html', '%1'], true));
  FOnBeforesync := Value;
end;

procedure TExtFormHtmlEditor.SetFOnEditmodechange
  (Value: TExtFormHtmlEditorOnEditmodechange);
begin
  if Assigned(FOnEditmodechange) then
    JSCode(JSName + '.events ["editmodechange"].listeners=[];');
  if Assigned(Value) then
    on('editmodechange', Ajax('editmodechange', ['This', '%0.nm', 'SourceEdit',
      '%1'], true));
  FOnEditmodechange := Value;
end;

procedure TExtFormHtmlEditor.SetFOnInitialize
  (Value: TExtFormHtmlEditorOnInitialize);
begin
  if Assigned(FOnInitialize) then
    JSCode(JSName + '.events ["initialize"].listeners=[];');
  if Assigned(Value) then
    on('initialize', Ajax('initialize', ['This', '%0.nm'], true));
  FOnInitialize := Value;
end;

procedure TExtFormHtmlEditor.SetFOnPush(Value: TExtFormHtmlEditorOnPush);
begin
  if Assigned(FOnPush) then
    JSCode(JSName + '.events ["push"].listeners=[];');
  if Assigned(Value) then
    on('push', Ajax('push', ['This', '%0.nm', 'Html', '%1'], true));
  FOnPush := Value;
end;

procedure TExtFormHtmlEditor.SetFOnSync(Value: TExtFormHtmlEditorOnSync);
begin
  if Assigned(FOnSync) then
    JSCode(JSName + '.events ["sync"].listeners=[];');
  if Assigned(Value) then
    on('sync', Ajax('sync', ['This', '%0.nm', 'Html', '%1'], true));
  FOnSync := Value;
end;

class function TExtFormHtmlEditor.JSClassName: string;
begin
  Result := 'Ext.form.HtmlEditor';
end;

procedure TExtFormHtmlEditor.InitDefaults;
begin
  inherited;
  FEnableAlignments := true;
  FEnableColors := true;
  FEnableFont := true;
  FEnableFontSize := true;
  FEnableFormat := true;
  FEnableLinks := true;
  FEnableLists := true;
  FEnableSourceEdit := true;
  FFontFamilies := CreateConfigArray('fontFamilies');
  FButtonTips := TExtObject.CreateInternal(Self, 'buttonTips');
end;

function TExtFormHtmlEditor.CleanHtml(Html: string): TExtFunction;
begin
  JSCode(JSName + '.cleanHtml(' + VarToJSON([Html]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.ExecCmd(Cmd: string; Value: string = '')
  : TExtFunction;
begin
  JSCode(JSName + '.execCmd(' + VarToJSON([Cmd, Value]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.ExecCmd(Cmd: string; Value: Boolean): TExtFunction;
begin
  JSCode(JSName + '.execCmd(' + VarToJSON([Cmd, Value]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.GetDocMarkup: TExtFunction;
begin
  JSCode(JSName + '.getDocMarkup();', 'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.GetToolbar: TExtFunction;
begin
  JSCode(JSName + '.getToolbar();', 'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.InsertAtCursor(Text: string): TExtFunction;
begin
  JSCode(JSName + '.insertAtCursor(' + VarToJSON([Text]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.PushValue: TExtFunction;
begin
  JSCode(JSName + '.pushValue();', 'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.RelayCmd(Cmd: string; Value: string = '')
  : TExtFunction;
begin
  JSCode(JSName + '.relayCmd(' + VarToJSON([Cmd, Value]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.RelayCmd(Cmd: string; Value: Boolean): TExtFunction;
begin
  JSCode(JSName + '.relayCmd(' + VarToJSON([Cmd, Value]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.SyncValue: TExtFunction;
begin
  JSCode(JSName + '.syncValue();', 'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.ToggleSourceEdit(SourceEdit: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.toggleSourceEdit(' + VarToJSON([SourceEdit]) + ');',
    'TExtFormHtmlEditor');
  Result := Self;
end;

function TExtFormHtmlEditor.UpdateToolbar: TExtFunction;
begin
  JSCode(JSName + '.updateToolbar();', 'TExtFormHtmlEditor');
  Result := Self;
end;

procedure TExtFormHtmlEditor.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'activate') and Assigned(FOnActivate) then
    FOnActivate(TExtFormHtmlEditor(ParamAsObject('This')))
  else if (AEvtName = 'beforepush') and Assigned(FOnBeforepush) then
    FOnBeforepush(TExtFormHtmlEditor(ParamAsObject('This')),
      ParamAsString('Html'))
  else if (AEvtName = 'beforesync') and Assigned(FOnBeforesync) then
    FOnBeforesync(TExtFormHtmlEditor(ParamAsObject('This')),
      ParamAsString('Html'))
  else if (AEvtName = 'editmodechange') and Assigned(FOnEditmodechange) then
    FOnEditmodechange(TExtFormHtmlEditor(ParamAsObject('This')),
      ParamAsBoolean('SourceEdit'))
  else if (AEvtName = 'initialize') and Assigned(FOnInitialize) then
    FOnInitialize(TExtFormHtmlEditor(ParamAsObject('This')))
  else if (AEvtName = 'push') and Assigned(FOnPush) then
    FOnPush(TExtFormHtmlEditor(ParamAsObject('This')), ParamAsString('Html'))
  else if (AEvtName = 'sync') and Assigned(FOnSync) then
    FOnSync(TExtFormHtmlEditor(ParamAsObject('This')), ParamAsString('Html'));
end;

procedure TExtUxCodePress.SetFAutoComplete(Value: Boolean);
begin
  FAutoComplete := Value;
  JSCode('autoComplete:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFAutoResize(Value: Boolean);
begin
  FAutoResize := Value;
  JSCode('autoResize:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress._SetCode(const AValue: string);
begin
  FCode := AValue;
  SetConfigItem('code', 'setCode', AValue);
end;

procedure TExtUxCodePress.SetFHeight(Value: Integer);
begin
  FHeight := Value;
  JSCode('height:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFLanguage(Value: string);
begin
  FLanguage := Value;
  JSCode('language:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFLineNumbers(Value: Boolean);
begin
  FLineNumbers := Value;
  JSCode('lineNumbers:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFPath(Value: string);
begin
  FPath := Value;
  JSCode('path:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFReadOnly(Value: Boolean);
begin
  FReadOnly := Value;
  JSCode('readOnly:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFSourceEl(Value: string);
begin
  FSourceEl := Value;
  JSCode('sourceEl:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFTrim(Value: Boolean);
begin
  FTrim := Value;
  JSCode('trim:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFUrl(Value: string);
begin
  FUrl := Value;
  JSCode('url:' + VarToJSON([Value]));
end;

procedure TExtUxCodePress.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCode('width:' + VarToJSON([Value]));
end;

class function TExtUxCodePress.JSClassName: string;
begin
  Result := 'Ext.ux.CodePress';
end;

function TExtUxCodePress.Edit(Obj: TExtObject; Language: string): TExtFunction;
begin
  JSCode(JSName + '.edit(' + VarToJSON([Obj, false, Language]) + ');',
    'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.SetCode(const ACode: string): TExtFunction;
begin
  Result := CallMethod('setCode', ACode);
end;

function TExtUxCodePress.GetCode: TExtFunction;
begin
  JSCode(JSName + '.getCode();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.GetLanguage: TExtFunction;
begin
  JSCode(JSName + '.getLanguage();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.SetValue(Code: string): TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([Code]) + ');', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.Resize: TExtFunction;
begin
  JSCode(JSName + '.resize();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.ToggleAutoComplete: TExtFunction;
begin
  JSCode(JSName + '.toggleAutoComplete();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.ToggleReadOnly: TExtFunction;
begin
  JSCode(JSName + '.toggleReadOnly();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.ToggleLineNumbers: TExtFunction;
begin
  JSCode(JSName + '.toggleLineNumbers();', 'TExtUxCodePress');
  Result := Self;
end;

function TExtUxCodePress.ToggleEditor: TExtFunction;
begin
  JSCode(JSName + '.toggleEditor();', 'TExtUxCodePress');
  Result := Self;
end;

procedure TExtFormTextField.SetAllowBlank(const AValue: Boolean);
begin
  FAllowBlank := AValue;
  SetConfigItem('allowBlank', AValue);
end;

procedure TExtFormTextField.SetFBlankText(Value: string);
begin
  FBlankText := Value;
  JSCode('blankText:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetFDisableKeyFilter(Value: Boolean);
begin
  FDisableKeyFilter := Value;
  JSCode('disableKeyFilter:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetFEmptyClass(Value: string);
begin
  FEmptyClass := Value;
  JSCode('emptyClass:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetEmptyText(const AValue: string);
begin
  FEmptyText := AValue;
  SetConfigItem('emptyText', AValue);
end;

procedure TExtFormTextField.SetEnableKeyEvents(const AValue: Boolean);
begin
  FEnableKeyEvents := AValue;
  SetConfigItem('enableKeyEvents', AValue);
end;

procedure TExtFormTextField.SetGrow(const AValue: Boolean);
begin
  FGrow := AValue;
  SetConfigItem('grow', AValue);
end;

procedure TExtFormTextField.SetFGrowMax(Value: Integer);
begin
  FGrowMax := Value;
  JSCode('growMax:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetFGrowMin(Value: Integer);
begin
  FGrowMin := Value;
  JSCode('growMin:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetFMaskRe(Value: string);
begin
  FMaskRe := Value;
  JSCode('maskRe:' + VarToJSON([#3 + Value]));
end;

procedure TExtFormTextField.SetMaxLength(const AValue: Integer);
begin
  FMaxLength := AValue;
  SetConfigItem('maxLength', AValue);
end;

procedure TExtFormTextField.SetMaxLengthText(const AValue: string);
begin
  FMaxLengthText := AValue;
  SetConfigItem('maxLengthText', AValue);
end;

procedure TExtFormTextField.SetMinLength(const AValue: Integer);
begin
  FMinLength := AValue;
  SetConfigItem('minLength', AValue);
end;

procedure TExtFormTextField.SetMinLengthText(const AValue: string);
begin
  FMinLengthText := AValue;
  SetConfigItem('minLengthText', AValue);
end;

procedure TExtFormTextField.SetFRegex(Value: string);
begin
  FRegex := Value;
  JSCode('regex:' + VarToJSON([#3 + Value]));
end;

procedure TExtFormTextField.SetFRegexText(Value: string);
begin
  FRegexText := Value;
  JSCode('regexText:' + VarToJSON([Value]));
end;

procedure TExtFormTextField.SetSelectOnFocus(const AValue: Boolean);
begin
  FSelectOnFocus := AValue;
  SetConfigItem('selectOnFocus', AValue);
end;

procedure TExtFormTextField.SetFStripCharsRe(Value: string);
begin
  FStripCharsRe := Value;
  JSCode('stripCharsRe:' + VarToJSON([#3 + Value]));
end;

procedure TExtFormTextField.SetFValidator(Value: TExtFunction);
begin
  FValidator := Value;
  JSCode('validator:' + VarToJSON([Value, true]));
end;

procedure TExtFormTextField.SetVtype(const AValue: string);
begin
  FVtype := AValue;
  SetConfigItem('vtype', AValue);
end;

procedure TExtFormTextField.SetFVtypeText(const AValue: string);
begin
  FVtypeText := AValue;
  SetConfigItem('vtypeText', AValue);
end;

procedure TExtFormTextField.SetFOnAutosize(Value: TExtFormTextFieldOnAutosize);
begin
  if Assigned(FOnAutosize) then
    JSCode(JSName + '.events ["autosize"].listeners=[];');
  if Assigned(Value) then
    on('autosize', Ajax('autosize', ['This', '%0.nm', 'Width', '%1'], true));
  FOnAutosize := Value;
end;

procedure TExtFormTextField.SetFOnKeydown(Value: TExtFormTextFieldOnKeydown);
begin
  if Assigned(FOnKeydown) then
    JSCode(JSName + '.events ["keydown"].listeners=[];');
  if Assigned(Value) then
    on('keydown', Ajax('keydown', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnKeydown := Value;
end;

procedure TExtFormTextField.SetFOnKeypress(Value: TExtFormTextFieldOnKeypress);
begin
  if Assigned(FOnKeypress) then
    JSCode(JSName + '.events ["keypress"].listeners=[];');
  if Assigned(Value) then
    on('keypress', Ajax('keypress', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnKeypress := Value;
end;

procedure TExtFormTextField.SetFOnKeyup(Value: TExtFormTextFieldOnKeyup);
begin
  if Assigned(FOnKeyup) then
    JSCode(JSName + '.events ["keyup"].listeners=[];');
  if Assigned(Value) then
    on('keyup', Ajax('keyup', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnKeyup := Value;
end;

class function TExtFormTextField.JSClassName: string;
begin
  Result := 'Ext.form.TextField';
end;

procedure TExtFormTextField.InitDefaults;
begin
  inherited;
  FAllowBlank := true;
  FBlankText := 'This field is required';
  FEmptyClass := 'x-form-empty-field';
  FGrowMax := 800;
  FGrowMin := 30;
  FMaxLengthText := 'The maximum length for this field is {maxLength}';
  FMinLength := 0;
  FMinLengthText := 'The minimum length for this field is {minLength}';
end;

function TExtFormTextField.AutoSize: TExtFunction;
begin
  JSCode(JSName + '.autoSize();', 'TExtFormTextField');
  Result := Self;
end;

function TExtFormTextField.GetErrors(Value: string): TExtFunction;
begin
  JSCode(JSName + '.getErrors(' + VarToJSON([Value]) + ');',
    'TExtFormTextField');
  Result := Self;
end;

function TExtFormTextField.GetObjectNamePrefix: string;
begin
  Result := 'txtfld';
end;

function TExtFormTextField.Reset: TExtFunction;
begin
  JSCode(JSName + '.reset();', 'TExtFormTextField');
  Result := Self;
end;

function TExtFormTextField.SelectText(Start: Integer = 0; EndJS: Integer = 0)
  : TExtFunction;
begin
  JSCode(JSName + '.selectText(' + VarToJSON([Start, EndJS]) + ');',
    'TExtFormTextField');
  Result := Self;
end;

procedure TExtFormTextField.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'autosize') and Assigned(FOnAutosize) then
    FOnAutosize(TExtFormTextField(ParamAsObject('This')),
      ParamAsInteger('Width'))
  else if (AEvtName = 'keydown') and Assigned(FOnKeydown) then
    FOnKeydown(TExtFormTextField(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'keypress') and Assigned(FOnKeypress) then
    FOnKeypress(TExtFormTextField(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'keyup') and Assigned(FOnKeyup) then
    FOnKeyup(TExtFormTextField(ParamAsObject('This')), ExtEventObject);
end;

procedure TExtFormSliderField.SetFTipText(Value: TExtFunction);
begin
  FTipText := Value;
  JSCode('tipText:' + VarToJSON([Value, true]));
end;

procedure TExtFormSliderField.SetFUseTips(Value: Boolean);
begin
  FUseTips := Value;
  JSCode('useTips:' + VarToJSON([Value]));
end;

class function TExtFormSliderField.JSClassName: string;
begin
  Result := 'Ext.form.SliderField';
end;

procedure TExtFormSliderField.InitDefaults;
begin
  inherited;
end;

function TExtFormSliderField.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtFormSliderField');
  Result := Self;
end;

function TExtFormSliderField.SetMaxValue(V: Integer): TExtFunction;
begin
  JSCode(JSName + '.setMaxValue(' + VarToJSON([V]) + ');',
    'TExtFormSliderField');
  Result := Self;
end;

function TExtFormSliderField.SetMinValue(V: Integer): TExtFunction;
begin
  JSCode(JSName + '.setMinValue(' + VarToJSON([V]) + ');',
    'TExtFormSliderField');
  Result := Self;
end;

function TExtFormSliderField.SetValue(V: Integer; Animate: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([V, Animate]) + ');',
    'TExtFormSliderField');
  Result := Self;
end;

procedure TExtFormDisplayField.SetFFieldClass(Value: string);
begin
  FFieldClass := Value;
  JSCode('fieldClass:' + VarToJSON([Value]));
end;

procedure TExtFormDisplayField.SetFHtmlEncode(Value: Boolean);
begin
  FHtmlEncode := Value;
  JSCode('htmlEncode:' + VarToJSON([Value]));
end;

class function TExtFormDisplayField.JSClassName: string;
begin
  Result := 'Ext.form.DisplayField';
end;

procedure TExtFormDisplayField.InitDefaults;
begin
  inherited;
  FFieldClass := 'x-form-display-field';
end;

procedure TExtFormCompositeField.SetFY(Value: Integer);
begin
  FY := Value;
  JSCode('y:' + VarToJSON([Value]));
end;

procedure TExtFormCompositeField.SetFDefaultMargins(Value: string);
begin
  FDefaultMargins := Value;
  JSCode('defaultMargins:' + VarToJSON([Value]));
end;

procedure TExtFormCompositeField.SetFFieldErrors(Value: TExtObjectList);
begin
  FFieldErrors := Value;
  JSCode('fieldErrors:' + VarToJSON([Value, false]));
end;

procedure TExtFormCompositeField.SetFInnerCt(Value: TExtContainer);
begin
  FInnerCt := Value;
  JSCode('innerCt:' + VarToJSON([Value, false]));
end;

procedure TExtFormCompositeField.SetFIsComposite(Value: Boolean);
begin
  FIsComposite := Value;
  JSCode('isComposite:' + VarToJSON([Value]));
end;

procedure TExtFormCompositeField.SetFItems(Value: TExtObjectList);
begin
  FItems := Value;
  JSCode('items:' + VarToJSON([Value, false]));
end;

procedure TExtFormCompositeField.SetFRendered(Value: Boolean);
begin
  FRendered := Value;
  JSCode('rendered:' + VarToJSON([Value]));
end;

class function TExtFormCompositeField.JSClassName: string;
begin
  Result := 'Ext.form.CompositeField';
end;

procedure TExtFormCompositeField.InitDefaults;
begin
  inherited;
  FFieldErrors := CreateConfigArray('fieldErrors');
  FInnerCt := TExtContainer.CreateInternal(Self, 'innerCt');
  FItems := CreateConfigArray('items');
  FRendered := true;
end;

function TExtFormCompositeField.BuildCombinedErrorMessage
  (Errors: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.buildCombinedErrorMessage(' + VarToJSON(Errors) + ');',
    'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.BuildLabel(Segments: TExtObjectList)
  : TExtFunction;
begin
  JSCode(JSName + '.buildLabel(' + VarToJSON(Segments) + ');',
    'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.ClearInvalidChildren: TExtFunction;
begin
  JSCode(JSName + '.clearInvalidChildren();', 'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.GetObjectNamePrefix: string;
begin
  Result := 'compfld';
end;

function TExtFormCompositeField.IsDirty: TExtFunction;
begin
  JSCode(JSName + '.isDirty();', 'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.OnFieldClearInvalid(Field: TExtFormField)
  : TExtFunction;
begin
  JSCode(JSName + '.onFieldClearInvalid(' + VarToJSON([Field, false]) + ');',
    'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.OnFieldMarkInvalid(Field: TExtFormField;
  Message: string): TExtFunction;
begin
  JSCode(JSName + '.onFieldMarkInvalid(' + VarToJSON([Field, false, message]) +
    ');', 'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.Reset: TExtFunction;
begin
  JSCode(JSName + '.reset();', 'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.SortErrors: TExtFunction;
begin
  JSCode(JSName + '.sortErrors();', 'TExtFormCompositeField');
  Result := Self;
end;

function TExtFormCompositeField.ValidateValue: TExtFunction;
begin
  JSCode(JSName + '.validateValue();', 'TExtFormCompositeField');
  Result := Self;
end;

procedure TExtFormCheckbox.SetFAutoCreate(Value: string);
begin
  FAutoCreate := Value;
  JSCode('autoCreate:' + VarToJSON([Value]));
end;

procedure TExtFormCheckbox.SetBoxLabel(const AValue: string);
begin
  FBoxLabel := AValue;
  SetConfigItem('boxLabel', AValue);
end;

procedure TExtFormCheckbox.SetFBoxLabel_(Value: string);
begin
  FBoxLabel_ := Value;
  JSCode('boxLabel:' + VarToJSON([Value]));
end;

procedure TExtFormCheckbox.SetChecked(const AValue: Boolean);
begin
  FChecked := AValue;
  SetConfigItem('checked', AValue);
end;

procedure TExtFormCheckbox.SetFFieldClass(Value: string);
begin
  FFieldClass := Value;
  JSCode('fieldClass:' + VarToJSON([Value]));
end;

procedure TExtFormCheckbox.SetFFocusClass(Value: string);
begin
  FFocusClass := Value;
  JSCode('focusClass:' + VarToJSON([Value]));
end;

procedure TExtFormCheckbox.SetFHandler(Value: TExtFunction);
begin
  FHandler := Value;
  JSCode('handler:' + VarToJSON([Value, true]));
end;

procedure TExtFormCheckbox.SetFInputValue(Value: string);
begin
  FInputValue := Value;
  JSCode('inputValue:' + VarToJSON([Value]));
end;

procedure TExtFormCheckbox.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCode('scope:' + VarToJSON([Value, false]));
end;

procedure TExtFormCheckbox.SetFOnCheck(Value: TExtFormCheckboxOnCheck);
begin
  if Assigned(FOnCheck) then
    JSCode(JSName + '.events ["check"].listeners=[];');
  if Assigned(Value) then
    on('check', Ajax('check', ['This', '%0.nm', 'Checked', '%1'], true));
  FOnCheck := Value;
end;

class function TExtFormCheckbox.JSClassName: string;
begin
  Result := 'Ext.form.Checkbox';
end;

procedure TExtFormCheckbox.InitDefaults;
begin
  inherited;
  FAutoCreate := 'input';
  FFieldClass := 'x-form-field';
  FScope := TExtObject.CreateInternal(Self, 'scope');
end;

function TExtFormCheckbox.GetObjectNamePrefix: string;
begin
  Result := 'chkbox';
end;

function TExtFormCheckbox.GetValue: TExtFunction;
begin
  Result := CallMethod('getValue', []);
end;

function TExtFormCheckbox.SetValue(const AChecked: Boolean): TExtFunction;
begin
  Result := CallMethod('setValue', AChecked);
end;

function TExtFormCheckbox.SetValue(const AChecked: string): TExtFunction;
begin
  Result := CallMethod('setValue', AChecked);
end;

procedure TExtFormCheckbox.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'check') and Assigned(FOnCheck) then
    FOnCheck(TExtFormCheckbox(ParamAsObject('This')),
      ParamAsBoolean('Checked'));
end;

procedure TExtFormCheckboxGroup.SetFAllowBlank(Value: Boolean);
begin
  FAllowBlank := Value;
  JSCode('allowBlank:' + VarToJSON([Value]));
end;

procedure TExtFormCheckboxGroup.SetFBlankText(Value: string);
begin
  FBlankText := Value;
  JSCode('blankText:' + VarToJSON([Value]));
end;

procedure TExtFormCheckboxGroup.SetFColumns(Value: string);
begin
  FColumns := Value;
  JSCode('columns:' + VarToJSON([Value]));
end;

procedure TExtFormCheckboxGroup.SetFColumnsNumber(Value: Integer);
begin
  FColumnsNumber := Value;
  JSCode('columns:' + VarToJSON([Value]));
end;

procedure TExtFormCheckboxGroup.SetFColumnsArray(Value: TExtObjectList);
begin
  FColumnsArray := Value;
  JSCode('columns:' + VarToJSON([Value, false]));
end;

procedure TExtFormCheckboxGroup.SetFItems(Value: TExtObjectList);
begin
  FItems := Value;
  JSCode('items:' + VarToJSON([Value, false]));
end;

procedure TExtFormCheckboxGroup.SetFVertical(Value: Boolean);
begin
  FVertical := Value;
  JSCode('vertical:' + VarToJSON([Value]));
end;

procedure TExtFormCheckboxGroup.SetFOnChange
  (Value: TExtFormCheckboxGroupOnChange);
begin
  if Assigned(FOnChange) then
    JSCode(JSName + '.events ["change"].listeners=[];');
  if Assigned(Value) then
    on('change', Ajax('change', ['This', '%0.nm', 'Checked', '%1.nm'], true));
  FOnChange := Value;
end;

class function TExtFormCheckboxGroup.JSClassName: string;
begin
  Result := 'Ext.form.CheckboxGroup';
end;

procedure TExtFormCheckboxGroup.InitDefaults;
begin
  inherited;
  FAllowBlank := true;
  FBlankText := 'You must select at least one item in this group';
  FColumnsArray := CreateConfigArray('columns');
  FItems := CreateConfigArray('items');
end;

function TExtFormCheckboxGroup.GetErrors: TExtFunction;
begin
  JSCode(JSName + '.getErrors();', 'TExtFormCheckboxGroup');
  Result := Self;
end;

function TExtFormCheckboxGroup.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtFormCheckboxGroup');
  Result := Self;
end;

function TExtFormCheckboxGroup.SetValue(Id: string; Value: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([Id, Value]) + ');',
    'TExtFormCheckboxGroup');
  Result := Self;
end;

procedure TExtFormCheckboxGroup.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'change') and Assigned(FOnChange) then
    FOnChange(TExtFormCheckboxGroup(ParamAsObject('This')),
      TExtObjectList(ParamAsObject('Checked')));
end;

procedure TExtFormTextArea.SetFAutoCreate(Value: string);
begin
  FAutoCreate := Value;
  JSCode('autoCreate:' + VarToJSON([Value]));
end;

procedure TExtFormTextArea.SetFGrowMax(Value: Integer);
begin
  FGrowMax := Value;
  JSCode('growMax:' + VarToJSON([Value]));
end;

procedure TExtFormTextArea.SetFGrowMin(Value: Integer);
begin
  FGrowMin := Value;
  JSCode('growMin:' + VarToJSON([Value]));
end;

procedure TExtFormTextArea.SetFPreventScrollbars(Value: Boolean);
begin
  FPreventScrollbars := Value;
  JSCode('preventScrollbars:' + VarToJSON([Value]));
end;

class function TExtFormTextArea.JSClassName: string;
begin
  Result := 'Ext.form.TextArea';
end;

function TExtFormTextArea.GetObjectNamePrefix: string;
begin
  Result := 'txtarea';
end;

procedure TExtFormTextArea.InitDefaults;
begin
  inherited;
  FGrowMax := 1000;
  FGrowMin := 60;
end;

function TExtFormTextArea.AutoSize: TExtFunction;
begin
  JSCode(JSName + '.autoSize();', 'TExtFormTextArea');
  Result := Self;
end;

procedure TExtFormTriggerField.SetFAutoCreate(Value: string);
begin
  FAutoCreate := Value;
  JSCode('autoCreate:' + VarToJSON([Value]));
end;

procedure TExtFormTriggerField._SetEditable(const AValue: Boolean);
begin
  FEditable := AValue;
  SetConfigItem('editable', 'setEditable', AValue);
end;

procedure TExtFormTriggerField.SetFHideTrigger(Value: Boolean);
begin
  FHideTrigger := Value;
  JSCode('hideTrigger:' + VarToJSON([Value]));
end;

procedure TExtFormTriggerField._SetReadOnly(const AValue: Boolean);
begin
  FReadOnly := AValue;
  SetConfigItem('readOnly', 'setReadOnly', AValue);
end;

procedure TExtFormTriggerField.SetTriggerClass(const AValue: string);
begin
  FTriggerClass := SetConfigItem('triggerClass', AValue);
end;

procedure TExtFormTriggerField.SetFTriggerConfig(Value: string);
begin
  FTriggerConfig := Value;
  JSCode('triggerConfig:' + VarToJSON([Value]));
end;

procedure TExtFormTriggerField.SetFWrapFocusClass(Value: string);
begin
  FWrapFocusClass := Value;
  JSCode('wrapFocusClass:' + VarToJSON([Value]));
end;

class function TExtFormTriggerField.JSClassName: string;
begin
  Result := 'Ext.form.TriggerField';
end;

procedure TExtFormTriggerField.InitDefaults;
begin
  inherited;
  FEditable := true;
end;

function TExtFormTriggerField.SetEditable(const AValue: Boolean): TExtFunction;
begin
  Result := CallMethod('setEditable', AValue);
end;

function TExtFormTriggerField.SetReadOnly(const AValue: Boolean): TExtFunction;
begin
  Result := CallMethod('setReadOnly', AValue);
end;

procedure TExtFormNumberField.SetAllowDecimals(const AValue: Boolean);
begin
  FAllowDecimals := AValue;
  SetConfigItem('allowDecimals', AValue);
end;

procedure TExtFormNumberField.SetAllowNegative(AValue: Boolean);
begin
  FAllowNegative := AValue;
  SetConfigItem('allowNegative', AValue);
end;

procedure TExtFormNumberField.SetFBaseChars(Value: string);
begin
  FBaseChars := Value;
  JSCode('baseChars:' + VarToJSON([Value]));
end;

procedure TExtFormNumberField.SetDecimalPrecision(const AValue: Integer);
begin
  FDecimalPrecision := AValue;
  SetConfigItem('decimalPrecision', AValue);
end;

procedure TExtFormNumberField.SetDecimalSeparator(const AValue: string);
begin
  FDecimalSeparator := AValue;
  SetConfigItem('decimalSeparator', AValue);
end;

procedure TExtFormNumberField.SetFFieldClass(Value: string);
begin
  FFieldClass := Value;
  JSCode('fieldClass:' + VarToJSON([Value]));
end;

procedure TExtFormNumberField.SetMaxText(const AValue: string);
begin
  FMaxText := AValue;
  SetConfigItem('maxText', AValue);
end;

procedure TExtFormNumberField._SetMaxValue(const AValue: Integer);
begin
  FMaxValue := AValue;
  SetConfigItem('maxValue', 'setMaxValue', AValue);
end;

procedure TExtFormNumberField.SetMinText(const AValue: string);
begin
  FMinText := AValue;
  SetConfigItem('minText', AValue);
end;

procedure TExtFormNumberField._SetMinValue(const AValue: Integer);
begin
  FMinValue := AValue;
  SetConfigItem('minValue', 'setMinValue', AValue);
end;

procedure TExtFormNumberField.SetNanText(const AValue: string);
begin
  FNanText := AValue;
  SetConfigItem('nanText', AValue);
end;

class function TExtFormNumberField.JSClassName: string;
begin
  Result := 'Ext.form.NumberField';
end;

function TExtFormNumberField.GetObjectNamePrefix: string;
begin
  Result := 'numfld';
end;

procedure TExtFormNumberField.InitDefaults;
begin
  inherited;
  FAllowDecimals := true;
  FAllowNegative := true;
  FBaseChars := '0123456789';
  FDecimalPrecision := 2;
  FDecimalSeparator := '.';
  FFieldClass := 'x-form-field x-form-num-field';
  FMaxText := 'The maximum value for this field is {maxValue}';
  FMinText := 'The minimum value for this field is {minValue}';
  FNanText := '{value} is not a valid number';
end;

function TExtFormNumberField.GetErrors(Value: string): TExtFunction;
begin
  JSCode(JSName + '.getErrors(' + VarToJSON([Value]) + ');',
    'TExtFormNumberField');
  Result := Self;
end;

function TExtFormNumberField.SetMaxValue(const AValue: Integer): TExtFunction;
begin
  FMaxValue := AValue;
  Result := CallMethod('setMaxValue', AValue);
end;

function TExtFormNumberField.SetMinValue(const AValue: Integer): TExtFunction;
begin
  FMinValue := AValue;
  Result := CallMethod('setMinValue', AValue);
end;

procedure TExtFormFieldSet.SetFAnimCollapse(Value: Boolean);
begin
  FAnimCollapse := Value;
  JSCode('animCollapse:' + VarToJSON([Value]));
end;

procedure TExtFormFieldSet.SetFBaseCls(Value: string);
begin
  FBaseCls := Value;
  JSCode('baseCls:' + VarToJSON([Value]));
end;

procedure TExtFormFieldSet.SetFCheckboxName(Value: string);
begin
  FCheckboxName := Value;
  JSCode('checkboxName:' + VarToJSON([Value]));
end;

procedure TExtFormFieldSet.SetFCheckboxToggle(Value: string);
begin
  FCheckboxToggle := Value;
  JSCode('checkboxToggle:' + VarToJSON([Value]));
end;

procedure TExtFormFieldSet.SetCollapsible(const AValue: Boolean);
begin
  FCollapsible := AValue;
  SetConfigItem('collapsible', AValue);
end;

procedure TExtFormFieldSet.SetFItemCls(Value: string);
begin
  FItemCls := Value;
  JSCode('itemCls:' + VarToJSON([Value]));
end;

procedure TExtFormFieldSet.SetLabelWidth(AValue: Integer);
begin
  FLabelWidth := AValue;
  SetConfigItem('labelWidth', AValue);
end;

procedure TExtFormFieldSet.SetFLayout(Value: string);
begin
  FLayout := Value;
  JSCode('layout:' + VarToJSON([Value]));
end;

class function TExtFormFieldSet.JSClassName: string;
begin
  Result := 'Ext.form.FieldSet';
end;

function TExtFormFieldSet.GetObjectNamePrefix: string;
begin
  Result := 'fldset';
end;

procedure TExtFormFieldSet.InitDefaults;
begin
  inherited;
  FBaseCls := 'x-fieldset';
  FCheckboxName := '[checkbox id]-checkbox';
  FLayout := 'form';
end;

function TExtFormFieldSet.OnCheckClick: TExtFunction;
begin
  JSCode(JSName + '.onCheckClick();', 'TExtFormFieldSet');
  Result := Self;
end;

procedure TExtFormFormPanel.SetFButtons(Value: TExtObjectList);
begin
  FButtons := Value;
  JSCode('buttons:' + VarToJSON([Value, false]));
end;

procedure TExtFormFormPanel.SetFFormId(Value: string);
begin
  FFormId := Value;
  JSCode('formId:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetFHideLabels(Value: Boolean);
begin
  FHideLabels := Value;
  JSCode('hideLabels:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetFItemCls(Value: string);
begin
  FItemCls := Value;
  JSCode('itemCls:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetFLabelPad(Value: Integer);
begin
  FLabelPad := Value;
  JSCode('labelPad:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetLabelSeparator(const AValue: string);
begin
  FLabelSeparator := AValue;
  SetConfigItem('labelSeparator', AValue);
end;

procedure TExtFormFormPanel.SetFLayout(Value: string);
begin
  FLayout := Value;
  JSCode('layout:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetFMinButtonWidth(Value: Integer);
begin
  FMinButtonWidth := Value;
  JSCode('minButtonWidth:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetFMonitorPoll(Value: Integer);
begin
  FMonitorPoll := Value;
  JSCode('monitorPoll:' + VarToJSON([Value]));
end;

procedure TExtFormFormPanel.SetMonitorValid(const AValue: Boolean);
begin
  FMonitorValid := AValue;
  SetConfigItem('monitorValid', AValue);
end;

procedure TExtFormFormPanel.SetFileUpload(const AValue: Boolean);
begin
  FFileUpload := AValue;
  SetConfigItem('fileUpload', AValue);
end;

procedure TExtFormFormPanel.SetFOnClientvalidation
  (Value: TExtFormFormPanelOnClientvalidation);
begin
  if Assigned(FOnClientvalidation) then
    JSCode(JSName + '.events ["clientvalidation"].listeners=[];');
  if Assigned(Value) then
    on('clientvalidation', Ajax('clientvalidation', ['This', '%0.nm', 'Valid',
      '%1'], true));
  FOnClientvalidation := Value;
end;

class function TExtFormFormPanel.JSClassName: string;
begin
  Result := 'Ext.form.FormPanel';
end;

procedure TExtFormFormPanel.InitDefaults;
begin
  inherited;
  FButtons := CreateConfigArray('buttons');
  FLabelPad := 5;
  FMinButtonWidth := 75;
  FMonitorPoll := 200;
  FForm := TExtFormBasicForm.CreateInternal(Self, 'getForm()');
end;

function TExtFormFormPanel.GetForm: TExtFormBasicForm;
begin
  //CallMethod('getForm', []);
  //Result := Self;
  Result := FForm;
end;

function TExtFormFormPanel.Load(const AOptions: TExtObject): TExtFunction;
begin
  Result := CallMethod('load', AOptions);
end;

function TExtFormFormPanel.StartMonitoring: TExtFunction;
begin
  JSCode(JSName + '.startMonitoring();', 'TExtFormFormPanel');
  Result := Self;
end;

function TExtFormFormPanel.StopMonitoring: TExtFunction;
begin
  JSCode(JSName + '.stopMonitoring();', 'TExtFormFormPanel');
  Result := Self;
end;

procedure TExtFormFormPanel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'clientvalidation') and Assigned(FOnClientvalidation) then
    FOnClientvalidation(TExtFormFormPanel(ParamAsObject('This')),
      ParamAsBoolean('Valid'));
end;

procedure TExtFormRadioGroup.SetFAllowBlank(Value: Boolean);
begin
  FAllowBlank := Value;
  JSCode('allowBlank:' + VarToJSON([Value]));
end;

procedure TExtFormRadioGroup.SetFBlankText(Value: string);
begin
  FBlankText := Value;
  JSCode('blankText:' + VarToJSON([Value]));
end;

procedure TExtFormRadioGroup.SetFItems(Value: TExtObjectList);
begin
  FItems := Value;
  JSCode('items:' + VarToJSON([Value, false]));
end;

procedure TExtFormRadioGroup.SetFOnChange(Value: TExtFormRadioGroupOnChange);
begin
  if Assigned(FOnChange) then
    JSCode(JSName + '.events ["change"].listeners=[];');
  if Assigned(Value) then
    on('change', Ajax('change', ['This', '%0.nm', 'Checked', '%1.nm'], true));
  FOnChange := Value;
end;

class function TExtFormRadioGroup.JSClassName: string;
begin
  Result := 'Ext.form.RadioGroup';
end;

procedure TExtFormRadioGroup.InitDefaults;
begin
  inherited;
  FAllowBlank := true;
  FBlankText := 'You must select one item in this group';
  FItems := CreateConfigArray('items');
end;

function TExtFormRadioGroup.GetValue: TExtFunction;
begin
  JSCode(JSName + '.getValue();', 'TExtFormRadioGroup');
  Result := Self;
end;

function TExtFormRadioGroup.OnSetValue(Id: string; Value: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.onSetValue(' + VarToJSON([Id, Value]) + ');',
    'TExtFormRadioGroup');
  Result := Self;
end;

function TExtFormRadioGroup.OnSetValue(Id: TExtFormRadio; Value: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.onSetValue(' + VarToJSON([Id, false, Value]) + ');',
    'TExtFormRadioGroup');
  Result := Self;
end;

procedure TExtFormRadioGroup.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'change') and Assigned(FOnChange) then
    FOnChange(TExtFormRadioGroup(ParamAsObject('This')),
      TExtFormRadio(ParamAsObject('Checked')));
end;

class function TExtFormRadio.JSClassName: string;
begin
  Result := 'Ext.form.Radio';
end;

procedure TExtFormRadio.InitDefaults;
begin
  inherited;
end;

function TExtFormRadio.GetGroupValue: TExtFunction;
begin
  JSCode(JSName + '.getGroupValue();', 'TExtFormRadio');
  Result := Self;
end;

function TExtFormRadio.SetValue(Value: string): TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([Value]) + ');', 'TExtFormRadio');
  Result := Self;
end;

function TExtFormRadio.SetValue(Value: Boolean): TExtFunction;
begin
  JSCode(JSName + '.setValue(' + VarToJSON([Value]) + ');', 'TExtFormRadio');
  Result := Self;
end;

procedure TExtFormDateField.SetAltFormats(const AValue: string);
begin
  FAltFormats := AValue;
  SetConfigItem('altFormats', AValue);
end;

procedure TExtFormDateField.SetFAutoCreate(Value: string);
begin
  FAutoCreate := Value;
  JSCode('autoCreate:' + VarToJSON([Value]));
end;

procedure TExtFormDateField._SetDisabledDates(const AValue: TExtObjectList);
begin
  FDisabledDates := AValue;
  SetConfigItem('disabledDates', 'setDisabledDates', AValue);
end;

procedure TExtFormDateField.SetFDisabledDatesText(Value: string);
begin
  FDisabledDatesText := Value;
  JSCode('disabledDatesText:' + VarToJSON([Value]));
end;

procedure TExtFormDateField._SetDisabledDays(const AValue: TExtObjectList);
begin
  FDisabledDays.Free;
  FDisabledDays := TExtObjectList(SetConfigItem('disabledDays', 'setDisabledDays', AValue));
end;

procedure TExtFormDateField.SetFDisabledDaysText(Value: string);
begin
  FDisabledDaysText := Value;
  JSCode('disabledDaysText:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFormat(const AValue: string);
begin
  FFormat := AValue;
  SetConfigItem('format', AValue);
end;

procedure TExtFormDateField.SetFInvalidText(Value: string);
begin
  FInvalidText := Value;
  JSCode('invalidText:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFMaxText(Value: string);
begin
  FMaxText := Value;
  JSCode('maxText:' + VarToJSON([Value]));
end;

procedure TExtFormDateField._SetMaxValue(const AValue: TDateTime);
begin
  FMaxValue := AValue;
  SetConfigItem('maxValue', 'setMaxValue', AValue);
end;

procedure TExtFormDateField.SetFMaxValueString(Value: string);
begin
  FMaxValueString := Value;
  JSCode('maxValue:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFMinText(Value: string);
begin
  FMinText := Value;
  JSCode('minText:' + VarToJSON([Value]));
end;

procedure TExtFormDateField._SetMinValue(const AValue: TDateTime);
begin
  FMinValue := AValue;
  SetConfigItem('minValue', 'setMinValue', AValue);
end;

procedure TExtFormDateField.SetFMinValueString(Value: string);
begin
  FMinValueString := Value;
  JSCode('minValue:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFShowToday(Value: Boolean);
begin
  FShowToday := Value;
  JSCode('showToday:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFTriggerClass(Value: string);
begin
  FTriggerClass := Value;
  JSCode('triggerClass:' + VarToJSON([Value]));
end;

procedure TExtFormDateField.SetFOnSelect(Value: TExtFormDateFieldOnSelect);
begin
  if Assigned(FOnSelect) then
    JSCode(JSName + '.events ["select"].listeners=[];');
  if Assigned(Value) then
    on('select', Ajax('select', ['This', '%0.nm', 'Date', '%1'], true));
  FOnSelect := Value;
end;

class function TExtFormDateField.JSClassName: string;
begin
  Result := 'Ext.form.DateField';
end;

procedure TExtFormDateField.InitDefaults;
begin
  inherited;
  FAltFormats :=
    'm/d/Y|n/j/Y|n/j/y|m/j/y|n/d/y|m/j/Y|n/d/Y|m-d-y|m-d-Y|m/d|m-d|md|mdy|mdY|d|Y-m-d';
  FDisabledDates := CreateConfigArray('disabledDates');
  FDisabledDatesText := 'Disabled';
  FDisabledDays := CreateConfigArray('disabledDays');
  FDisabledDaysText := 'Disabled';
  FFormat := 'm/d/Y';
  FInvalidText :=
    '{value} is not a valid date - it must be in the format {format}';
  FMaxText := 'The date in this field must be before {maxValue}';
  FMinText := 'The date in this field must be after {minValue}';
  FShowToday := true;
  FTriggerClass := 'x-form-date-trigger';
end;

function TExtFormDateField.GetErrors(Value: string): TExtFunction;
begin
  JSCode(JSName + '.getErrors(' + VarToJSON([Value]) + ');',
    'TExtFormDateField');
  Result := Self;
end;

function TExtFormDateField.GetObjectNamePrefix: string;
begin
  Result := 'datefld';
end;

function TExtFormDateField.GetValue: TExtFunction;
begin
  Result := CallMethod('getValue', []);
end;

function TExtFormDateField.SetDisabledDates(const ADisabledDates: TExtObjectList): TExtFunction;
begin
  FDisabledDates.Free;
  FDisabledDates := ADisabledDates;
  Result := CallMethod('setDisabledDates', ADisabledDates);
end;

function TExtFormDateField.SetDisabledDays(const ADisabledDays: TExtObjectList): TExtFunction;
begin
  FDisabledDays.Free;
  FDisabledDays := ADisabledDays;
  Result := CallMethod('setDisabledDays', ADisabledDays);
end;

function TExtFormDateField.SetMaxValue(const AValue: TDateTime): TExtFunction;
begin
  FMaxValue := AValue;
  Result := CallMethod('setMaxValue', AValue);
end;

function TExtFormDateField.SetMinValue(const AValue: TDateTime): TExtFunction;
begin
  FMinValue := AValue;
  Result := CallMethod('setMinValue', AValue);
end;

function TExtFormDateField.SetValue(const ADate: string): TExtFunction;
begin
  Result := CallMethod('setValue', [ADate]);
end;

function TExtFormDateField.SetValue(const ADate: TDateTime): TExtFunction;
begin
  Result := CallMethod('setValue', [ADate]);
end;

procedure TExtFormDateField.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'select') and Assigned(FOnSelect) then
    FOnSelect(TExtFormDateField(ParamAsObject('This')),
      ParamAsDateTime('Date'));
end;

procedure TExtFormComboBox.SetFAllQuery(Value: string);
begin
  FAllQuery := Value;
  JSCode('allQuery:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFAutoCreate(Value: string);
begin
  FAutoCreate := Value;
  JSCode('autoCreate:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetAutoSelect(const AValue: Boolean);
begin
  FAutoSelect := AValue;
  SetConfigItem('autoSelect', AValue);
end;

procedure TExtFormComboBox.SetFClearFilterOnReset(Value: Boolean);
begin
  FClearFilterOnReset := Value;
  JSCode('clearFilterOnReset:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetDisplayField(const AValue: string);
begin
  FDisplayField := AValue;
  SetConfigItem('displayField', AValue);
end;

procedure TExtFormComboBox.SetForceSelection(const AValue: Boolean);
begin
  FForceSelection := AValue;
  SetConfigItem('forceSelection', AValue);
end;

procedure TExtFormComboBox.SetFHandleHeight(Value: Integer);
begin
  FHandleHeight := Value;
  JSCode('handleHeight:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFHiddenId(Value: string);
begin
  FHiddenId := Value;
  JSCode('hiddenId:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetHiddenName(const AValue: string);
begin
  FHiddenName := AValue;
  SetConfigItem('hiddenName', AValue);
end;

procedure TExtFormComboBox.SetHiddenValue(const AValue: string);
begin
  FHiddenValue := SetConfigItem('hiddenValue', AValue);
end;

procedure TExtFormComboBox.SetFItemSelector(Value: string);
begin
  FItemSelector := Value;
  JSCode('itemSelector:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFLazyInit(Value: Boolean);
begin
  FLazyInit := Value;
  JSCode('lazyInit:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetLazyRender(const AValue: Boolean);
begin
  FLazyRender := SetConfigItem('lazyRender', AValue);
end;

procedure TExtFormComboBox.SetFListAlign(Value: string);
begin
  FListAlign := Value;
  JSCode('listAlign:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFListAlignArray(Value: TExtObjectList);
begin
  FListAlignArray := Value;
  JSCode('listAlign:' + VarToJSON([Value, false]));
end;

procedure TExtFormComboBox.SetFListClass(Value: string);
begin
  FListClass := Value;
  JSCode('listClass:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFListEmptyText(Value: string);
begin
  FListEmptyText := Value;
  JSCode('listEmptyText:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetListWidth(const AValue: Integer);
begin
  FListWidth := SetConfigItem('listWidth', AValue);
end;

procedure TExtFormComboBox.SetListWidthFunc(const AValue: TExtFunction);
begin
  FListWidthFunc := SetFunctionConfigItem('listWidth', AValue);
end;

procedure TExtFormComboBox.SetFLoadingText(Value: string);
begin
  FLoadingText := Value;
  JSCode('loadingText:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFMaxHeight(Value: Integer);
begin
  FMaxHeight := Value;
  JSCode('maxHeight:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetMinChars(const AValue: Integer);
begin
  FMinChars := SetConfigItem('minChars', AValue);
end;

procedure TExtFormComboBox.SetMinHeight(const AValue: Integer);
begin
  FMinHeight := SetConfigItem('minHeight', AValue);
end;

procedure TExtFormComboBox.SetMinHeightFunc(const AValue: TExtFunction);
begin
  FMinHeightFunc := SetFunctionConfigItem('minHeight', AValue);
end;

procedure TExtFormComboBox.SetMinListWidth(const AValue: Integer);
begin
  FMinListWidth := AValue;
  SetConfigItem('minListWidth', AValue);
end;

procedure TExtFormComboBox.SetMode(const AValue: string);
begin
  FMode := AValue;
  SetConfigItem('mode', AValue);
end;

procedure TExtFormComboBox.SetPageSize(const AValue: Integer);
begin
  FPageSize := AValue;
  SetConfigItem('pageSize', AValue);
end;

procedure TExtFormComboBox.SetQueryDelay(const AValue: Integer);
begin
  FQueryDelay := AValue;
  SetConfigItem('queryDelay', AValue);
end;

procedure TExtFormComboBox.SetQueryParam(const AValue: string);
begin
  FQueryParam := AValue;
  SetConfigItem('queryParam', AValue);
end;

procedure TExtFormComboBox.SetSelectOnFocus(const AValue: Boolean);
begin
  FSelectOnFocus := AValue;
  SetConfigItem('selectOnFocus', AValue);
end;

procedure TExtFormComboBox.SetSelectedClass(const AValue: string);
begin
  FSelectedClass := AValue;
  SetConfigItem('selectedClass', AValue);
end;

procedure TExtFormComboBox.SetFShadow(Value: Boolean);
begin
  FShadow := Value;
  JSCode('shadow:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFShadowString(Value: string);
begin
  FShadowString := Value;
  JSCode('shadow:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetStore(const AValue: TExtDataStore);
begin
  FStore.Free;
  FStore := AValue;
  SetConfigItem('store', AValue);
end;

procedure TExtFormComboBox.SetStoreArray(const AValue: TExtObjectList);
begin
  FStoreArray.Free;
  FStoreArray := AValue;
  SetConfigItem('store', AValue);
end;

procedure TExtFormComboBox.SetFTitle(Value: string);
begin
  FTitle := Value;
  JSCode('title:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFTpl(Value: string);
begin
  FTpl := Value;
  JSCode('tpl:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetFTplExtXTemplate(Value: TExtXTemplate);
begin
  FTplExtXTemplate := Value;
  JSCode('tpl:' + VarToJSON([Value, false]));
end;

procedure TExtFormComboBox.SetFTransform(Value: string);
begin
  FTransform := Value;
  JSCode('transform:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetTriggerAction(const AValue: string);
begin
  FTriggerAction := AValue;
  SetConfigItem('triggerAction', AValue);
end;

procedure TExtFormComboBox.SetFTriggerClass(Value: string);
begin
  FTriggerClass := Value;
  JSCode('triggerClass:' + VarToJSON([Value]));
end;

procedure TExtFormComboBox.SetTypeAhead(const AValue: Boolean);
begin
  FTypeAhead := AValue;
  SetConfigItem('typeAhead', AValue);
end;

procedure TExtFormComboBox.SetTypeAheadDelay(const AValue: Integer);
begin
  FTypeAheadDelay := AValue;
  SetConfigItem('typeAheadDelay', AValue);
end;

procedure TExtFormComboBox.SetValueField(const AValue: string);
begin
  FValueField := AValue;
  SetConfigItem('valueField', AValue);
end;

procedure TExtFormComboBox.SetValueNotFoundText(const AValue: string);
begin
  FValueNotFoundText := AValue;
  SetConfigItem('valueNotFoundText', AValue);
end;

procedure TExtFormComboBox.SetFKeyNav(Value: TExtKeyNav);
begin
  FKeyNav := Value;
  JSCode(JSName + '.keyNav=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormComboBox.SetFLastQuery(Value: string);
begin
  FLastQuery := Value;
  JSCode(JSName + '.lastQuery=' + VarToJSON([Value]) + ';');
end;

procedure TExtFormComboBox.SetFView(Value: TExtDataView);
begin
  FView := Value;
  JSCode(JSName + '.view=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtFormComboBox.SetFOnBeforequery
  (Value: TExtFormComboBoxOnBeforequery);
begin
  if Assigned(FOnBeforequery) then
    JSCode(JSName + '.events ["beforequery"].listeners=[];');
  if Assigned(Value) then
    on('beforequery', Ajax('beforequery', ['QueryEvent', '%0.nm'], true));
  FOnBeforequery := Value;
end;

procedure TExtFormComboBox.SetFOnBeforeselect
  (Value: TExtFormComboBoxOnBeforeselect);
begin
  if Assigned(FOnBeforeselect) then
    JSCode(JSName + '.events ["beforeselect"].listeners=[];');
  if Assigned(Value) then
    on('beforeselect', Ajax('beforeselect', ['Combo', '%0.nm', 'RecordJS',
      '%1.nm', 'Index', '%2'], true));
  FOnBeforeselect := Value;
end;

procedure TExtFormComboBox.SetFOnCollapse(Value: TExtFormComboBoxOnCollapse);
begin
  if Assigned(FOnCollapse) then
    JSCode(JSName + '.events ["collapse"].listeners=[];');
  if Assigned(Value) then
    on('collapse', Ajax('collapse', ['Combo', '%0.nm'], true));
  FOnCollapse := Value;
end;

procedure TExtFormComboBox.SetFOnExpand(Value: TExtFormComboBoxOnExpand);
begin
  if Assigned(FOnExpand) then
    JSCode(JSName + '.events ["expand"].listeners=[];');
  if Assigned(Value) then
    on('expand', Ajax('expand', ['Combo', '%0.nm'], true));
  FOnExpand := Value;
end;

procedure TExtFormComboBox.SetFOnSelect(Value: TExtFormComboBoxOnSelect);
begin
  if Assigned(FOnSelect) then
    JSCode(JSName + '.events ["select"].listeners=[];');
  if Assigned(Value) then
    on('select', Ajax('select', ['Combo', '%0.nm', 'RecordJS', '%1.nm', 'Index',
      '%2'], true));
  FOnSelect := Value;
end;

class function TExtFormComboBox.JSClassName: string;
begin
  Result := 'Ext.form.ComboBox';
end;

procedure TExtFormComboBox.InitDefaults;
begin
  inherited;
  FAutoSelect := true;
  FClearFilterOnReset := true;
  FDisplayField := 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-mode';
  FHandleHeight := 8;
  FHiddenId := 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-hiddenName';
  FLazyInit := true;
  FListAlign := 'tl-bl?';
  FListAlignArray := CreateConfigArray('listAlign');
  FListConfig := TExtObject.CreateInternal(Self, 'listConfig');
  FLoadingText := 'Loading...';
  FMaxHeight := 300;
  FMinChars := 4;
  FMinHeight := 90;
  FMinListWidth := 70;
  FPageSize := 0;
  FQueryDelay := 500;
  FQueryParam := 'query';
  FSelectOnFocus := true;
  FSelectedClass := 'x-combo-selected';
  FStore := TExtDataStore.CreateInternal(Self, 'store');
  FStoreArray := CreateConfigArray('store');
  FTplExtXTemplate := TExtXTemplate.CreateInternal(Self, 'tpl');
  FTriggerClass := 'x-form-arrow-trigger';
  FTypeAheadDelay := 250;
  FValueField := 'output/Ext.form.ComboBox.html#Ext.form.ComboBox-mode';
  FKeyNav := TExtKeyNav.CreateInternal(Self, 'keyNav');
  FView := TExtDataView.CreateInternal(Self, 'view');
end;

function TExtFormComboBox.ClearValue: TExtFunction;
begin
  Result := CallMethod('clearValue', []);
end;

function TExtFormComboBox.Collapse: TExtFunction;
begin
  JSCode(JSName + '.collapse();', 'TExtFormComboBox');
  Result := Self;
end;

function TExtFormComboBox.DoQuery(Query: string; ForceAll: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.doQuery(' + VarToJSON([Query, ForceAll]) + ');',
    'TExtFormComboBox');
  Result := Self;
end;

function TExtFormComboBox.Expand: TExtFunction;
begin
  Result := CallMethod('expand', []);
end;

function TExtFormComboBox.GetListParent: TExtFunction;
begin
  Result := CallMethod('getListParent', []);
end;

function TExtFormComboBox.GetObjectNamePrefix: string;
begin
  Result := 'combo';
end;

function TExtFormComboBox.GetStore: TExtFunction;
begin
  Result := CallMethod('getStore', []);
end;

function TExtFormComboBox.GetValue: TExtFunction;
begin
  Result := CallMethod('getValue', []);
end;

function TExtFormComboBox.IsExpanded: TExtFunction;
begin
  Result := CallMethod('isExpanded', []);
end;

function TExtFormComboBox.Select(Index: Integer; ScrollIntoView: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([index, ScrollIntoView]) + ');',
    'TExtFormComboBox');
  Result := Self;
end;

function TExtFormComboBox.SelectByValue(Value: string; ScrollIntoView: Boolean)
  : TExtFunction;
begin
  JSCode(JSName + '.selectByValue(' + VarToJSON([Value, ScrollIntoView]) + ');',
    'TExtFormComboBox');
  Result := Self;
end;

function TExtFormComboBox.SetValue(const AValue: string): TExtFunction;
begin
  Result := CallMethod('setValue', AValue);
end;

procedure TExtFormComboBox.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforequery') and Assigned(FOnBeforequery) then
    FOnBeforequery(TExtObject(ParamAsObject('QueryEvent')))
  else if (AEvtName = 'beforeselect') and Assigned(FOnBeforeselect) then
    FOnBeforeselect(TExtFormComboBox(ParamAsObject('Combo')),
      TExtDataRecord(ParamAsObject('RecordJS')), ParamAsInteger('Index'))
  else if (AEvtName = 'collapse') and Assigned(FOnCollapse) then
    FOnCollapse(TExtFormComboBox(ParamAsObject('Combo')))
  else if (AEvtName = 'expand') and Assigned(FOnExpand) then
    FOnExpand(TExtFormComboBox(ParamAsObject('Combo')))
  else if (AEvtName = 'select') and Assigned(FOnSelect) then
    FOnSelect(TExtFormComboBox(ParamAsObject('Combo')),
      TExtDataRecord(ParamAsObject('RecordJS')), ParamAsInteger('Index'));
end;

procedure TExtFormTwinTriggerField.SetTrigger1Class(const AValue: string);
begin
  FTrigger1Class := SetConfigItem('trigger1Class', AValue);
end;

procedure TExtFormTwinTriggerField.SetTrigger2Class(const AValue: string);
begin
  FTrigger2Class := SetConfigItem('trigger2Class', AValue);
end;

procedure TExtFormTwinTriggerField.SetFTriggerConfig(Value: string);
begin
  FTriggerConfig := Value;
  JSCode('triggerConfig:' + VarToJSON([Value]));
end;

class function TExtFormTwinTriggerField.JSClassName: string;
begin
  Result := 'Ext.form.TwinTriggerField';
end;

procedure TExtFormTwinTriggerField.InitDefaults;
begin
  inherited;
end;

procedure TExtFormTimeField.SetAltFormats(const AValue: string);
begin
  FAltFormats := AValue;
  SetConfigItem('altFormats', AValue);
end;

procedure TExtFormTimeField.SetFormat(const AValue: string);
begin
  FFormat := AValue;
  SetConfigItem('format', AValue);
end;

procedure TExtFormTimeField.SetFIncrement(Value: Integer);
begin
  FIncrement := Value;
  JSCode('increment:' + VarToJSON([Value]));
end;

procedure TExtFormTimeField.SetFInvalidText(Value: string);
begin
  FInvalidText := Value;
  JSCode('invalidText:' + VarToJSON([Value]));
end;

procedure TExtFormTimeField.SetFMaxText(Value: string);
begin
  FMaxText := Value;
  JSCode('maxText:' + VarToJSON([Value]));
end;

procedure TExtFormTimeField._SetMaxValue(const AValue: TDateTime);
begin
  FMaxValue := AValue;
  SetConfigItem('maxValue', 'setMaxValue', AValue);
end;

procedure TExtFormTimeField.SetFMaxValueString(Value: string);
begin
  FMaxValueString := Value;
  JSCode('maxValue:' + VarToJSON([Value]));
end;

procedure TExtFormTimeField.SetFMinText(Value: string);
begin
  FMinText := Value;
  JSCode('minText:' + VarToJSON([Value]));
end;

procedure TExtFormTimeField._SetMinValue(const AValue: TDateTime);
begin
  FMinValue := AValue;
  SetConfigItem('minValue', 'setMinValue', AValue);
end;

procedure TExtFormTimeField.SetFMinValueString(Value: string);
begin
  FMinValueString := Value;
  JSCode('minValue:' + VarToJSON([Value]));
end;

class function TExtFormTimeField.JSClassName: string;
begin
  Result := 'Ext.form.TimeField';
end;

function TExtFormTimeField.GetObjectNamePrefix: string;
begin
  Result := 'timefld';
end;

procedure TExtFormTimeField.InitDefaults;
begin
  inherited;
  FAltFormats :=
    'g:ia/g:iA/g:i a/g:i A/h:i/g:i/H:i/ga/ha/gA/h a/g a/g A/gi/hi/gia/hia/g/H/gi a/hi a/giA/hiA/gi A/hi A';
  FFormat := 'g:i A';
  FIncrement := 15;
  FInvalidText := '{value} is not a valid time';
  FMaxText := 'The time in this field must be equal to or before {0}';
  FMinText := 'The time in this field must be equal to or after {0}';
end;

function TExtFormTimeField.SetMaxValue(const AValue: TDateTime): TExtFunction;
begin
  FMaxValue := AValue;
  Result := CallMethod('setMaxValue', AValue);
end;

function TExtFormTimeField.SetMaxValue(Value: string): TExtFunction;
begin
  JSCode(JSName + '.setMaxValue(' + VarToJSON([Value]) + ');',
    'TExtFormTimeField');
  Result := Self;
end;

function TExtFormTimeField.SetMinValue(const AValue: TDateTime): TExtFunction;
begin
  FMinValue := AValue;
  Result := CallMethod('setMinValue', AValue);
end;

function TExtFormTimeField.SetMinValue(Value: string): TExtFunction;
begin
  JSCode(JSName + '.setMinValue(' + VarToJSON([Value]) + ');',
    'TExtFormTimeField');
  Result := Self;
end;

procedure TExtUxFormLovCombo.SetFSeparator(Value: string);
begin
  FSeparator := Value;
  JSCode('separator:' + VarToJSON([Value]));
end;

class function TExtUxFormLovCombo.JSClassName: string;
begin
  Result := 'Ext.ux.form.LovCombo';
end;

{ TExtFormFieldContainer }

class function TExtFormFieldContainer.JSClassName: string;
begin
  Result := 'Ext.form.FieldContainer';
end;

end.
