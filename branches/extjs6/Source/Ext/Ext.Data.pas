unit Ext.Data;

interface

uses
  Classes, StrUtils, Kitto.Ext, Ext.Base, Ext.Util;

type
  TExtDataDataReader = class;
  TExtDataRequest = class;
  TExtDataField = class;
  TExtDataNode = class;
  TExtDataStore = class;
  TExtDataTree = class;
  TExtDataConnection = class;
  TExtDataJsonReader = class;
  TExtDataXmlStore = class;
  TExtDataArrayReader = class;
  TExtDataArrayStore = class;
  TExtDataJsonStore = class;

  TExtDataProxy = class;
  TExtDataAjaxProxy = class;
  TExtDataMemoryProxy = class;

  TExtDataDataReader = class(TExtFunction)
  private
    FFields: TExtObjectList;
    FFieldsObject: TExtObject;
    FMessageProperty: string;
    FBuildExtractors: TExtObject;
    FExtractValues: TExtObject;
    FGetId: TExtObject;
    FGetMessage: TExtObject;
    FGetRoot: TExtObject;
    FGetSuccess: TExtObject;
    FGetTotal: TExtObject;
    FMeta: string;
    procedure SetFFields(Value: TExtObjectList);
    procedure SetFFieldsObject(Value: TExtObject);
    procedure SetFMessageProperty(Value: string);
    procedure SetFBuildExtractors(Value: TExtObject);
    procedure SetFExtractValues(Value: TExtObject);
    procedure SetFGetId(Value: TExtObject);
    procedure SetFGetMessage(Value: TExtObject);
    procedure SetFGetRoot(Value: TExtObject);
    procedure SetFGetSuccess(Value: TExtObject);
    procedure SetFGetTotal(Value: TExtObject);
    procedure SetFMeta(Value: string);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function IsData(Data: TExtObject): TExtFunction;
    function Realize(RecordJS: TExtDataRecord; Data: TExtObject): TExtFunction; overload;
    function Realize(RecordJS: TExtObjectList; Data: TExtObject): TExtFunction; overload;
    function Realize(RecordJS: TExtObjectList; Data: TExtObjectList)
      : TExtFunction; overload;
    function Realize(RecordJS: TExtDataRecord; Data: TExtObjectList)
      : TExtFunction; overload;
    function Update(Rs: TExtDataRecord; Data: TExtObject): TExtFunction; overload;
    function Update(Rs: TExtObjectList; Data: TExtObject): TExtFunction; overload;
    function Update(Rs: TExtObjectList; Data: TExtObjectList): TExtFunction; overload;
    function Update(Rs: TExtDataRecord; Data: TExtObjectList): TExtFunction; overload;
    property Fields: TExtObjectList read FFields write SetFFields;
    property FieldsObject: TExtObject read FFieldsObject write SetFFieldsObject;
    property MessageProperty: string read FMessageProperty write SetFMessageProperty;
    property BuildExtractors: TExtObject read FBuildExtractors write SetFBuildExtractors;
    property ExtractValues: TExtObject read FExtractValues write SetFExtractValues;
    property GetId: TExtObject read FGetId write SetFGetId;
    property GetMessage: TExtObject read FGetMessage write SetFGetMessage;
    property GetRoot: TExtObject read FGetRoot write SetFGetRoot;
    property GetSuccess: TExtObject read FGetSuccess write SetFGetSuccess;
    property GetTotal: TExtObject read FGetTotal write SetFGetTotal;
    property Meta: string read FMeta write SetFMeta;
  end;

  TExtDataRequest = class(TExtFunction)
  private
    FAction: string;
    FCallback: TExtFunction;
    FParams: TExtObject;
    FReader: TExtDataDataReader;
    FRs: TExtObjectList;
    FRsExtDataRecord: TExtDataRecord;
    FScope: TExtObject;
    procedure SetFAction(Value: string);
    procedure SetFCallback(Value: TExtFunction);
    procedure SetFParams(Value: TExtObject);
    procedure SetFReader(Value: TExtDataDataReader);
    procedure SetFRs(Value: TExtObjectList);
    procedure SetFRsExtDataRecord(Value: TExtDataRecord);
    procedure SetFScope(Value: TExtObject);
  public
    class function JSClassName: string; override;
    property Action: string read FAction write SetFAction;
    property Callback: TExtFunction read FCallback write SetFCallback;
    property Params: TExtObject read FParams write SetFParams;
    property Reader: TExtDataDataReader read FReader write SetFReader;
    property Rs: TExtObjectList read FRs write SetFRs;
    property RsExtDataRecord: TExtDataRecord read FRsExtDataRecord
      write SetFRsExtDataRecord;
    property Scope: TExtObject read FScope write SetFScope;
  end;

  TExtDataField = class(TExtFunction)
  private
    FAllowBlank: Boolean;
    FConvert: TExtFunction;
    FDateFormat: string;
    FDefaultValue: string;
    FMapping: string;
    FMappingNumber: Integer;
    FName: string;
    FSortDir: string;
    FSortType: TExtFunction;
    FType: string;
    FUseNull: Boolean;
    procedure SetAllowBlank(const AValue: Boolean);
    procedure SetFConvert(Value: TExtFunction);
    procedure SetFDateFormat(Value: string);
    procedure SetFDefaultValue(Value: string);
    procedure SetMapping(AValue: string);
    procedure SetFMappingNumber(Value: Integer);
    procedure _SetName(const AValue: string);
    procedure SetFSortDir(Value: string);
    procedure SetFSortType(Value: TExtFunction);
    procedure SetType(const AValue: string);
    procedure SetUseNull(const AValue: Boolean);
  protected
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    property AllowBlank: Boolean read FAllowBlank write SetAllowBlank;
    property Convert: TExtFunction read FConvert write SetFConvert;
    property DateFormat: string read FDateFormat write SetFDateFormat;
    property DefaultValue: string read FDefaultValue write SetFDefaultValue;
    property Mapping: string read FMapping write SetMapping;
    property MappingNumber: Integer read FMappingNumber write SetFMappingNumber;
    property Name: string read FName write _SetName;
    property SortDir: string read FSortDir write SetFSortDir;
    property SortType: TExtFunction read FSortType write SetFSortType;
    property &Type: string read FType write SetType;
    property UseNull: Boolean read FUseNull write SetUseNull;
  end;

  // Procedural types for events TExtDataNode
  TExtDataNodeOnAppend = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode; Index: Integer) of object;
  TExtDataNodeOnBeforeappend = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode) of object;
  TExtDataNodeOnBeforeinsert = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode; RefNode: TExtDataNode) of object;
  TExtDataNodeOnBeforemove = procedure(Tree: TExtDataTree; This: TExtDataNode;
    OldParent: TExtDataNode; NewParent: TExtDataNode; Index: Integer) of object;
  TExtDataNodeOnBeforeremove = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode) of object;
  TExtDataNodeOnInsert = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode; RefNode: TExtDataNode) of object;
  TExtDataNodeOnMove = procedure(Tree: TExtDataTree; This: TExtDataNode;
    OldParent: TExtDataNode; NewParent: TExtDataNode; Index: Integer) of object;
  TExtDataNodeOnRemove = procedure(Tree: TExtDataTree; This: TExtDataNode;
    Node: TExtDataNode) of object;

  TExtDataNode = class(TExtUtilObservable)
  private
    FId: string;
    FLeaf: Boolean;
    FAttributes: TExtObject;
    FChildren: TExtObjectList;
    FId_: string;
    FOnAppend: TExtDataNodeOnAppend;
    FOnBeforeappend: TExtDataNodeOnBeforeappend;
    FOnBeforeinsert: TExtDataNodeOnBeforeinsert;
    FOnBeforemove: TExtDataNodeOnBeforemove;
    FOnBeforeremove: TExtDataNodeOnBeforeremove;
    FOnInsert: TExtDataNodeOnInsert;
    FOnMove: TExtDataNodeOnMove;
    FOnRemove: TExtDataNodeOnRemove;
    procedure _SetId(const AValue: string);
    procedure SetLeaf(const AValue: Boolean);
    procedure SetFAttributes(Value: TExtObject);
    procedure SetFId_(Value: string);
    procedure SetFOnAppend(Value: TExtDataNodeOnAppend);
    procedure SetFOnBeforeappend(Value: TExtDataNodeOnBeforeappend);
    procedure SetFOnBeforeinsert(Value: TExtDataNodeOnBeforeinsert);
    procedure SetFOnBeforemove(Value: TExtDataNodeOnBeforemove);
    procedure SetFOnBeforeremove(Value: TExtDataNodeOnBeforeremove);
    procedure SetFOnInsert(Value: TExtDataNodeOnInsert);
    procedure SetFOnMove(Value: TExtDataNodeOnMove);
    procedure SetFOnRemove(Value: TExtDataNodeOnRemove);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function AppendChild(const ANode: TExtDataNode): TExtFunction; overload;
    function AppendChild(const ANodes: TExtObjectList): TExtFunction; overload;
    function Bubble(Fn: TExtFunction; Scope: TExtObject = nil; Args: TExtObjectList = nil)
      : TExtFunction;
    function Cascade(Fn: TExtFunction; Scope: TExtObject = nil;
      Args: TExtObjectList = nil): TExtFunction;
    function Contains(Node: TExtDataNode): TExtFunction;
    function EachChild(Fn: TExtFunction; Scope: TExtObject = nil;
      Args: TExtObjectList = nil): TExtFunction;
    function FindChild(Attribute: string; Value: string; Deep: Boolean = false)
      : TExtFunction;
    function FindChildBy(Fn: TExtFunction; Scope: TExtObject = nil; Deep: Boolean = false)
      : TExtFunction;
    function GetDepth: TExtFunction;
    function GetOwnerTree: TExtFunction;
    function GetPath(Attr: string = ''): TExtFunction;
    function HasChildNodes: TExtFunction;
    function IndexOf(Node: TExtDataNode): TExtFunction;
    function InsertBefore(Node: TExtDataNode; RefNode: TExtDataNode): TExtFunction;
    function IsAncestor(Node: TExtDataNode): TExtFunction;
    function IsExpandable: TExtFunction;
    function IsFirst: TExtFunction;
    function IsLast: TExtFunction;
    function IsLeaf: TExtFunction;
    function Item(Index: Integer): TExtFunction;
    function Remove(DestroyJS: Boolean): TExtFunction;
    function RemoveAll(DestroyJS: Boolean): TExtFunction;
    function RemoveChild(Node: TExtDataNode; DestroyJS: Boolean): TExtFunction;
    function ReplaceChild(NewChild: TExtDataNode; OldChild: TExtDataNode): TExtFunction;
    function SetId(const AId: string): TExtFunction;
    function Sort(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    property Id: string read FId write _SetId;
    property Leaf: Boolean read FLeaf write SetLeaf;
    property Attributes: TExtObject read FAttributes write SetFAttributes;
    property Children: TExtObjectList read FChildren;
    property Id_: string read FId_ write SetFId_;
    property OnAppend: TExtDataNodeOnAppend read FOnAppend write SetFOnAppend;
    property OnBeforeappend: TExtDataNodeOnBeforeappend read FOnBeforeappend
      write SetFOnBeforeappend;
    property OnBeforeinsert: TExtDataNodeOnBeforeinsert read FOnBeforeinsert
      write SetFOnBeforeinsert;
    property OnBeforemove: TExtDataNodeOnBeforemove read FOnBeforemove
      write SetFOnBeforemove;
    property OnBeforeremove: TExtDataNodeOnBeforeremove read FOnBeforeremove
      write SetFOnBeforeremove;
    property OnInsert: TExtDataNodeOnInsert read FOnInsert write SetFOnInsert;
    property OnMove: TExtDataNodeOnMove read FOnMove write SetFOnMove;
    property OnRemove: TExtDataNodeOnRemove read FOnRemove write SetFOnRemove;
  end;

  // Procedural types for events TExtDataStore
  TExtDataStoreOnAdd = procedure(This: TExtDataStore; Records: TExtObjectList;
    Index: Integer) of object;
  TExtDataStoreOnBeforeload = procedure(This: TExtDataStore; Options: TExtObject)
    of object;
  TExtDataStoreOnBeforesave = procedure(Store: TExtDataStore; Data: TExtObject) of object;
  TExtDataStoreOnBeforewrite = procedure(Store: TExtDataStore; Action: string;
    Rs: TExtDataRecord; Options: TExtObject; Arg: TExtObject) of object;
  TExtDataStoreOnClear = procedure(This: TExtDataStore; The: TExtObjectList) of object;
  TExtDataStoreOnDatachanged = procedure(This: TExtDataStore) of object;
  TExtDataStoreOnLoad = procedure(This: TExtDataStore; Records: TExtObjectList;
    Options: TExtObject) of object;
  TExtDataStoreOnMetachange = procedure(This: TExtDataStore; Meta: TExtObject) of object;
  TExtDataStoreOnRemove = procedure(This: TExtDataStore; RecordJS: TExtDataRecord;
    Index: Integer) of object;
  TExtDataStoreOnSave = procedure(Store: TExtDataStore; Batch: Integer; Data: TExtObject)
    of object;
  TExtDataStoreOnUpdate = procedure(This: TExtDataStore; RecordJS: TExtDataRecord;
    Operation: string) of object;
  TExtDataStoreOnWrite = procedure(Store: TExtDataStore; Action: string;
    ResultJS: TExtObject; Res: TExtDirectTransaction; Rs: TExtDataRecord) of object;

  TExtDataStore = class(TExtUtilObservable)
  private
    FAutoDestroy: Boolean;
    FAutoLoad: Boolean;
    FAutoLoadObject: TExtObject;
    FAutoSave: Boolean;
    FBaseParams: TExtObject;
    FBatch: Boolean;
    FData: TExtObjectList;
    FDefaultParamNames: TExtObject;
    FParamNames: TExtObject;
    FProxy: TExtDataProxy;
    FPruneModifiedRecords: Boolean; // true
    FRemoteSort: Boolean;
    FRestful: Boolean;
    FSortInfo: TExtObject;
    FStoreId: string;
    FBaseParams_: TExtObject;
    FFields: TExtObjectList;
    FHasMultiSort: Boolean;
    FIsDestroyed: Boolean;
    FLastOptions: TExtObject;
    FMultiSortInfo: TExtObject;
    FRecordType: TExtFunction;
    FOnAdd: TExtDataStoreOnAdd;
    FOnBeforeload: TExtDataStoreOnBeforeload;
    FOnBeforesave: TExtDataStoreOnBeforesave;
    FOnBeforewrite: TExtDataStoreOnBeforewrite;
    FOnClear: TExtDataStoreOnClear;
    FOnDatachanged: TExtDataStoreOnDatachanged;
    FOnLoad: TExtDataStoreOnLoad;
    FOnMetachange: TExtDataStoreOnMetachange;
    FOnRemove: TExtDataStoreOnRemove;
    FOnSave: TExtDataStoreOnSave;
    FOnUpdate: TExtDataStoreOnUpdate;
    FOnWrite: TExtDataStoreOnWrite;
    FTotalLength: Integer;
    FGroupField: string;
    procedure SetFAutoDestroy(Value: Boolean);
    procedure SetAutoLoad(const AValue: Boolean);
    procedure SetFAutoLoadObject(Value: TExtObject);
    procedure SetFAutoSave(Value: Boolean);
    procedure SetFBaseParams(Value: TExtObject);
    procedure SetFBatch(Value: Boolean);
    procedure SetFData(Value: TExtObjectList);
    procedure SetFDefaultParamNames(Value: TExtObject);
    procedure SetFParamNames(Value: TExtObject);
    procedure SetProxy(const AValue: TExtDataProxy);
    procedure SetFPruneModifiedRecords(Value: Boolean);
    procedure SetRemoteSort(const AValue: Boolean);
    procedure SetFRestful(Value: Boolean);
    procedure SetFSortInfo(Value: TExtObject);
    procedure SetStoreId(AValue: string);
    procedure SetFBaseParams_(Value: TExtObject);
    procedure SetFFields(Value: TExtObjectList);
    procedure SetFHasMultiSort(Value: Boolean);
    procedure SetFIsDestroyed(Value: Boolean);
    procedure SetFLastOptions(Value: TExtObject);
    procedure SetFMultiSortInfo(Value: TExtObject);
    procedure SetFRecordType(Value: TExtFunction);
    procedure SetFOnAdd(Value: TExtDataStoreOnAdd);
    procedure SetFOnBeforeload(Value: TExtDataStoreOnBeforeload);
    procedure SetFOnBeforesave(Value: TExtDataStoreOnBeforesave);
    procedure SetFOnBeforewrite(Value: TExtDataStoreOnBeforewrite);
    procedure SetFOnClear(Value: TExtDataStoreOnClear);
    procedure SetFOnDatachanged(Value: TExtDataStoreOnDatachanged);
    procedure SetFOnLoad(Value: TExtDataStoreOnLoad);
    procedure SetFOnMetachange(Value: TExtDataStoreOnMetachange);
    procedure SetFOnRemove(Value: TExtDataStoreOnRemove);
    procedure SetFOnSave(Value: TExtDataStoreOnSave);
    procedure SetFOnUpdate(Value: TExtDataStoreOnUpdate);
    procedure SetFOnWrite(Value: TExtDataStoreOnWrite);
    procedure SetTotalLength(const AValue: Integer);
    procedure SetGroupField(const AValue: string);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function Add(Records: TExtObjectList): TExtFunction;
    function AddSorted(RecordJS: TExtDataRecord): TExtFunction;
    function ClearFilter(SuppressEvent: Boolean): TExtFunction;
    function Collect(DataIndex: string; AllowNull: Boolean = false;
      BypassFilter: Boolean = false): TExtFunction;
    function CommitChanges: TExtFunction;
    function Each(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function Filter(Field: string; Value: string; AnyMatch: Boolean = false;
      CaseSensitive: Boolean = false; ExactMatch: Boolean = false): TExtFunction;
      overload;
    function Filter(Field: TExtObjectList; Value: string; AnyMatch: Boolean = false;
      CaseSensitive: Boolean = false; ExactMatch: Boolean = false): TExtFunction;
      overload;
    function FilterBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function Find(FieldName: string; Value: string; StartIndex: Integer = 0;
      AnyMatch: Boolean = false; CaseSensitive: Boolean = false): TExtFunction; overload;
    function FindBy(Fn: TExtFunction; Scope: TExtObject = nil; StartIndex: Integer = 0)
      : TExtFunction;
    function FindExact(FieldName: string; Value: string; StartIndex: Integer = 0)
      : TExtFunction;
    function GetAt(Index: Integer): TExtFunction;
    function GetById(Id: string): TExtFunction;
    function GetCount: TExtFunction;
    function GetModifiedRecords: TExtFunction;
    function GetRange(StartIndex: Integer = 0; EndIndex: Integer = 0): TExtFunction;
    function GetSortState: TExtFunction;
    function GetTotalCount: TExtFunction;
    function IndexOf(RecordJS: TExtDataRecord): TExtFunction;
    function IndexOfId(Id: string): TExtFunction;
    function Insert(Index: Integer; Records: TExtObjectList): TExtFunction;
    function IsFiltered: TExtFunction;
    function Load(const AOptions: TExtObject): TExtFunction;
    function LoadData(Data: TExtObject; Append: Boolean = false): TExtFunction;
    function MultiSort(Sorters: TExtObjectList; Direction: string): TExtFunction;
    function Query(Field: string; Value: string; AnyMatch: Boolean = false;
      CaseSensitive: Boolean = false): TExtFunction; overload;
    function QueryBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    function RejectChanges: TExtFunction;
    function Reload(Options: TExtObject): TExtFunction;
    function Remove(RecordJS: TExtDataRecord): TExtFunction; overload;
    function Remove(RecordJS: TExtObjectList): TExtFunction; overload;
    procedure RemoveAll(const ASilent: Boolean = False);
    function RemoveAt(Index: Integer): TExtFunction;
    function Save: TExtFunction;
    function SetBaseParam(Name: string; Value: string): TExtFunction;
    function SetDefaultSort(FieldName: string; Dir: string = ''): TExtFunction;
    function SingleSort(FieldName: string; Dir: string = ''): TExtFunction;
    function Sort(FieldName: string; Dir: string = ''): TExtFunction; overload;
    function Sort(FieldName: TExtObjectList; Dir: string = ''): TExtFunction; overload;
    function Sum(PropertyJS: string; Start: Integer = 0; EndJS: Integer = 0)
      : TExtFunction;
    property AutoDestroy: Boolean read FAutoDestroy write SetFAutoDestroy;
    property AutoLoad: Boolean read FAutoLoad write SetAutoLoad;
    property AutoLoadObject: TExtObject read FAutoLoadObject write SetFAutoLoadObject;
    property AutoSave: Boolean read FAutoSave write SetFAutoSave;
    property BaseParams: TExtObject read FBaseParams write SetFBaseParams;
    property Batch: Boolean read FBatch write SetFBatch;
    property Data: TExtObjectList read FData write SetFData;
    property DefaultParamNames: TExtObject read FDefaultParamNames
      write SetFDefaultParamNames;
    property GroupField: string read FGroupField write SetGroupField;
    property ParamNames: TExtObject read FParamNames write SetFParamNames;
    property Proxy: TExtDataProxy read FProxy write SetProxy;
    property PruneModifiedRecords: Boolean read FPruneModifiedRecords
      write SetFPruneModifiedRecords;
    property RemoteSort: Boolean read FRemoteSort write SetRemoteSort;
    property Restful: Boolean read FRestful write SetFRestful;
    property SortInfo: TExtObject read FSortInfo write SetFSortInfo;
    property StoreId: string read FStoreId write SetStoreId;
    property TotalLength: Integer  read FTotalLength write SetTotalLength;
    property BaseParams_: TExtObject read FBaseParams_ write SetFBaseParams_;
    property Fields: TExtObjectList read FFields write SetFFields;
    property HasMultiSort: Boolean read FHasMultiSort write SetFHasMultiSort;
    property IsDestroyed: Boolean read FIsDestroyed write SetFIsDestroyed;
    property LastOptions: TExtObject read FLastOptions write SetFLastOptions;
    property MultiSortInfo: TExtObject read FMultiSortInfo write SetFMultiSortInfo;
    property RecordType: TExtFunction read FRecordType write SetFRecordType;
    property OnAdd: TExtDataStoreOnAdd read FOnAdd write SetFOnAdd;
    property OnBeforeload: TExtDataStoreOnBeforeload read FOnBeforeload
      write SetFOnBeforeload;
    property OnBeforesave: TExtDataStoreOnBeforesave read FOnBeforesave
      write SetFOnBeforesave;
    property OnBeforewrite: TExtDataStoreOnBeforewrite read FOnBeforewrite
      write SetFOnBeforewrite;
    property OnClear: TExtDataStoreOnClear read FOnClear write SetFOnClear;
    property OnDatachanged: TExtDataStoreOnDatachanged read FOnDatachanged
      write SetFOnDatachanged;
    property OnLoad: TExtDataStoreOnLoad read FOnLoad write SetFOnLoad;
    property OnMetachange: TExtDataStoreOnMetachange read FOnMetachange
      write SetFOnMetachange;
    property OnRemove: TExtDataStoreOnRemove read FOnRemove write SetFOnRemove;
    property OnSave: TExtDataStoreOnSave read FOnSave write SetFOnSave;
    property OnUpdate: TExtDataStoreOnUpdate read FOnUpdate write SetFOnUpdate;
    property OnWrite: TExtDataStoreOnWrite read FOnWrite write SetFOnWrite;
  end;

  // Procedural types for events TExtDataTree
  TExtDataTreeOnAppend = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode; Index: Integer) of object;
  TExtDataTreeOnBeforeappend = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode) of object;
  TExtDataTreeOnBeforeinsert = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode; RefNode: TExtDataNode) of object;
  TExtDataTreeOnBeforemove = procedure(Tree: TExtDataTree; Node: TExtDataNode;
    OldParent: TExtDataNode; NewParent: TExtDataNode; Index: Integer) of object;
  TExtDataTreeOnBeforeremove = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode) of object;
  TExtDataTreeOnInsert = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode; RefNode: TExtDataNode) of object;
  TExtDataTreeOnMove = procedure(Tree: TExtDataTree; Node: TExtDataNode;
    OldParent: TExtDataNode; NewParent: TExtDataNode; Index: Integer) of object;
  TExtDataTreeOnRemove = procedure(Tree: TExtDataTree; Parent: TExtDataNode;
    Node: TExtDataNode) of object;

  TExtDataTree = class(TExtUtilObservable)
  private
    FPathSeparator: string; // '/'
    FRoot: TExtDataNode;
    FOnAppend: TExtDataTreeOnAppend;
    FOnBeforeappend: TExtDataTreeOnBeforeappend;
    FOnBeforeinsert: TExtDataTreeOnBeforeinsert;
    FOnBeforemove: TExtDataTreeOnBeforemove;
    FOnBeforeremove: TExtDataTreeOnBeforeremove;
    FOnInsert: TExtDataTreeOnInsert;
    FOnMove: TExtDataTreeOnMove;
    FOnRemove: TExtDataTreeOnRemove;
    procedure SetFPathSeparator(Value: string);
    procedure SetFRoot(Value: TExtDataNode);
    procedure SetFOnAppend(Value: TExtDataTreeOnAppend);
    procedure SetFOnBeforeappend(Value: TExtDataTreeOnBeforeappend);
    procedure SetFOnBeforeinsert(Value: TExtDataTreeOnBeforeinsert);
    procedure SetFOnBeforemove(Value: TExtDataTreeOnBeforemove);
    procedure SetFOnBeforeremove(Value: TExtDataTreeOnBeforeremove);
    procedure SetFOnInsert(Value: TExtDataTreeOnInsert);
    procedure SetFOnMove(Value: TExtDataTreeOnMove);
    procedure SetFOnRemove(Value: TExtDataTreeOnRemove);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetNodeById(Id: string): TExtFunction;
    function GetRootNode: TExtFunction;
    function SetRootNode(Node: TExtDataNode): TExtFunction;
    property PathSeparator: string read FPathSeparator write SetFPathSeparator;
    property Root: TExtDataNode read FRoot write SetFRoot;
    property OnAppend: TExtDataTreeOnAppend read FOnAppend write SetFOnAppend;
    property OnBeforeappend: TExtDataTreeOnBeforeappend read FOnBeforeappend
      write SetFOnBeforeappend;
    property OnBeforeinsert: TExtDataTreeOnBeforeinsert read FOnBeforeinsert
      write SetFOnBeforeinsert;
    property OnBeforemove: TExtDataTreeOnBeforemove read FOnBeforemove
      write SetFOnBeforemove;
    property OnBeforeremove: TExtDataTreeOnBeforeremove read FOnBeforeremove
      write SetFOnBeforeremove;
    property OnInsert: TExtDataTreeOnInsert read FOnInsert write SetFOnInsert;
    property OnMove: TExtDataTreeOnMove read FOnMove write SetFOnMove;
    property OnRemove: TExtDataTreeOnRemove read FOnRemove write SetFOnRemove;
  end;

  // Procedural types for events TExtDataDataProxy
  TExtDataDataProxyOnBeforeload = procedure(This: TExtDataProxy; Params: TExtObject)
    of object;
  TExtDataDataProxyOnBeforewrite = procedure(This: TExtDataProxy; Action: string;
    Rs: TExtDataRecord; Params: TExtObject) of object;
  TExtDataDataProxyOnException = procedure(This: TExtDataProxy; TypeJS: string;
    Action: string; Options: TExtObject; Response: TExtObject; Arg: string) of object;
  TExtDataDataProxyOnLoad = procedure(This: TExtDataProxy; O: TExtObject;
    Options: TExtObject) of object;
  TExtDataDataProxyOnWrite_ = procedure(This: TExtDataProxy; Action: string;
    Data: TExtObject; Response: TExtObject; Rs: TExtDataRecord; Options: TExtObject)
    of object;

  TExtDataProxy = class(TExtUtilObservable)
  private
    FApi: TExtObject;
    FDoRequest: TExtFunction;
    FOnRead: TExtFunction;
    FOnWrite: TExtFunction;
    FRestful: Boolean;
    FOnBeforeload: TExtDataDataProxyOnBeforeload;
    FOnBeforewrite: TExtDataDataProxyOnBeforewrite;
    FOnException: TExtDataDataProxyOnException;
    FOnLoad: TExtDataDataProxyOnLoad;
    FOnWrite_: TExtDataDataProxyOnWrite_;
    FReader: TExtDataDataReader;
    procedure SetFApi(Value: TExtObject);
    procedure SetFDoRequest(Value: TExtFunction);
    procedure SetFOnRead(Value: TExtFunction);
    procedure SetFOnWrite(Value: TExtFunction);
    procedure SetFRestful(Value: Boolean);
    procedure SetFOnBeforeload(Value: TExtDataDataProxyOnBeforeload);
    procedure SetFOnBeforewrite(Value: TExtDataDataProxyOnBeforewrite);
    procedure SetFOnException(Value: TExtDataDataProxyOnException);
    procedure SetFOnLoad(Value: TExtDataDataProxyOnLoad);
    procedure SetFOnWrite_(Value: TExtDataDataProxyOnWrite_);
    procedure SetReader(const AValue: TExtDataDataReader);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function IsApiAction(ExtDataApiCREATEREADUPDATEDESTROY: string): TExtFunction;
    function Load(Params: TExtObject; Reader: TExtObject; Callback: TExtObject;
      Scope: TExtObject; Arg: TExtObject): TExtFunction;
    function Request(Action: string; Rs: TExtObjectList; Params: TExtObject;
      Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
      Options: TExtObject): TExtFunction; overload;
    function SetApi(const AApi: string; const AUrl: string): TExtFunction; overload;
    function SetApi(Api: TExtObject; Url: string): TExtFunction; overload;
    function SetApi(Api: TExtObject; Url: TExtFunction): TExtFunction; overload;
    function SetApi(Api: string; Url: TExtFunction): TExtFunction; overload;
    property Api: TExtObject read FApi write SetFApi;
    property DoRequest: TExtFunction read FDoRequest write SetFDoRequest;
    property OnRead: TExtFunction read FOnRead write SetFOnRead;
    property OnWrite: TExtFunction read FOnWrite write SetFOnWrite;
    property Restful: Boolean read FRestful write SetFRestful;
    property OnBeforeload: TExtDataDataProxyOnBeforeload read FOnBeforeload
      write SetFOnBeforeload;
    property OnBeforewrite: TExtDataDataProxyOnBeforewrite read FOnBeforewrite
      write SetFOnBeforewrite;
    property OnException: TExtDataDataProxyOnException read FOnException
      write SetFOnException;
    property OnLoad: TExtDataDataProxyOnLoad read FOnLoad write SetFOnLoad;
    property OnWrite_: TExtDataDataProxyOnWrite_ read FOnWrite_ write SetFOnWrite_;
    property Reader: TExtDataDataReader read FReader write SetReader;
  end;

  // Procedural types for events TExtDataConnection
  TExtDataConnectionOnBeforerequest = procedure(Conn: TExtDataConnection;
    Options: TExtObject) of object;
  TExtDataConnectionOnRequestcomplete = procedure(Conn: TExtDataConnection;
    Response: TExtObject; Options: TExtObject) of object;
  TExtDataConnectionOnRequestexception = procedure(Conn: TExtDataConnection;
    Response: TExtObject; Options: TExtObject) of object;

  TExtDataConnection = class(TExtUtilObservable)
  private
    FAutoAbort: Boolean;
    FDefaultHeaders: TExtObject;
    FDisableCaching: Boolean; // true
    FDisableCachingParam: string;
    FExtraParams: TExtObject;
    FMethod: string;
    // 'output/Ext.data.Connection.html#Ext.data.Connection-request'
    FTimeout: Integer; // 30000
    FUrl: string;
    FOnBeforerequest: TExtDataConnectionOnBeforerequest;
    FOnRequestcomplete: TExtDataConnectionOnRequestcomplete;
    FOnRequestexception: TExtDataConnectionOnRequestexception;
    procedure SetFAutoAbort(Value: Boolean);
    procedure SetFDefaultHeaders(Value: TExtObject);
    procedure SetFDisableCaching(Value: Boolean);
    procedure SetFDisableCachingParam(Value: string);
    procedure SetFExtraParams(Value: TExtObject);
    procedure SetFMethod(Value: string);
    procedure SetFTimeout(Value: Integer);
    procedure SetFUrl(Value: string);
    procedure SetFOnBeforerequest(Value: TExtDataConnectionOnBeforerequest);
    procedure SetFOnRequestcomplete(Value: TExtDataConnectionOnRequestcomplete);
    procedure SetFOnRequestexception(Value: TExtDataConnectionOnRequestexception);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function Abort(TransactionId: Integer = 0): TExtFunction;
    function IsLoading(TransactionId: Integer = 0): TExtFunction;
    function Request(Options: TExtObject): TExtFunction;
    property AutoAbort: Boolean read FAutoAbort write SetFAutoAbort;
    property DefaultHeaders: TExtObject read FDefaultHeaders write SetFDefaultHeaders;
    property DisableCaching: Boolean read FDisableCaching write SetFDisableCaching;
    property DisableCachingParam: string read FDisableCachingParam
      write SetFDisableCachingParam;
    property ExtraParams: TExtObject read FExtraParams write SetFExtraParams;
    property Method: string read FMethod write SetFMethod;
    property Timeout: Integer read FTimeout write SetFTimeout;
    property Url: string read FUrl write SetFUrl;
    property OnBeforerequest: TExtDataConnectionOnBeforerequest read FOnBeforerequest
      write SetFOnBeforerequest;
    property OnRequestcomplete: TExtDataConnectionOnRequestcomplete
      read FOnRequestcomplete write SetFOnRequestcomplete;
    property OnRequestexception: TExtDataConnectionOnRequestexception
      read FOnRequestexception write SetFOnRequestexception;
  end;

  TExtDataJsonReader = class(TExtDataDataReader)
  private
    FIdProperty: string;
    FRootProperty: string;
    FSuccessProperty: string;
    FMessageProperty: string;
    FTotalProperty: string;
    FJsonData: TExtObject;
    FMeta: string;
    procedure SetFIdProperty(Value: string);
    procedure SetRootProperty(const AValue: string);
    procedure SetSuccessProperty(const AValue: string);
    procedure SetTotalProperty(const AValue: string);
    procedure SetFJsonData(Value: TExtObject);
    procedure SetFMeta(Value: string);
    procedure SetMessageProperty(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function Read(Response: TExtObject): TExtFunction;
    function ReadRecords(O: TExtObject): TExtFunction;
    function ReadResponse(Action: string; Response: TExtObject): TExtFunction;
    property IdProperty: string read FIdProperty write SetFIdProperty;
    property RootProperty: string read FRootProperty write SetRootProperty;
    property SuccessProperty: string read FSuccessProperty write SetSuccessProperty;
    property MessageProperty: string read FMessageProperty write SetMessageProperty;
    property TotalProperty: string read FTotalProperty write SetTotalProperty;
    property JsonData: TExtObject read FJsonData write SetFJsonData;
    property Meta: string read FMeta write SetFMeta;
  end;

  TExtDataXmlStore = class(TExtDataStore)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  TExtDataArrayReader = class(TExtDataJsonReader)
  private
    FId: Integer;
    FIdIndex: Integer;
    procedure SetFId(Value: Integer);
    procedure SetFIdIndex(Value: Integer);
  public
    class function JSClassName: string; override;
    function ReadRecords(O: TExtObject): TExtFunction;
    property Id: Integer read FId write SetFId;
    property IdIndex: Integer read FIdIndex write SetFIdIndex;
  end;

  TExtDataArrayStore = class(TExtDataStore)
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
  end;

  TExtDataAjaxProxy = class(TExtDataProxy)
  private
    FConn: TExtDataConnection;
    FUrl: string;
    procedure SetFConn(Value: TExtDataConnection);
    procedure SetUrl(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function DoRequest(Action: string; Rs: TExtDataRecord; Params: TExtObject;
      Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
      Arg: TExtObject): TExtFunction; overload;
    function DoRequest(Action: string; Rs: TExtObjectList; Params: TExtObject;
      Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
      Arg: TExtObject): TExtFunction; overload;
    function GetConnection: TExtFunction;
    function OnRead(Action: string; O: TExtObject; Res: TExtObject): TExtFunction;
    function OnWrite(Action: string; Trans: TExtObject; Res: TExtObject): TExtFunction;
    property Conn: TExtDataConnection read FConn write SetFConn;
    property Url: string read FUrl write SetUrl;
  end;

  // Procedural types for events TExtDataMemoryProxy
  TExtDataMemoryProxyOnLoadexception = procedure(This: TExtDataMemoryProxy;
    Arg: TExtObject; Null: TExtObject; E: string) of object;

  TExtDataMemoryProxy = class(TExtDataProxy)
  private
    FOnLoadexception: TExtDataMemoryProxyOnLoadexception;
    procedure SetFOnLoadexception(Value: TExtDataMemoryProxyOnLoadexception);
  protected
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function DoRequest(Action: string; Rs: TExtDataRecord; Params: TExtObject;
      Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
      Arg: TExtObject): TExtFunction; overload;
    function DoRequest(Action: string; Rs: TExtObjectList; Params: TExtObject;
      Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
      Arg: TExtObject): TExtFunction; overload;
    property OnLoadexception: TExtDataMemoryProxyOnLoadexception read FOnLoadexception
      write SetFOnLoadexception;
  end;

  TExtDataJsonStore = class(TExtDataStore)
  private
    FId: string;
    FRoot: string;
    FSuccessProperty: string;
    FTotalProperty: string;
    procedure SetFId(Value: string);
    procedure SetFRoot(Value: string);
    procedure SetFSuccessProperty(Value: string);
    procedure SetFTotalProperty(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property Id: string read FId write SetFId;
    property Root: string read FRoot write SetFRoot;
    property SuccessProperty: string read FSuccessProperty write SetFSuccessProperty;
    property TotalProperty: string read FTotalProperty write SetFTotalProperty;
  end;

implementation

uses
  Math;

procedure TExtDataDataReader.SetFFields(Value: TExtObjectList);
begin
  FFields := Value;
  JSCode('fields:' + VarToJSON([Value, false]));
end;

procedure TExtDataDataReader.SetFFieldsObject(Value: TExtObject);
begin
  FFieldsObject := Value;
  JSCode('fields:' + VarToJSON([Value, false]));
end;

procedure TExtDataDataReader.SetFMessageProperty(Value: string);
begin
  FMessageProperty := Value;
  JSCode('messageProperty:' + VarToJSON([Value]));
end;

procedure TExtDataDataReader.SetFBuildExtractors(Value: TExtObject);
begin
  FBuildExtractors := Value;
  JSCode(JSName + '.buildExtractors=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFExtractValues(Value: TExtObject);
begin
  FExtractValues := Value;
  JSCode(JSName + '.extractValues=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFGetId(Value: TExtObject);
begin
  FGetId := Value;
  JSCode(JSName + '.getId=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFGetMessage(Value: TExtObject);
begin
  FGetMessage := Value;
  JSCode(JSName + '.getMessage=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFGetRoot(Value: TExtObject);
begin
  FGetRoot := Value;
  JSCode(JSName + '.getRoot=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFGetSuccess(Value: TExtObject);
begin
  FGetSuccess := Value;
  JSCode(JSName + '.getSuccess=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFGetTotal(Value: TExtObject);
begin
  FGetTotal := Value;
  JSCode(JSName + '.getTotal=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataDataReader.SetFMeta(Value: string);
begin
  FMeta := Value;
  JSCode(JSName + '.meta=' + VarToJSON([Value]) + ';');
end;

class function TExtDataDataReader.JSClassName: string;
begin
  Result := 'Ext.data.DataReader';
end;

function TExtDataDataReader.GetObjectNamePrefix: string;
begin
  Result := 'reader';
end;

procedure TExtDataDataReader.InitDefaults;
begin
  inherited;
  FFields := CreateConfigArray('fields');
  FFieldsObject := TExtObject.CreateInternal(Self, 'fields');
  FBuildExtractors := TExtObject.CreateInternal(Self, 'buildExtractors');
  FExtractValues := TExtObject.CreateInternal(Self, 'extractValues');
  FGetId := TExtObject.CreateInternal(Self, 'getId');
  FGetMessage := TExtObject.CreateInternal(Self, 'getMessage');
  FGetRoot := TExtObject.CreateInternal(Self, 'getRoot');
  FGetSuccess := TExtObject.CreateInternal(Self, 'getSuccess');
  FGetTotal := TExtObject.CreateInternal(Self, 'getTotal');
end;

function TExtDataDataReader.IsData(Data: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.isData(' + VarToJSON([Data, false]) + ');', 'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Realize(RecordJS: TExtDataRecord; Data: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.realize(' + VarToJSON([RecordJS, false, Data, false]) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Realize(RecordJS: TExtObjectList; Data: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.realize(' + VarToJSON(RecordJS) + ',' + VarToJSON([Data, false]) +
    ');', 'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Realize(RecordJS: TExtObjectList; Data: TExtObjectList)
  : TExtFunction;
begin
  JSCode(JSName + '.realize(' + VarToJSON(RecordJS) + ',' + VarToJSON(Data) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Realize(RecordJS: TExtDataRecord; Data: TExtObjectList)
  : TExtFunction;
begin
  JSCode(JSName + '.realize(' + VarToJSON([RecordJS, false]) + ',' + VarToJSON(Data) +
    ');', 'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Update(Rs: TExtDataRecord; Data: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON([Rs, false, Data, false]) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Update(Rs: TExtObjectList; Data: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON(Rs) + ',' + VarToJSON([Data, false]) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Update(Rs: TExtObjectList; Data: TExtObjectList)
  : TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON(Rs) + ',' + VarToJSON(Data) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

function TExtDataDataReader.Update(Rs: TExtDataRecord; Data: TExtObjectList)
  : TExtFunction;
begin
  JSCode(JSName + '.update(' + VarToJSON([Rs, false]) + ',' + VarToJSON(Data) + ');',
    'TExtDataDataReader');
  Result := Self;
end;

procedure TExtDataRequest.SetFAction(Value: string);
begin
  FAction := Value;
  JSCode('action:' + VarToJSON([Value]));
end;

procedure TExtDataRequest.SetFCallback(Value: TExtFunction);
begin
  FCallback := Value;
  JSCode('callback:' + VarToJSON([Value, true]));
end;

procedure TExtDataRequest.SetFParams(Value: TExtObject);
begin
  FParams := Value;
  JSCode('params:' + VarToJSON([Value, false]));
end;

procedure TExtDataRequest.SetFReader(Value: TExtDataDataReader);
begin
  FReader := Value;
  JSCode('reader:' + VarToJSON([Value, false]));
end;

procedure TExtDataRequest.SetFRs(Value: TExtObjectList);
begin
  FRs := Value;
  JSCode('rs:' + VarToJSON([Value, false]));
end;

procedure TExtDataRequest.SetFRsExtDataRecord(Value: TExtDataRecord);
begin
  FRsExtDataRecord := Value;
  JSCode('rs:' + VarToJSON([Value, false]));
end;

procedure TExtDataRequest.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCode('scope:' + VarToJSON([Value, false]));
end;

class function TExtDataRequest.JSClassName: string;
begin
  Result := 'Ext.data.Request';
end;

procedure TExtDataField.SetAllowBlank(const AValue: Boolean);
begin
  FAllowBlank := SetConfigItem('allowBlank', AValue);
end;

procedure TExtDataField.SetFConvert(Value: TExtFunction);
begin
  FConvert := Value;
  JSCode('convert:' + VarToJSON([Value, true]));
end;

procedure TExtDataField.SetFDateFormat(Value: string);
begin
  FDateFormat := Value;
  JSCode('dateFormat:' + VarToJSON([Value]));
end;

procedure TExtDataField.SetFDefaultValue(Value: string);
begin
  FDefaultValue := Value;
  JSCode('defaultValue:' + VarToJSON([Value]));
end;

procedure TExtDataField.SetMapping(AValue: string);
begin
  FMapping := SetConfigItem('mapping', AValue);
end;

procedure TExtDataField.SetFMappingNumber(Value: Integer);
begin
  FMappingNumber := Value;
  JSCode('mapping:' + VarToJSON([Value]));
end;

procedure TExtDataField._SetName(const AValue: string);
begin
  FName := SetConfigItem('name', AValue);
end;

procedure TExtDataField.SetFSortDir(Value: string);
begin
  FSortDir := Value;
  JSCode('sortDir:' + VarToJSON([Value]));
end;

procedure TExtDataField.SetFSortType(Value: TExtFunction);
begin
  FSortType := Value;
  JSCode('sortType:' + VarToJSON([Value, true]));
end;

procedure TExtDataField.SetType(const AValue: string);
begin
  FType := SetConfigItem('type', AValue);
end;

procedure TExtDataField.SetUseNull(const AValue: Boolean);
begin
  FUseNull := SetConfigItem('useNull', AValue);
end;

function TExtDataField.GetObjectNamePrefix: string;
begin
  Result := 'dfld';
end;

class function TExtDataField.JSClassName: string;
begin
  Result := 'Ext.data.Field';
end;

procedure TExtDataNode._SetId(const AValue: string);
begin
  FId := SetConfigItem('id', 'setId', AValue);
end;

procedure TExtDataNode.SetLeaf(const AValue: Boolean);
begin
  FLeaf := SetConfigItem('leaf', AValue);
end;

procedure TExtDataNode.SetFAttributes(Value: TExtObject);
begin
  FAttributes := Value;
  JSCode(JSName + '.attributes=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataNode.SetFId_(Value: string);
begin
  FId_ := Value;
  JSCode(JSName + '.id=' + VarToJSON([Value]) + ';');
end;

procedure TExtDataNode.SetFOnAppend(Value: TExtDataNodeOnAppend);
begin
  if Assigned(FOnAppend) then
    JSCode(JSName + '.events ["append"].listeners=[];');
  if Assigned(Value) then
    on('append', Ajax('append', ['Tree', '%0.nm', 'This', '%1.nm', 'Node', '%2.nm',
      'Index', '%3'], true));
  FOnAppend := Value;
end;

procedure TExtDataNode.SetFOnBeforeappend(Value: TExtDataNodeOnBeforeappend);
begin
  if Assigned(FOnBeforeappend) then
    JSCode(JSName + '.events ["beforeappend"].listeners=[];');
  if Assigned(Value) then
    on('beforeappend', Ajax('beforeappend', ['Tree', '%0.nm', 'This', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnBeforeappend := Value;
end;

procedure TExtDataNode.SetFOnBeforeinsert(Value: TExtDataNodeOnBeforeinsert);
begin
  if Assigned(FOnBeforeinsert) then
    JSCode(JSName + '.events ["beforeinsert"].listeners=[];');
  if Assigned(Value) then
    on('beforeinsert', Ajax('beforeinsert', ['Tree', '%0.nm', 'This', '%1.nm', 'Node',
      '%2.nm', 'RefNode', '%3.nm'], true));
  FOnBeforeinsert := Value;
end;

procedure TExtDataNode.SetFOnBeforemove(Value: TExtDataNodeOnBeforemove);
begin
  if Assigned(FOnBeforemove) then
    JSCode(JSName + '.events ["beforemove"].listeners=[];');
  if Assigned(Value) then
    on('beforemove', Ajax('beforemove', ['Tree', '%0.nm', 'This', '%1.nm', 'OldParent',
      '%2.nm', 'NewParent', '%3.nm', 'Index', '%4'], true));
  FOnBeforemove := Value;
end;

procedure TExtDataNode.SetFOnBeforeremove(Value: TExtDataNodeOnBeforeremove);
begin
  if Assigned(FOnBeforeremove) then
    JSCode(JSName + '.events ["beforeremove"].listeners=[];');
  if Assigned(Value) then
    on('beforeremove', Ajax('beforeremove', ['Tree', '%0.nm', 'This', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnBeforeremove := Value;
end;

procedure TExtDataNode.SetFOnInsert(Value: TExtDataNodeOnInsert);
begin
  if Assigned(FOnInsert) then
    JSCode(JSName + '.events ["insert"].listeners=[];');
  if Assigned(Value) then
    on('insert', Ajax('insert', ['Tree', '%0.nm', 'This', '%1.nm', 'Node', '%2.nm',
      'RefNode', '%3.nm'], true));
  FOnInsert := Value;
end;

procedure TExtDataNode.SetFOnMove(Value: TExtDataNodeOnMove);
begin
  if Assigned(FOnMove) then
    JSCode(JSName + '.events ["move"].listeners=[];');
  if Assigned(Value) then
    on('move', Ajax('move', ['Tree', '%0.nm', 'This', '%1.nm', 'OldParent', '%2.nm',
      'NewParent', '%3.nm', 'Index', '%4'], true));
  FOnMove := Value;
end;

procedure TExtDataNode.SetFOnRemove(Value: TExtDataNodeOnRemove);
begin
  if Assigned(FOnRemove) then
    JSCode(JSName + '.events ["remove"].listeners=[];');
  if Assigned(Value) then
    on('remove', Ajax('remove', ['Tree', '%0.nm', 'This', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnRemove := Value;
end;

class function TExtDataNode.JSClassName: string;
begin
  Result := 'Ext.data.Node';
end;

procedure TExtDataNode.InitDefaults;
begin
  inherited;
  FAttributes := TExtObject.CreateInternal(Self, 'attributes');
  FChildren := CreateConfigArray('children');
end;

function TExtDataNode.AppendChild(const ANode: TExtDataNode): TExtFunction;
begin
  FChildren.AddInternal(ANode);
  Result := CallMethod('appendChild', ANode);
end;

function TExtDataNode.AppendChild(const ANodes: TExtObjectList): TExtFunction;
begin
  FChildren.AddInternal(ANodes);
  Result := CallMethod('appendChild', ANodes);
end;

function TExtDataNode.Bubble(Fn: TExtFunction; Scope: TExtObject = nil;
  Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.bubble(' + VarToJSON([Fn, true, Scope, false]) + ',' + VarToJSON(Args)
    + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.Cascade(Fn: TExtFunction; Scope: TExtObject = nil;
  Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.cascade(' + VarToJSON([Fn, true, Scope, false]) + ',' +
    VarToJSON(Args) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.Contains(Node: TExtDataNode): TExtFunction;
begin
  JSCode(JSName + '.contains(' + VarToJSON([Node, false]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.EachChild(Fn: TExtFunction; Scope: TExtObject = nil;
  Args: TExtObjectList = nil): TExtFunction;
begin
  JSCode(JSName + '.eachChild(' + VarToJSON([Fn, true, Scope, false]) + ',' +
    VarToJSON(Args) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.FindChild(Attribute: string; Value: string; Deep: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.findChild(' + VarToJSON([Attribute, Value, Deep]) + ');',
    'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.FindChildBy(Fn: TExtFunction; Scope: TExtObject = nil;
  Deep: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.findChildBy(' + VarToJSON([Fn, true, Scope, false, Deep]) + ');',
    'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.GetDepth: TExtFunction;
begin
  JSCode(JSName + '.getDepth();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.GetOwnerTree: TExtFunction;
begin
  JSCode(JSName + '.getOwnerTree();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.GetPath(Attr: string = ''): TExtFunction;
begin
  JSCode(JSName + '.getPath(' + VarToJSON([Attr]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.HasChildNodes: TExtFunction;
begin
  JSCode(JSName + '.hasChildNodes();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IndexOf(Node: TExtDataNode): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([Node, false]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.InsertBefore(Node: TExtDataNode; RefNode: TExtDataNode)
  : TExtFunction;
begin
  JSCode(JSName + '.insertBefore(' + VarToJSON([Node, false, RefNode, false]) + ');',
    'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IsAncestor(Node: TExtDataNode): TExtFunction;
begin
  JSCode(JSName + '.isAncestor(' + VarToJSON([Node, false]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IsExpandable: TExtFunction;
begin
  JSCode(JSName + '.isExpandable();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IsFirst: TExtFunction;
begin
  JSCode(JSName + '.isFirst();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IsLast: TExtFunction;
begin
  JSCode(JSName + '.isLast();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.IsLeaf: TExtFunction;
begin
  JSCode(JSName + '.isLeaf();', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.Item(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.item(' + VarToJSON([index]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.Remove(DestroyJS: Boolean): TExtFunction;
begin
  JSCode(JSName + '.remove(' + VarToJSON([DestroyJS]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.RemoveAll(DestroyJS: Boolean): TExtFunction;
begin
  JSCode(JSName + '.removeAll(' + VarToJSON([DestroyJS]) + ');', 'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.RemoveChild(Node: TExtDataNode; DestroyJS: Boolean): TExtFunction;
begin
  JSCode(JSName + '.removeChild(' + VarToJSON([Node, false, DestroyJS]) + ');',
    'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.ReplaceChild(NewChild: TExtDataNode; OldChild: TExtDataNode)
  : TExtFunction;
begin
  JSCode(JSName + '.replaceChild(' + VarToJSON([NewChild, false, OldChild, false]) + ');',
    'TExtDataNode');
  Result := Self;
end;

function TExtDataNode.SetId(const AId: string): TExtFunction;
begin
  FId := AId;
  Result := CallMethod('setId', AId);
end;

function TExtDataNode.Sort(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.sort(' + VarToJSON([Fn, true, Scope, false]) + ');', 'TExtDataNode');
  Result := Self;
end;

procedure TExtDataNode.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'append') and Assigned(FOnAppend) then
    FOnAppend(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('This')),
      TExtDataNode(ParamAsObject('Node')), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeappend') and Assigned(FOnBeforeappend) then
    FOnBeforeappend(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('This')), TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'beforeinsert') and Assigned(FOnBeforeinsert) then
    FOnBeforeinsert(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('This')), TExtDataNode(ParamAsObject('Node')),
      TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'beforemove') and Assigned(FOnBeforemove) then
    FOnBeforemove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('This')
      ), TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')
      ), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeremove') and Assigned(FOnBeforeremove) then
    FOnBeforeremove(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('This')), TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'insert') and Assigned(FOnInsert) then
    FOnInsert(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('This')),
      TExtDataNode(ParamAsObject('Node')), TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'move') and Assigned(FOnMove) then
    FOnMove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('This')),
      TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')),
      ParamAsInteger('Index'))
  else if (AEvtName = 'remove') and Assigned(FOnRemove) then
    FOnRemove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('This')),
      TExtDataNode(ParamAsObject('Node')));
end;

procedure TExtDataStore.SetFAutoDestroy(Value: Boolean);
begin
  FAutoDestroy := Value;
  JSCode('autoDestroy:' + VarToJSON([Value]));
end;

procedure TExtDataStore.SetAutoLoad(const AValue: Boolean);
begin
  FAutoLoad := SetConfigItem('autoLoad', AValue);
end;

procedure TExtDataStore.SetFAutoLoadObject(Value: TExtObject);
begin
  FAutoLoadObject := Value;
  JSCode('autoLoad:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetFAutoSave(Value: Boolean);
begin
  FAutoSave := Value;
  JSCode('autoSave:' + VarToJSON([Value]));
end;

procedure TExtDataStore.SetFBaseParams(Value: TExtObject);
begin
  FBaseParams := Value;
  JSCode('baseParams:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetFBatch(Value: Boolean);
begin
  FBatch := Value;
  JSCode('batch:' + VarToJSON([Value]));
end;

procedure TExtDataStore.SetFData(Value: TExtObjectList);
begin
  FData := Value;
  JSCode('data:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetFDefaultParamNames(Value: TExtObject);
begin
  FDefaultParamNames := Value;
  JSCode('defaultParamNames:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetFParamNames(Value: TExtObject);
begin
  FParamNames := Value;
  JSCode('paramNames:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetProxy(const AValue: TExtDataProxy);
begin
  FProxy := AValue;
  SetConfigItem('proxy', AValue);
end;

procedure TExtDataStore.SetFPruneModifiedRecords(Value: Boolean);
begin
  FPruneModifiedRecords := Value;
  JSCode('pruneModifiedRecords:' + VarToJSON([Value]));
end;

procedure TExtDataStore.SetRemoteSort(const AValue: Boolean);
begin
  FRemoteSort := SetConfigItem('remoteSort', AValue);
end;

procedure TExtDataStore.SetTotalLength(const AValue: Integer);
begin
  FTotalLength := SetProperty('totalLength', AValue);
end;

procedure TExtDataStore.SetFRestful(Value: Boolean);
begin
  FRestful := Value;
  JSCode('restful:' + VarToJSON([Value]));
end;

procedure TExtDataStore.SetFSortInfo(Value: TExtObject);
begin
  FSortInfo.Free;
  FSortInfo := Value;
  JSCode('sortInfo:' + VarToJSON([Value, false]));
end;

procedure TExtDataStore.SetGroupField(const AValue: string);
begin
  FGroupField := SetConfigItem('groupField', AValue);
end;

procedure TExtDataStore.SetStoreId(AValue: string);
begin
  FStoreId := SetProperty('storeId', AValue);
end;

procedure TExtDataStore.SetFBaseParams_(Value: TExtObject);
begin
  FBaseParams_ := Value;
  JSCode(JSName + '.baseParams=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataStore.SetFFields(Value: TExtObjectList);
begin
  FFields := Value;
  JSCode(JSName + '.fields=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataStore.SetFHasMultiSort(Value: Boolean);
begin
  FHasMultiSort := Value;
  JSCode(JSName + '.hasMultiSort=' + VarToJSON([Value]) + ';');
end;

procedure TExtDataStore.SetFIsDestroyed(Value: Boolean);
begin
  FIsDestroyed := Value;
  JSCode(JSName + '.isDestroyed=' + VarToJSON([Value]) + ';');
end;

procedure TExtDataStore.SetFLastOptions(Value: TExtObject);
begin
  FLastOptions := Value;
  JSCode(JSName + '.lastOptions=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataStore.SetFMultiSortInfo(Value: TExtObject);
begin
  FMultiSortInfo := Value;
  JSCode(JSName + '.multiSortInfo=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataStore.SetFRecordType(Value: TExtFunction);
begin
  FRecordType := Value;
  JSCode(JSName + '.recordType=' + VarToJSON([Value, true]) + ';');
end;

procedure TExtDataStore.SetFOnAdd(Value: TExtDataStoreOnAdd);
begin
  if Assigned(FOnAdd) then
    JSCode(JSName + '.events ["add"].listeners=[];');
  if Assigned(Value) then
    on('add', Ajax('add', ['This', '%0.nm', 'Records', '%1.nm', 'Index', '%2'], true));
  FOnAdd := Value;
end;

procedure TExtDataStore.SetFOnBeforeload(Value: TExtDataStoreOnBeforeload);
begin
  if Assigned(FOnBeforeload) then
    JSCode(JSName + '.events ["beforeload"].listeners=[];');
  if Assigned(Value) then
    on('beforeload', Ajax('beforeload', ['This', '%0.nm', 'Options', '%1.nm'], true));
  FOnBeforeload := Value;
end;

procedure TExtDataStore.SetFOnBeforesave(Value: TExtDataStoreOnBeforesave);
begin
  if Assigned(FOnBeforesave) then
    JSCode(JSName + '.events ["beforesave"].listeners=[];');
  if Assigned(Value) then
    on('beforesave', Ajax('beforesave', ['Store', '%0.nm', 'Data', '%1.nm'], true));
  FOnBeforesave := Value;
end;

procedure TExtDataStore.SetFOnBeforewrite(Value: TExtDataStoreOnBeforewrite);
begin
  if Assigned(FOnBeforewrite) then
    JSCode(JSName + '.events ["beforewrite"].listeners=[];');
  if Assigned(Value) then
    on('beforewrite', Ajax('beforewrite', ['Store', '%0.nm', 'Action', '%1', 'Rs',
      '%2.nm', 'Options', '%3.nm', 'Arg', '%4.nm'], true));
  FOnBeforewrite := Value;
end;

procedure TExtDataStore.SetFOnClear(Value: TExtDataStoreOnClear);
begin
  if Assigned(FOnClear) then
    JSCode(JSName + '.events ["clear"].listeners=[];');
  if Assigned(Value) then
    on('clear', Ajax('clear', ['This', '%0.nm', 'The', '%1.nm'], true));
  FOnClear := Value;
end;

procedure TExtDataStore.SetFOnDatachanged(Value: TExtDataStoreOnDatachanged);
begin
  if Assigned(FOnDatachanged) then
    JSCode(JSName + '.events ["datachanged"].listeners=[];');
  if Assigned(Value) then
    on('datachanged', Ajax('datachanged', ['This', '%0.nm'], true));
  FOnDatachanged := Value;
end;

procedure TExtDataStore.SetFOnLoad(Value: TExtDataStoreOnLoad);
begin
  if Assigned(FOnLoad) then
    JSCode(JSName + '.events ["load"].listeners=[];');
  if Assigned(Value) then
    on('load', Ajax('load', ['This', '%0.nm', 'Records', '%1.nm', 'Options',
      '%2.nm'], true));
  FOnLoad := Value;
end;

procedure TExtDataStore.SetFOnMetachange(Value: TExtDataStoreOnMetachange);
begin
  if Assigned(FOnMetachange) then
    JSCode(JSName + '.events ["metachange"].listeners=[];');
  if Assigned(Value) then
    on('metachange', Ajax('metachange', ['This', '%0.nm', 'Meta', '%1.nm'], true));
  FOnMetachange := Value;
end;

procedure TExtDataStore.SetFOnRemove(Value: TExtDataStoreOnRemove);
begin
  if Assigned(FOnRemove) then
    JSCode(JSName + '.events ["remove"].listeners=[];');
  if Assigned(Value) then
    on('remove', Ajax('remove', ['This', '%0.nm', 'RecordJS', '%1.nm', 'Index',
      '%2'], true));
  FOnRemove := Value;
end;

procedure TExtDataStore.SetFOnSave(Value: TExtDataStoreOnSave);
begin
  if Assigned(FOnSave) then
    JSCode(JSName + '.events ["save"].listeners=[];');
  if Assigned(Value) then
    on('save', Ajax('save', ['Store', '%0.nm', 'Batch', '%1', 'Data', '%2.nm'], true));
  FOnSave := Value;
end;

procedure TExtDataStore.SetFOnUpdate(Value: TExtDataStoreOnUpdate);
begin
  if Assigned(FOnUpdate) then
    JSCode(JSName + '.events ["update"].listeners=[];');
  if Assigned(Value) then
    on('update', Ajax('update', ['This', '%0.nm', 'RecordJS', '%1.nm', 'Operation',
      '%2'], true));
  FOnUpdate := Value;
end;

procedure TExtDataStore.SetFOnWrite(Value: TExtDataStoreOnWrite);
begin
  if Assigned(FOnWrite) then
    JSCode(JSName + '.events ["write"].listeners=[];');
  if Assigned(Value) then
    on('write', Ajax('write', ['Store', '%0.nm', 'Action', '%1', 'ResultJS', '%2.nm',
      'Res', '%3.nm', 'Rs', '%4.nm'], true));
  FOnWrite := Value;
end;

class function TExtDataStore.JSClassName: string;
begin
  Result := 'Ext.data.Store';
end;

procedure TExtDataStore.InitDefaults;
begin
  inherited;
  FAutoLoadObject := TExtObject.CreateInternal(Self, 'autoLoad');
  FBaseParams := TExtObject.CreateInternal(Self, 'baseParams');
  FData := CreateConfigArray('data');
  FDefaultParamNames := TExtObject.CreateInternal(Self, 'defaultParamNames');
  FParamNames := TExtObject.CreateInternal(Self, 'paramNames');
  FProxy := TExtDataProxy.CreateInternal(Self, 'proxy');
  FPruneModifiedRecords := true;
  FSortInfo := TExtObject.CreateInternal(Self, 'sortInfo');
//  FBaseParams_ := TExtObject.CreateInternal(Self, 'baseParams');
  FFields := CreateConfigArray('fields');
  FLastOptions := TExtObject.CreateInternal(Self, 'lastOptions');
  FMultiSortInfo := TExtObject.CreateInternal(Self, 'multiSortInfo');
end;

function TExtDataStore.Add(Records: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.add(' + VarToJSON(Records) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.AddSorted(RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.addSorted(' + VarToJSON([RecordJS, false]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.ClearFilter(SuppressEvent: Boolean): TExtFunction;
begin
  JSCode(JSName + '.clearFilter(' + VarToJSON([SuppressEvent]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Collect(DataIndex: string; AllowNull: Boolean = false;
  BypassFilter: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.collect(' + VarToJSON([DataIndex, AllowNull, BypassFilter]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.CommitChanges: TExtFunction;
begin
  JSCode(JSName + '.commitChanges();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Each(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.each(' + VarToJSON([Fn, true, Scope, false]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Filter(Field: string; Value: string; AnyMatch: Boolean = false;
  CaseSensitive: Boolean = false; ExactMatch: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.filter(' + VarToJSON([Field, Value, AnyMatch, CaseSensitive,
    ExactMatch]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Filter(Field: TExtObjectList; Value: string;
  AnyMatch: Boolean = false; CaseSensitive: Boolean = false; ExactMatch: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.filter(' + VarToJSON(Field) + ',' + VarToJSON([Value, AnyMatch,
    CaseSensitive, ExactMatch]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.FilterBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.filterBy(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Find(FieldName: string; Value: string; StartIndex: Integer = 0;
  AnyMatch: Boolean = false; CaseSensitive: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.find(' + VarToJSON([FieldName, Value, StartIndex, AnyMatch,
    CaseSensitive]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.FindBy(Fn: TExtFunction; Scope: TExtObject = nil;
  StartIndex: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.findBy(' + VarToJSON([Fn, true, Scope, false, StartIndex]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.FindExact(FieldName: string; Value: string;
  StartIndex: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.findExact(' + VarToJSON([FieldName, Value, StartIndex]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetAt(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.getAt(' + VarToJSON([index]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetById(Id: string): TExtFunction;
begin
  JSCode(JSName + '.getById(' + VarToJSON([Id]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetCount: TExtFunction;
begin
  JSCode(JSName + '.getCount();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetModifiedRecords: TExtFunction;
begin
  JSCode(JSName + '.getModifiedRecords();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetObjectNamePrefix: string;
begin
  Result := 'store';
end;

function TExtDataStore.GetRange(StartIndex: Integer = 0; EndIndex: Integer = 0)
  : TExtFunction;
begin
  JSCode(JSName + '.getRange(' + VarToJSON([StartIndex, EndIndex]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetSortState: TExtFunction;
begin
  JSCode(JSName + '.getSortState();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.GetTotalCount: TExtFunction;
begin
  JSCode(JSName + '.getTotalCount();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.IndexOf(RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.indexOf(' + VarToJSON([RecordJS, false]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.IndexOfId(Id: string): TExtFunction;
begin
  JSCode(JSName + '.indexOfId(' + VarToJSON([Id]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Insert(Index: Integer; Records: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.insert(' + VarToJSON([index]) + ',' + VarToJSON(Records) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.IsFiltered: TExtFunction;
begin
  JSCode(JSName + '.isFiltered();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Load(const AOptions: TExtObject): TExtFunction;
begin
  Result := CallMethod('load', AOptions);
end;

function TExtDataStore.LoadData(Data: TExtObject; Append: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.loadData(' + VarToJSON([Data, false, Append]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.MultiSort(Sorters: TExtObjectList; Direction: string)
  : TExtFunction;
begin
  JSCode(JSName + '.multiSort(' + VarToJSON(Sorters) + ',' + VarToJSON([Direction]) +
    ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Query(Field: string; Value: string; AnyMatch: Boolean = false;
  CaseSensitive: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.query(' + VarToJSON([Field, Value, AnyMatch, CaseSensitive]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.QueryBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.queryBy(' + VarToJSON([Fn, true, Scope, false]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.RejectChanges: TExtFunction;
begin
  JSCode(JSName + '.rejectChanges();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Reload(Options: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.reload(' + VarToJSON([Options, false]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Remove(RecordJS: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.remove(' + VarToJSON([RecordJS, false]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Remove(RecordJS: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.remove(' + VarToJSON(RecordJS) + ');', 'TExtDataStore');
  Result := Self;
end;

procedure TExtDataStore.RemoveAll(const ASilent: Boolean);
begin
  CallMethod('removeAll', ASilent);
end;

function TExtDataStore.RemoveAt(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.removeAt(' + VarToJSON([index]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Save: TExtFunction;
begin
  JSCode(JSName + '.save();', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.SetBaseParam(Name: string; Value: string): TExtFunction;
begin
  JSCode(JSName + '.setBaseParam(' + VarToJSON([name, Value]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.SetDefaultSort(FieldName: string; Dir: string = ''): TExtFunction;
begin
  JSCode(JSName + '.setDefaultSort(' + VarToJSON([FieldName, Dir]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.SingleSort(FieldName: string; Dir: string = ''): TExtFunction;
begin
  JSCode(JSName + '.singleSort(' + VarToJSON([FieldName, Dir]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Sort(FieldName: string; Dir: string = ''): TExtFunction;
begin
  JSCode(JSName + '.sort(' + VarToJSON([FieldName, Dir]) + ');', 'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Sort(FieldName: TExtObjectList; Dir: string = ''): TExtFunction;
begin
  JSCode(JSName + '.sort(' + VarToJSON(FieldName) + ',' + VarToJSON([Dir]) + ');',
    'TExtDataStore');
  Result := Self;
end;

function TExtDataStore.Sum(PropertyJS: string; Start: Integer = 0; EndJS: Integer = 0)
  : TExtFunction;
begin
  JSCode(JSName + '.sum(' + VarToJSON([PropertyJS, Start, EndJS]) + ');',
    'TExtDataStore');
  Result := Self;
end;

procedure TExtDataStore.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'add') and Assigned(FOnAdd) then
    FOnAdd(TExtDataStore(ParamAsObject('This')), TExtObjectList(ParamAsObject('Records')),
      ParamAsInteger('Index'))
  else if (AEvtName = 'beforeload') and Assigned(FOnBeforeload) then
    FOnBeforeload(TExtDataStore(ParamAsObject('This')),
      TExtObject(ParamAsObject('Options')))
  else if (AEvtName = 'beforesave') and Assigned(FOnBeforesave) then
    FOnBeforesave(TExtDataStore(ParamAsObject('Store')),
      TExtObject(ParamAsObject('Data')))
  else if (AEvtName = 'beforewrite') and Assigned(FOnBeforewrite) then
    FOnBeforewrite(TExtDataStore(ParamAsObject('Store')), ParamAsString('Action'),
      TExtDataRecord(ParamAsObject('Rs')), TExtObject(ParamAsObject('Options')),
      TExtObject(ParamAsObject('Arg')))
  else if (AEvtName = 'clear') and Assigned(FOnClear) then
    FOnClear(TExtDataStore(ParamAsObject('This')), TExtObjectList(ParamAsObject('The')))
  else if (AEvtName = 'datachanged') and Assigned(FOnDatachanged) then
    FOnDatachanged(TExtDataStore(ParamAsObject('This')))
  else if (AEvtName = 'load') and Assigned(FOnLoad) then
    FOnLoad(TExtDataStore(ParamAsObject('This')), TExtObjectList(ParamAsObject('Records')
      ), TExtObject(ParamAsObject('Options')))
  else if (AEvtName = 'metachange') and Assigned(FOnMetachange) then
    FOnMetachange(TExtDataStore(ParamAsObject('This')), TExtObject(ParamAsObject('Meta')))
  else if (AEvtName = 'remove') and Assigned(FOnRemove) then
    FOnRemove(TExtDataStore(ParamAsObject('This')),
      TExtDataRecord(ParamAsObject('RecordJS')), ParamAsInteger('Index'))
  else if (AEvtName = 'save') and Assigned(FOnSave) then
    FOnSave(TExtDataStore(ParamAsObject('Store')), ParamAsInteger('Batch'),
      TExtObject(ParamAsObject('Data')))
  else if (AEvtName = 'update') and Assigned(FOnUpdate) then
    FOnUpdate(TExtDataStore(ParamAsObject('This')),
      TExtDataRecord(ParamAsObject('RecordJS')), ParamAsString('Operation'))
  else if (AEvtName = 'write') and Assigned(FOnWrite) then
    FOnWrite(TExtDataStore(ParamAsObject('Store')), ParamAsString('Action'),
      TExtObject(ParamAsObject('ResultJS')), TExtDirectTransaction(ParamAsObject('Res')),
      TExtDataRecord(ParamAsObject('Rs')));
end;

procedure TExtDataTree.SetFPathSeparator(Value: string);
begin
  FPathSeparator := Value;
  JSCode('pathSeparator:' + VarToJSON([Value]));
end;

procedure TExtDataTree.SetFRoot(Value: TExtDataNode);
begin
  FRoot := Value;
  JSCode(JSName + '.root=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataTree.SetFOnAppend(Value: TExtDataTreeOnAppend);
begin
  if Assigned(FOnAppend) then
    JSCode(JSName + '.events ["append"].listeners=[];');
  if Assigned(Value) then
    on('append', Ajax('append', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm',
      'Index', '%3'], true));
  FOnAppend := Value;
end;

procedure TExtDataTree.SetFOnBeforeappend(Value: TExtDataTreeOnBeforeappend);
begin
  if Assigned(FOnBeforeappend) then
    JSCode(JSName + '.events ["beforeappend"].listeners=[];');
  if Assigned(Value) then
    on('beforeappend', Ajax('beforeappend', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnBeforeappend := Value;
end;

procedure TExtDataTree.SetFOnBeforeinsert(Value: TExtDataTreeOnBeforeinsert);
begin
  if Assigned(FOnBeforeinsert) then
    JSCode(JSName + '.events ["beforeinsert"].listeners=[];');
  if Assigned(Value) then
    on('beforeinsert', Ajax('beforeinsert', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node',
      '%2.nm', 'RefNode', '%3.nm'], true));
  FOnBeforeinsert := Value;
end;

procedure TExtDataTree.SetFOnBeforemove(Value: TExtDataTreeOnBeforemove);
begin
  if Assigned(FOnBeforemove) then
    JSCode(JSName + '.events ["beforemove"].listeners=[];');
  if Assigned(Value) then
    on('beforemove', Ajax('beforemove', ['Tree', '%0.nm', 'Node', '%1.nm', 'OldParent',
      '%2.nm', 'NewParent', '%3.nm', 'Index', '%4'], true));
  FOnBeforemove := Value;
end;

procedure TExtDataTree.SetFOnBeforeremove(Value: TExtDataTreeOnBeforeremove);
begin
  if Assigned(FOnBeforeremove) then
    JSCode(JSName + '.events ["beforeremove"].listeners=[];');
  if Assigned(Value) then
    on('beforeremove', Ajax('beforeremove', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnBeforeremove := Value;
end;

procedure TExtDataTree.SetFOnInsert(Value: TExtDataTreeOnInsert);
begin
  if Assigned(FOnInsert) then
    JSCode(JSName + '.events ["insert"].listeners=[];');
  if Assigned(Value) then
    on('insert', Ajax('insert', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm',
      'RefNode', '%3.nm'], true));
  FOnInsert := Value;
end;

procedure TExtDataTree.SetFOnMove(Value: TExtDataTreeOnMove);
begin
  if Assigned(FOnMove) then
    JSCode(JSName + '.events ["move"].listeners=[];');
  if Assigned(Value) then
    on('move', Ajax('move', ['Tree', '%0.nm', 'Node', '%1.nm', 'OldParent', '%2.nm',
      'NewParent', '%3.nm', 'Index', '%4'], true));
  FOnMove := Value;
end;

procedure TExtDataTree.SetFOnRemove(Value: TExtDataTreeOnRemove);
begin
  if Assigned(FOnRemove) then
    JSCode(JSName + '.events ["remove"].listeners=[];');
  if Assigned(Value) then
    on('remove', Ajax('remove', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node',
      '%2.nm'], true));
  FOnRemove := Value;
end;

class function TExtDataTree.JSClassName: string;
begin
  Result := 'Ext.data.Tree';
end;

procedure TExtDataTree.InitDefaults;
begin
  inherited;
  FPathSeparator := '/';
  FRoot := TExtDataNode.CreateInternal(Self, 'root');
end;

function TExtDataTree.GetNodeById(Id: string): TExtFunction;
begin
  JSCode(JSName + '.getNodeById(' + VarToJSON([Id]) + ');', 'TExtDataTree');
  Result := Self;
end;

function TExtDataTree.GetRootNode: TExtFunction;
begin
  JSCode(JSName + '.getRootNode();', 'TExtDataTree');
  Result := Self;
end;

function TExtDataTree.SetRootNode(Node: TExtDataNode): TExtFunction;
begin
  JSCode(JSName + '.setRootNode(' + VarToJSON([Node, false]) + ');', 'TExtDataTree');
  Result := Self;
end;

procedure TExtDataTree.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'append') and Assigned(FOnAppend) then
    FOnAppend(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeappend') and Assigned(FOnBeforeappend) then
    FOnBeforeappend(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('Parent')), TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'beforeinsert') and Assigned(FOnBeforeinsert) then
    FOnBeforeinsert(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('Parent')), TExtDataNode(ParamAsObject('Node')),
      TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'beforemove') and Assigned(FOnBeforemove) then
    FOnBeforemove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Node')
      ), TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')
      ), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeremove') and Assigned(FOnBeforeremove) then
    FOnBeforeremove(TExtDataTree(ParamAsObject('Tree')),
      TExtDataNode(ParamAsObject('Parent')), TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'insert') and Assigned(FOnInsert) then
    FOnInsert(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')), TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'move') and Assigned(FOnMove) then
    FOnMove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Node')),
      TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')),
      ParamAsInteger('Index'))
  else if (AEvtName = 'remove') and Assigned(FOnRemove) then
    FOnRemove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')));
end;

procedure TExtDataProxy.SetFApi(Value: TExtObject);
begin
  FApi := Value;
  JSCode('api:' + VarToJSON([Value, false]));
end;

procedure TExtDataProxy.SetFDoRequest(Value: TExtFunction);
begin
  FDoRequest := Value;
  JSCode('doRequest:' + VarToJSON([Value, true]));
end;

procedure TExtDataProxy.SetFOnRead(Value: TExtFunction);
begin
  FOnRead := Value;
  JSCode('onRead:' + VarToJSON([Value, true]));
end;

procedure TExtDataProxy.SetFOnWrite(Value: TExtFunction);
begin
  FOnWrite := Value;
  JSCode('onWrite:' + VarToJSON([Value, true]));
end;

procedure TExtDataProxy.SetFRestful(Value: Boolean);
begin
  FRestful := Value;
  JSCode('restful:' + VarToJSON([Value]));
end;

procedure TExtDataProxy.SetReader(const AValue: TExtDataDataReader);
begin
  FReader.Free;
  FReader := AValue;
  SetConfigItem('reader', AValue);
end;

procedure TExtDataProxy.SetFOnBeforeload(Value: TExtDataDataProxyOnBeforeload);
begin
  if Assigned(FOnBeforeload) then
    JSCode(JSName + '.events ["beforeload"].listeners=[];');
  if Assigned(Value) then
    on('beforeload', Ajax('beforeload', ['This', '%0.nm', 'Params', '%1.nm'], true));
  FOnBeforeload := Value;
end;

procedure TExtDataProxy.SetFOnBeforewrite(Value: TExtDataDataProxyOnBeforewrite);
begin
  if Assigned(FOnBeforewrite) then
    JSCode(JSName + '.events ["beforewrite"].listeners=[];');
  if Assigned(Value) then
    on('beforewrite', Ajax('beforewrite', ['This', '%0.nm', 'Action', '%1', 'Rs', '%2.nm',
      'Params', '%3.nm'], true));
  FOnBeforewrite := Value;
end;

procedure TExtDataProxy.SetFOnException(Value: TExtDataDataProxyOnException);
begin
  if Assigned(FOnException) then
    JSCode(JSName + '.events ["exception"].listeners=[];');
  if Assigned(Value) then
    on('exception', Ajax('exception', ['This', '%0.nm', 'TypeJS', '%1', 'Action', '%2',
      'Options', '%3.nm', 'Response', '%4.nm', 'Arg', '%5'], true));
  FOnException := Value;
end;

procedure TExtDataProxy.SetFOnLoad(Value: TExtDataDataProxyOnLoad);
begin
  if Assigned(FOnLoad) then
    JSCode(JSName + '.events ["load"].listeners=[];');
  if Assigned(Value) then
    on('load', Ajax('load', ['This', '%0.nm', 'O', '%1.nm', 'Options', '%2.nm'], true));
  FOnLoad := Value;
end;

procedure TExtDataProxy.SetFOnWrite_(Value: TExtDataDataProxyOnWrite_);
begin
  if Assigned(FOnWrite_) then
    JSCode(JSName + '.events ["write"].listeners=[];');
  if Assigned(Value) then
    on('write', Ajax('write', ['This', '%0.nm', 'Action', '%1', 'Data', '%2.nm',
      'Response', '%3.nm', 'Rs', '%4.nm', 'Options', '%5.nm'], true));
  FOnWrite_ := Value;
end;

class function TExtDataProxy.JSClassName: string;
begin
  Result := 'Ext.data.proxy.Proxy';
end;

procedure TExtDataProxy.InitDefaults;
begin
  inherited;
  FApi := TExtObject.CreateInternal(Self, 'api');
end;

function TExtDataProxy.IsApiAction(ExtDataApiCREATEREADUPDATEDESTROY: string)
  : TExtFunction;
begin
  JSCode(JSName + '.isApiAction(' + VarToJSON([ExtDataApiCREATEREADUPDATEDESTROY]) + ');',
    'TExtDataDataProxy');
  Result := Self;
end;

function TExtDataProxy.Load(Params: TExtObject; Reader: TExtObject;
  Callback: TExtObject; Scope: TExtObject; Arg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.load(' + VarToJSON([Params, false, Reader, false, Callback, false,
    Scope, false, Arg, false]) + ');', 'TExtDataDataProxy');
  Result := Self;
end;

function TExtDataProxy.Request(Action: string; Rs: TExtObjectList; Params: TExtObject;
  Reader: TExtDataDataReader; Callback: TExtFunction; Scope: TExtObject;
  Options: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.request(' + VarToJSON([Action]) + ',' + VarToJSON(Rs) + ',' +
    VarToJSON([Params, false, Reader, false, Callback, true, Scope, false, Options, false]
    ) + ');', 'TExtDataDataProxy');
  Result := Self;
end;

function TExtDataProxy.SetApi(const AApi: string; const AUrl: string): TExtFunction;
begin
  Result := CallMethod('setApi', [AApi, AUrl]);
end;

function TExtDataProxy.SetApi(Api: TExtObject; Url: string): TExtFunction;
begin
  JSCode(JSName + '.setApi(' + VarToJSON([Api, false, Url]) + ');', 'TExtDataDataProxy');
  Result := Self;
end;

function TExtDataProxy.SetApi(Api: TExtObject; Url: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.setApi(' + VarToJSON([Api, false, Url, true]) + ');',
    'TExtDataDataProxy');
  Result := Self;
end;

function TExtDataProxy.SetApi(Api: string; Url: TExtFunction): TExtFunction;
begin
  JSCode(JSName + '.setApi(' + VarToJSON([Api, Url, true]) + ');', 'TExtDataDataProxy');
  Result := Self;
end;

procedure TExtDataProxy.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeload') and Assigned(FOnBeforeload) then
    FOnBeforeload(TExtDataProxy(ParamAsObject('This')),
      TExtObject(ParamAsObject('Params')))
  else if (AEvtName = 'beforewrite') and Assigned(FOnBeforewrite) then
    FOnBeforewrite(TExtDataProxy(ParamAsObject('This')), ParamAsString('Action'),
      TExtDataRecord(ParamAsObject('Rs')), TExtObject(ParamAsObject('Params')))
  else if (AEvtName = 'exception') and Assigned(FOnException) then
    FOnException(TExtDataProxy(ParamAsObject('This')), ParamAsString('TypeJS'),
      ParamAsString('Action'), TExtObject(ParamAsObject('Options')),
      TExtObject(ParamAsObject('Response')), ParamAsString('Arg'))
  else if (AEvtName = 'load') and Assigned(FOnLoad) then
    FOnLoad(TExtDataProxy(ParamAsObject('This')), TExtObject(ParamAsObject('O')),
      TExtObject(ParamAsObject('Options')))
  else if (AEvtName = 'write') and Assigned(FOnWrite_) then
    FOnWrite_(TExtDataProxy(ParamAsObject('This')), ParamAsString('Action'),
      TExtObject(ParamAsObject('Data')), TExtObject(ParamAsObject('Response')),
      TExtDataRecord(ParamAsObject('Rs')), TExtObject(ParamAsObject('Options')));
end;

procedure TExtDataConnection.SetFAutoAbort(Value: Boolean);
begin
  FAutoAbort := Value;
  JSCode('autoAbort:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFDefaultHeaders(Value: TExtObject);
begin
  FDefaultHeaders := Value;
  JSCode('defaultHeaders:' + VarToJSON([Value, false]));
end;

procedure TExtDataConnection.SetFDisableCaching(Value: Boolean);
begin
  FDisableCaching := Value;
  JSCode('disableCaching:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFDisableCachingParam(Value: string);
begin
  FDisableCachingParam := Value;
  JSCode('disableCachingParam:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFExtraParams(Value: TExtObject);
begin
  FExtraParams := Value;
  JSCode('extraParams:' + VarToJSON([Value, false]));
end;

procedure TExtDataConnection.SetFMethod(Value: string);
begin
  FMethod := Value;
  JSCode('method:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFTimeout(Value: Integer);
begin
  FTimeout := Value;
  JSCode('timeout:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFUrl(Value: string);
begin
  FUrl := Value;
  JSCode('url:' + VarToJSON([Value]));
end;

procedure TExtDataConnection.SetFOnBeforerequest
  (Value: TExtDataConnectionOnBeforerequest);
begin
  if Assigned(FOnBeforerequest) then
    JSCode(JSName + '.events ["beforerequest"].listeners=[];');
  if Assigned(Value) then
    on('beforerequest', Ajax('beforerequest', ['Conn', '%0.nm', 'Options',
      '%1.nm'], true));
  FOnBeforerequest := Value;
end;

procedure TExtDataConnection.SetFOnRequestcomplete
  (Value: TExtDataConnectionOnRequestcomplete);
begin
  if Assigned(FOnRequestcomplete) then
    JSCode(JSName + '.events ["requestcomplete"].listeners=[];');
  if Assigned(Value) then
    on('requestcomplete', Ajax('requestcomplete', ['Conn', '%0.nm', 'Response', '%1.nm',
      'Options', '%2.nm'], true));
  FOnRequestcomplete := Value;
end;

procedure TExtDataConnection.SetFOnRequestexception
  (Value: TExtDataConnectionOnRequestexception);
begin
  if Assigned(FOnRequestexception) then
    JSCode(JSName + '.events ["requestexception"].listeners=[];');
  if Assigned(Value) then
    on('requestexception', Ajax('requestexception', ['Conn', '%0.nm', 'Response', '%1.nm',
      'Options', '%2.nm'], true));
  FOnRequestexception := Value;
end;

class function TExtDataConnection.JSClassName: string;
begin
  Result := 'Ext.data.Connection';
end;

procedure TExtDataConnection.InitDefaults;
begin
  inherited;
  FDefaultHeaders := TExtObject.CreateInternal(Self, 'defaultHeaders');
  FDisableCaching := true;
  FExtraParams := TExtObject.CreateInternal(Self, 'extraParams');
  FMethod := 'output/Ext.data.Connection.html#Ext.data.Connection-request';
  FTimeout := 30000;
end;

function TExtDataConnection.Abort(TransactionId: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.abort(' + VarToJSON([TransactionId]) + ');', 'TExtDataConnection');
  Result := Self;
end;

function TExtDataConnection.IsLoading(TransactionId: Integer = 0): TExtFunction;
begin
  JSCode(JSName + '.isLoading(' + VarToJSON([TransactionId]) + ');',
    'TExtDataConnection');
  Result := Self;
end;

function TExtDataConnection.Request(Options: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.request(' + VarToJSON([Options, false]) + ');', 'TExtDataConnection');
  Result := Self;
end;

procedure TExtDataConnection.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforerequest') and Assigned(FOnBeforerequest) then
    FOnBeforerequest(TExtDataConnection(ParamAsObject('Conn')),
      TExtObject(ParamAsObject('Options')))
  else if (AEvtName = 'requestcomplete') and Assigned(FOnRequestcomplete) then
    FOnRequestcomplete(TExtDataConnection(ParamAsObject('Conn')),
      TExtObject(ParamAsObject('Response')), TExtObject(ParamAsObject('Options')))
  else if (AEvtName = 'requestexception') and Assigned(FOnRequestexception) then
    FOnRequestexception(TExtDataConnection(ParamAsObject('Conn')),
      TExtObject(ParamAsObject('Response')), TExtObject(ParamAsObject('Options')));
end;

procedure TExtDataJsonReader.SetFIdProperty(Value: string);
begin
  FIdProperty := Value;
  JSCode('idProperty:' + VarToJSON([Value]));
end;

procedure TExtDataJsonReader.SetRootProperty(const AValue: string);
begin
  FRootProperty := SetConfigItem('rootProperty', AValue);
end;

procedure TExtDataJsonReader.SetSuccessProperty(const AValue: string);
begin
  FSuccessProperty := SetConfigItem('successProperty', AValue);
end;

procedure TExtDataJsonReader.SetTotalProperty(const AValue: string);
begin
  FTotalProperty := SetConfigItem('totalProperty', AValue);
end;

procedure TExtDataJsonReader.SetFJsonData(Value: TExtObject);
begin
  FJsonData := Value;
  JSCode(JSName + '.jsonData=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataJsonReader.SetFMeta(Value: string);
begin
  FMeta := Value;
  JSCode(JSName + '.meta=' + VarToJSON([Value]) + ';');
end;

procedure TExtDataJsonReader.SetMessageProperty(const AValue: string);
begin
  FMessageProperty := SetConfigItem('messageProperty', AValue);
end;

class function TExtDataJsonReader.JSClassName: string;
begin
  Result := 'Ext.data.JsonReader';
end;

procedure TExtDataJsonReader.InitDefaults;
begin
  inherited;
  FJsonData := TExtObject.CreateInternal(Self, 'jsonData');
end;

function TExtDataJsonReader.Read(Response: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.read(' + VarToJSON([Response, false]) + ');', 'TExtDataJsonReader');
  Result := Self;
end;

function TExtDataJsonReader.ReadRecords(O: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.readRecords(' + VarToJSON([O, false]) + ');', 'TExtDataJsonReader');
  Result := Self;
end;

function TExtDataJsonReader.ReadResponse(Action: string; Response: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.readResponse(' + VarToJSON([Action, Response, false]) + ');',
    'TExtDataJsonReader');
  Result := Self;
end;

class function TExtDataXmlStore.JSClassName: string;
begin
  Result := 'Ext.data.XmlStore';
end;

procedure TExtDataXmlStore.InitDefaults;
begin
  inherited;
end;

procedure TExtDataArrayReader.SetFId(Value: Integer);
begin
  FId := Value;
  JSCode('id:' + VarToJSON([Value]));
end;

procedure TExtDataArrayReader.SetFIdIndex(Value: Integer);
begin
  FIdIndex := Value;
  JSCode('idIndex:' + VarToJSON([Value]));
end;

class function TExtDataArrayReader.JSClassName: string;
begin
  Result := 'Ext.data.ArrayReader';
end;

function TExtDataArrayReader.ReadRecords(O: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.readRecords(' + VarToJSON([O, false]) + ');', 'TExtDataArrayReader');
  Result := Self;
end;

class function TExtDataArrayStore.JSClassName: string;
begin
  Result := 'Ext.data.ArrayStore';
end;

procedure TExtDataArrayStore.InitDefaults;
begin
  inherited;
end;

procedure TExtDataAjaxProxy.SetFConn(Value: TExtDataConnection);
begin
  FConn := Value;
  JSCode(JSName + '.conn=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtDataAjaxProxy.SetUrl(const AValue: string);
begin
  FUrl := SetConfigItem('url', AValue);
end;

class function TExtDataAjaxProxy.JSClassName: string;
begin
  Result := 'Ext.data.proxy.Ajax';
end;

procedure TExtDataAjaxProxy.InitDefaults;
begin
  inherited;
  FConn := TExtDataConnection.CreateInternal(Self, 'conn');
end;

function TExtDataAjaxProxy.DoRequest(Action: string; Rs: TExtDataRecord;
  Params: TExtObject; Reader: TExtDataDataReader; Callback: TExtFunction;
  Scope: TExtObject; Arg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.doRequest(' + VarToJSON([Action, Rs, false, Params, false, Reader,
    false, Callback, true, Scope, false, Arg, false]) + ');', 'TExtDataHttpProxy');
  Result := Self;
end;

function TExtDataAjaxProxy.DoRequest(Action: string; Rs: TExtObjectList;
  Params: TExtObject; Reader: TExtDataDataReader; Callback: TExtFunction;
  Scope: TExtObject; Arg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.doRequest(' + VarToJSON([Action]) + ',' + VarToJSON(Rs) + ',' +
    VarToJSON([Params, false, Reader, false, Callback, true, Scope, false, Arg, false]) +
    ');', 'TExtDataHttpProxy');
  Result := Self;
end;

function TExtDataAjaxProxy.GetConnection: TExtFunction;
begin
  JSCode(JSName + '.getConnection();', 'TExtDataHttpProxy');
  Result := Self;
end;

function TExtDataAjaxProxy.OnRead(Action: string; O: TExtObject; Res: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.onRead(' + VarToJSON([Action, O, false, Res, false]) + ');',
    'TExtDataHttpProxy');
  Result := Self;
end;

function TExtDataAjaxProxy.OnWrite(Action: string; Trans: TExtObject; Res: TExtObject)
  : TExtFunction;
begin
  JSCode(JSName + '.onWrite(' + VarToJSON([Action, Trans, false, Res, false]) + ');',
    'TExtDataHttpProxy');
  Result := Self;
end;

procedure TExtDataMemoryProxy.SetFOnLoadexception
  (Value: TExtDataMemoryProxyOnLoadexception);
begin
  if Assigned(FOnLoadexception) then
    JSCode(JSName + '.events ["loadexception"].listeners=[];');
  if Assigned(Value) then
    on('loadexception', Ajax('loadexception', ['This', '%0.nm', 'Arg', '%1.nm', 'Null',
      '%2.nm', 'E', '%3'], true));
  FOnLoadexception := Value;
end;

class function TExtDataMemoryProxy.JSClassName: string;
begin
  Result := 'Ext.data.MemoryProxy';
end;

function TExtDataMemoryProxy.DoRequest(Action: string; Rs: TExtDataRecord;
  Params: TExtObject; Reader: TExtDataDataReader; Callback: TExtFunction;
  Scope: TExtObject; Arg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.doRequest(' + VarToJSON([Action, Rs, false, Params, false, Reader,
    false, Callback, true, Scope, false, Arg, false]) + ');', 'TExtDataMemoryProxy');
  Result := Self;
end;

function TExtDataMemoryProxy.DoRequest(Action: string; Rs: TExtObjectList;
  Params: TExtObject; Reader: TExtDataDataReader; Callback: TExtFunction;
  Scope: TExtObject; Arg: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.doRequest(' + VarToJSON([Action]) + ',' + VarToJSON(Rs) + ',' +
    VarToJSON([Params, false, Reader, false, Callback, true, Scope, false, Arg, false]) +
    ');', 'TExtDataMemoryProxy');
  Result := Self;
end;

procedure TExtDataMemoryProxy.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'loadexception') and Assigned(FOnLoadexception) then
    FOnLoadexception(TExtDataMemoryProxy(ParamAsObject('This')),
      TExtObject(ParamAsObject('Arg')), TExtObject(ParamAsObject('Null')),
      ParamAsString('E'));
end;

procedure TExtDataJsonStore.SetFId(Value: string);
begin
  FId := Value;
  JSCode('id:' + VarToJSON([Value]));
end;

procedure TExtDataJsonStore.SetFRoot(Value: string);
begin
  FRoot := Value;
  JSCode('root:' + VarToJSON([Value]));
end;

procedure TExtDataJsonStore.SetFSuccessProperty(Value: string);
begin
  FSuccessProperty := Value;
  JSCode('successProperty:' + VarToJSON([Value]));
end;

procedure TExtDataJsonStore.SetFTotalProperty(Value: string);
begin
  FTotalProperty := Value;
  JSCode('totalProperty:' + VarToJSON([Value]));
end;

class function TExtDataJsonStore.JSClassName: string;
begin
  Result := 'Ext.data.JsonStore';
end;

procedure TExtDataJsonStore.InitDefaults;
begin
  inherited;
end;

end.
