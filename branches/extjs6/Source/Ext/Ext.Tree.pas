unit Ext.Tree;

interface

uses
  StrUtils,
  Kitto.Ext,
  Ext.Util,
  Ext.Base,
  Ext.Data;

type
  TExtTreeRootTreeNodeUI = class;
  TExtTreeTreeNodeUI = class;
  TExtTreeTreeFilter = class;
  TExtTreeTreeSorter = class;
  TExtTreeTreeLoader = class;
  TExtTreeMultiSelectionModel = class;
  TExtTreeDefaultSelectionModel = class;
  TExtTreeTreeNode = class;
  TExtTreeAsyncTreeNode = class;
  TExtTreeTreeEditor = class;
  TExtTreeTreePanel = class;

  TExtTreeRootTreeNodeUI = class(TExtFunction)
  public
    class function JSClassName: string; override;
  end;

  TExtTreeTreeNodeUI = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function AddClass(ClassName: String): TExtFunction; overload;
    function AddClass(ClassName: TExtObjectList): TExtFunction; overload;
    function GetAnchor: TExtFunction;
    function GetEl: TExtFunction;
    function GetIconEl: TExtFunction;
    function GetTextEl: TExtFunction;
    function Hide: TExtFunction;
    function IsChecked: TExtFunction;
    function RemoveClass(ClassName: String): TExtFunction; overload;
    function RemoveClass(ClassName: TExtObjectList): TExtFunction; overload;
    function Show: TExtFunction;
    function ToggleCheck(Value: Boolean = false): TExtFunction;
  end;

  TExtTreeTreeFilter = class(TExtFunction)
  public
    class function JSClassName: string; override;
    function Clear: TExtFunction;
    function Filter(Value: string; Attr: String = ''; StartNode: TExtTreeTreeNode = nil): TExtFunction;
    function FilterBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
  end;

  TExtTreeTreeSorter = class(TExtFunction)
  private
    FCaseSensitive: Boolean;
    FDir: String;
    FFolderSort: Boolean;
    FLeafAttr: String; // 'leaf'
    FPropertyJS: String; // 'text'
    FSortType: TExtFunction;
    procedure SetFCaseSensitive(Value: Boolean);
    procedure SetFDir(Value: String);
    procedure SetFFolderSort(Value: Boolean);
    procedure SetFLeafAttr(Value: String);
    procedure SetFPropertyJS(Value: String);
    procedure SetFSortType(Value: TExtFunction);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property CaseSensitive: Boolean read FCaseSensitive write SetFCaseSensitive;
    property Dir: String read FDir write SetFDir;
    property FolderSort: Boolean read FFolderSort write SetFFolderSort;
    property LeafAttr: String read FLeafAttr write SetFLeafAttr;
    property PropertyJS: String read FPropertyJS write SetFPropertyJS;
    property SortType: TExtFunction read FSortType write SetFSortType;
  end;

  // Procedural types for events TExtTreeTreeLoader
  TExtTreeTreeLoaderOnBeforeload = procedure(This: TExtTreeTreeLoader; Node: TExtObject; Callback: TExtObject)
    of object;
  TExtTreeTreeLoaderOnLoad = procedure(This: TExtTreeTreeLoader; Node: TExtObject; Response: TExtObject) of object;
  TExtTreeTreeLoaderOnLoadexception = procedure(This: TExtTreeTreeLoader; Node: TExtObject; Response: TExtObject)
    of object;

  TExtTreeTreeLoader = class(TExtUtilObservable)
  private
    FBaseAttrs: TExtObject;
    FBaseParams: TExtObject;
    FClearOnLoad: Boolean;
    FDataUrl: String;
    FDirectFn: TExtFunction;
    FNodeParameter: String;
    FParamOrder: TExtObjectList;
    FParamOrderString: String;
    FParamsAsHash: Boolean;
    FPreloadChildren: Boolean;
    FRequestMethod: String; // 'output/Ext.Ajax.html#Ext.Ajax-method'
    FUiProviders: TExtObject;
    FUrl: String;
    FOnBeforeload: TExtTreeTreeLoaderOnBeforeload;
    FOnLoad: TExtTreeTreeLoaderOnLoad;
    FOnLoadexception: TExtTreeTreeLoaderOnLoadexception;
    procedure SetFBaseAttrs(Value: TExtObject);
    procedure SetFBaseParams(Value: TExtObject);
    procedure SetFClearOnLoad(Value: Boolean);
    procedure SetFDataUrl(Value: String);
    procedure SetFDirectFn(Value: TExtFunction);
    procedure SetFNodeParameter(Value: String);
    procedure SetFParamOrder(Value: TExtObjectList);
    procedure SetFParamOrderString(Value: String);
    procedure SetFParamsAsHash(Value: Boolean);
    procedure SetFPreloadChildren(Value: Boolean);
    procedure SetFRequestMethod(Value: String);
    procedure SetFUiProviders(Value: TExtObject);
    procedure SetFUrl(Value: String);
    procedure SetFOnBeforeload(Value: TExtTreeTreeLoaderOnBeforeload);
    procedure SetFOnLoad(Value: TExtTreeTreeLoaderOnLoad);
    procedure SetFOnLoadexception(Value: TExtTreeTreeLoaderOnLoadexception);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function CreateNode(Attr: TExtObject): TExtFunction;
    function Load(Node: TExtTreeTreeNode; Callback: TExtFunction; Scope: TExtObject): TExtFunction;
    property BaseAttrs: TExtObject read FBaseAttrs write SetFBaseAttrs;
    property BaseParams: TExtObject read FBaseParams write SetFBaseParams;
    property ClearOnLoad: Boolean read FClearOnLoad write SetFClearOnLoad;
    property DataUrl: String read FDataUrl write SetFDataUrl;
    property DirectFn: TExtFunction read FDirectFn write SetFDirectFn;
    property NodeParameter: String read FNodeParameter write SetFNodeParameter;
    property ParamOrder: TExtObjectList read FParamOrder write SetFParamOrder;
    property ParamOrderString: String read FParamOrderString write SetFParamOrderString;
    property ParamsAsHash: Boolean read FParamsAsHash write SetFParamsAsHash;
    property PreloadChildren: Boolean read FPreloadChildren write SetFPreloadChildren;
    property RequestMethod: String read FRequestMethod write SetFRequestMethod;
    property UiProviders: TExtObject read FUiProviders write SetFUiProviders;
    property Url: String read FUrl write SetFUrl;
    property OnBeforeload: TExtTreeTreeLoaderOnBeforeload read FOnBeforeload write SetFOnBeforeload;
    property OnLoad: TExtTreeTreeLoaderOnLoad read FOnLoad write SetFOnLoad;
    property OnLoadexception: TExtTreeTreeLoaderOnLoadexception read FOnLoadexception write SetFOnLoadexception;
  end;

  // Procedural types for events TExtTreeMultiSelectionModel
  TExtTreeMultiSelectionModelOnSelectionchange = procedure(This: TExtTreeMultiSelectionModel; Nodes: TExtObjectList)
    of object;

  TExtTreeMultiSelectionModel = class(TExtUtilObservable)
  private
    FOnSelectionchange: TExtTreeMultiSelectionModelOnSelectionchange;
    procedure SetFOnSelectionchange(Value: TExtTreeMultiSelectionModelOnSelectionchange);
  protected
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function ClearSelections: TExtFunction;
    function GetSelectedNodes: TExtFunction;
    function IsSelected(Node: TExtTreeTreeNode): TExtFunction;
    function Unselect(Node: TExtTreeTreeNode): TExtFunction;
    property OnSelectionchange: TExtTreeMultiSelectionModelOnSelectionchange read FOnSelectionchange
      write SetFOnSelectionchange;
  end;

  // Procedural types for events TExtTreeDefaultSelectionModel
  TExtTreeDefaultSelectionModelOnBeforeselect = procedure(This: TExtTreeDefaultSelectionModel; Node: TExtTreeTreeNode;
    Node_: TExtTreeTreeNode) of object;
  TExtTreeDefaultSelectionModelOnSelectionchange = procedure(This: TExtTreeDefaultSelectionModel;
    Node: TExtTreeTreeNode) of object;

  TExtTreeDefaultSelectionModel = class(TExtUtilObservable)
  private
    FOnBeforeselect: TExtTreeDefaultSelectionModelOnBeforeselect;
    FOnSelectionchange: TExtTreeDefaultSelectionModelOnSelectionchange;
    procedure SetFOnBeforeselect(Value: TExtTreeDefaultSelectionModelOnBeforeselect);
    procedure SetFOnSelectionchange(Value: TExtTreeDefaultSelectionModelOnSelectionchange);
  protected
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function ClearSelections(Silent: Boolean): TExtFunction;
    function GetSelectedNode: TExtFunction;
    function IsSelected(Node: TExtTreeTreeNode): TExtFunction;
    function Select(Node: TExtTreeTreeNode): TExtFunction;
    function SelectNext: TExtFunction;
    function SelectPrevious: TExtFunction;
    function Unselect(Node: TExtTreeTreeNode; Silent: Boolean): TExtFunction;
    property OnBeforeselect: TExtTreeDefaultSelectionModelOnBeforeselect read FOnBeforeselect write SetFOnBeforeselect;
    property OnSelectionchange: TExtTreeDefaultSelectionModelOnSelectionchange read FOnSelectionchange
      write SetFOnSelectionchange;
  end;

  // Procedural types for events TExtTreeTreeNode
  TExtTreeTreeNodeOnBeforechildrenrendered = procedure(This: TExtTreeTreeNode) of object;
  TExtTreeTreeNodeOnBeforeclick = procedure(This: TExtTreeTreeNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreeNodeOnBeforecollapse = procedure(This: TExtTreeTreeNode; Deep: Boolean; Anim: Boolean) of object;
  TExtTreeTreeNodeOnBeforedblclick = procedure(This: TExtTreeTreeNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreeNodeOnBeforeexpand = procedure(This: TExtTreeTreeNode; Deep: Boolean; Anim: Boolean) of object;
  TExtTreeTreeNodeOnCheckchange = procedure(This: TExtTreeTreeNode; Checked: Boolean) of object;
  TExtTreeTreeNodeOnClick = procedure(This: TExtTreeTreeNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreeNodeOnCollapse = procedure(This: TExtTreeTreeNode) of object;
  TExtTreeTreeNodeOnContextmenu = procedure(This: TExtTreeTreeNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreeNodeOnDblclick = procedure(This: TExtTreeTreeNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreeNodeOnDisabledchange = procedure(This: TExtTreeTreeNode; Disabled: Boolean) of object;
  TExtTreeTreeNodeOnExpand = procedure(This: TExtTreeTreeNode) of object;
  TExtTreeTreeNodeOnTextchange = procedure(This: TExtTreeTreeNode; Text: String; OldText: String) of object;

  TExtTreeTreeNode = class(TExtDataNode)
  private
    FAllowChildren: Boolean; // true
    FAllowDrag: Boolean; // true
    FAllowDrop: Boolean; // true
    FChecked: Boolean;
    FCls: String;
    FDisabled: Boolean;
    FDraggable: Boolean;
    FEditable: Boolean; // true
    FExpandable: Boolean;
    FExpanded: Boolean;
    FHidden: Boolean;
    FHref: String;
    FHrefTarget: String;
    FIcon: String;
    FIconCls: String;
    FIsTarget: Boolean; // true
    FQtip: String;
    FQtipCfg: String;
    FSingleClickExpand: Boolean;
    FText: String;
    FUiProvider: TExtFunction;
    FDisabled_: Boolean;
    FHidden_: Boolean;
    FText_: String;
    FOnBeforechildrenrendered: TExtTreeTreeNodeOnBeforechildrenrendered;
    FOnBeforeclick: TExtTreeTreeNodeOnBeforeclick;
    FOnBeforecollapse: TExtTreeTreeNodeOnBeforecollapse;
    FOnBeforedblclick: TExtTreeTreeNodeOnBeforedblclick;
    FOnBeforeexpand: TExtTreeTreeNodeOnBeforeexpand;
    FOnCheckchange: TExtTreeTreeNodeOnCheckchange;
    FOnClick: TExtTreeTreeNodeOnClick;
    FOnCollapse: TExtTreeTreeNodeOnCollapse;
    FOnContextmenu: TExtTreeTreeNodeOnContextmenu;
    FOnDblclick: TExtTreeTreeNodeOnDblclick;
    FOnDisabledchange: TExtTreeTreeNodeOnDisabledchange;
    FOnExpand: TExtTreeTreeNodeOnExpand;
    FOnTextchange: TExtTreeTreeNodeOnTextchange;
    procedure SetFAllowChildren(Value: Boolean);
    procedure SetFAllowDrag(Value: Boolean);
    procedure SetFAllowDrop(Value: Boolean);
    procedure SetFChecked(Value: Boolean);
    procedure SetFCls(Value: String);
    procedure SetDisabled(const AValue: Boolean);
    procedure SetFDraggable(Value: Boolean);
    procedure SetFEditable(Value: Boolean);
    procedure SetExpandable(const AValue: Boolean);
    procedure SetExpanded(const AValue: Boolean);
    procedure SetHidden(const AValue: Boolean);
    procedure SetFHref(Value: String);
    procedure SetFHrefTarget(Value: String);
    procedure SetFIcon(Value: String);
    procedure SetIconCls(const AValue: string);
    procedure SetFIsTarget(Value: Boolean);
    procedure SetQtip(const AValue: string);
    procedure SetFQtipCfg(Value: String);
    procedure SetFSingleClickExpand(Value: Boolean);
    procedure _SetText(const AValue: string);
    procedure SetFUiProvider(Value: TExtFunction);
    procedure SetFDisabled_(Value: Boolean);
    procedure SetFHidden_(Value: Boolean);
    procedure SetFText_(Value: String);
    procedure SetFOnBeforechildrenrendered(Value: TExtTreeTreeNodeOnBeforechildrenrendered);
    procedure SetFOnBeforeclick(Value: TExtTreeTreeNodeOnBeforeclick);
    procedure SetFOnBeforecollapse(Value: TExtTreeTreeNodeOnBeforecollapse);
    procedure SetFOnBeforedblclick(Value: TExtTreeTreeNodeOnBeforedblclick);
    procedure SetFOnBeforeexpand(Value: TExtTreeTreeNodeOnBeforeexpand);
    procedure SetFOnCheckchange(Value: TExtTreeTreeNodeOnCheckchange);
    procedure SetFOnClick(Value: TExtTreeTreeNodeOnClick);
    procedure SetFOnCollapse(Value: TExtTreeTreeNodeOnCollapse);
    procedure SetFOnContextmenu(Value: TExtTreeTreeNodeOnContextmenu);
    procedure SetFOnDblclick(Value: TExtTreeTreeNodeOnDblclick);
    procedure SetFOnDisabledchange(Value: TExtTreeTreeNodeOnDisabledchange);
    procedure SetFOnExpand(Value: TExtTreeTreeNodeOnExpand);
    procedure SetFOnTextchange(Value: TExtTreeTreeNodeOnTextchange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function Collapse(Deep: Boolean = false; Anim: Boolean = false; Callback: TExtFunction = nil;
      Scope: TExtObject = nil): TExtFunction;
    function CollapseChildNodes(Deep: Boolean = false): TExtFunction;
    function Disable: TExtFunction;
    function Enable: TExtFunction;
    function EnsureVisible(Callback: TExtFunction = nil; Scope: TExtObject = nil): TExtFunction;
    function Expand(Deep: Boolean = false; Anim: Boolean = false; Callback: TExtFunction = nil; Scope: TExtObject = nil)
      : TExtFunction;
    function ExpandChildNodes(Deep: Boolean = false): TExtFunction;
    function GetUI: TExtFunction;
    function IsExpanded: TExtFunction;
    function IsSelected: TExtFunction;
    function Select: TExtFunction;
    function SetText(const AText: string): TExtFunction;
    function SetTooltip(const ATip: string; const ATitle: string = ''): TExtFunction;
    function Toggle: TExtFunction;
    function Unselect(const ASilent: Boolean = false): TExtFunction;
    property AllowChildren: Boolean read FAllowChildren write SetFAllowChildren;
    property AllowDrag: Boolean read FAllowDrag write SetFAllowDrag;
    property AllowDrop: Boolean read FAllowDrop write SetFAllowDrop;
    property Checked: Boolean read FChecked write SetFChecked;
    property Cls: String read FCls write SetFCls;
    property Disabled: Boolean read FDisabled write SetDisabled;
    property Draggable: Boolean read FDraggable write SetFDraggable;
    property Editable: Boolean read FEditable write SetFEditable;
    property Expandable: Boolean read FExpandable write SetExpandable;
    property Expanded: Boolean read FExpanded write SetExpanded;
    property Hidden: Boolean read FHidden write SetHidden;
    property Href: String read FHref write SetFHref;
    property HrefTarget: String read FHrefTarget write SetFHrefTarget;
    property Icon: String read FIcon write SetFIcon;
    property IconCls: String read FIconCls write SetIconCls;
    property IsTarget: Boolean read FIsTarget write SetFIsTarget;
    property Qtip: string read FQtip write SetQtip;
    property QtipCfg: String read FQtipCfg write SetFQtipCfg;
    property SingleClickExpand: Boolean read FSingleClickExpand write SetFSingleClickExpand;
    property Text: string read FText write _SetText;
    property UiProvider: TExtFunction read FUiProvider write SetFUiProvider;
    property Disabled_: Boolean read FDisabled_ write SetFDisabled_;
    property Hidden_: Boolean read FHidden_ write SetFHidden_;
    property Text_: String read FText_ write SetFText_;
    property OnBeforechildrenrendered: TExtTreeTreeNodeOnBeforechildrenrendered read FOnBeforechildrenrendered
      write SetFOnBeforechildrenrendered;
    property OnBeforeclick: TExtTreeTreeNodeOnBeforeclick read FOnBeforeclick write SetFOnBeforeclick;
    property OnBeforecollapse: TExtTreeTreeNodeOnBeforecollapse read FOnBeforecollapse write SetFOnBeforecollapse;
    property OnBeforedblclick: TExtTreeTreeNodeOnBeforedblclick read FOnBeforedblclick write SetFOnBeforedblclick;
    property OnBeforeexpand: TExtTreeTreeNodeOnBeforeexpand read FOnBeforeexpand write SetFOnBeforeexpand;
    property OnCheckchange: TExtTreeTreeNodeOnCheckchange read FOnCheckchange write SetFOnCheckchange;
    property OnClick: TExtTreeTreeNodeOnClick read FOnClick write SetFOnClick;
    property OnCollapse: TExtTreeTreeNodeOnCollapse read FOnCollapse write SetFOnCollapse;
    property OnContextmenu: TExtTreeTreeNodeOnContextmenu read FOnContextmenu write SetFOnContextmenu;
    property OnDblclick: TExtTreeTreeNodeOnDblclick read FOnDblclick write SetFOnDblclick;
    property OnDisabledchange: TExtTreeTreeNodeOnDisabledchange read FOnDisabledchange write SetFOnDisabledchange;
    property OnExpand: TExtTreeTreeNodeOnExpand read FOnExpand write SetFOnExpand;
    property OnTextchange: TExtTreeTreeNodeOnTextchange read FOnTextchange write SetFOnTextchange;
  end;

  // Procedural types for events TExtTreeAsyncTreeNode
  TExtTreeAsyncTreeNodeOnBeforeload = procedure(This: TExtTreeAsyncTreeNode) of object;
  TExtTreeAsyncTreeNodeOnLoad = procedure(This: TExtTreeAsyncTreeNode) of object;

  TExtTreeAsyncTreeNode = class(TExtTreeTreeNode)
  private
    FLoader: TExtTreeTreeLoader;
    FLoader_: TExtTreeTreeLoader;
    FOnBeforeload: TExtTreeAsyncTreeNodeOnBeforeload;
    FOnLoad: TExtTreeAsyncTreeNodeOnLoad;
    procedure SetFLoader(Value: TExtTreeTreeLoader);
    procedure SetFLoader_(Value: TExtTreeTreeLoader);
    procedure SetFOnBeforeload(Value: TExtTreeAsyncTreeNodeOnBeforeload);
    procedure SetFOnLoad(Value: TExtTreeAsyncTreeNodeOnLoad);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function IsLoaded: TExtFunction;
    function IsLoading: TExtFunction;
    function Reload(Callback: TExtFunction; Scope: TExtObject = nil): TExtFunction;
    property Loader: TExtTreeTreeLoader read FLoader write SetFLoader;
    property Loader_: TExtTreeTreeLoader read FLoader_ write SetFLoader_;
    property OnBeforeload: TExtTreeAsyncTreeNodeOnBeforeload read FOnBeforeload write SetFOnBeforeload;
    property OnLoad: TExtTreeAsyncTreeNodeOnLoad read FOnLoad write SetFOnLoad;
  end;

  TExtTreeTreeEditor = class(TExtEditor)
  private
    FAlignment: String;
    FCls: String; // 'x-small-editor x-tree-editor'
    FEditDelay: Integer; // 350
    FHideEl: Boolean;
    FMaxWidth: Integer; // 250
    FShim: Boolean;
    FEditNode: TExtTreeTreeNode;
    procedure SetFAlignment(Value: String);
    procedure SetFCls(Value: String);
    procedure SetFEditDelay(Value: Integer);
    procedure SetFHideEl(Value: Boolean);
    procedure SetFMaxWidth(Value: Integer);
    procedure SetFShim(Value: Boolean);
    procedure SetFEditNode(Value: TExtTreeTreeNode);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function TriggerEdit(Node: TExtTreeTreeNode): TExtFunction;
    property Alignment: String read FAlignment write SetFAlignment;
    property Cls: String read FCls write SetFCls;
    property EditDelay: Integer read FEditDelay write SetFEditDelay;
    property HideEl: Boolean read FHideEl write SetFHideEl;
    property MaxWidth: Integer read FMaxWidth write SetFMaxWidth;
    property Shim: Boolean read FShim write SetFShim;
    property EditNode: TExtTreeTreeNode read FEditNode write SetFEditNode;
  end;

  // Procedural types for events TExtTreeTreePanel
  TExtTreeTreePanelOnAppend = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode; Index: Integer)
    of object;
  TExtTreeTreePanelOnBeforeappend = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode) of object;
  TExtTreeTreePanelOnBeforechildrenrendered = procedure(Node: TExtDataNode) of object;
  TExtTreeTreePanelOnBeforeclick = procedure(Node: TExtDataNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnBeforecollapsenode = procedure(Node: TExtDataNode; Deep: Boolean; Anim: Boolean) of object;
  TExtTreeTreePanelOnBeforedblclick = procedure(Node: TExtDataNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnBeforeexpandnode = procedure(Node: TExtDataNode; Deep: Boolean; Anim: Boolean) of object;
  TExtTreeTreePanelOnBeforeinsert = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode;
    RefNode: TExtDataNode) of object;
  TExtTreeTreePanelOnBeforeload = procedure(Node: TExtDataNode) of object;
  TExtTreeTreePanelOnBeforemovenode = procedure(Tree: TExtDataTree; Node: TExtDataNode; OldParent: TExtDataNode;
    NewParent: TExtDataNode; Index: Integer) of object;
  TExtTreeTreePanelOnBeforenodedrop = procedure(DropEvent: TExtObject) of object;
  TExtTreeTreePanelOnBeforeremove = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode) of object;
  TExtTreeTreePanelOnCheckchange = procedure(This: TExtTreeTreePanel; Checked: Boolean) of object;
  TExtTreeTreePanelOnClick = procedure(Node: TExtDataNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnCollapsenode = procedure(Node: TExtDataNode) of object;
  TExtTreeTreePanelOnContainerclick = procedure(This: TExtTreeTreePanel; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnContainercontextmenu = procedure(This: TExtTreeTreePanel; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnContainerdblclick = procedure(This: TExtTreeTreePanel; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnContextmenu = procedure(Node: TExtDataNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnDblclick = procedure(Node: TExtDataNode; E: TExtEventObjectSingleton) of object;
  TExtTreeTreePanelOnDisabledchange = procedure(Node: TExtDataNode; Disabled: Boolean) of object;
  TExtTreeTreePanelOnExpandnode = procedure(Node: TExtDataNode) of object;
  TExtTreeTreePanelOnInsert = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode;
    RefNode: TExtDataNode) of object;
  TExtTreeTreePanelOnLoad = procedure(Node: TExtDataNode) of object;
  TExtTreeTreePanelOnMovenode = procedure(Tree: TExtDataTree; Node: TExtDataNode; OldParent: TExtDataNode;
    NewParent: TExtDataNode; Index: Integer) of object;
  TExtTreeTreePanelOnNodedragover = procedure(DragOverEvent: TExtObject) of object;
  TExtTreeTreePanelOnNodedrop = procedure(DropEvent: TExtObject) of object;
  TExtTreeTreePanelOnRemove = procedure(Tree: TExtDataTree; Parent: TExtDataNode; Node: TExtDataNode) of object;
  TExtTreeTreePanelOnTextchange = procedure(Node: TExtDataNode; Text: String; OldText: String) of object;

  TExtTreeTreePanel = class(TExtPanel)
  private
    FAnimate: Boolean;
    FContainerScroll: Boolean;
    FDdAppendOnly: Boolean;
    FDdGroup: String;
    FDdScroll: Boolean;
    FDragConfig: TExtObject;
    FDropConfig: TExtObject;
    FEnableDD: Boolean;
    FEnableDrag: Boolean;
    FEnableDrop: Boolean;
    FHlColor: String; // 'C3DAF9'
    FHlDrop: Boolean;
    FLines: Boolean; // true
    FPathSeparator: String; // '/'
    FRequestMethod: String; // 'output/Ext.Ajax.html#Ext.Ajax-method'
    FRoot: TExtTreeTreeNode;
    FRootVisible: Boolean; // true
    FSelModel: TExtObject;
    FSingleExpand: Boolean;
    FTrackMouseOver: Boolean;
    FUseArrows: Boolean;
    FOnAppend: TExtTreeTreePanelOnAppend;
    FOnBeforeappend: TExtTreeTreePanelOnBeforeappend;
    FOnBeforechildrenrendered: TExtTreeTreePanelOnBeforechildrenrendered;
    FOnBeforeclick: TExtTreeTreePanelOnBeforeclick;
    FOnBeforecollapsenode: TExtTreeTreePanelOnBeforecollapsenode;
    FOnBeforedblclick: TExtTreeTreePanelOnBeforedblclick;
    FOnBeforeexpandnode: TExtTreeTreePanelOnBeforeexpandnode;
    FOnBeforeinsert: TExtTreeTreePanelOnBeforeinsert;
    FOnBeforeload: TExtTreeTreePanelOnBeforeload;
    FOnBeforemovenode: TExtTreeTreePanelOnBeforemovenode;
    FOnBeforenodedrop: TExtTreeTreePanelOnBeforenodedrop;
    FOnBeforeremove: TExtTreeTreePanelOnBeforeremove;
    FOnCheckchange: TExtTreeTreePanelOnCheckchange;
    FOnClick: TExtTreeTreePanelOnClick;
    FOnCollapsenode: TExtTreeTreePanelOnCollapsenode;
    FOnContainerclick: TExtTreeTreePanelOnContainerclick;
    FOnContainercontextmenu: TExtTreeTreePanelOnContainercontextmenu;
    FOnContainerdblclick: TExtTreeTreePanelOnContainerdblclick;
    FOnContextmenu: TExtTreeTreePanelOnContextmenu;
    FOnDblclick: TExtTreeTreePanelOnDblclick;
    FOnDisabledchange: TExtTreeTreePanelOnDisabledchange;
    FOnExpandnode: TExtTreeTreePanelOnExpandnode;
    FOnInsert: TExtTreeTreePanelOnInsert;
    FOnLoad: TExtTreeTreePanelOnLoad;
    FOnMovenode: TExtTreeTreePanelOnMovenode;
    FOnNodedragover: TExtTreeTreePanelOnNodedragover;
    FOnNodedrop: TExtTreeTreePanelOnNodedrop;
    FOnRemove: TExtTreeTreePanelOnRemove;
    FOnTextchange: TExtTreeTreePanelOnTextchange;
    procedure SetFAnimate(Value: Boolean);
    procedure SetFContainerScroll(Value: Boolean);
    procedure SetFDdAppendOnly(Value: Boolean);
    procedure SetFDdGroup(Value: String);
    procedure SetFDdScroll(Value: Boolean);
    procedure SetFDragConfig(Value: TExtObject);
    procedure SetFDropConfig(Value: TExtObject);
    procedure SetFEnableDD(Value: Boolean);
    procedure SetFEnableDrag(Value: Boolean);
    procedure SetFEnableDrop(Value: Boolean);
    procedure SetFHlColor(Value: String);
    procedure SetFHlDrop(Value: Boolean);
    procedure SetFLines(Value: Boolean);
    procedure SetFPathSeparator(Value: String);
    procedure SetFRequestMethod(Value: String);
    procedure SetRootVisible(const AValue: Boolean);
    procedure SetFSelModel(Value: TExtObject);
    procedure SetFSingleExpand(Value: Boolean);
    procedure SetFTrackMouseOver(Value: Boolean);
    procedure SetFUseArrows(Value: Boolean);
    procedure SetFOnAppend(Value: TExtTreeTreePanelOnAppend);
    procedure SetFOnBeforeappend(Value: TExtTreeTreePanelOnBeforeappend);
    procedure SetFOnBeforechildrenrendered(Value: TExtTreeTreePanelOnBeforechildrenrendered);
    procedure SetFOnBeforeclick(Value: TExtTreeTreePanelOnBeforeclick);
    procedure SetFOnBeforecollapsenode(Value: TExtTreeTreePanelOnBeforecollapsenode);
    procedure SetFOnBeforedblclick(Value: TExtTreeTreePanelOnBeforedblclick);
    procedure SetFOnBeforeexpandnode(Value: TExtTreeTreePanelOnBeforeexpandnode);
    procedure SetFOnBeforeinsert(Value: TExtTreeTreePanelOnBeforeinsert);
    procedure SetFOnBeforeload(Value: TExtTreeTreePanelOnBeforeload);
    procedure SetFOnBeforemovenode(Value: TExtTreeTreePanelOnBeforemovenode);
    procedure SetFOnBeforenodedrop(Value: TExtTreeTreePanelOnBeforenodedrop);
    procedure SetFOnBeforeremove(Value: TExtTreeTreePanelOnBeforeremove);
    procedure SetFOnCheckchange(Value: TExtTreeTreePanelOnCheckchange);
    procedure SetFOnClick(Value: TExtTreeTreePanelOnClick);
    procedure SetFOnCollapsenode(Value: TExtTreeTreePanelOnCollapsenode);
    procedure SetFOnContainerclick(Value: TExtTreeTreePanelOnContainerclick);
    procedure SetFOnContainercontextmenu(Value: TExtTreeTreePanelOnContainercontextmenu);
    procedure SetFOnContainerdblclick(Value: TExtTreeTreePanelOnContainerdblclick);
    procedure SetFOnContextmenu(Value: TExtTreeTreePanelOnContextmenu);
    procedure SetFOnDblclick(Value: TExtTreeTreePanelOnDblclick);
    procedure SetFOnDisabledchange(Value: TExtTreeTreePanelOnDisabledchange);
    procedure SetFOnExpandnode(Value: TExtTreeTreePanelOnExpandnode);
    procedure SetFOnInsert(Value: TExtTreeTreePanelOnInsert);
    procedure SetFOnLoad(Value: TExtTreeTreePanelOnLoad);
    procedure SetFOnMovenode(Value: TExtTreeTreePanelOnMovenode);
    procedure SetFOnNodedragover(Value: TExtTreeTreePanelOnNodedragover);
    procedure SetFOnNodedrop(Value: TExtTreeTreePanelOnNodedrop);
    procedure SetFOnRemove(Value: TExtTreeTreePanelOnRemove);
    procedure SetFOnTextchange(Value: TExtTreeTreePanelOnTextchange);
    function GetRoot: TExtTreeTreeNode;
    procedure SetRoot(const AValue: TExtTreeTreeNode);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function CollapseAll: TExtFunction;
    function ExpandAll: TExtFunction;
    function ExpandPath(Path: String; Attr: String = ''; Callback: TExtFunction = nil): TExtFunction;
    function GetChecked(Attribute: String = ''; StartNode: TExtTreeTreeNode = nil): TExtFunction;
    function GetLoader: TExtFunction;
    function GetNodeById(Id: String): TExtFunction;
    function GetRootNode: TExtFunction;
    function GetSelectionModel: TExtFunction;
    function GetTreeEl: TExtFunction;
    function SelectPath(Path: String; Attr: String = ''; Callback: TExtFunction = nil): TExtFunction;
    property Animate: Boolean read FAnimate write SetFAnimate;
    property ContainerScroll: Boolean read FContainerScroll write SetFContainerScroll;
    property DdAppendOnly: Boolean read FDdAppendOnly write SetFDdAppendOnly;
    property DdGroup: String read FDdGroup write SetFDdGroup;
    property DdScroll: Boolean read FDdScroll write SetFDdScroll;
    property DragConfig: TExtObject read FDragConfig write SetFDragConfig;
    property DropConfig: TExtObject read FDropConfig write SetFDropConfig;
    property EnableDD: Boolean read FEnableDD write SetFEnableDD;
    property EnableDrag: Boolean read FEnableDrag write SetFEnableDrag;
    property EnableDrop: Boolean read FEnableDrop write SetFEnableDrop;
    property HlColor: String read FHlColor write SetFHlColor;
    property HlDrop: Boolean read FHlDrop write SetFHlDrop;
    property Lines: Boolean read FLines write SetFLines;
    property PathSeparator: String read FPathSeparator write SetFPathSeparator;
    property RequestMethod: String read FRequestMethod write SetFRequestMethod;
    property Root: TExtTreeTreeNode read GetRoot write SetRoot;
    property RootVisible: Boolean read FRootVisible write SetRootVisible;
    property SelModel: TExtObject read FSelModel write SetFSelModel;
    property SingleExpand: Boolean read FSingleExpand write SetFSingleExpand;
    property TrackMouseOver: Boolean read FTrackMouseOver write SetFTrackMouseOver;
    property UseArrows: Boolean read FUseArrows write SetFUseArrows;
    property OnAppend: TExtTreeTreePanelOnAppend read FOnAppend write SetFOnAppend;
    property OnBeforeappend: TExtTreeTreePanelOnBeforeappend read FOnBeforeappend write SetFOnBeforeappend;
    property OnBeforechildrenrendered: TExtTreeTreePanelOnBeforechildrenrendered read FOnBeforechildrenrendered
      write SetFOnBeforechildrenrendered;
    property OnBeforeclick: TExtTreeTreePanelOnBeforeclick read FOnBeforeclick write SetFOnBeforeclick;
    property OnBeforecollapsenode: TExtTreeTreePanelOnBeforecollapsenode read FOnBeforecollapsenode
      write SetFOnBeforecollapsenode;
    property OnBeforedblclick: TExtTreeTreePanelOnBeforedblclick read FOnBeforedblclick write SetFOnBeforedblclick;
    property OnBeforeexpandnode: TExtTreeTreePanelOnBeforeexpandnode read FOnBeforeexpandnode
      write SetFOnBeforeexpandnode;
    property OnBeforeinsert: TExtTreeTreePanelOnBeforeinsert read FOnBeforeinsert write SetFOnBeforeinsert;
    property OnBeforeload: TExtTreeTreePanelOnBeforeload read FOnBeforeload write SetFOnBeforeload;
    property OnBeforemovenode: TExtTreeTreePanelOnBeforemovenode read FOnBeforemovenode write SetFOnBeforemovenode;
    property OnBeforenodedrop: TExtTreeTreePanelOnBeforenodedrop read FOnBeforenodedrop write SetFOnBeforenodedrop;
    property OnBeforeremove: TExtTreeTreePanelOnBeforeremove read FOnBeforeremove write SetFOnBeforeremove;
    property OnCheckchange: TExtTreeTreePanelOnCheckchange read FOnCheckchange write SetFOnCheckchange;
    property OnClick: TExtTreeTreePanelOnClick read FOnClick write SetFOnClick;
    property OnCollapsenode: TExtTreeTreePanelOnCollapsenode read FOnCollapsenode write SetFOnCollapsenode;
    property OnContainerclick: TExtTreeTreePanelOnContainerclick read FOnContainerclick write SetFOnContainerclick;
    property OnContainercontextmenu: TExtTreeTreePanelOnContainercontextmenu read FOnContainercontextmenu
      write SetFOnContainercontextmenu;
    property OnContainerdblclick: TExtTreeTreePanelOnContainerdblclick read FOnContainerdblclick
      write SetFOnContainerdblclick;
    property OnContextmenu: TExtTreeTreePanelOnContextmenu read FOnContextmenu write SetFOnContextmenu;
    property OnDblclick: TExtTreeTreePanelOnDblclick read FOnDblclick write SetFOnDblclick;
    property OnDisabledchange: TExtTreeTreePanelOnDisabledchange read FOnDisabledchange write SetFOnDisabledchange;
    property OnExpandnode: TExtTreeTreePanelOnExpandnode read FOnExpandnode write SetFOnExpandnode;
    property OnInsert: TExtTreeTreePanelOnInsert read FOnInsert write SetFOnInsert;
    property OnLoad: TExtTreeTreePanelOnLoad read FOnLoad write SetFOnLoad;
    property OnMovenode: TExtTreeTreePanelOnMovenode read FOnMovenode write SetFOnMovenode;
    property OnNodedragover: TExtTreeTreePanelOnNodedragover read FOnNodedragover write SetFOnNodedragover;
    property OnNodedrop: TExtTreeTreePanelOnNodedrop read FOnNodedrop write SetFOnNodedrop;
    property OnRemove: TExtTreeTreePanelOnRemove read FOnRemove write SetFOnRemove;
    property OnTextchange: TExtTreeTreePanelOnTextchange read FOnTextchange write SetFOnTextchange;
  end;

implementation

class function TExtTreeRootTreeNodeUI.JSClassName: string;
begin
  Result := 'Ext.tree.RootTreeNodeUI';
end;

class function TExtTreeTreeNodeUI.JSClassName: string;
begin
  Result := 'Ext.tree.TreeNodeUI';
end;

function TExtTreeTreeNodeUI.AddClass(ClassName: String): TExtFunction;
begin
  JSCode(JSName + '.addClass(' + VarToJSON([ClassName]) + ');', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.AddClass(ClassName: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.addClass(' + VarToJSON(ClassName) + ');', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.GetAnchor: TExtFunction;
begin
  JSCode(JSName + '.getAnchor();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.GetEl: TExtFunction;
begin
  JSCode(JSName + '.getEl();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.GetIconEl: TExtFunction;
begin
  JSCode(JSName + '.getIconEl();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.GetTextEl: TExtFunction;
begin
  JSCode(JSName + '.getTextEl();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.Hide: TExtFunction;
begin
  JSCode(JSName + '.hide();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.IsChecked: TExtFunction;
begin
  JSCode(JSName + '.isChecked();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.RemoveClass(ClassName: String): TExtFunction;
begin
  JSCode(JSName + '.removeClass(' + VarToJSON([ClassName]) + ');', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.RemoveClass(ClassName: TExtObjectList): TExtFunction;
begin
  JSCode(JSName + '.removeClass(' + VarToJSON(ClassName) + ');', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.Show: TExtFunction;
begin
  JSCode(JSName + '.show();', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

function TExtTreeTreeNodeUI.ToggleCheck(Value: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.toggleCheck(' + VarToJSON([Value]) + ');', 'TExtTreeTreeNodeUI');
  Result := Self;
end;

class function TExtTreeTreeFilter.JSClassName: string;
begin
  Result := 'Ext.tree.TreeFilter';
end;

function TExtTreeTreeFilter.Clear: TExtFunction;
begin
  JSCode(JSName + '.clear();', 'TExtTreeTreeFilter');
  Result := Self;
end;

function TExtTreeTreeFilter.Filter(Value: String; Attr: String = ''; StartNode: TExtTreeTreeNode = nil): TExtFunction;
begin
  JSCode(JSName + '.filter(' + VarToJSON([Value, Attr, StartNode, false]) + ');', 'TExtTreeTreeFilter');
  Result := Self;
end;

function TExtTreeTreeFilter.FilterBy(Fn: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.filterBy(' + VarToJSON([Fn, true, Scope, false]) + ');', 'TExtTreeTreeFilter');
  Result := Self;
end;

procedure TExtTreeTreeSorter.SetFCaseSensitive(Value: Boolean);
begin
  FCaseSensitive := Value;
  JSCode('caseSensitive:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeSorter.SetFDir(Value: String);
begin
  FDir := Value;
  JSCode('dir:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeSorter.SetFFolderSort(Value: Boolean);
begin
  FFolderSort := Value;
  JSCode('folderSort:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeSorter.SetFLeafAttr(Value: String);
begin
  FLeafAttr := Value;
  JSCode('leafAttr:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeSorter.SetFPropertyJS(Value: String);
begin
  FPropertyJS := Value;
  JSCode('propertyJS:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeSorter.SetFSortType(Value: TExtFunction);
begin
  FSortType := Value;
  JSCode('sortType:' + VarToJSON([Value, true]));
end;

class function TExtTreeTreeSorter.JSClassName: string;
begin
  Result := 'Ext.tree.TreeSorter';
end;

procedure TExtTreeTreeSorter.InitDefaults;
begin
  inherited;
  FLeafAttr := 'leaf';
  FPropertyJS := 'text';
end;

procedure TExtTreeTreeLoader.SetFBaseAttrs(Value: TExtObject);
begin
  FBaseAttrs := Value;
  JSCode('baseAttrs:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreeLoader.SetFBaseParams(Value: TExtObject);
begin
  FBaseParams := Value;
  JSCode('baseParams:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreeLoader.SetFClearOnLoad(Value: Boolean);
begin
  FClearOnLoad := Value;
  JSCode('clearOnLoad:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFDataUrl(Value: String);
begin
  FDataUrl := Value;
  JSCode('dataUrl:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFDirectFn(Value: TExtFunction);
begin
  FDirectFn := Value;
  JSCode('directFn:' + VarToJSON([Value, true]));
end;

procedure TExtTreeTreeLoader.SetFNodeParameter(Value: String);
begin
  FNodeParameter := Value;
  JSCode('nodeParameter:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFParamOrder(Value: TExtObjectList);
begin
  FParamOrder := Value;
  JSCode('paramOrder:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreeLoader.SetFParamOrderString(Value: String);
begin
  FParamOrderString := Value;
  JSCode('paramOrder:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFParamsAsHash(Value: Boolean);
begin
  FParamsAsHash := Value;
  JSCode('paramsAsHash:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFPreloadChildren(Value: Boolean);
begin
  FPreloadChildren := Value;
  JSCode('preloadChildren:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFRequestMethod(Value: String);
begin
  FRequestMethod := Value;
  JSCode('requestMethod:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFUiProviders(Value: TExtObject);
begin
  FUiProviders := Value;
  JSCode('uiProviders:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreeLoader.SetFUrl(Value: String);
begin
  FUrl := Value;
  JSCode('url:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeLoader.SetFOnBeforeload(Value: TExtTreeTreeLoaderOnBeforeload);
begin
  if Assigned(FOnBeforeload) then
    JSCode(JSName + '.events ["beforeload"].listeners=[];');
  if Assigned(Value) then
    On('beforeload', Ajax('beforeload', ['This', '%0.nm', 'Node', '%1.nm', 'Callback', '%2.nm'], true));
  FOnBeforeload := Value;
end;

procedure TExtTreeTreeLoader.SetFOnLoad(Value: TExtTreeTreeLoaderOnLoad);
begin
  if Assigned(FOnLoad) then
    JSCode(JSName + '.events ["load"].listeners=[];');
  if Assigned(Value) then
    On('load', Ajax('load', ['This', '%0.nm', 'Node', '%1.nm', 'Response', '%2.nm'], true));
  FOnLoad := Value;
end;

procedure TExtTreeTreeLoader.SetFOnLoadexception(Value: TExtTreeTreeLoaderOnLoadexception);
begin
  if Assigned(FOnLoadexception) then
    JSCode(JSName + '.events ["loadexception"].listeners=[];');
  if Assigned(Value) then
    On('loadexception', Ajax('loadexception', ['This', '%0.nm', 'Node', '%1.nm', 'Response', '%2.nm'], true));
  FOnLoadexception := Value;
end;

class function TExtTreeTreeLoader.JSClassName: string;
begin
  Result := 'Ext.tree.TreeLoader';
end;

procedure TExtTreeTreeLoader.InitDefaults;
begin
  inherited;
  FBaseAttrs := TExtObject.CreateInternal(Self, 'baseAttrs');
  FBaseParams := TExtObject.CreateInternal(Self, 'baseParams');
  FParamOrder := CreateConfigArray('paramOrder');
  FRequestMethod := 'output/Ext.Ajax.html#Ext.Ajax-method';
  FUiProviders := TExtObject.CreateInternal(Self, 'uiProviders');
end;

function TExtTreeTreeLoader.CreateNode(Attr: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.createNode(' + VarToJSON([Attr, false]) + ');', 'TExtTreeTreeLoader');
  Result := Self;
end;

function TExtTreeTreeLoader.Load(Node: TExtTreeTreeNode; Callback: TExtFunction; Scope: TExtObject): TExtFunction;
begin
  JSCode(JSName + '.load(' + VarToJSON([Node, false, Callback, true, Scope, false]) + ');', 'TExtTreeTreeLoader');
  Result := Self;
end;

procedure TExtTreeTreeLoader.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeload') and Assigned(FOnBeforeload) then
    FOnBeforeload(TExtTreeTreeLoader(ParamAsObject('This')), TExtObject(ParamAsObject('Node')),
      TExtObject(ParamAsObject('Callback')))
  else if (AEvtName = 'load') and Assigned(FOnLoad) then
    FOnLoad(TExtTreeTreeLoader(ParamAsObject('This')), TExtObject(ParamAsObject('Node')),
      TExtObject(ParamAsObject('Response')))
  else if (AEvtName = 'loadexception') and Assigned(FOnLoadexception) then
    FOnLoadexception(TExtTreeTreeLoader(ParamAsObject('This')), TExtObject(ParamAsObject('Node')),
      TExtObject(ParamAsObject('Response')));
end;

procedure TExtTreeMultiSelectionModel.SetFOnSelectionchange(Value: TExtTreeMultiSelectionModelOnSelectionchange);
begin
  if Assigned(FOnSelectionchange) then
    JSCode(JSName + '.events ["selectionchange"].listeners=[];');
  if Assigned(Value) then
    On('selectionchange', Ajax('selectionchange', ['This', '%0.nm', 'Nodes', '%1.nm'], true));
  FOnSelectionchange := Value;
end;

class function TExtTreeMultiSelectionModel.JSClassName: string;
begin
  Result := 'Ext.tree.MultiSelectionModel';
end;

function TExtTreeMultiSelectionModel.ClearSelections: TExtFunction;
begin
  JSCode(JSName + '.clearSelections();', 'TExtTreeMultiSelectionModel');
  Result := Self;
end;

function TExtTreeMultiSelectionModel.GetSelectedNodes: TExtFunction;
begin
  JSCode(JSName + '.getSelectedNodes();', 'TExtTreeMultiSelectionModel');
  Result := Self;
end;

function TExtTreeMultiSelectionModel.IsSelected(Node: TExtTreeTreeNode): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([Node, false]) + ');', 'TExtTreeMultiSelectionModel');
  Result := Self;
end;

function TExtTreeMultiSelectionModel.Unselect(Node: TExtTreeTreeNode): TExtFunction;
begin
  JSCode(JSName + '.unselect(' + VarToJSON([Node, false]) + ');', 'TExtTreeMultiSelectionModel');
  Result := Self;
end;

procedure TExtTreeMultiSelectionModel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'selectionchange') and Assigned(FOnSelectionchange) then
    FOnSelectionchange(TExtTreeMultiSelectionModel(ParamAsObject('This')), TExtObjectList(ParamAsObject('Nodes')));
end;

procedure TExtTreeDefaultSelectionModel.SetFOnBeforeselect(Value: TExtTreeDefaultSelectionModelOnBeforeselect);
begin
  if Assigned(FOnBeforeselect) then
    JSCode(JSName + '.events ["beforeselect"].listeners=[];');
  if Assigned(Value) then
    On('beforeselect', Ajax('beforeselect', ['This', '%0.nm', 'Node', '%1.nm', 'Node_', '%2.nm'], true));
  FOnBeforeselect := Value;
end;

procedure TExtTreeDefaultSelectionModel.SetFOnSelectionchange(Value: TExtTreeDefaultSelectionModelOnSelectionchange);
begin
  if Assigned(FOnSelectionchange) then
    JSCode(JSName + '.events ["selectionchange"].listeners=[];');
  if Assigned(Value) then
    On('selectionchange', Ajax('selectionchange', ['This', '%0.nm', 'Node', '%1.nm'], true));
  FOnSelectionchange := Value;
end;

class function TExtTreeDefaultSelectionModel.JSClassName: string;
begin
  Result := 'Ext.tree.DefaultSelectionModel';
end;

function TExtTreeDefaultSelectionModel.ClearSelections(Silent: Boolean): TExtFunction;
begin
  JSCode(JSName + '.clearSelections(' + VarToJSON([Silent]) + ');', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.GetSelectedNode: TExtFunction;
begin
  JSCode(JSName + '.getSelectedNode();', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.IsSelected(Node: TExtTreeTreeNode): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([Node, false]) + ');', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.Select(Node: TExtTreeTreeNode): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([Node, false]) + ');', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.SelectNext: TExtFunction;
begin
  JSCode(JSName + '.selectNext();', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.SelectPrevious: TExtFunction;
begin
  JSCode(JSName + '.selectPrevious();', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

function TExtTreeDefaultSelectionModel.Unselect(Node: TExtTreeTreeNode; Silent: Boolean): TExtFunction;
begin
  JSCode(JSName + '.unselect(' + VarToJSON([Node, false, Silent]) + ');', 'TExtTreeDefaultSelectionModel');
  Result := Self;
end;

procedure TExtTreeDefaultSelectionModel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeselect') and Assigned(FOnBeforeselect) then
    FOnBeforeselect(TExtTreeDefaultSelectionModel(ParamAsObject('This')), TExtTreeTreeNode(ParamAsObject('Node')),
      TExtTreeTreeNode(ParamAsObject('Node_')))
  else if (AEvtName = 'selectionchange') and Assigned(FOnSelectionchange) then
    FOnSelectionchange(TExtTreeDefaultSelectionModel(ParamAsObject('This')), TExtTreeTreeNode(ParamAsObject('Node')));
end;

procedure TExtTreeTreeNode.SetFAllowChildren(Value: Boolean);
begin
  FAllowChildren := Value;
  JSCode('allowChildren:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFAllowDrag(Value: Boolean);
begin
  FAllowDrag := Value;
  JSCode('allowDrag:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFAllowDrop(Value: Boolean);
begin
  FAllowDrop := Value;
  JSCode('allowDrop:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFChecked(Value: Boolean);
begin
  FChecked := Value;
  JSCode('checked:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFCls(Value: String);
begin
  FCls := Value;
  JSCode('cls:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetDisabled(const AValue: Boolean);
begin
  FDisabled := AValue;
  SetConfigItem('disabled', AValue);
end;

procedure TExtTreeTreeNode.SetFDraggable(Value: Boolean);
begin
  FDraggable := Value;
  JSCode('draggable:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFEditable(Value: Boolean);
begin
  FEditable := Value;
  JSCode('editable:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetExpandable(const AValue: Boolean);
begin
  FExpandable := AValue;
  SetConfigItem('expandable', AValue);
end;

procedure TExtTreeTreeNode.SetExpanded(const AValue: Boolean);
begin
  FExpanded := AValue;
  SetConfigItem('expanded', AValue);
end;

procedure TExtTreeTreeNode.SetHidden(const AValue: Boolean);
begin
  FHidden := AValue;
  SetConfigItem('hidden', AValue);
end;

procedure TExtTreeTreeNode.SetFHref(Value: String);
begin
  FHref := Value;
  JSCode('href:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFHrefTarget(Value: String);
begin
  FHrefTarget := Value;
  JSCode('hrefTarget:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFIcon(Value: String);
begin
  FIcon := Value;
  JSCode('icon:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetIconCls(const AValue: string);
begin
  FIconCls := AValue;
  SetConfigItem('iconCls', AValue);
end;

procedure TExtTreeTreeNode.SetFIsTarget(Value: Boolean);
begin
  FIsTarget := Value;
  JSCode('isTarget:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetQtip(const AValue: string);
begin
  FQtip := AValue;
  SetConfigItem('qtip', AValue);
end;

procedure TExtTreeTreeNode.SetFQtipCfg(Value: String);
begin
  FQtipCfg := Value;
  JSCode('qtipCfg:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode.SetFSingleClickExpand(Value: Boolean);
begin
  FSingleClickExpand := Value;
  JSCode('singleClickExpand:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeNode._SetText(const AValue: string);
begin
  FText := AValue;
  SetConfigItem('text', 'setText', AValue);
end;

procedure TExtTreeTreeNode.SetFUiProvider(Value: TExtFunction);
begin
  FUiProvider := Value;
  JSCode('uiProvider:' + VarToJSON([Value, true]));
end;

procedure TExtTreeTreeNode.SetFDisabled_(Value: Boolean);
begin
  FDisabled_ := Value;
  JSCode(JSName + '.disabled=' + VarToJSON([Value]) + ';');
end;

procedure TExtTreeTreeNode.SetFHidden_(Value: Boolean);
begin
  FHidden_ := Value;
  JSCode(JSName + '.hidden=' + VarToJSON([Value]) + ';');
end;

procedure TExtTreeTreeNode.SetFText_(Value: String);
begin
  FText_ := Value;
  JSCode(JSName + '.text=' + VarToJSON([Value]) + ';');
end;

procedure TExtTreeTreeNode.SetFOnBeforechildrenrendered(Value: TExtTreeTreeNodeOnBeforechildrenrendered);
begin
  if Assigned(FOnBeforechildrenrendered) then
    JSCode(JSName + '.events ["beforechildrenrendered"].listeners=[];');
  if Assigned(Value) then
    On('beforechildrenrendered', Ajax('beforechildrenrendered', ['This', '%0.nm'], true));
  FOnBeforechildrenrendered := Value;
end;

procedure TExtTreeTreeNode.SetFOnBeforeclick(Value: TExtTreeTreeNodeOnBeforeclick);
begin
  if Assigned(FOnBeforeclick) then
    JSCode(JSName + '.events ["beforeclick"].listeners=[];');
  if Assigned(Value) then
    On('beforeclick', Ajax('beforeclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnBeforeclick := Value;
end;

procedure TExtTreeTreeNode.SetFOnBeforecollapse(Value: TExtTreeTreeNodeOnBeforecollapse);
begin
  if Assigned(FOnBeforecollapse) then
    JSCode(JSName + '.events ["beforecollapse"].listeners=[];');
  if Assigned(Value) then
    On('beforecollapse', Ajax('beforecollapse', ['This', '%0.nm', 'Deep', '%1', 'Anim', '%2'], true));
  FOnBeforecollapse := Value;
end;

procedure TExtTreeTreeNode.SetFOnBeforedblclick(Value: TExtTreeTreeNodeOnBeforedblclick);
begin
  if Assigned(FOnBeforedblclick) then
    JSCode(JSName + '.events ["beforedblclick"].listeners=[];');
  if Assigned(Value) then
    On('beforedblclick', Ajax('beforedblclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnBeforedblclick := Value;
end;

procedure TExtTreeTreeNode.SetFOnBeforeexpand(Value: TExtTreeTreeNodeOnBeforeexpand);
begin
  if Assigned(FOnBeforeexpand) then
    JSCode(JSName + '.events ["beforeexpand"].listeners=[];');
  if Assigned(Value) then
    On('beforeexpand', Ajax('beforeexpand', ['This', '%0.nm', 'Deep', '%1', 'Anim', '%2'], true));
  FOnBeforeexpand := Value;
end;

procedure TExtTreeTreeNode.SetFOnCheckchange(Value: TExtTreeTreeNodeOnCheckchange);
begin
  if Assigned(FOnCheckchange) then
    JSCode(JSName + '.events ["checkchange"].listeners=[];');
  if Assigned(Value) then
    On('checkchange', Ajax('checkchange', ['This', '%0.nm', 'Checked', '%1'], true));
  FOnCheckchange := Value;
end;

procedure TExtTreeTreeNode.SetFOnClick(Value: TExtTreeTreeNodeOnClick);
begin
  if Assigned(FOnClick) then
    JSCode(JSName + '.events ["click"].listeners=[];');
  if Assigned(Value) then
    On('click', Ajax('click', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnClick := Value;
end;

procedure TExtTreeTreeNode.SetFOnCollapse(Value: TExtTreeTreeNodeOnCollapse);
begin
  if Assigned(FOnCollapse) then
    JSCode(JSName + '.events ["collapse"].listeners=[];');
  if Assigned(Value) then
    On('collapse', Ajax('collapse', ['This', '%0.nm'], true));
  FOnCollapse := Value;
end;

procedure TExtTreeTreeNode.SetFOnContextmenu(Value: TExtTreeTreeNodeOnContextmenu);
begin
  if Assigned(FOnContextmenu) then
    JSCode(JSName + '.events ["contextmenu"].listeners=[];');
  if Assigned(Value) then
    On('contextmenu', Ajax('contextmenu', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContextmenu := Value;
end;

procedure TExtTreeTreeNode.SetFOnDblclick(Value: TExtTreeTreeNodeOnDblclick);
begin
  if Assigned(FOnDblclick) then
    JSCode(JSName + '.events ["dblclick"].listeners=[];');
  if Assigned(Value) then
    On('dblclick', Ajax('dblclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnDblclick := Value;
end;

procedure TExtTreeTreeNode.SetFOnDisabledchange(Value: TExtTreeTreeNodeOnDisabledchange);
begin
  if Assigned(FOnDisabledchange) then
    JSCode(JSName + '.events ["disabledchange"].listeners=[];');
  if Assigned(Value) then
    On('disabledchange', Ajax('disabledchange', ['This', '%0.nm', 'Disabled', '%1'], true));
  FOnDisabledchange := Value;
end;

procedure TExtTreeTreeNode.SetFOnExpand(Value: TExtTreeTreeNodeOnExpand);
begin
  if Assigned(FOnExpand) then
    JSCode(JSName + '.events ["expand"].listeners=[];');
  if Assigned(Value) then
    On('expand', Ajax('expand', ['This', '%0.nm'], true));
  FOnExpand := Value;
end;

procedure TExtTreeTreeNode.SetFOnTextchange(Value: TExtTreeTreeNodeOnTextchange);
begin
  if Assigned(FOnTextchange) then
    JSCode(JSName + '.events ["textchange"].listeners=[];');
  if Assigned(Value) then
    On('textchange', Ajax('textchange', ['This', '%0.nm', 'Text', '%1', 'OldText', '%2'], true));
  FOnTextchange := Value;
end;

class function TExtTreeTreeNode.JSClassName: string;
begin
  Result := 'Object';
end;

procedure TExtTreeTreeNode.InitDefaults;
begin
  inherited;
  FAllowChildren := true;
  FAllowDrag := true;
  FAllowDrop := true;
  FEditable := true;
  FIsTarget := true;
end;

function TExtTreeTreeNode.Collapse(Deep: Boolean = false; Anim: Boolean = false; Callback: TExtFunction = nil;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.collapse(' + VarToJSON([Deep, Anim, Callback, true, Scope, false]) + ');', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.CollapseChildNodes(Deep: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.collapseChildNodes(' + VarToJSON([Deep]) + ');', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.Disable: TExtFunction;
begin
  JSCode(JSName + '.disable();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.Enable: TExtFunction;
begin
  JSCode(JSName + '.enable();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.EnsureVisible(Callback: TExtFunction = nil; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.ensureVisible(' + VarToJSON([Callback, true, Scope, false]) + ');', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.Expand(Deep: Boolean = false; Anim: Boolean = false; Callback: TExtFunction = nil;
  Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.expand(' + VarToJSON([Deep, Anim, Callback, true, Scope, false]) + ');', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.ExpandChildNodes(Deep: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.expandChildNodes(' + VarToJSON([Deep]) + ');', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.GetObjectNamePrefix: string;
begin
  Result := 'treenode';
end;

function TExtTreeTreeNode.GetUI: TExtFunction;
begin
  JSCode(JSName + '.getUI();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.IsExpanded: TExtFunction;
begin
  JSCode(JSName + '.isExpanded();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.IsSelected: TExtFunction;
begin
  JSCode(JSName + '.isSelected();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.Select: TExtFunction;
begin
  JSCode(JSName + '.select();', 'TExtTreeTreeNode');
  Result := Self;
end;

function TExtTreeTreeNode.SetText(const AText: string): TExtFunction;
begin
  FText := AText;
  Result := CallMethod('setText')
    .AddParam(AText)
    .AsFunction;
end;

function TExtTreeTreeNode.SetTooltip(const ATip, ATitle: string): TExtFunction;
begin
  Result := CallMethod('setTooltip')
    .AddParam(ATip)
    .AddParam(ATitle)
    .AsFunction;
end;

function TExtTreeTreeNode.Toggle: TExtFunction;
begin
  Result := CallMethod('toggle')
    .AsFunction;
end;

function TExtTreeTreeNode.Unselect(const ASilent: Boolean): TExtFunction;
begin
  Result := CallMethod('unselect')
    .AddParam(ASilent)
    .AsFunction;
end;

procedure TExtTreeTreeNode.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforechildrenrendered') and Assigned(FOnBeforechildrenrendered) then
    FOnBeforechildrenrendered(TExtTreeTreeNode(ParamAsObject('This')))
  else if (AEvtName = 'beforeclick') and Assigned(FOnBeforeclick) then
    FOnBeforeclick(TExtTreeTreeNode(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'beforecollapse') and Assigned(FOnBeforecollapse) then
    FOnBeforecollapse(TExtTreeTreeNode(ParamAsObject('This')), ParamAsBoolean('Deep'), ParamAsBoolean('Anim'))
  else if (AEvtName = 'beforedblclick') and Assigned(FOnBeforedblclick) then
    FOnBeforedblclick(TExtTreeTreeNode(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'beforeexpand') and Assigned(FOnBeforeexpand) then
    FOnBeforeexpand(TExtTreeTreeNode(ParamAsObject('This')), ParamAsBoolean('Deep'), ParamAsBoolean('Anim'))
  else if (AEvtName = 'checkchange') and Assigned(FOnCheckchange) then
    FOnCheckchange(TExtTreeTreeNode(ParamAsObject('This')), ParamAsBoolean('Checked'))
  else if (AEvtName = 'click') and Assigned(FOnClick) then
    FOnClick(TExtTreeTreeNode(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'collapse') and Assigned(FOnCollapse) then
    FOnCollapse(TExtTreeTreeNode(ParamAsObject('This')))
  else if (AEvtName = 'contextmenu') and Assigned(FOnContextmenu) then
    FOnContextmenu(TExtTreeTreeNode(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'dblclick') and Assigned(FOnDblclick) then
    FOnDblclick(TExtTreeTreeNode(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'disabledchange') and Assigned(FOnDisabledchange) then
    FOnDisabledchange(TExtTreeTreeNode(ParamAsObject('This')), ParamAsBoolean('Disabled'))
  else if (AEvtName = 'expand') and Assigned(FOnExpand) then
    FOnExpand(TExtTreeTreeNode(ParamAsObject('This')))
  else if (AEvtName = 'textchange') and Assigned(FOnTextchange) then
    FOnTextchange(TExtTreeTreeNode(ParamAsObject('This')), ParamAsString('Text'), ParamAsString('OldText'));
end;

procedure TExtTreeAsyncTreeNode.SetFLoader(Value: TExtTreeTreeLoader);
begin
  FLoader := Value;
  JSCode('loader:' + VarToJSON([Value, false]));
end;

procedure TExtTreeAsyncTreeNode.SetFLoader_(Value: TExtTreeTreeLoader);
begin
  FLoader_ := Value;
  JSCode(JSName + '.loader=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtTreeAsyncTreeNode.SetFOnBeforeload(Value: TExtTreeAsyncTreeNodeOnBeforeload);
begin
  if Assigned(FOnBeforeload) then
    JSCode(JSName + '.events ["beforeload"].listeners=[];');
  if Assigned(Value) then
    On('beforeload', Ajax('beforeload', ['This', '%0.nm'], true));
  FOnBeforeload := Value;
end;

procedure TExtTreeAsyncTreeNode.SetFOnLoad(Value: TExtTreeAsyncTreeNodeOnLoad);
begin
  if Assigned(FOnLoad) then
    JSCode(JSName + '.events ["load"].listeners=[];');
  if Assigned(Value) then
    On('load', Ajax('load', ['This', '%0.nm'], true));
  FOnLoad := Value;
end;

class function TExtTreeAsyncTreeNode.JSClassName: string;
begin
  Result := 'Ext.tree.AsyncTreeNode';
end;

procedure TExtTreeAsyncTreeNode.InitDefaults;
begin
  inherited;
  FLoader := TExtTreeTreeLoader.CreateInternal(Self, 'loader');
  FLoader_ := TExtTreeTreeLoader.CreateInternal(Self, 'loader');
end;

function TExtTreeAsyncTreeNode.IsLoaded: TExtFunction;
begin
  JSCode(JSName + '.isLoaded();', 'TExtTreeAsyncTreeNode');
  Result := Self;
end;

function TExtTreeAsyncTreeNode.IsLoading: TExtFunction;
begin
  JSCode(JSName + '.isLoading();', 'TExtTreeAsyncTreeNode');
  Result := Self;
end;

function TExtTreeAsyncTreeNode.Reload(Callback: TExtFunction; Scope: TExtObject = nil): TExtFunction;
begin
  JSCode(JSName + '.reload(' + VarToJSON([Callback, true, Scope, false]) + ');', 'TExtTreeAsyncTreeNode');
  Result := Self;
end;

procedure TExtTreeAsyncTreeNode.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforeload') and Assigned(FOnBeforeload) then
    FOnBeforeload(TExtTreeAsyncTreeNode(ParamAsObject('This')))
  else if (AEvtName = 'load') and Assigned(FOnLoad) then
    FOnLoad(TExtTreeAsyncTreeNode(ParamAsObject('This')));
end;

procedure TExtTreeTreeEditor.SetFAlignment(Value: String);
begin
  FAlignment := Value;
  JSCode('alignment:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFCls(Value: String);
begin
  FCls := Value;
  JSCode('cls:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFEditDelay(Value: Integer);
begin
  FEditDelay := Value;
  JSCode('editDelay:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFHideEl(Value: Boolean);
begin
  FHideEl := Value;
  JSCode('hideEl:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFMaxWidth(Value: Integer);
begin
  FMaxWidth := Value;
  JSCode('maxWidth:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFShim(Value: Boolean);
begin
  FShim := Value;
  JSCode('shim:' + VarToJSON([Value]));
end;

procedure TExtTreeTreeEditor.SetFEditNode(Value: TExtTreeTreeNode);
begin
  FEditNode := Value;
  JSCode(JSName + '.editNode=' + VarToJSON([Value, false]) + ';');
end;

class function TExtTreeTreeEditor.JSClassName: string;
begin
  Result := 'Ext.tree.TreeEditor';
end;

procedure TExtTreeTreeEditor.InitDefaults;
begin
  inherited;
  FCls := 'x-small-editor x-tree-editor';
  FEditDelay := 350;
  FMaxWidth := 250;
  FEditNode := TExtTreeTreeNode.CreateInternal(Self, 'editNode');
end;

function TExtTreeTreeEditor.TriggerEdit(Node: TExtTreeTreeNode): TExtFunction;
begin
  JSCode(JSName + '.triggerEdit(' + VarToJSON([Node, false]) + ');', 'TExtTreeTreeEditor');
  Result := Self;
end;

procedure TExtTreeTreePanel.SetFAnimate(Value: Boolean);
begin
  FAnimate := Value;
  JSCode('animate:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFContainerScroll(Value: Boolean);
begin
  FContainerScroll := Value;
  JSCode('containerScroll:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFDdAppendOnly(Value: Boolean);
begin
  FDdAppendOnly := Value;
  JSCode('ddAppendOnly:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFDdGroup(Value: String);
begin
  FDdGroup := Value;
  JSCode('ddGroup:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFDdScroll(Value: Boolean);
begin
  FDdScroll := Value;
  JSCode('ddScroll:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFDragConfig(Value: TExtObject);
begin
  FDragConfig := Value;
  JSCode('dragConfig:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreePanel.SetFDropConfig(Value: TExtObject);
begin
  FDropConfig := Value;
  JSCode('dropConfig:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreePanel.SetFEnableDD(Value: Boolean);
begin
  FEnableDD := Value;
  JSCode('enableDD:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFEnableDrag(Value: Boolean);
begin
  FEnableDrag := Value;
  JSCode('enableDrag:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFEnableDrop(Value: Boolean);
begin
  FEnableDrop := Value;
  JSCode('enableDrop:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFHlColor(Value: String);
begin
  FHlColor := Value;
  JSCode('hlColor:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFHlDrop(Value: Boolean);
begin
  FHlDrop := Value;
  JSCode('hlDrop:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFLines(Value: Boolean);
begin
  FLines := Value;
  JSCode('lines:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFPathSeparator(Value: String);
begin
  FPathSeparator := Value;
  JSCode('pathSeparator:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFRequestMethod(Value: String);
begin
  FRequestMethod := Value;
  JSCode('requestMethod:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetRoot(const AValue: TExtTreeTreeNode);
begin
  FRoot := AValue;
  SetConfigItem('root', FRoot);
end;

procedure TExtTreeTreePanel.SetRootVisible(const AValue: Boolean);
begin
  FRootVisible := AValue;
  SetConfigItem('rootVisible', AValue);
end;

procedure TExtTreeTreePanel.SetFSelModel(Value: TExtObject);
begin
  FSelModel := Value;
  JSCode('selModel:' + VarToJSON([Value, false]));
end;

procedure TExtTreeTreePanel.SetFSingleExpand(Value: Boolean);
begin
  FSingleExpand := Value;
  JSCode('singleExpand:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFTrackMouseOver(Value: Boolean);
begin
  FTrackMouseOver := Value;
  JSCode('trackMouseOver:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFUseArrows(Value: Boolean);
begin
  FUseArrows := Value;
  JSCode('useArrows:' + VarToJSON([Value]));
end;

procedure TExtTreeTreePanel.SetFOnAppend(Value: TExtTreeTreePanelOnAppend);
begin
  if Assigned(FOnAppend) then
    JSCode(JSName + '.events ["append"].listeners=[];');
  if Assigned(Value) then
    On('append', Ajax('append', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm', 'Index', '%3'], true));
  FOnAppend := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeappend(Value: TExtTreeTreePanelOnBeforeappend);
begin
  if Assigned(FOnBeforeappend) then
    JSCode(JSName + '.events ["beforeappend"].listeners=[];');
  if Assigned(Value) then
    On('beforeappend', Ajax('beforeappend', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm'], true));
  FOnBeforeappend := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforechildrenrendered(Value: TExtTreeTreePanelOnBeforechildrenrendered);
begin
  if Assigned(FOnBeforechildrenrendered) then
    JSCode(JSName + '.events ["beforechildrenrendered"].listeners=[];');
  if Assigned(Value) then
    On('beforechildrenrendered', Ajax('beforechildrenrendered', ['Node', '%0.nm'], true));
  FOnBeforechildrenrendered := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeclick(Value: TExtTreeTreePanelOnBeforeclick);
begin
  if Assigned(FOnBeforeclick) then
    JSCode(JSName + '.events ["beforeclick"].listeners=[];');
  if Assigned(Value) then
    On('beforeclick', Ajax('beforeclick', ['Node', '%0.nm', 'E', '%1.nm'], true));
  FOnBeforeclick := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforecollapsenode(Value: TExtTreeTreePanelOnBeforecollapsenode);
begin
  if Assigned(FOnBeforecollapsenode) then
    JSCode(JSName + '.events ["beforecollapsenode"].listeners=[];');
  if Assigned(Value) then
    On('beforecollapsenode', Ajax('beforecollapsenode', ['Node', '%0.nm', 'Deep', '%1', 'Anim', '%2'], true));
  FOnBeforecollapsenode := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforedblclick(Value: TExtTreeTreePanelOnBeforedblclick);
begin
  if Assigned(FOnBeforedblclick) then
    JSCode(JSName + '.events ["beforedblclick"].listeners=[];');
  if Assigned(Value) then
    On('beforedblclick', Ajax('beforedblclick', ['Node', '%0.nm', 'E', '%1.nm'], true));
  FOnBeforedblclick := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeexpandnode(Value: TExtTreeTreePanelOnBeforeexpandnode);
begin
  if Assigned(FOnBeforeexpandnode) then
    JSCode(JSName + '.events ["beforeexpandnode"].listeners=[];');
  if Assigned(Value) then
    On('beforeexpandnode', Ajax('beforeexpandnode', ['Node', '%0.nm', 'Deep', '%1', 'Anim', '%2'], true));
  FOnBeforeexpandnode := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeinsert(Value: TExtTreeTreePanelOnBeforeinsert);
begin
  if Assigned(FOnBeforeinsert) then
    JSCode(JSName + '.events ["beforeinsert"].listeners=[];');
  if Assigned(Value) then
    On('beforeinsert', Ajax('beforeinsert', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm', 'RefNode',
      '%3.nm'], true));
  FOnBeforeinsert := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeload(Value: TExtTreeTreePanelOnBeforeload);
begin
  if Assigned(FOnBeforeload) then
    JSCode(JSName + '.events ["beforeload"].listeners=[];');
  if Assigned(Value) then
    On('beforeload', Ajax('beforeload', ['Node', '%0.nm'], true));
  FOnBeforeload := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforemovenode(Value: TExtTreeTreePanelOnBeforemovenode);
begin
  if Assigned(FOnBeforemovenode) then
    JSCode(JSName + '.events ["beforemovenode"].listeners=[];');
  if Assigned(Value) then
    On('beforemovenode', Ajax('beforemovenode', ['Tree', '%0.nm', 'Node', '%1.nm', 'OldParent', '%2.nm', 'NewParent',
      '%3.nm', 'Index', '%4'], true));
  FOnBeforemovenode := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforenodedrop(Value: TExtTreeTreePanelOnBeforenodedrop);
begin
  if Assigned(FOnBeforenodedrop) then
    JSCode(JSName + '.events ["beforenodedrop"].listeners=[];');
  if Assigned(Value) then
    On('beforenodedrop', Ajax('beforenodedrop', ['DropEvent', '%0.nm'], true));
  FOnBeforenodedrop := Value;
end;

procedure TExtTreeTreePanel.SetFOnBeforeremove(Value: TExtTreeTreePanelOnBeforeremove);
begin
  if Assigned(FOnBeforeremove) then
    JSCode(JSName + '.events ["beforeremove"].listeners=[];');
  if Assigned(Value) then
    On('beforeremove', Ajax('beforeremove', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm'], true));
  FOnBeforeremove := Value;
end;

procedure TExtTreeTreePanel.SetFOnCheckchange(Value: TExtTreeTreePanelOnCheckchange);
begin
  if Assigned(FOnCheckchange) then
    JSCode(JSName + '.events ["checkchange"].listeners=[];');
  if Assigned(Value) then
    On('checkchange', Ajax('checkchange', ['This', '%0.nm', 'Checked', '%1'], true));
  FOnCheckchange := Value;
end;

procedure TExtTreeTreePanel.SetFOnClick(Value: TExtTreeTreePanelOnClick);
begin
  if Assigned(FOnClick) then
    JSCode(JSName + '.events ["click"].listeners=[];');
  if Assigned(Value) then
    On('click', Ajax('click', ['Node', '%0.nm', 'E', '%1.nm'], true));
  FOnClick := Value;
end;

procedure TExtTreeTreePanel.SetFOnCollapsenode(Value: TExtTreeTreePanelOnCollapsenode);
begin
  if Assigned(FOnCollapsenode) then
    JSCode(JSName + '.events ["collapsenode"].listeners=[];');
  if Assigned(Value) then
    On('collapsenode', Ajax('collapsenode', ['Node', '%0.nm'], true));
  FOnCollapsenode := Value;
end;

procedure TExtTreeTreePanel.SetFOnContainerclick(Value: TExtTreeTreePanelOnContainerclick);
begin
  if Assigned(FOnContainerclick) then
    JSCode(JSName + '.events ["containerclick"].listeners=[];');
  if Assigned(Value) then
    On('containerclick', Ajax('containerclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContainerclick := Value;
end;

procedure TExtTreeTreePanel.SetFOnContainercontextmenu(Value: TExtTreeTreePanelOnContainercontextmenu);
begin
  if Assigned(FOnContainercontextmenu) then
    JSCode(JSName + '.events ["containercontextmenu"].listeners=[];');
  if Assigned(Value) then
    On('containercontextmenu', Ajax('containercontextmenu', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContainercontextmenu := Value;
end;

procedure TExtTreeTreePanel.SetFOnContainerdblclick(Value: TExtTreeTreePanelOnContainerdblclick);
begin
  if Assigned(FOnContainerdblclick) then
    JSCode(JSName + '.events ["containerdblclick"].listeners=[];');
  if Assigned(Value) then
    On('containerdblclick', Ajax('containerdblclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContainerdblclick := Value;
end;

procedure TExtTreeTreePanel.SetFOnContextmenu(Value: TExtTreeTreePanelOnContextmenu);
begin
  if Assigned(FOnContextmenu) then
    JSCode(JSName + '.events ["contextmenu"].listeners=[];');
  if Assigned(Value) then
    On('contextmenu', Ajax('contextmenu', ['Node', '%0.nm', 'E', '%1.nm'], true));
  FOnContextmenu := Value;
end;

procedure TExtTreeTreePanel.SetFOnDblclick(Value: TExtTreeTreePanelOnDblclick);
begin
  if Assigned(FOnDblclick) then
    JSCode(JSName + '.events ["dblclick"].listeners=[];');
  if Assigned(Value) then
    On('dblclick', Ajax('dblclick', ['Node', '%0.nm', 'E', '%1.nm'], true));
  FOnDblclick := Value;
end;

procedure TExtTreeTreePanel.SetFOnDisabledchange(Value: TExtTreeTreePanelOnDisabledchange);
begin
  if Assigned(FOnDisabledchange) then
    JSCode(JSName + '.events ["disabledchange"].listeners=[];');
  if Assigned(Value) then
    On('disabledchange', Ajax('disabledchange', ['Node', '%0.nm', 'Disabled', '%1'], true));
  FOnDisabledchange := Value;
end;

procedure TExtTreeTreePanel.SetFOnExpandnode(Value: TExtTreeTreePanelOnExpandnode);
begin
  if Assigned(FOnExpandnode) then
    JSCode(JSName + '.events ["expandnode"].listeners=[];');
  if Assigned(Value) then
    On('expandnode', Ajax('expandnode', ['Node', '%0.nm'], true));
  FOnExpandnode := Value;
end;

procedure TExtTreeTreePanel.SetFOnInsert(Value: TExtTreeTreePanelOnInsert);
begin
  if Assigned(FOnInsert) then
    JSCode(JSName + '.events ["insert"].listeners=[];');
  if Assigned(Value) then
    On('insert', Ajax('insert', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm', 'RefNode', '%3.nm'], true));
  FOnInsert := Value;
end;

procedure TExtTreeTreePanel.SetFOnLoad(Value: TExtTreeTreePanelOnLoad);
begin
  if Assigned(FOnLoad) then
    JSCode(JSName + '.events ["load"].listeners=[];');
  if Assigned(Value) then
    On('load', Ajax('load', ['Node', '%0.nm'], true));
  FOnLoad := Value;
end;

procedure TExtTreeTreePanel.SetFOnMovenode(Value: TExtTreeTreePanelOnMovenode);
begin
  if Assigned(FOnMovenode) then
    JSCode(JSName + '.events ["movenode"].listeners=[];');
  if Assigned(Value) then
    On('movenode', Ajax('movenode', ['Tree', '%0.nm', 'Node', '%1.nm', 'OldParent', '%2.nm', 'NewParent', '%3.nm',
      'Index', '%4'], true));
  FOnMovenode := Value;
end;

procedure TExtTreeTreePanel.SetFOnNodedragover(Value: TExtTreeTreePanelOnNodedragover);
begin
  if Assigned(FOnNodedragover) then
    JSCode(JSName + '.events ["nodedragover"].listeners=[];');
  if Assigned(Value) then
    On('nodedragover', Ajax('nodedragover', ['DragOverEvent', '%0.nm'], true));
  FOnNodedragover := Value;
end;

procedure TExtTreeTreePanel.SetFOnNodedrop(Value: TExtTreeTreePanelOnNodedrop);
begin
  if Assigned(FOnNodedrop) then
    JSCode(JSName + '.events ["nodedrop"].listeners=[];');
  if Assigned(Value) then
    On('nodedrop', Ajax('nodedrop', ['DropEvent', '%0.nm'], true));
  FOnNodedrop := Value;
end;

procedure TExtTreeTreePanel.SetFOnRemove(Value: TExtTreeTreePanelOnRemove);
begin
  if Assigned(FOnRemove) then
    JSCode(JSName + '.events ["remove"].listeners=[];');
  if Assigned(Value) then
    On('remove', Ajax('remove', ['Tree', '%0.nm', 'Parent', '%1.nm', 'Node', '%2.nm'], true));
  FOnRemove := Value;
end;

procedure TExtTreeTreePanel.SetFOnTextchange(Value: TExtTreeTreePanelOnTextchange);
begin
  if Assigned(FOnTextchange) then
    JSCode(JSName + '.events ["textchange"].listeners=[];');
  if Assigned(Value) then
    On('textchange', Ajax('textchange', ['Node', '%0.nm', 'Text', '%1', 'OldText', '%2'], true));
  FOnTextchange := Value;
end;

class function TExtTreeTreePanel.JSClassName: string;
begin
  Result := 'Ext.tree.TreePanel';
end;

procedure TExtTreeTreePanel.InitDefaults;
begin
  inherited;
  FDragConfig := TExtObject.CreateInternal(Self, 'dragConfig');
  FDropConfig := TExtObject.CreateInternal(Self, 'dropConfig');
  FHlColor := 'C3DAF9';
  FLines := true;
  FPathSeparator := '/';
  FRequestMethod := 'output/Ext.Ajax.html#Ext.Ajax-method';
  FRootVisible := true;
  FSelModel := TExtObject.CreateInternal(Self, 'selModel');
end;

function TExtTreeTreePanel.CollapseAll: TExtFunction;
begin
  JSCode(JSName + '.collapseAll();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.ExpandAll: TExtFunction;
begin
  JSCode(JSName + '.expandAll();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.ExpandPath(Path: String; Attr: String = ''; Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.expandPath(' + VarToJSON([Path, Attr, Callback, true]) + ');', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetChecked(Attribute: String = ''; StartNode: TExtTreeTreeNode = nil): TExtFunction;
begin
  JSCode(JSName + '.getChecked(' + VarToJSON([Attribute, StartNode, false]) + ');', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetLoader: TExtFunction;
begin
  JSCode(JSName + '.getLoader();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetNodeById(Id: String): TExtFunction;
begin
  JSCode(JSName + '.getNodeById(' + VarToJSON([Id]) + ');', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetRoot: TExtTreeTreeNode;
begin
  Result := FRoot;
end;

function TExtTreeTreePanel.GetRootNode: TExtFunction;
begin
  JSCode(JSName + '.getRootNode();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetSelectionModel: TExtFunction;
begin
  JSCode(JSName + '.getSelectionModel();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.GetTreeEl: TExtFunction;
begin
  JSCode(JSName + '.getTreeEl();', 'TExtTreeTreePanel');
  Result := Self;
end;

function TExtTreeTreePanel.SelectPath(Path: String; Attr: String = ''; Callback: TExtFunction = nil): TExtFunction;
begin
  JSCode(JSName + '.selectPath(' + VarToJSON([Path, Attr, Callback, true]) + ');', 'TExtTreeTreePanel');
  Result := Self;
end;

procedure TExtTreeTreePanel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'append') and Assigned(FOnAppend) then
    FOnAppend(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')), ParamAsInteger('Index'))
  else if (AEvtName = 'beforeappend') and Assigned(FOnBeforeappend) then
    FOnBeforeappend(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'beforechildrenrendered') and Assigned(FOnBeforechildrenrendered) then
    FOnBeforechildrenrendered(TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'beforeclick') and Assigned(FOnBeforeclick) then
    FOnBeforeclick(TExtDataNode(ParamAsObject('Node')), ExtEventObject)
  else if (AEvtName = 'beforecollapsenode') and Assigned(FOnBeforecollapsenode) then
    FOnBeforecollapsenode(TExtDataNode(ParamAsObject('Node')), ParamAsBoolean('Deep'), ParamAsBoolean('Anim'))
  else if (AEvtName = 'beforedblclick') and Assigned(FOnBeforedblclick) then
    FOnBeforedblclick(TExtDataNode(ParamAsObject('Node')), ExtEventObject)
  else if (AEvtName = 'beforeexpandnode') and Assigned(FOnBeforeexpandnode) then
    FOnBeforeexpandnode(TExtDataNode(ParamAsObject('Node')), ParamAsBoolean('Deep'), ParamAsBoolean('Anim'))
  else if (AEvtName = 'beforeinsert') and Assigned(FOnBeforeinsert) then
    FOnBeforeinsert(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')), TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'beforeload') and Assigned(FOnBeforeload) then
    FOnBeforeload(TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'beforemovenode') and Assigned(FOnBeforemovenode) then
    FOnBeforemovenode(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Node')),
      TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')), ParamAsInteger('Index'))
  else if (AEvtName = 'beforenodedrop') and Assigned(FOnBeforenodedrop) then
    FOnBeforenodedrop(TExtObject(ParamAsObject('DropEvent')))
  else if (AEvtName = 'beforeremove') and Assigned(FOnBeforeremove) then
    FOnBeforeremove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'checkchange') and Assigned(FOnCheckchange) then
    FOnCheckchange(TExtTreeTreePanel(ParamAsObject('This')), ParamAsBoolean('Checked'))
  else if (AEvtName = 'click') and Assigned(FOnClick) then
    FOnClick(TExtDataNode(ParamAsObject('Node')), ExtEventObject)
  else if (AEvtName = 'collapsenode') and Assigned(FOnCollapsenode) then
    FOnCollapsenode(TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'containerclick') and Assigned(FOnContainerclick) then
    FOnContainerclick(TExtTreeTreePanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containercontextmenu') and Assigned(FOnContainercontextmenu) then
    FOnContainercontextmenu(TExtTreeTreePanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containerdblclick') and Assigned(FOnContainerdblclick) then
    FOnContainerdblclick(TExtTreeTreePanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'contextmenu') and Assigned(FOnContextmenu) then
    FOnContextmenu(TExtDataNode(ParamAsObject('Node')), ExtEventObject)
  else if (AEvtName = 'dblclick') and Assigned(FOnDblclick) then
    FOnDblclick(TExtDataNode(ParamAsObject('Node')), ExtEventObject)
  else if (AEvtName = 'disabledchange') and Assigned(FOnDisabledchange) then
    FOnDisabledchange(TExtDataNode(ParamAsObject('Node')), ParamAsBoolean('Disabled'))
  else if (AEvtName = 'expandnode') and Assigned(FOnExpandnode) then
    FOnExpandnode(TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'insert') and Assigned(FOnInsert) then
    FOnInsert(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')), TExtDataNode(ParamAsObject('RefNode')))
  else if (AEvtName = 'load') and Assigned(FOnLoad) then
    FOnLoad(TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'movenode') and Assigned(FOnMovenode) then
    FOnMovenode(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Node')),
      TExtDataNode(ParamAsObject('OldParent')), TExtDataNode(ParamAsObject('NewParent')), ParamAsInteger('Index'))
  else if (AEvtName = 'nodedragover') and Assigned(FOnNodedragover) then
    FOnNodedragover(TExtObject(ParamAsObject('DragOverEvent')))
  else if (AEvtName = 'nodedrop') and Assigned(FOnNodedrop) then
    FOnNodedrop(TExtObject(ParamAsObject('DropEvent')))
  else if (AEvtName = 'remove') and Assigned(FOnRemove) then
    FOnRemove(TExtDataTree(ParamAsObject('Tree')), TExtDataNode(ParamAsObject('Parent')),
      TExtDataNode(ParamAsObject('Node')))
  else if (AEvtName = 'textchange') and Assigned(FOnTextchange) then
    FOnTextchange(TExtDataNode(ParamAsObject('Node')), ParamAsString('Text'), ParamAsString('OldText'));
end;

end.
