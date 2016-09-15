unit Ext.Grid;

interface

uses
  Classes, StrUtils, Kitto.Ext, Ext.Util, Ext.Base, Ext.Data;

type
  TExtGridRowNumberer = class;
  TExtGridColumn = class;
  TExtGridPropertyRecord = class;
  TExtGridTemplateColumn = class;
  TExtGridNumberColumn = class;
  TExtViewTable = class;
  TExtGridBooleanColumn = class;
  TExtGridDateColumn = class;
  TExtGridAbstractSelectionModel = class;
  TExtGridCellSelectionModel = class;
  TExtSelectionRowModel = class;
  TExtGridGroupingView = class;
  TExtGridCheckboxSelectionModel = class;
  TExtGridGridPanel = class;
  TExtGridPropertyGrid = class;

  TExtGridRowNumberer = class(TExtFunction)
  private
    FHeader: string;
    FWidth: Integer;
    procedure SetFHeader(Value: string);
    procedure SetFWidth(Value: Integer);
  public
    class function JSClassName: string; override;
    property Header: string read FHeader write SetFHeader;
    property Width: Integer read FWidth write SetFWidth;
  end;

  TExtGridColumn = class(TExtFunction)
  private
    FAlign: TExtGridColumnAlign;
    FCss: string;
    FDataIndex: string;
    FEditable: Boolean;
    FEditor: TExtFormField;
    FEmptyGroupText: string;
    FFixed: Boolean;
    FGroupName: string;
    FGroupRenderer: TExtFunction;
    FGroupable: Boolean;
    FHeader: string;
    FHidden: Boolean;
    FHideable: Boolean; // true
    FId: string;
    FMenuDisabled: Boolean;
    FRenderer: string;
    FResizable: Boolean;
    FScope: TExtObject;
    FSortable: Boolean;
    FTooltip: string;
    FWidth: Integer;
    FXtype: string;
    FRendererExtFunction: TExtFunction;
    procedure SetAlign(const AValue: TExtGridColumnAlign);
    procedure SetCss(const AValue: string);
    procedure SetDataIndex(const AValue: string);
    procedure SetEditable(const AValue: Boolean);
    procedure SetEditor(AValue: TExtFormField);
    procedure SetEmptyGroupText(const AValue: string);
    procedure SetFixed(const AValue: Boolean);
    procedure SetGroupName(const AValue: string);
    procedure SetGroupRenderer(const AValue: TExtFunction);
    procedure SetFGroupable(Value: Boolean);
    procedure SetHeader(const AValue: string);
    procedure SetHidden(const AValue: Boolean);
    procedure SetHideable(const AValue: Boolean);
    procedure SetFId(Value: string);
    procedure SetFMenuDisabled(Value: Boolean);
    procedure SetRenderer(const AValue: string);
    procedure SetFResizable(Value: Boolean);
    procedure SetFScope(Value: TExtObject);
    procedure SetSortable(const AValue: Boolean);
    procedure SetFTooltip(Value: string);
    procedure SetWidth(const AValue: Integer);
    procedure SetFXtype(Value: string);
    procedure SetRendererExtFunction(const AValue: TExtFunction);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetCellEditor(RowIndex: Integer): TExtFunction;
    property Align: TExtGridColumnAlign read FAlign write SetAlign;
    property Css: string read FCss write SetCss;
    property DataIndex: string read FDataIndex write SetDataIndex;
    property Editable: Boolean read FEditable write SetEditable;
    property Editor: TExtFormField read FEditor write SetEditor;
    property EmptyGroupText: string read FEmptyGroupText write SetEmptyGroupText;
    property Fixed: Boolean read FFixed write SetFixed;
    property GroupName: string read FGroupName write SetGroupName;
    property GroupRenderer: TExtFunction read FGroupRenderer write SetGroupRenderer;
    property Groupable: Boolean read FGroupable write SetFGroupable;
    property Header: string read FHeader write SetHeader;
    property Hidden: Boolean read FHidden write SetHidden;
    property Hideable: Boolean read FHideable write SetHideable;
    property Id: string read FId write SetFId;
    property MenuDisabled: Boolean read FMenuDisabled write SetFMenuDisabled;
    property Renderer: string read FRenderer write SetRenderer;
    property Resizable: Boolean read FResizable write SetFResizable;
    property Scope: TExtObject read FScope write SetFScope;
    property Sortable: Boolean read FSortable write SetSortable;
    property Tooltip: string read FTooltip write SetFTooltip;
    property Width: Integer read FWidth write SetWidth;
    property Xtype: string read FXtype write SetFXtype;
    property RendererExtFunction: TExtFunction read FRendererExtFunction
      write SetRendererExtFunction;
  end;

  TExtGridPropertyRecord = class(TExtFunction)
  public
    class function JSClassName: string; override;
  end;

  TExtGridTemplateColumn = class(TExtGridColumn)
  private
    FTpl: string;
    FTplXTemplate: TExtXTemplate;
    procedure SetFTpl(Value: string);
    procedure SetFTplXTemplate(Value: TExtXTemplate);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property Tpl: string read FTpl write SetFTpl;
    property TplXTemplate: TExtXTemplate read FTplXTemplate write SetFTplXTemplate;
  end;

  TExtGridNumberColumn = class(TExtGridColumn)
  private
    FFormat: string; // '0,000.00'
    procedure SetFormat(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property Format: string read FFormat write SetFormat;
  end;

  // Procedural types for events TExtViewTable
  TExtViewTableOnBeforerefresh = procedure(View: TExtViewTable) of object;
  TExtViewTableOnBeforerowremoved = procedure(View: TExtViewTable;
    RowIndex: Integer; RecordJS: TExtDataRecord) of object;
  TExtViewTableOnBeforerowsinserted = procedure(View: TExtViewTable;
    FirstRow: Integer; LastRow: Integer) of object;
  TExtViewTableOnRefresh = procedure(View: TExtViewTable) of object;
  TExtViewTableOnRowremoved = procedure(View: TExtViewTable; RowIndex: Integer;
    RecordJS: TExtDataRecord) of object;
  TExtViewTableOnRowsinserted = procedure(View: TExtViewTable; FirstRow: Integer;
    LastRow: Integer) of object;
  TExtViewTableOnRowupdated = procedure(View: TExtViewTable; FirstRow: Integer;
    RecordJS: TExtDataRecord) of object;

  TExtViewTable = class(TExtUtilObservable)
  private
    FAutoFill: Boolean;
    FCellSelector: string; // 'td.x-grid3-cell'
    FCellSelectorDepth: Integer; // 4
    FColumnsText: string; // 'Columns'
    FDeferEmptyText: Boolean; // true
    FEmptyText: string;
    FEnableRowBody: Boolean;
    FForceFit: Boolean;
    FHeadersDisabled: Boolean;
    FRowBodySelector: string; // 'div.x-grid3-row'
    FRowBodySelectorDepth: Integer; // 10
    FRowSelector: string; // 'div.x-grid3-row'
    FRowSelectorDepth: Integer; // 10
    FScrollOffset: Integer;
    FSelectedRowClass: string; // 'x-grid3-row-selected'
    FSortAscText: string; // 'Sort Ascending'
    FSortClasses: TExtObjectList;
    FSortDescText: string; // 'Sort Descending'
    FMainBody: TExtElement;
    FOnBeforerefresh: TExtViewTableOnBeforerefresh;
    FOnBeforerowremoved: TExtViewTableOnBeforerowremoved;
    FOnBeforerowsinserted: TExtViewTableOnBeforerowsinserted;
    FOnRefresh: TExtViewTableOnRefresh;
    FOnRowremoved: TExtViewTableOnRowremoved;
    FOnRowsinserted: TExtViewTableOnRowsinserted;
    FOnRowupdated: TExtViewTableOnRowupdated;
    FGetRowClass: TExtFunction;
    FDisableSelection: Boolean;
    procedure SetAutoFill(const AValue: Boolean);
    procedure SetFCellSelector(Value: string);
    procedure SetFCellSelectorDepth(Value: Integer);
    procedure SetFColumnsText(Value: string);
    procedure SetFDeferEmptyText(Value: Boolean);
    procedure SetEmptyText(const AValue: string);
    procedure SetEnableRowBody(const AValue: Boolean);
    procedure SetForceFit(const AValue: Boolean);
    procedure SetFHeadersDisabled(Value: Boolean);
    procedure SetFRowBodySelector(Value: string);
    procedure SetFRowBodySelectorDepth(Value: Integer);
    procedure SetFRowSelector(Value: string);
    procedure SetFRowSelectorDepth(Value: Integer);
    procedure SetFScrollOffset(Value: Integer);
    procedure SetFSelectedRowClass(Value: string);
    procedure SetFSortAscText(Value: string);
    procedure SetFSortClasses(Value: TExtObjectList);
    procedure SetFSortDescText(Value: string);
    procedure SetFMainBody(Value: TExtElement);
    procedure SetFOnBeforerefresh(Value: TExtViewTableOnBeforerefresh);
    procedure SetFOnBeforerowremoved(Value: TExtViewTableOnBeforerowremoved);
    procedure SetFOnBeforerowsinserted(Value: TExtViewTableOnBeforerowsinserted);
    procedure SetFOnRefresh(Value: TExtViewTableOnRefresh);
    procedure SetFOnRowremoved(Value: TExtViewTableOnRowremoved);
    procedure SetFOnRowsinserted(Value: TExtViewTableOnRowsinserted);
    procedure SetFOnRowupdated(Value: TExtViewTableOnRowupdated);
    procedure SetGetRowClass(const AValue: TExtFunction);
    procedure SetDisableSelection(const AValue: Boolean);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function FocusCell(Row: Integer; Col: Integer): TExtFunction;
    function FocusRow(Row: Integer): TExtFunction;
    function GetCell(Row: Integer; Col: Integer): TExtFunction;
    function GetHeaderCell(Index: Integer): TExtFunction;
    function GetRow(Index: Integer): TExtFunction;
    function Refresh(HeadersToo: Boolean = false): TExtFunction;
    function ScrollToTop: TExtFunction;
    property AutoFill: Boolean read FAutoFill write SetAutoFill;
    property CellSelector: string read FCellSelector write SetFCellSelector;
    property CellSelectorDepth: Integer read FCellSelectorDepth
      write SetFCellSelectorDepth;
    property ColumnsText: string read FColumnsText write SetFColumnsText;
    property DeferEmptyText: Boolean read FDeferEmptyText write SetFDeferEmptyText;
    property DisableSelection: Boolean read FDisableSelection write SetDisableSelection;
    property EmptyText: string read FEmptyText write SetEmptyText;
    property EnableRowBody: Boolean read FEnableRowBody write SetEnableRowBody;
    property ForceFit: Boolean read FForceFit write SetForceFit;
    property GetRowClass: TExtFunction read FGetRowClass write SetGetRowClass;
    property HeadersDisabled: Boolean read FHeadersDisabled write SetFHeadersDisabled;
    property RowBodySelector: string read FRowBodySelector write SetFRowBodySelector;
    property RowBodySelectorDepth: Integer read FRowBodySelectorDepth
      write SetFRowBodySelectorDepth;
    property RowSelector: string read FRowSelector write SetFRowSelector;
    property RowSelectorDepth: Integer read FRowSelectorDepth write SetFRowSelectorDepth;
    property ScrollOffset: Integer read FScrollOffset write SetFScrollOffset;
    property SelectedRowClass: string read FSelectedRowClass write SetFSelectedRowClass;
    property SortAscText: string read FSortAscText write SetFSortAscText;
    property SortClasses: TExtObjectList read FSortClasses write SetFSortClasses;
    property SortDescText: string read FSortDescText write SetFSortDescText;
    property MainBody: TExtElement read FMainBody write SetFMainBody;
    property OnBeforerefresh: TExtViewTableOnBeforerefresh read FOnBeforerefresh
      write SetFOnBeforerefresh;
    property OnBeforerowremoved: TExtViewTableOnBeforerowremoved
      read FOnBeforerowremoved write SetFOnBeforerowremoved;
    property OnBeforerowsinserted: TExtViewTableOnBeforerowsinserted
      read FOnBeforerowsinserted write SetFOnBeforerowsinserted;
    property OnRefresh: TExtViewTableOnRefresh read FOnRefresh write SetFOnRefresh;
    property OnRowremoved: TExtViewTableOnRowremoved read FOnRowremoved
      write SetFOnRowremoved;
    property OnRowsinserted: TExtViewTableOnRowsinserted read FOnRowsinserted
      write SetFOnRowsinserted;
    property OnRowupdated: TExtViewTableOnRowupdated read FOnRowupdated
      write SetFOnRowupdated;
  end;

  TExtGridView = class(TExtViewTable)
  public
    class function JSClassName: string; override;
  end;

  TExtGridBooleanColumn = class(TExtGridColumn)
  private
    FFalseText: string; // 'false'
    FTrueText: string; // 'true'
    FUndefinedText: string;
    procedure SetFFalseText(Value: string);
    procedure SetFTrueText(Value: string);
    procedure SetFUndefinedText(Value: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property FalseText: string read FFalseText write SetFFalseText;
    property TrueText: string read FTrueText write SetFTrueText;
    property UndefinedText: string read FUndefinedText write SetFUndefinedText;
  end;

  TExtGridDateColumn = class(TExtGridColumn)
  private
    FFormat: string; // 'm/d/Y'
    procedure SetFormat(const AValue: string);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property Format: string read FFormat write SetFormat;
  end;

  TExtGridAbstractSelectionModel = class(TExtUtilObservable)
  private
    FGrid: TExtObject;
    procedure SetGrid(const AValue: TExtObject);
  protected
    procedure InitDefaults; override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function IsLocked: TExtFunction;
    function Lock: TExtFunction;
    function Unlock: TExtFunction;
    property Grid: TExtObject read FGrid write SetGrid;
  end;

  // Procedural types for events TExtGridCellSelectionModel
  TExtGridCellSelectionModelOnBeforecellselect = procedure
    (This: TExtGridCellSelectionModel; RowIndex: Integer; ColIndex: Integer) of object;
  TExtGridCellSelectionModelOnCellselect = procedure(This: TExtGridCellSelectionModel;
    RowIndex: Integer; ColIndex: Integer) of object;
  TExtGridCellSelectionModelOnSelectionchange = procedure
    (This: TExtGridCellSelectionModel; Selection: TExtObject) of object;

  TExtGridCellSelectionModel = class(TExtGridAbstractSelectionModel)
  private
    FOnBeforecellselect: TExtGridCellSelectionModelOnBeforecellselect;
    FOnCellselect: TExtGridCellSelectionModelOnCellselect;
    FOnSelectionchange: TExtGridCellSelectionModelOnSelectionchange;
    procedure SetFOnBeforecellselect(Value: TExtGridCellSelectionModelOnBeforecellselect);
    procedure SetFOnCellselect(Value: TExtGridCellSelectionModelOnCellselect);
    procedure SetFOnSelectionchange(Value: TExtGridCellSelectionModelOnSelectionchange);
  protected
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function ClearSelections(PreventNotify: Boolean): TExtFunction;
    function GetSelectedCell: TExtFunction;
    function HasSelection: TExtFunction;
    function Select(RowIndex: Integer; ColIndex: Integer;
      PreventViewNotify: Boolean = false; PreventFocus: Boolean = false;
      R: TExtDataRecord = nil): TExtFunction;
    property OnBeforecellselect: TExtGridCellSelectionModelOnBeforecellselect
      read FOnBeforecellselect write SetFOnBeforecellselect;
    property OnCellselect: TExtGridCellSelectionModelOnCellselect read FOnCellselect
      write SetFOnCellselect;
    property OnSelectionchange: TExtGridCellSelectionModelOnSelectionchange
      read FOnSelectionchange write SetFOnSelectionchange;
  end;

  // Procedural types for events TExtSelectionRowModel
  TExtSelectionRowModelOnBeforerowselect = procedure(This: TExtSelectionRowModel;
    RowIndex: Integer; KeepExisting: Boolean; RecordJS: TExtDataRecord) of object;
  TExtSelectionRowModelOnRowdeselect = procedure(This: TExtSelectionRowModel;
    RowIndex: Integer; RecordJS: TExtDataRecord) of object;
  TExtSelectionRowModelOnRowselect = procedure(This: TExtSelectionRowModel;
    RowIndex: Integer; R: TExtDataRecord) of object;
  TExtSelectionRowModelOnSelectionchange = procedure(This: TExtSelectionRowModel) of object;

  TExtSelectionRowModel = class(TExtGridAbstractSelectionModel)
  private
    FMoveEditorOnEnter: Boolean;
    FOnBeforerowselect: TExtSelectionRowModelOnBeforerowselect;
    FOnRowdeselect: TExtSelectionRowModelOnRowdeselect;
    FOnRowselect: TExtSelectionRowModelOnRowselect;
    FOnSelectionchange: TExtSelectionRowModelOnSelectionchange;
    FMode: string;
    procedure SetFMoveEditorOnEnter(Value: Boolean);
    procedure SetFOnBeforerowselect(Value: TExtSelectionRowModelOnBeforerowselect);
    procedure SetFOnRowdeselect(Value: TExtSelectionRowModelOnRowdeselect);
    procedure SetFOnRowselect(Value: TExtSelectionRowModelOnRowselect);
    procedure SetFOnSelectionchange(Value: TExtSelectionRowModelOnSelectionchange);
    procedure SetMode(const AValue: string);
  protected
    procedure HandleEvent(const AEvtName: string); override;
    procedure InitDefaults; override;
  public
    const
      SIMPLE_SELECT = 'SIMPLE';
      SINGLE_SELECT = 'SINGLE';
      MULTI_SELECT = 'MULTI';
    class function JSClassName: string; override;
    function ClearSelections(Fast: Boolean = false): TExtFunction;
    function DeselectRange(StartRow: Integer; EndRow: Integer): TExtFunction;
    function DeselectRow(Row: Integer; PreventViewNotify: Boolean = false): TExtFunction;
    function Each(const AFunction: TExtFunction; const AScope: TExtObject = nil): TExtFunction;
    function GetCount: TExtFunction;
    function GetSelected: TExtFunction;
    function GetSelections: TExtFunction;
    function HasNext: TExtFunction;
    function HasPrevious: TExtFunction;
    function HasSelection: TExtFunction;
    function IsIdSelected(Id: string): TExtFunction;
    function IsSelected(Index: Integer): TExtFunction; overload;
    function IsSelected(Index: TExtDataRecord): TExtFunction; overload;
    function SelectAll: TExtFunction;
    function Select(const AIndex: Integer; const AKeepExisting: Boolean = False): TExtFunction;
    function SelectNext(KeepExisting: Boolean = false): TExtFunction;
    function SelectPrevious(KeepExisting: Boolean = false): TExtFunction;
    function SelectRange(StartRow: Integer; EndRow: Integer;
      KeepExisting: Boolean = false): TExtFunction;
    function SelectRecords(Records: TExtObjectList; KeepExisting: Boolean = false)
      : TExtFunction;
    function SelectRow(Row: Integer; KeepExisting: Boolean = false;
      PreventViewNotify: Boolean = false): TExtFunction;
    function SelectRows(Rows: TExtObjectList; KeepExisting: Boolean = false)
      : TExtFunction;
    property Mode: string read FMode write SetMode;
    property MoveEditorOnEnter: Boolean read FMoveEditorOnEnter
      write SetFMoveEditorOnEnter;
    property OnBeforerowselect: TExtSelectionRowModelOnBeforerowselect
      read FOnBeforerowselect write SetFOnBeforerowselect;
    property OnRowdeselect: TExtSelectionRowModelOnRowdeselect read FOnRowdeselect
      write SetFOnRowdeselect;
    property OnRowselect: TExtSelectionRowModelOnRowselect read FOnRowselect
      write SetFOnRowselect;
    property OnSelectionchange: TExtSelectionRowModelOnSelectionchange
      read FOnSelectionchange write SetFOnSelectionchange;
  end;

  TExtGridGroupingView = class(TExtGridView)
  private
    FEmptyGroupText: string;
    FEnableGrouping: Boolean; // true
    FEnableGroupingMenu: Boolean; // true
    FEnableNoGroups: Boolean; // true
    FGroupByText: string; // 'Group By This Field'
    FGroupMode: string;
    FGroupRenderer: TExtFunction;
    FGroupTextTpl: string; // '{text}'
    FHideGroupedColumn: Boolean;
    FIgnoreAdd: Boolean;
    FShowGroupName: Boolean; // true
    FShowGroupsText: string; // 'Show in Groups'
    FStartCollapsed: Boolean;
    procedure SetEmptyGroupText(const AValue: string);
    procedure SetEnableGrouping(const AValue: Boolean);
    procedure SetEnableGroupingMenu(const AValue: Boolean);
    procedure SetEnableNoGroups(const AValue: Boolean);
    procedure SetFGroupByText(Value: string);
    procedure SetGroupMode(const AValue: string);
    procedure SetGroupRenderer(const AValue: TExtFunction);
    procedure SetGroupTextTpl(const AValue: string);
    procedure SetHideGroupedColumn(const AValue: Boolean);
    procedure SetFIgnoreAdd(Value: Boolean);
    procedure SetShowGroupName(const AValue: Boolean);
    procedure SetShowGroupsText(const AValue: string);
    procedure SetStartCollapsed(const AValue: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    function CollapseAllGroups: TExtFunction;
    function ExpandAllGroups: TExtFunction;
    function GetGroupId(Value: string): TExtFunction;
    function ToggleAllGroups(Expanded: Boolean = false): TExtFunction;
    function ToggleGroup(GroupId: string; Expanded: Boolean = false): TExtFunction;
    function ToggleRowIndex(RowIndex: Integer; Expanded: Boolean = false): TExtFunction;
    property EmptyGroupText: string read FEmptyGroupText write SetEmptyGroupText;
    property EnableGrouping: Boolean read FEnableGrouping write SetEnableGrouping;
    property EnableGroupingMenu: Boolean read FEnableGroupingMenu
      write SetEnableGroupingMenu;
    property EnableNoGroups: Boolean read FEnableNoGroups write SetEnableNoGroups;
    property GroupByText: string read FGroupByText write SetFGroupByText;
    property GroupMode: string read FGroupMode write SetGroupMode;
    property GroupRenderer: TExtFunction read FGroupRenderer write SetGroupRenderer;
    property GroupTextTpl: string read FGroupTextTpl write SetGroupTextTpl;
    property HideGroupedColumn: Boolean read FHideGroupedColumn
      write SetHideGroupedColumn;
    property IgnoreAdd: Boolean read FIgnoreAdd write SetFIgnoreAdd;
    property ShowGroupName: Boolean read FShowGroupName write SetShowGroupName;
    property ShowGroupsText: string read FShowGroupsText write SetShowGroupsText;
    property StartCollapsed: Boolean read FStartCollapsed write SetStartCollapsed;
  end;

  TExtGridCheckboxSelectionModel = class(TExtSelectionRowModel)
  private
    FCheckOnly: Boolean;
    FHeader: string;
    FSortable: Boolean;
    FWidth: Integer; // 20
    procedure SetFCheckOnly(Value: Boolean);
    procedure SetFHeader(Value: string);
    procedure SetFSortable(Value: Boolean);
    procedure SetFWidth(Value: Integer);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property CheckOnly: Boolean read FCheckOnly write SetFCheckOnly;
    property Header: string read FHeader write SetFHeader;
    property Sortable: Boolean read FSortable write SetFSortable;
    property Width: Integer read FWidth write SetFWidth;
  end;

  // Procedural types for events TExtGridGridPanel
  TExtGridGridPanelOnBodyscroll = procedure(ScrollLeft: Integer; ScrollTop: Integer)
    of object;
  TExtGridGridPanelOnCellclick = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnCellcontextmenu = procedure(This: TExtGridGridPanel;
    RowIndex: Integer; CellIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnCelldblclick = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnCellmousedown = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnClick = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnColumnmove = procedure(OldIndex: Integer; NewIndex: Integer)
    of object;
  TExtGridGridPanelOnColumnresize = procedure(ColumnIndex: Integer; NewSize: Integer)
    of object;
  TExtGridGridPanelOnContainerclick = procedure(This: TExtGridGridPanel;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnContainercontextmenu = procedure(This: TExtGridGridPanel;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnContainerdblclick = procedure(This: TExtGridGridPanel;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnContainermousedown = procedure(This: TExtGridGridPanel;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnContextmenu = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnDblclick = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnGroupchange = procedure(This: TExtGridGridPanel; GroupField: string)
    of object;
  TExtGridGridPanelOnGroupclick = procedure(This: TExtGridGridPanel; GroupField: string;
    GroupValue: string; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnGroupcontextmenu = procedure(This: TExtGridGridPanel;
    GroupField: string; GroupValue: string; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnGroupdblclick = procedure(This: TExtGridGridPanel;
    GroupField: string; GroupValue: string; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnGroupmousedown = procedure(This: TExtGridGridPanel;
    GroupField: string; GroupValue: string; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnHeaderclick = procedure(This: TExtGridGridPanel;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnHeadercontextmenu = procedure(This: TExtGridGridPanel;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnHeaderdblclick = procedure(This: TExtGridGridPanel;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnHeadermousedown = procedure(This: TExtGridGridPanel;
    ColumnIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnKeydown = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnKeypress = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnMousedown = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnMouseout = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnMouseover = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnMouseup = procedure(E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowbodyclick = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowbodycontextmenu = procedure(This: TExtGridGridPanel;
    RowIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowbodydblclick = procedure(This: TExtGridGridPanel;
    RowIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowbodymousedown = procedure(This: TExtGridGridPanel;
    RowIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowclick = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowcontextmenu = procedure(This: TExtGridGridPanel;
    RowIndex: Integer; E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowdblclick = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnRowmousedown = procedure(This: TExtGridGridPanel; RowIndex: Integer;
    E: TExtEventObjectSingleton) of object;
  TExtGridGridPanelOnSortchange = procedure(This: TExtGridGridPanel; SortInfo: TExtObject)
    of object;
  TExtGridGridPanelOnViewready = procedure(This: TExtGridGridPanel) of object;

  TExtGridGridPanel = class(TExtPanel)
  private
    FAutoExpandColumn: string;
    FAutoExpandMax: Integer;
    FAutoExpandMin: Integer;
    FCm: TExtObject;
    FColumnLines: Boolean;
    FColumns: TExtObjectList;
    FDdGroup: string;
    FDdText: string;
    FDeferRowRender: Boolean;
    FDisableSelection: Boolean;
    FEnableColumnHide: Boolean;
    FEnableColumnMove: Boolean;
    FEnableColumnResize: Boolean;
    FEnableDragDrop: Boolean;
    FEnableHdMenu: Boolean;
    FFeatures: TExtObjectList;
    FHideHeaders: Boolean;
    FLoadMask: TExtObject;
    FMaxHeight: Integer;
    FMinColumnWidth: Integer;
    FSelModel: TExtObject;
    FSm: TExtObject;
    FStateEvents: TExtObjectList;
    FStore: TExtDataStore;
    FStripeRows: Boolean;
    FTrackMouseOver: Boolean;
    FView: TExtObject;
    FViewConfig: TExtObject;
    FLoadMaskBoolean: Boolean;
    FOnBodyscroll: TExtGridGridPanelOnBodyscroll;
    FOnCellclick: TExtGridGridPanelOnCellclick;
    FOnCellcontextmenu: TExtGridGridPanelOnCellcontextmenu;
    FOnCelldblclick: TExtGridGridPanelOnCelldblclick;
    FOnCellmousedown: TExtGridGridPanelOnCellmousedown;
    FOnClick: TExtGridGridPanelOnClick;
    FOnColumnmove: TExtGridGridPanelOnColumnmove;
    FOnColumnresize: TExtGridGridPanelOnColumnresize;
    FOnContainerclick: TExtGridGridPanelOnContainerclick;
    FOnContainercontextmenu: TExtGridGridPanelOnContainercontextmenu;
    FOnContainerdblclick: TExtGridGridPanelOnContainerdblclick;
    FOnContainermousedown: TExtGridGridPanelOnContainermousedown;
    FOnContextmenu: TExtGridGridPanelOnContextmenu;
    FOnDblclick: TExtGridGridPanelOnDblclick;
    FOnGroupchange: TExtGridGridPanelOnGroupchange;
    FOnGroupclick: TExtGridGridPanelOnGroupclick;
    FOnGroupcontextmenu: TExtGridGridPanelOnGroupcontextmenu;
    FOnGroupdblclick: TExtGridGridPanelOnGroupdblclick;
    FOnGroupmousedown: TExtGridGridPanelOnGroupmousedown;
    FOnHeaderclick: TExtGridGridPanelOnHeaderclick;
    FOnHeadercontextmenu: TExtGridGridPanelOnHeadercontextmenu;
    FOnHeaderdblclick: TExtGridGridPanelOnHeaderdblclick;
    FOnHeadermousedown: TExtGridGridPanelOnHeadermousedown;
    FOnKeydown: TExtGridGridPanelOnKeydown;
    FOnKeypress: TExtGridGridPanelOnKeypress;
    FOnMousedown: TExtGridGridPanelOnMousedown;
    FOnMouseout: TExtGridGridPanelOnMouseout;
    FOnMouseover: TExtGridGridPanelOnMouseover;
    FOnMouseup: TExtGridGridPanelOnMouseup;
    FOnRowbodyclick: TExtGridGridPanelOnRowbodyclick;
    FOnRowbodycontextmenu: TExtGridGridPanelOnRowbodycontextmenu;
    FOnRowbodydblclick: TExtGridGridPanelOnRowbodydblclick;
    FOnRowbodymousedown: TExtGridGridPanelOnRowbodymousedown;
    FOnRowclick: TExtGridGridPanelOnRowclick;
    FOnRowcontextmenu: TExtGridGridPanelOnRowcontextmenu;
    FOnRowdblclick: TExtGridGridPanelOnRowdblclick;
    FOnRowmousedown: TExtGridGridPanelOnRowmousedown;
    FOnSortchange: TExtGridGridPanelOnSortchange;
    FOnViewready: TExtGridGridPanelOnViewready;
    procedure SetAutoExpandColumn(const AValue: string);
    procedure SetFAutoExpandMax(Value: Integer);
    procedure SetFAutoExpandMin(Value: Integer);
    procedure SetFCm(Value: TExtObject);
    procedure SetColumnLines(const AValue: Boolean);
    procedure SetFDdGroup(Value: string);
    procedure SetFDdText(Value: string);
    procedure SetFDeferRowRender(Value: Boolean);
    procedure SetDisableSelection(const AValue: Boolean);
    procedure SetFEnableColumnHide(Value: Boolean);
    procedure SetFEnableColumnMove(Value: Boolean);
    procedure SetFEnableColumnResize(Value: Boolean);
    procedure SetFEnableDragDrop(Value: Boolean);
    procedure SetEnableHdMenu(AValue: Boolean);
    procedure SetFHideHeaders(Value: Boolean);
    procedure SetFLoadMask(Value: TExtObject);
    procedure SetFMaxHeight(Value: Integer);
    procedure SetFMinColumnWidth(Value: Integer);
    procedure SetSelModel(const AValue: TExtObject);
    procedure SetFSm(Value: TExtObject);
    procedure SetFStateEvents(Value: TExtObjectList);
    procedure SetStore(const AValue: TExtDataStore);
    procedure SetStripeRows(const AValue: Boolean);
    procedure SetTrackMouseOver(const AValue: Boolean);
    procedure SetView(const AValue: TExtObject);
    procedure SetFViewConfig(const AValue: TExtObject);
    procedure SetFLoadMaskBoolean(Value: Boolean);
    procedure SetFOnBodyscroll(Value: TExtGridGridPanelOnBodyscroll);
    procedure SetFOnCellclick(Value: TExtGridGridPanelOnCellclick);
    procedure SetFOnCellcontextmenu(Value: TExtGridGridPanelOnCellcontextmenu);
    procedure SetFOnCelldblclick(Value: TExtGridGridPanelOnCelldblclick);
    procedure SetFOnCellmousedown(Value: TExtGridGridPanelOnCellmousedown);
    procedure SetFOnClick(Value: TExtGridGridPanelOnClick);
    procedure SetFOnColumnmove(Value: TExtGridGridPanelOnColumnmove);
    procedure SetFOnColumnresize(Value: TExtGridGridPanelOnColumnresize);
    procedure SetFOnContainerclick(Value: TExtGridGridPanelOnContainerclick);
    procedure SetFOnContainercontextmenu(Value: TExtGridGridPanelOnContainercontextmenu);
    procedure SetFOnContainerdblclick(Value: TExtGridGridPanelOnContainerdblclick);
    procedure SetFOnContainermousedown(Value: TExtGridGridPanelOnContainermousedown);
    procedure SetFOnContextmenu(Value: TExtGridGridPanelOnContextmenu);
    procedure SetFOnDblclick(Value: TExtGridGridPanelOnDblclick);
    procedure SetFOnGroupchange(Value: TExtGridGridPanelOnGroupchange);
    procedure SetFOnGroupclick(Value: TExtGridGridPanelOnGroupclick);
    procedure SetFOnGroupcontextmenu(Value: TExtGridGridPanelOnGroupcontextmenu);
    procedure SetFOnGroupdblclick(Value: TExtGridGridPanelOnGroupdblclick);
    procedure SetFOnGroupmousedown(Value: TExtGridGridPanelOnGroupmousedown);
    procedure SetFOnHeaderclick(Value: TExtGridGridPanelOnHeaderclick);
    procedure SetFOnHeadercontextmenu(Value: TExtGridGridPanelOnHeadercontextmenu);
    procedure SetFOnHeaderdblclick(Value: TExtGridGridPanelOnHeaderdblclick);
    procedure SetFOnHeadermousedown(Value: TExtGridGridPanelOnHeadermousedown);
    procedure SetFOnKeydown(Value: TExtGridGridPanelOnKeydown);
    procedure SetFOnKeypress(Value: TExtGridGridPanelOnKeypress);
    procedure SetFOnMousedown(Value: TExtGridGridPanelOnMousedown);
    procedure SetFOnMouseout(Value: TExtGridGridPanelOnMouseout);
    procedure SetFOnMouseover(Value: TExtGridGridPanelOnMouseover);
    procedure SetFOnMouseup(Value: TExtGridGridPanelOnMouseup);
    procedure SetFOnRowbodyclick(Value: TExtGridGridPanelOnRowbodyclick);
    procedure SetFOnRowbodycontextmenu(Value: TExtGridGridPanelOnRowbodycontextmenu);
    procedure SetFOnRowbodydblclick(Value: TExtGridGridPanelOnRowbodydblclick);
    procedure SetFOnRowbodymousedown(Value: TExtGridGridPanelOnRowbodymousedown);
    procedure SetFOnRowclick(Value: TExtGridGridPanelOnRowclick);
    procedure SetFOnRowcontextmenu(Value: TExtGridGridPanelOnRowcontextmenu);
    procedure SetFOnRowdblclick(Value: TExtGridGridPanelOnRowdblclick);
    procedure SetFOnRowmousedown(Value: TExtGridGridPanelOnRowmousedown);
    procedure SetFOnSortchange(Value: TExtGridGridPanelOnSortchange);
    procedure SetFOnViewready(Value: TExtGridGridPanelOnViewready);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
    function GetObjectNamePrefix: string; override;
  public
    class function JSClassName: string; override;
    function GetColumnModel: TExtFunction;
    function GetDragDropText: TExtFunction;
    function GetGridEl: TExtFunction;
    function GetSelectionModel: TExtFunction;
    function GetStore: TExtFunction;
    function GetView: TExtFunction;
    property AutoExpandColumn: string read FAutoExpandColumn write SetAutoExpandColumn;
    property AutoExpandMax: Integer read FAutoExpandMax write SetFAutoExpandMax;
    property AutoExpandMin: Integer read FAutoExpandMin write SetFAutoExpandMin;
    property Cm: TExtObject read FCm write SetFCm;
    property ColumnLines: Boolean read FColumnLines write SetColumnLines;
    property Columns: TExtObjectList read FColumns;
    property DdGroup: string read FDdGroup write SetFDdGroup;
    property DdText: string read FDdText write SetFDdText;
    property DeferRowRender: Boolean read FDeferRowRender write SetFDeferRowRender;
    property DisableSelection: Boolean read FDisableSelection write SetDisableSelection;
    property EnableColumnHide: Boolean read FEnableColumnHide write SetFEnableColumnHide;
    property EnableColumnMove: Boolean read FEnableColumnMove write SetFEnableColumnMove;
    property EnableColumnResize: Boolean read FEnableColumnResize
      write SetFEnableColumnResize;
    property EnableDragDrop: Boolean read FEnableDragDrop write SetFEnableDragDrop;
    property EnableHdMenu: Boolean read FEnableHdMenu write SetEnableHdMenu;
    property Features: TExtObjectList read FFeatures;
    property HideHeaders: Boolean read FHideHeaders write SetFHideHeaders;
    property LoadMask: TExtObject read FLoadMask write SetFLoadMask;
    property MaxHeight: Integer read FMaxHeight write SetFMaxHeight;
    property MinColumnWidth: Integer read FMinColumnWidth write SetFMinColumnWidth;
    property SelModel: TExtObject read FSelModel write SetSelModel;
    property Sm: TExtObject read FSm write SetFSm;
    property StateEvents: TExtObjectList read FStateEvents write SetFStateEvents;
    property Store: TExtDataStore read FStore write SetStore;
    property StripeRows: Boolean read FStripeRows write SetStripeRows;
    property TrackMouseOver: Boolean read FTrackMouseOver write SetTrackMouseOver;
    property View: TExtObject read FView write SetView;
    property ViewConfig: TExtObject read FViewConfig write SetFViewConfig;
    property LoadMaskBoolean: Boolean read FLoadMaskBoolean write SetFLoadMaskBoolean;
    property OnBodyscroll: TExtGridGridPanelOnBodyscroll read FOnBodyscroll
      write SetFOnBodyscroll;
    property OnCellclick: TExtGridGridPanelOnCellclick read FOnCellclick
      write SetFOnCellclick;
    property OnCellcontextmenu: TExtGridGridPanelOnCellcontextmenu read FOnCellcontextmenu
      write SetFOnCellcontextmenu;
    property OnCelldblclick: TExtGridGridPanelOnCelldblclick read FOnCelldblclick
      write SetFOnCelldblclick;
    property OnCellmousedown: TExtGridGridPanelOnCellmousedown read FOnCellmousedown
      write SetFOnCellmousedown;
    property OnClick: TExtGridGridPanelOnClick read FOnClick write SetFOnClick;
    property OnColumnmove: TExtGridGridPanelOnColumnmove read FOnColumnmove
      write SetFOnColumnmove;
    property OnColumnresize: TExtGridGridPanelOnColumnresize read FOnColumnresize
      write SetFOnColumnresize;
    property OnContainerclick: TExtGridGridPanelOnContainerclick read FOnContainerclick
      write SetFOnContainerclick;
    property OnContainercontextmenu: TExtGridGridPanelOnContainercontextmenu
      read FOnContainercontextmenu write SetFOnContainercontextmenu;
    property OnContainerdblclick: TExtGridGridPanelOnContainerdblclick
      read FOnContainerdblclick write SetFOnContainerdblclick;
    property OnContainermousedown: TExtGridGridPanelOnContainermousedown
      read FOnContainermousedown write SetFOnContainermousedown;
    property OnContextmenu: TExtGridGridPanelOnContextmenu read FOnContextmenu
      write SetFOnContextmenu;
    property OnDblclick: TExtGridGridPanelOnDblclick read FOnDblclick
      write SetFOnDblclick;
    property OnGroupchange: TExtGridGridPanelOnGroupchange read FOnGroupchange
      write SetFOnGroupchange;
    property OnGroupclick: TExtGridGridPanelOnGroupclick read FOnGroupclick
      write SetFOnGroupclick;
    property OnGroupcontextmenu: TExtGridGridPanelOnGroupcontextmenu
      read FOnGroupcontextmenu write SetFOnGroupcontextmenu;
    property OnGroupdblclick: TExtGridGridPanelOnGroupdblclick read FOnGroupdblclick
      write SetFOnGroupdblclick;
    property OnGroupmousedown: TExtGridGridPanelOnGroupmousedown read FOnGroupmousedown
      write SetFOnGroupmousedown;
    property OnHeaderclick: TExtGridGridPanelOnHeaderclick read FOnHeaderclick
      write SetFOnHeaderclick;
    property OnHeadercontextmenu: TExtGridGridPanelOnHeadercontextmenu
      read FOnHeadercontextmenu write SetFOnHeadercontextmenu;
    property OnHeaderdblclick: TExtGridGridPanelOnHeaderdblclick read FOnHeaderdblclick
      write SetFOnHeaderdblclick;
    property OnHeadermousedown: TExtGridGridPanelOnHeadermousedown read FOnHeadermousedown
      write SetFOnHeadermousedown;
    property OnKeydown: TExtGridGridPanelOnKeydown read FOnKeydown write SetFOnKeydown;
    property OnKeypress: TExtGridGridPanelOnKeypress read FOnKeypress
      write SetFOnKeypress;
    property OnMousedown: TExtGridGridPanelOnMousedown read FOnMousedown
      write SetFOnMousedown;
    property OnMouseout: TExtGridGridPanelOnMouseout read FOnMouseout
      write SetFOnMouseout;
    property OnMouseover: TExtGridGridPanelOnMouseover read FOnMouseover
      write SetFOnMouseover;
    property OnMouseup: TExtGridGridPanelOnMouseup read FOnMouseup write SetFOnMouseup;
    property OnRowbodyclick: TExtGridGridPanelOnRowbodyclick read FOnRowbodyclick
      write SetFOnRowbodyclick;
    property OnRowbodycontextmenu: TExtGridGridPanelOnRowbodycontextmenu
      read FOnRowbodycontextmenu write SetFOnRowbodycontextmenu;
    property OnRowbodydblclick: TExtGridGridPanelOnRowbodydblclick read FOnRowbodydblclick
      write SetFOnRowbodydblclick;
    property OnRowbodymousedown: TExtGridGridPanelOnRowbodymousedown
      read FOnRowbodymousedown write SetFOnRowbodymousedown;
    property OnRowclick: TExtGridGridPanelOnRowclick read FOnRowclick
      write SetFOnRowclick;
    property OnRowcontextmenu: TExtGridGridPanelOnRowcontextmenu read FOnRowcontextmenu
      write SetFOnRowcontextmenu;
    property OnRowdblclick: TExtGridGridPanelOnRowdblclick read FOnRowdblclick
      write SetFOnRowdblclick;
    property OnRowmousedown: TExtGridGridPanelOnRowmousedown read FOnRowmousedown
      write SetFOnRowmousedown;
    property OnSortchange: TExtGridGridPanelOnSortchange read FOnSortchange
      write SetFOnSortchange;
    property OnViewready: TExtGridGridPanelOnViewready read FOnViewready
      write SetFOnViewready;
  end;

  // Procedural types for events TExtGridPropertyGrid
  TExtGridPropertyGridOnBeforepropertychange = procedure(Source: TExtObject;
    RecordId: string; Value: string; OldValue: string) of object;
  TExtGridPropertyGridOnPropertychange = procedure(Source: TExtObject; RecordId: string;
    Value: string; OldValue: string) of object;

  TExtGridPropertyGrid = class(TExtGridGridPanel)
  private
    FCustomEditors: TExtObject;
    FCustomRenderers: TExtObject;
    FPropertyNames: TExtObject;
    FSource: TExtObject;
    FOnBeforepropertychange: TExtGridPropertyGridOnBeforepropertychange;
    FOnPropertychange: TExtGridPropertyGridOnPropertychange;
    procedure SetFCustomEditors(Value: TExtObject);
    procedure SetFCustomRenderers(Value: TExtObject);
    procedure SetFPropertyNames(Value: TExtObject);
    procedure _SetSource(const AValue: TExtObject);
    procedure SetFOnBeforepropertychange
      (Value: TExtGridPropertyGridOnBeforepropertychange);
    procedure SetFOnPropertychange(Value: TExtGridPropertyGridOnPropertychange);
  protected
    procedure InitDefaults; override;
    procedure HandleEvent(const AEvtName: string); override;
  public
    class function JSClassName: string; override;
    function GetSource: TExtFunction;
    function RemoveProperty(Prop: string): TExtFunction;
    function SetProperty(Prop: string; Value: string; Create: Boolean = false)
      : TExtFunction;
    function SetSource(const ASource: TExtObject): TExtFunction;
    property CustomEditors: TExtObject read FCustomEditors write SetFCustomEditors;
    property CustomRenderers: TExtObject read FCustomRenderers write SetFCustomRenderers;
    property PropertyNames: TExtObject read FPropertyNames write SetFPropertyNames;
    property Source: TExtObject read FSource write _SetSource;
    property OnBeforepropertychange: TExtGridPropertyGridOnBeforepropertychange
      read FOnBeforepropertychange write SetFOnBeforepropertychange;
    property OnPropertychange: TExtGridPropertyGridOnPropertychange read FOnPropertychange
      write SetFOnPropertychange;
  end;

  TExtGridFeatureFeature = class(TExtUtilObservable)
  end;

  TExtGridGroupingFeature = class(TExtGridFeatureFeature)
  private
    FStartCollapsed: Boolean;
    FEnableGroupingMenu: Boolean;
    FEnableNoGroups: Boolean;
    FHideGroupedHeader: Boolean;
    FShowSummaryRow: Boolean;
    procedure SetStartCollapsed(const AValue: Boolean);
    procedure SetEnableGroupingMenu(const AValue: Boolean);
    procedure SetEnableNoGroups(const AValue: Boolean);
    procedure SetHideGroupedHeader(const AValue: Boolean);
    procedure SetShowSummaryRow(const AValue: Boolean);
  protected
    procedure InitDefaults; override;
  public
    class function JSClassName: string; override;
    property StartCollapsed: Boolean read FStartCollapsed write SetStartCollapsed;
    property EnableGroupingMenu: Boolean read FEnableGroupingMenu write SetEnableGroupingMenu;
    property EnableNoGroups: Boolean read FEnableNoGroups write SetEnableNoGroups;
    property HideGroupedHeader: Boolean read FHideGroupedHeader write SetHideGroupedHeader;
    property ShowSummaryRow: Boolean read FShowSummaryRow write SetShowSummaryRow;
  end;

  TExtGridPluginEditing = class(TExtPluginAbstract)
  end;

  TExtGridPluginCellEditing = class(TExtGridPluginEditing)
  private
    FClicksToEdit: Integer;
    procedure SetClicksToEdit(const AValue: Integer);
  public
    class function JSClassName: string; override;
    property ClicksToEdit: Integer read FClicksToEdit write SetClicksToEdit;
  end;

  TExtGridPluginRowEditing = class(TExtGridPluginEditing)
  public
    class function JSClassName: string; override;
  end;

implementation

uses
  Kitto.JS;

procedure TExtGridRowNumberer.SetFHeader(Value: string);
begin
  FHeader := Value;
  JSCode('header:' + VarToJSON([Value]));
end;

procedure TExtGridRowNumberer.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCode('width:' + VarToJSON([Value]));
end;

class function TExtGridRowNumberer.JSClassName: string;
begin
  Result := 'Ext.grid.RowNumberer';
end;

procedure TExtGridColumn.SetAlign(const AValue: TExtGridColumnAlign);
begin
  FAlign := AValue;
  SetConfigItem('align', TJS.EnumToJSString(TypeInfo(TExtGridColumnAlign), Ord(AValue)));
end;

procedure TExtGridColumn.SetCss(const AValue: string);
begin
  FCss := SetConfigItem('css', AValue);
end;

procedure TExtGridColumn.SetDataIndex(const AValue: string);
begin
  FDataIndex := SetConfigItem('dataIndex', AValue);
end;

procedure TExtGridColumn.SetEditable(const AValue: Boolean);
begin
  FEditable := SetConfigItem('editable', AValue);
end;

procedure TExtGridColumn.SetEditor(AValue: TExtFormField);
begin
  FEditor := AValue;
  SetConfigItem('editor', 'setEditor', AValue);
end;

procedure TExtGridColumn.SetEmptyGroupText(const AValue: string);
begin
  FEmptyGroupText := SetConfigItem('emptyGroupText', AValue);
end;

procedure TExtGridColumn.SetFixed(const AValue: Boolean);
begin
  FFixed := SetConfigItem('fixed', AValue);
end;

procedure TExtGridColumn.SetGroupName(const AValue: string);
begin
  FGroupName := SetConfigItem('groupName', AValue);
end;

procedure TExtGridColumn.SetGroupRenderer(const AValue: TExtFunction);
begin
  FGroupRenderer := SetFunctionConfigItem('groupRenderer', AValue);
end;

procedure TExtGridColumn.SetFGroupable(Value: Boolean);
begin
  FGroupable := Value;
  JSCode('groupable:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetHeader(const AValue: string);
begin
  FHeader := SetConfigItem('header', AValue);
end;

procedure TExtGridColumn.SetHidden(const AValue: Boolean);
begin
  FHidden := SetConfigItem('hidden', 'setHidden', AValue);
end;

procedure TExtGridColumn.SetHideable(const AValue: Boolean);
begin
  FHideable := SetConfigItem('hideable', AValue);
end;

procedure TExtGridColumn.SetFId(Value: string);
begin
  FId := Value;
  JSCode('id:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetFMenuDisabled(Value: Boolean);
begin
  FMenuDisabled := Value;
  JSCode('menuDisabled:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetRenderer(const AValue: string);
begin
  FRenderer := SetConfigItem('renderer', AValue);
end;

procedure TExtGridColumn.SetFResizable(Value: Boolean);
begin
  FResizable := Value;
  JSCode('resizable:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetFScope(Value: TExtObject);
begin
  FScope := Value;
  JSCode('scope:' + VarToJSON([Value, false]));
end;

procedure TExtGridColumn.SetSortable(const AValue: Boolean);
begin
  FSortable := SetConfigItem('sortable', AValue);
end;

procedure TExtGridColumn.SetFTooltip(Value: string);
begin
  FTooltip := Value;
  JSCode('tooltip:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetWidth(const AValue: Integer);
begin
  FWidth := SetConfigItem('width', AValue);
end;

procedure TExtGridColumn.SetFXtype(Value: string);
begin
  FXtype := Value;
  JSCode('xtype:' + VarToJSON([Value]));
end;

procedure TExtGridColumn.SetRendererExtFunction(const AValue: TExtFunction);
begin
  FRendererExtFunction := SetFunctionConfigItem('renderer', AValue);
end;

class function TExtGridColumn.JSClassName: string;
begin
  Result := 'Ext.grid.Column';
end;

function TExtGridColumn.GetObjectNamePrefix: string;
begin
  Result := 'col';
end;

procedure TExtGridColumn.InitDefaults;
begin
  inherited;
  FEditor := TExtFormField.CreateInternal(Self, 'editor');
  FHideable := true;
  FScope := TExtObject.CreateInternal(Self, 'scope');
end;

function TExtGridColumn.GetCellEditor(RowIndex: Integer): TExtFunction;
begin
  JSCode(JSName + '.getCellEditor(' + VarToJSON([RowIndex]) + ');', 'TExtGridColumn');
  Result := Self;
end;


class function TExtGridPropertyRecord.JSClassName: string;
begin
  Result := 'Ext.grid.PropertyRecord';
end;

procedure TExtGridTemplateColumn.SetFTpl(Value: string);
begin
  FTpl := Value;
  JSCode('tpl:' + VarToJSON([Value]));
end;

procedure TExtGridTemplateColumn.SetFTplXTemplate(Value: TExtXTemplate);
begin
  FTplXTemplate := Value;
  JSCode('tpl:' + VarToJSON([Value, false]));
end;

class function TExtGridTemplateColumn.JSClassName: string;
begin
  Result := 'Ext.grid.TemplateColumn';
end;

procedure TExtGridTemplateColumn.InitDefaults;
begin
  inherited;
  FTplXTemplate := TExtXTemplate.CreateInternal(Self, 'tpl');
end;

procedure TExtGridNumberColumn.SetFormat(const AValue: string);
begin
  FFormat := SetConfigItem('format', AValue);
end;

class function TExtGridNumberColumn.JSClassName: string;
begin
  Result := 'Ext.grid.NumberColumn';
end;

procedure TExtGridNumberColumn.InitDefaults;
begin
  inherited;
  FFormat := '0,000.00';
end;

procedure TExtViewTable.SetAutoFill(const AValue: Boolean);
begin
  FAutoFill := SetConfigItem('autoFill', AValue);
end;

procedure TExtViewTable.SetDisableSelection(const AValue: Boolean);
begin
  FDisableSelection := SetConfigItem('disableSelection', AValue);
end;

procedure TExtViewTable.SetFCellSelector(Value: string);
begin
  FCellSelector := Value;
  JSCode('cellSelector:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFCellSelectorDepth(Value: Integer);
begin
  FCellSelectorDepth := Value;
  JSCode('cellSelectorDepth:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFColumnsText(Value: string);
begin
  FColumnsText := Value;
  JSCode('columnsText:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFDeferEmptyText(Value: Boolean);
begin
  FDeferEmptyText := Value;
  JSCode('deferEmptyText:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetEmptyText(const AValue: string);
begin
  FEmptyText := SetConfigItem('emptyText', AValue);
end;

procedure TExtViewTable.SetEnableRowBody(const AValue: Boolean);
begin
  FEnableRowBody := SetConfigItem('enableRowBody', AValue);
end;

procedure TExtViewTable.SetForceFit(const AValue: Boolean);
begin
  FForceFit := SetConfigItem('forceFit', AValue);
end;

procedure TExtViewTable.SetGetRowClass(const AValue: TExtFunction);
begin
  FGetRowClass := SetFunctionConfigItem('getRowClass', AValue);
end;

procedure TExtViewTable.SetFHeadersDisabled(Value: Boolean);
begin
  FHeadersDisabled := Value;
  JSCode('headersDisabled:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFRowBodySelector(Value: string);
begin
  FRowBodySelector := Value;
  JSCode('rowBodySelector:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFRowBodySelectorDepth(Value: Integer);
begin
  FRowBodySelectorDepth := Value;
  JSCode('rowBodySelectorDepth:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFRowSelector(Value: string);
begin
  FRowSelector := Value;
  JSCode('rowSelector:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFRowSelectorDepth(Value: Integer);
begin
  FRowSelectorDepth := Value;
  JSCode('rowSelectorDepth:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFScrollOffset(Value: Integer);
begin
  FScrollOffset := Value;
  JSCode('scrollOffset:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFSelectedRowClass(Value: string);
begin
  FSelectedRowClass := Value;
  JSCode('selectedRowClass:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFSortAscText(Value: string);
begin
  FSortAscText := Value;
  JSCode('sortAscText:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFSortClasses(Value: TExtObjectList);
begin
  FSortClasses := Value;
  JSCode('sortClasses:' + VarToJSON([Value, false]));
end;

procedure TExtViewTable.SetFSortDescText(Value: string);
begin
  FSortDescText := Value;
  JSCode('sortDescText:' + VarToJSON([Value]));
end;

procedure TExtViewTable.SetFMainBody(Value: TExtElement);
begin
  FMainBody := Value;
  JSCode(JSName + '.mainBody=' + VarToJSON([Value, false]) + ';');
end;

procedure TExtViewTable.SetFOnBeforerefresh(Value: TExtViewTableOnBeforerefresh);
begin
  if Assigned(FOnBeforerefresh) then
    JSCode(JSName + '.events ["beforerefresh"].listeners=[];');
  if Assigned(Value) then
    on('beforerefresh', Ajax('beforerefresh', ['View', '%0.nm'], true));
  FOnBeforerefresh := Value;
end;

procedure TExtViewTable.SetFOnBeforerowremoved
  (Value: TExtViewTableOnBeforerowremoved);
begin
  if Assigned(FOnBeforerowremoved) then
    JSCode(JSName + '.events ["beforerowremoved"].listeners=[];');
  if Assigned(Value) then
    on('beforerowremoved', Ajax('beforerowremoved', ['View', '%0.nm', 'RowIndex', '%1',
      'RecordJS', '%2.nm'], true));
  FOnBeforerowremoved := Value;
end;

procedure TExtViewTable.SetFOnBeforerowsinserted
  (Value: TExtViewTableOnBeforerowsinserted);
begin
  if Assigned(FOnBeforerowsinserted) then
    JSCode(JSName + '.events ["beforerowsinserted"].listeners=[];');
  if Assigned(Value) then
    on('beforerowsinserted', Ajax('beforerowsinserted', ['View', '%0.nm', 'FirstRow',
      '%1', 'LastRow', '%2'], true));
  FOnBeforerowsinserted := Value;
end;

procedure TExtViewTable.SetFOnRefresh(Value: TExtViewTableOnRefresh);
begin
  if Assigned(FOnRefresh) then
    JSCode(JSName + '.events ["refresh"].listeners=[];');
  if Assigned(Value) then
    on('refresh', Ajax('refresh', ['View', '%0.nm'], true));
  FOnRefresh := Value;
end;

procedure TExtViewTable.SetFOnRowremoved(Value: TExtViewTableOnRowremoved);
begin
  if Assigned(FOnRowremoved) then
    JSCode(JSName + '.events ["rowremoved"].listeners=[];');
  if Assigned(Value) then
    on('rowremoved', Ajax('rowremoved', ['View', '%0.nm', 'RowIndex', '%1', 'RecordJS',
      '%2.nm'], true));
  FOnRowremoved := Value;
end;

procedure TExtViewTable.SetFOnRowsinserted(Value: TExtViewTableOnRowsinserted);
begin
  if Assigned(FOnRowsinserted) then
    JSCode(JSName + '.events ["rowsinserted"].listeners=[];');
  if Assigned(Value) then
    on('rowsinserted', Ajax('rowsinserted', ['View', '%0.nm', 'FirstRow', '%1', 'LastRow',
      '%2'], true));
  FOnRowsinserted := Value;
end;

procedure TExtViewTable.SetFOnRowupdated(Value: TExtViewTableOnRowupdated);
begin
  if Assigned(FOnRowupdated) then
    JSCode(JSName + '.events ["rowupdated"].listeners=[];');
  if Assigned(Value) then
    on('rowupdated', Ajax('rowupdated', ['View', '%0.nm', 'FirstRow', '%1', 'RecordJS',
      '%2.nm'], true));
  FOnRowupdated := Value;
end;

class function TExtViewTable.JSClassName: string;
begin
  Result := 'Ext.view.Table';
end;

procedure TExtViewTable.InitDefaults;
begin
  inherited;
  FCellSelector := 'td.x-grid3-cell';
  FCellSelectorDepth := 4;
  FColumnsText := 'Columns';
  FDeferEmptyText := true;
  FRowBodySelector := 'div.x-grid3-row';
  FRowBodySelectorDepth := 10;
  FRowSelector := 'div.x-grid3-row';
  FRowSelectorDepth := 10;
  FSelectedRowClass := 'x-grid3-row-selected';
  FSortAscText := 'Sort Ascending';
  FSortClasses := TExtObjectList.CreateInternal(Self, 'sortClasses');
  FSortDescText := 'Sort Descending';
  FMainBody := TExtElement.CreateInternal(Self, 'mainBody');
  DisableSelection := False;
end;

function TExtViewTable.FocusCell(Row: Integer; Col: Integer): TExtFunction;
begin
  JSCode(JSName + '.focusCell(' + VarToJSON([Row, Col]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.FocusRow(Row: Integer): TExtFunction;
begin
  JSCode(JSName + '.focusRow(' + VarToJSON([Row]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.GetCell(Row: Integer; Col: Integer): TExtFunction;
begin
  JSCode(JSName + '.getCell(' + VarToJSON([Row, Col]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.GetHeaderCell(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.getHeaderCell(' + VarToJSON([index]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.GetObjectNamePrefix: string;
begin
  Result := 'viewtable';
end;

function TExtViewTable.GetRow(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.getRow(' + VarToJSON([index]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.Refresh(HeadersToo: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.refresh(' + VarToJSON([HeadersToo]) + ');', 'TExtViewTable');
  Result := Self;
end;

function TExtViewTable.ScrollToTop: TExtFunction;
begin
  JSCode(JSName + '.scrollToTop();', 'TExtViewTable');
  Result := Self;
end;

procedure TExtViewTable.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforerefresh') and Assigned(FOnBeforerefresh) then
    FOnBeforerefresh(TExtViewTable(ParamAsObject('View')))
  else if (AEvtName = 'beforerowremoved') and Assigned(FOnBeforerowremoved) then
    FOnBeforerowremoved(TExtViewTable(ParamAsObject('View')),
      ParamAsInteger('RowIndex'), TExtDataRecord(ParamAsObject('RecordJS')))
  else if (AEvtName = 'beforerowsinserted') and Assigned(FOnBeforerowsinserted) then
    FOnBeforerowsinserted(TExtViewTable(ParamAsObject('View')),
      ParamAsInteger('FirstRow'), ParamAsInteger('LastRow'))
  else if (AEvtName = 'refresh') and Assigned(FOnRefresh) then
    FOnRefresh(TExtViewTable(ParamAsObject('View')))
  else if (AEvtName = 'rowremoved') and Assigned(FOnRowremoved) then
    FOnRowremoved(TExtViewTable(ParamAsObject('View')), ParamAsInteger('RowIndex'),
      TExtDataRecord(ParamAsObject('RecordJS')))
  else if (AEvtName = 'rowsinserted') and Assigned(FOnRowsinserted) then
    FOnRowsinserted(TExtViewTable(ParamAsObject('View')), ParamAsInteger('FirstRow'),
      ParamAsInteger('LastRow'))
  else if (AEvtName = 'rowupdated') and Assigned(FOnRowupdated) then
    FOnRowupdated(TExtViewTable(ParamAsObject('View')), ParamAsInteger('FirstRow'),
      TExtDataRecord(ParamAsObject('RecordJS')));
end;

procedure TExtGridBooleanColumn.SetFFalseText(Value: string);
begin
  FFalseText := Value;
  JSCode('falseText:' + VarToJSON([Value]));
end;

procedure TExtGridBooleanColumn.SetFTrueText(Value: string);
begin
  FTrueText := Value;
  JSCode('trueText:' + VarToJSON([Value]));
end;

procedure TExtGridBooleanColumn.SetFUndefinedText(Value: string);
begin
  FUndefinedText := Value;
  JSCode('undefinedText:' + VarToJSON([Value]));
end;

class function TExtGridBooleanColumn.JSClassName: string;
begin
  Result := 'Ext.grid.BooleanColumn';
end;

procedure TExtGridBooleanColumn.InitDefaults;
begin
  inherited;
  FFalseText := 'false';
  FTrueText := 'true';
end;

procedure TExtGridDateColumn.SetFormat(const AValue: string);
begin
  FFormat := SetConfigItem('format', AValue);
end;

class function TExtGridDateColumn.JSClassName: string;
begin
  Result := 'Ext.grid.DateColumn';
end;

procedure TExtGridDateColumn.InitDefaults;
begin
  inherited;
  FFormat := 'm/d/Y';
end;

procedure TExtGridAbstractSelectionModel.SetGrid(const AValue: TExtObject);
begin
  FGrid.Free;
  FGrid := SetProperty('grid', AValue);
end;

class function TExtGridAbstractSelectionModel.JSClassName: string;
begin
  Result := 'Ext.grid.AbstractSelectionModel';
end;

function TExtGridAbstractSelectionModel.GetObjectNamePrefix: string;
begin
  Result := 'selmodel';
end;

procedure TExtGridAbstractSelectionModel.InitDefaults;
begin
  inherited;
  FGrid := TExtObject.CreateInternal(Self, 'grid');
end;

function TExtGridAbstractSelectionModel.IsLocked: TExtFunction;
begin
  JSCode(JSName + '.isLocked();', 'TExtGridAbstractSelectionModel');
  Result := Self;
end;

function TExtGridAbstractSelectionModel.Lock: TExtFunction;
begin
  JSCode(JSName + '.lock();', 'TExtGridAbstractSelectionModel');
  Result := Self;
end;

function TExtGridAbstractSelectionModel.Unlock: TExtFunction;
begin
  JSCode(JSName + '.unlock();', 'TExtGridAbstractSelectionModel');
  Result := Self;
end;

procedure TExtGridCellSelectionModel.SetFOnBeforecellselect
  (Value: TExtGridCellSelectionModelOnBeforecellselect);
begin
  if Assigned(FOnBeforecellselect) then
    JSCode(JSName + '.events ["beforecellselect"].listeners=[];');
  if Assigned(Value) then
    on('beforecellselect', Ajax('beforecellselect', ['This', '%0.nm', 'RowIndex', '%1',
      'ColIndex', '%2'], true));
  FOnBeforecellselect := Value;
end;

procedure TExtGridCellSelectionModel.SetFOnCellselect
  (Value: TExtGridCellSelectionModelOnCellselect);
begin
  if Assigned(FOnCellselect) then
    JSCode(JSName + '.events ["cellselect"].listeners=[];');
  if Assigned(Value) then
    on('cellselect', Ajax('cellselect', ['This', '%0.nm', 'RowIndex', '%1', 'ColIndex',
      '%2'], true));
  FOnCellselect := Value;
end;

procedure TExtGridCellSelectionModel.SetFOnSelectionchange
  (Value: TExtGridCellSelectionModelOnSelectionchange);
begin
  if Assigned(FOnSelectionchange) then
    JSCode(JSName + '.events ["selectionchange"].listeners=[];');
  if Assigned(Value) then
    on('selectionchange', Ajax('selectionchange', ['This', '%0.nm', 'Selection',
      '%1.nm'], true));
  FOnSelectionchange := Value;
end;

class function TExtGridCellSelectionModel.JSClassName: string;
begin
  Result := 'Ext.grid.CellSelectionModel';
end;

function TExtGridCellSelectionModel.ClearSelections(PreventNotify: Boolean): TExtFunction;
begin
  JSCode(JSName + '.clearSelections(' + VarToJSON([PreventNotify]) + ');',
    'TExtGridCellSelectionModel');
  Result := Self;
end;

function TExtGridCellSelectionModel.GetSelectedCell: TExtFunction;
begin
  JSCode(JSName + '.getSelectedCell();', 'TExtGridCellSelectionModel');
  Result := Self;
end;

function TExtGridCellSelectionModel.HasSelection: TExtFunction;
begin
  JSCode(JSName + '.hasSelection();', 'TExtGridCellSelectionModel');
  Result := Self;
end;

function TExtGridCellSelectionModel.Select(RowIndex: Integer; ColIndex: Integer;
  PreventViewNotify: Boolean = false; PreventFocus: Boolean = false;
  R: TExtDataRecord = nil): TExtFunction;
begin
  JSCode(JSName + '.select(' + VarToJSON([RowIndex, ColIndex, PreventViewNotify,
    PreventFocus, R, false]) + ');', 'TExtGridCellSelectionModel');
  Result := Self;
end;

procedure TExtGridCellSelectionModel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforecellselect') and Assigned(FOnBeforecellselect) then
    FOnBeforecellselect(TExtGridCellSelectionModel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ParamAsInteger('ColIndex'))
  else if (AEvtName = 'cellselect') and Assigned(FOnCellselect) then
    FOnCellselect(TExtGridCellSelectionModel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ParamAsInteger('ColIndex'))
  else if (AEvtName = 'selectionchange') and Assigned(FOnSelectionchange) then
    FOnSelectionchange(TExtGridCellSelectionModel(ParamAsObject('This')),
      TExtObject(ParamAsObject('Selection')));
end;

procedure TExtSelectionRowModel.SetFMoveEditorOnEnter(Value: Boolean);
begin
  FMoveEditorOnEnter := Value;
  JSCode('moveEditorOnEnter:' + VarToJSON([Value]));
end;

procedure TExtSelectionRowModel.SetFOnBeforerowselect
  (Value: TExtSelectionRowModelOnBeforerowselect);
begin
  if Assigned(FOnBeforerowselect) then
    JSCode(JSName + '.events ["beforerowselect"].listeners=[];');
  if Assigned(Value) then
    on('beforerowselect', Ajax('beforerowselect', ['This', '%0.nm', 'RowIndex', '%1',
      'KeepExisting', '%2', 'RecordJS', '%3.nm'], true));
  FOnBeforerowselect := Value;
end;

procedure TExtSelectionRowModel.SetFOnRowdeselect
  (Value: TExtSelectionRowModelOnRowdeselect);
begin
  if Assigned(FOnRowdeselect) then
    JSCode(JSName + '.events ["rowdeselect"].listeners=[];');
  if Assigned(Value) then
    on('rowdeselect', Ajax('rowdeselect', ['This', '%0.nm', 'RowIndex', '%1', 'RecordJS',
      '%2.nm'], true));
  FOnRowdeselect := Value;
end;

procedure TExtSelectionRowModel.SetFOnRowselect
  (Value: TExtSelectionRowModelOnRowselect);
begin
  if Assigned(FOnRowselect) then
    JSCode(JSName + '.events ["rowselect"].listeners=[];');
  if Assigned(Value) then
    on('rowselect', Ajax('rowselect', ['This', '%0.nm', 'RowIndex', '%1', 'R',
      '%2.nm'], true));
  FOnRowselect := Value;
end;

procedure TExtSelectionRowModel.SetFOnSelectionchange
  (Value: TExtSelectionRowModelOnSelectionchange);
begin
  if Assigned(FOnSelectionchange) then
    JSCode(JSName + '.events ["selectionchange"].listeners=[];');
  if Assigned(Value) then
    on('selectionchange', Ajax('selectionchange', ['This', '%0.nm'], true));
  FOnSelectionchange := Value;
end;

procedure TExtSelectionRowModel.SetMode(const AValue: string);
begin
  FMode := SetConfigItem('mode', AValue);
end;

class function TExtSelectionRowModel.JSClassName: string;
begin
  Result := 'Ext.selection.RowModel';
end;

function TExtSelectionRowModel.ClearSelections(Fast: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.clearSelections(' + VarToJSON([Fast]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.DeselectRange(StartRow: Integer; EndRow: Integer)
  : TExtFunction;
begin
  JSCode(JSName + '.deselectRange(' + VarToJSON([StartRow, EndRow]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.DeselectRow(Row: Integer;
  PreventViewNotify: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.deselectRow(' + VarToJSON([Row, PreventViewNotify]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.Each(const AFunction: TExtFunction; const AScope: TExtObject): TExtFunction;
begin
  Result := CallMethod('each', [AFunction, True, AScope, False]);
end;

function TExtSelectionRowModel.GetCount: TExtFunction;
begin
  Result := CallMethod('getCount', []);
end;

function TExtSelectionRowModel.GetSelected: TExtFunction;
begin
  Result := CallMethod('getSelected', []);
end;

function TExtSelectionRowModel.GetSelections: TExtFunction;
begin
  Result := CallMethod('getSelections', []);
end;

function TExtSelectionRowModel.HasNext: TExtFunction;
begin
  Result := CallMethod('hasNext', []);
end;

function TExtSelectionRowModel.HasPrevious: TExtFunction;
begin
  Result := CallMethod('hasPrevious', []);
end;

function TExtSelectionRowModel.HasSelection: TExtFunction;
begin
  JSCode(JSName + '.hasSelection();', 'TExtSelectionRowModel');
  Result := Self;
end;

procedure TExtSelectionRowModel.InitDefaults;
begin
  inherited;
  FMode := SINGLE_SELECT;
end;

function TExtSelectionRowModel.IsIdSelected(Id: string): TExtFunction;
begin
  JSCode(JSName + '.isIdSelected(' + VarToJSON([Id]) + ');', 'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.IsSelected(Index: Integer): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([index]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.IsSelected(Index: TExtDataRecord): TExtFunction;
begin
  JSCode(JSName + '.isSelected(' + VarToJSON([index, false]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.Select(const AIndex: Integer; const AKeepExisting: Boolean): TExtFunction;
begin
  Result := CallMethod('select', [AIndex, AKeepExisting]);
end;

function TExtSelectionRowModel.SelectAll: TExtFunction;
begin
  JSCode(JSName + '.selectAll();', 'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectNext(KeepExisting: Boolean): TExtFunction;
begin
  JSCode(JSName + '.selectNext(' + VarToJSON([KeepExisting]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectPrevious(KeepExisting: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.selectPrevious(' + VarToJSON([KeepExisting]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectRange(StartRow: Integer; EndRow: Integer;
  KeepExisting: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.selectRange(' + VarToJSON([StartRow, EndRow, KeepExisting]) + ');',
    'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectRecords(Records: TExtObjectList;
  KeepExisting: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.selectRecords(' + VarToJSON(Records) + ',' + VarToJSON([KeepExisting])
    + ');', 'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectRow(Row: Integer; KeepExisting: Boolean = false;
  PreventViewNotify: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.selectRow(' + VarToJSON([Row, KeepExisting, PreventViewNotify]) +
    ');', 'TExtSelectionRowModel');
  Result := Self;
end;

function TExtSelectionRowModel.SelectRows(Rows: TExtObjectList;
  KeepExisting: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.selectRows(' + VarToJSON(Rows) + ',' + VarToJSON([KeepExisting]) +
    ');', 'TExtSelectionRowModel');
  Result := Self;
end;

procedure TExtSelectionRowModel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforerowselect') and Assigned(FOnBeforerowselect) then
    FOnBeforerowselect(TExtSelectionRowModel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ParamAsBoolean('KeepExisting'),
      TExtDataRecord(ParamAsObject('RecordJS')))
  else if (AEvtName = 'rowdeselect') and Assigned(FOnRowdeselect) then
    FOnRowdeselect(TExtSelectionRowModel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), TExtDataRecord(ParamAsObject('RecordJS')))
  else if (AEvtName = 'rowselect') and Assigned(FOnRowselect) then
    FOnRowselect(TExtSelectionRowModel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), TExtDataRecord(ParamAsObject('R')))
  else if (AEvtName = 'selectionchange') and Assigned(FOnSelectionchange) then
    FOnSelectionchange(TExtSelectionRowModel(ParamAsObject('This')));
end;

procedure TExtGridGroupingView.SetEmptyGroupText(const AValue: string);
begin
  FEmptyGroupText := SetConfigItem('emptyGroupText', AValue);
end;

procedure TExtGridGroupingView.SetEnableGrouping(const AValue: Boolean);
begin
  FEnableGrouping := SetConfigItem('enableGrouping', AValue);
end;

procedure TExtGridGroupingView.SetEnableGroupingMenu(const AValue: Boolean);
begin
  FEnableGroupingMenu := SetConfigItem('enableGroupingMenu', AValue);
end;

procedure TExtGridGroupingView.SetEnableNoGroups(const AValue: Boolean);
begin
  FEnableNoGroups := SetConfigItem('enableNoGroups', AValue);
end;

procedure TExtGridGroupingView.SetFGroupByText(Value: string);
begin
  FGroupByText := Value;
  JSCode('groupByText:' + VarToJSON([Value]));
end;

procedure TExtGridGroupingView.SetGroupMode(const AValue: string);
begin
  FGroupMode := SetConfigItem('groupMode', AValue);
end;

procedure TExtGridGroupingView.SetGroupRenderer(const AValue: TExtFunction);
begin
  FGroupRenderer := SetFunctionConfigItem('groupRenderer', AValue);
end;

procedure TExtGridGroupingView.SetGroupTextTpl(const AValue: string);
begin
  FGroupTextTpl := SetConfigItem('groupTextTpl', AValue);
end;

procedure TExtGridGroupingView.SetHideGroupedColumn(const AValue: Boolean);
begin
  FHideGroupedColumn := SetConfigItem('hideGroupedColumn', AValue);
end;

procedure TExtGridGroupingView.SetFIgnoreAdd(Value: Boolean);
begin
  FIgnoreAdd := Value;
  JSCode('ignoreAdd:' + VarToJSON([Value]));
end;

procedure TExtGridGroupingView.SetShowGroupName(const AValue: Boolean);
begin
  FShowGroupName := SetConfigItem('showGroupName', AValue);
end;

procedure TExtGridGroupingView.SetShowGroupsText(const AValue: string);
begin
  FShowGroupsText := SetConfigItem('showGroupsText', AValue);
end;

procedure TExtGridGroupingView.SetStartCollapsed(const AValue: Boolean);
begin
  FStartCollapsed := SetConfigItem('startCollapsed', AValue);
end;

class function TExtGridGroupingView.JSClassName: string;
begin
  Result := 'Ext.grid.GroupingView';
end;

procedure TExtGridGroupingView.InitDefaults;
begin
  inherited;
  FEnableGrouping := true;
  FEnableGroupingMenu := true;
  FEnableNoGroups := true;
  FGroupByText := 'Group By This Field';
  FGroupTextTpl := '{text}';
  FShowGroupName := true;
  FShowGroupsText := 'Show in Groups';
end;

function TExtGridGroupingView.CollapseAllGroups: TExtFunction;
begin
  JSCode(JSName + '.collapseAllGroups();', 'TExtGridGroupingView');
  Result := Self;
end;

function TExtGridGroupingView.ExpandAllGroups: TExtFunction;
begin
  JSCode(JSName + '.expandAllGroups();', 'TExtGridGroupingView');
  Result := Self;
end;

function TExtGridGroupingView.GetGroupId(Value: string): TExtFunction;
begin
  JSCode(JSName + '.getGroupId(' + VarToJSON([Value]) + ');', 'TExtGridGroupingView');
  Result := Self;
end;

function TExtGridGroupingView.ToggleAllGroups(Expanded: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.toggleAllGroups(' + VarToJSON([Expanded]) + ');',
    'TExtGridGroupingView');
  Result := Self;
end;

function TExtGridGroupingView.ToggleGroup(GroupId: string; Expanded: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.toggleGroup(' + VarToJSON([GroupId, Expanded]) + ');',
    'TExtGridGroupingView');
  Result := Self;
end;

function TExtGridGroupingView.ToggleRowIndex(RowIndex: Integer; Expanded: Boolean = false)
  : TExtFunction;
begin
  JSCode(JSName + '.toggleRowIndex(' + VarToJSON([RowIndex, Expanded]) + ');',
    'TExtGridGroupingView');
  Result := Self;
end;

procedure TExtGridCheckboxSelectionModel.SetFCheckOnly(Value: Boolean);
begin
  FCheckOnly := Value;
  JSCode('checkOnly:' + VarToJSON([Value]));
end;

procedure TExtGridCheckboxSelectionModel.SetFHeader(Value: string);
begin
  FHeader := Value;
  JSCode('header:' + VarToJSON([Value]));
end;

procedure TExtGridCheckboxSelectionModel.SetFSortable(Value: Boolean);
begin
  FSortable := Value;
  JSCode('sortable:' + VarToJSON([Value]));
end;

procedure TExtGridCheckboxSelectionModel.SetFWidth(Value: Integer);
begin
  FWidth := Value;
  JSCode('width:' + VarToJSON([Value]));
end;

class function TExtGridCheckboxSelectionModel.JSClassName: string;
begin
  Result := 'Ext.grid.CheckboxSelectionModel';
end;

procedure TExtGridCheckboxSelectionModel.InitDefaults;
begin
  inherited;
  FWidth := 20;
end;

procedure TExtGridGridPanel.SetAutoExpandColumn(const AValue: string);
begin
  FAutoExpandColumn := SetConfigItem('autoExpandColumn', AValue);
end;

procedure TExtGridGridPanel.SetFAutoExpandMax(Value: Integer);
begin
  FAutoExpandMax := Value;
  JSCode('autoExpandMax:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFAutoExpandMin(Value: Integer);
begin
  FAutoExpandMin := Value;
  JSCode('autoExpandMin:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFCm(Value: TExtObject);
begin
  FCm := Value;
  JSCode('cm:' + VarToJSON([Value, false]));
end;

procedure TExtGridGridPanel.SetColumnLines(const AValue: Boolean);
begin
  FColumnLines := SetConfigItem('columnLines', AValue);
end;

procedure TExtGridGridPanel.SetFDdGroup(Value: string);
begin
  FDdGroup := Value;
  JSCode('ddGroup:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFDdText(Value: string);
begin
  FDdText := Value;
  JSCode('ddText:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFDeferRowRender(Value: Boolean);
begin
  FDeferRowRender := Value;
  JSCode('deferRowRender:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetDisableSelection(const AValue: Boolean);
begin
  FDisableSelection := SetConfigItem('disableSelection', AValue);
end;

procedure TExtGridGridPanel.SetFEnableColumnHide(Value: Boolean);
begin
  FEnableColumnHide := Value;
  JSCode('enableColumnHide:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFEnableColumnMove(Value: Boolean);
begin
  FEnableColumnMove := Value;
  JSCode('enableColumnMove:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFEnableColumnResize(Value: Boolean);
begin
  FEnableColumnResize := Value;
  JSCode('enableColumnResize:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFEnableDragDrop(Value: Boolean);
begin
  FEnableDragDrop := Value;
  JSCode('enableDragDrop:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetEnableHdMenu(AValue: Boolean);
begin
  FEnableHdMenu := SetConfigItem('enableHdMenu', AValue);
end;

procedure TExtGridGridPanel.SetFHideHeaders(Value: Boolean);
begin
  FHideHeaders := Value;
  JSCode('hideHeaders:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFLoadMask(Value: TExtObject);
begin
  FLoadMask := Value;
  JSCode('loadMask:' + VarToJSON([Value, false]));
end;

procedure TExtGridGridPanel.SetFMaxHeight(Value: Integer);
begin
  FMaxHeight := Value;
  JSCode('maxHeight:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFMinColumnWidth(Value: Integer);
begin
  FMinColumnWidth := Value;
  JSCode('minColumnWidth:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetSelModel(const AValue: TExtObject);
begin
  FSelModel := SetConfigItem('selModel', AValue);
end;

procedure TExtGridGridPanel.SetFSm(Value: TExtObject);
begin
  FSm := Value;
  JSCode('sm:' + VarToJSON([Value, false]));
end;

procedure TExtGridGridPanel.SetFStateEvents(Value: TExtObjectList);
begin
  FStateEvents.Free;
  FStateEvents := Value;
  JSCode('stateEvents:' + VarToJSON([Value, false]));
end;

procedure TExtGridGridPanel.SetStore(const AValue: TExtDataStore);
begin
  FStore.Free;
  FStore := AValue;
  SetConfigItem('store', AValue);
end;

procedure TExtGridGridPanel.SetStripeRows(const AValue: Boolean);
begin
  FStripeRows := SetConfigItem('stripeRows', AValue);
end;

procedure TExtGridGridPanel.SetTrackMouseOver(const AValue: Boolean);
begin
  FTrackMouseOver := SetConfigItem('trackMouseOver', AValue);
end;

procedure TExtGridGridPanel.SetView(const AValue: TExtObject);
begin
  FView.Free;
  FView := SetConfigItem('view', AValue);
end;

procedure TExtGridGridPanel.SetFViewConfig(const AValue: TExtObject);
begin
  FViewConfig.Free;
  FViewConfig := SetConfigItem('viewConfig', AValue);
end;

procedure TExtGridGridPanel.SetFLoadMaskBoolean(Value: Boolean);
begin
  FLoadMaskBoolean := Value;
  JSCode('loadMask:' + VarToJSON([Value]));
end;

procedure TExtGridGridPanel.SetFOnBodyscroll(Value: TExtGridGridPanelOnBodyscroll);
begin
  if Assigned(FOnBodyscroll) then
    JSCode(JSName + '.events ["bodyscroll"].listeners=[];');
  if Assigned(Value) then
    on('bodyscroll', Ajax('bodyscroll', ['ScrollLeft', '%0', 'ScrollTop', '%1'], true));
  FOnBodyscroll := Value;
end;

procedure TExtGridGridPanel.SetFOnCellclick(Value: TExtGridGridPanelOnCellclick);
begin
  if Assigned(FOnCellclick) then
    JSCode(JSName + '.events ["cellclick"].listeners=[];');
  if Assigned(Value) then
    on('cellclick', Ajax('cellclick', ['This', '%0.nm', 'RowIndex', '%1', 'ColumnIndex',
      '%2', 'E', '%3.nm'], true));
  FOnCellclick := Value;
end;

procedure TExtGridGridPanel.SetFOnCellcontextmenu
  (Value: TExtGridGridPanelOnCellcontextmenu);
begin
  if Assigned(FOnCellcontextmenu) then
    JSCode(JSName + '.events ["cellcontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('cellcontextmenu', Ajax('cellcontextmenu', ['This', '%0.nm', 'RowIndex', '%1',
      'CellIndex', '%2', 'E', '%3.nm'], true));
  FOnCellcontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnCelldblclick(Value: TExtGridGridPanelOnCelldblclick);
begin
  if Assigned(FOnCelldblclick) then
    JSCode(JSName + '.events ["celldblclick"].listeners=[];');
  if Assigned(Value) then
    on('celldblclick', Ajax('celldblclick', ['This', '%0.nm', 'RowIndex', '%1',
      'ColumnIndex', '%2', 'E', '%3.nm'], true));
  FOnCelldblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnCellmousedown(Value: TExtGridGridPanelOnCellmousedown);
begin
  if Assigned(FOnCellmousedown) then
    JSCode(JSName + '.events ["cellmousedown"].listeners=[];');
  if Assigned(Value) then
    on('cellmousedown', Ajax('cellmousedown', ['This', '%0.nm', 'RowIndex', '%1',
      'ColumnIndex', '%2', 'E', '%3.nm'], true));
  FOnCellmousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnClick(Value: TExtGridGridPanelOnClick);
begin
  if Assigned(FOnClick) then
    JSCode(JSName + '.events ["click"].listeners=[];');
  if Assigned(Value) then
    on('click', Ajax('click', ['E', '%0.nm'], true));
  FOnClick := Value;
end;

procedure TExtGridGridPanel.SetFOnColumnmove(Value: TExtGridGridPanelOnColumnmove);
begin
  if Assigned(FOnColumnmove) then
    JSCode(JSName + '.events ["columnmove"].listeners=[];');
  if Assigned(Value) then
    on('columnmove', Ajax('columnmove', ['OldIndex', '%0', 'NewIndex', '%1'], true));
  FOnColumnmove := Value;
end;

procedure TExtGridGridPanel.SetFOnColumnresize(Value: TExtGridGridPanelOnColumnresize);
begin
  if Assigned(FOnColumnresize) then
    JSCode(JSName + '.events ["columnresize"].listeners=[];');
  if Assigned(Value) then
    on('columnresize', Ajax('columnresize', ['ColumnIndex', '%0', 'NewSize',
      '%1'], true));
  FOnColumnresize := Value;
end;

procedure TExtGridGridPanel.SetFOnContainerclick
  (Value: TExtGridGridPanelOnContainerclick);
begin
  if Assigned(FOnContainerclick) then
    JSCode(JSName + '.events ["containerclick"].listeners=[];');
  if Assigned(Value) then
    on('containerclick', Ajax('containerclick', ['This', '%0.nm', 'E', '%1.nm'], true));
  FOnContainerclick := Value;
end;

procedure TExtGridGridPanel.SetFOnContainercontextmenu
  (Value: TExtGridGridPanelOnContainercontextmenu);
begin
  if Assigned(FOnContainercontextmenu) then
    JSCode(JSName + '.events ["containercontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('containercontextmenu', Ajax('containercontextmenu', ['This', '%0.nm', 'E',
      '%1.nm'], true));
  FOnContainercontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnContainerdblclick
  (Value: TExtGridGridPanelOnContainerdblclick);
begin
  if Assigned(FOnContainerdblclick) then
    JSCode(JSName + '.events ["containerdblclick"].listeners=[];');
  if Assigned(Value) then
    on('containerdblclick', Ajax('containerdblclick', ['This', '%0.nm', 'E',
      '%1.nm'], true));
  FOnContainerdblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnContainermousedown
  (Value: TExtGridGridPanelOnContainermousedown);
begin
  if Assigned(FOnContainermousedown) then
    JSCode(JSName + '.events ["containermousedown"].listeners=[];');
  if Assigned(Value) then
    on('containermousedown', Ajax('containermousedown', ['This', '%0.nm', 'E',
      '%1.nm'], true));
  FOnContainermousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnContextmenu(Value: TExtGridGridPanelOnContextmenu);
begin
  if Assigned(FOnContextmenu) then
    JSCode(JSName + '.events ["contextmenu"].listeners=[];');
  if Assigned(Value) then
    on('contextmenu', Ajax('contextmenu', ['E', '%0.nm'], true));
  FOnContextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnDblclick(Value: TExtGridGridPanelOnDblclick);
begin
  if Assigned(FOnDblclick) then
    JSCode(JSName + '.events ["dblclick"].listeners=[];');
  if Assigned(Value) then
    on('dblclick', Ajax('dblclick', ['E', '%0.nm'], true));
  FOnDblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnGroupchange(Value: TExtGridGridPanelOnGroupchange);
begin
  if Assigned(FOnGroupchange) then
    JSCode(JSName + '.events ["groupchange"].listeners=[];');
  if Assigned(Value) then
    on('groupchange', Ajax('groupchange', ['This', '%0.nm', 'GroupField', '%1'], true));
  FOnGroupchange := Value;
end;

procedure TExtGridGridPanel.SetFOnGroupclick(Value: TExtGridGridPanelOnGroupclick);
begin
  if Assigned(FOnGroupclick) then
    JSCode(JSName + '.events ["groupclick"].listeners=[];');
  if Assigned(Value) then
    on('groupclick', Ajax('groupclick', ['This', '%0.nm', 'GroupField', '%1',
      'GroupValue', '%2', 'E', '%3.nm'], true));
  FOnGroupclick := Value;
end;

procedure TExtGridGridPanel.SetFOnGroupcontextmenu
  (Value: TExtGridGridPanelOnGroupcontextmenu);
begin
  if Assigned(FOnGroupcontextmenu) then
    JSCode(JSName + '.events ["groupcontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('groupcontextmenu', Ajax('groupcontextmenu', ['This', '%0.nm', 'GroupField', '%1',
      'GroupValue', '%2', 'E', '%3.nm'], true));
  FOnGroupcontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnGroupdblclick(Value: TExtGridGridPanelOnGroupdblclick);
begin
  if Assigned(FOnGroupdblclick) then
    JSCode(JSName + '.events ["groupdblclick"].listeners=[];');
  if Assigned(Value) then
    on('groupdblclick', Ajax('groupdblclick', ['This', '%0.nm', 'GroupField', '%1',
      'GroupValue', '%2', 'E', '%3.nm'], true));
  FOnGroupdblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnGroupmousedown
  (Value: TExtGridGridPanelOnGroupmousedown);
begin
  if Assigned(FOnGroupmousedown) then
    JSCode(JSName + '.events ["groupmousedown"].listeners=[];');
  if Assigned(Value) then
    on('groupmousedown', Ajax('groupmousedown', ['This', '%0.nm', 'GroupField', '%1',
      'GroupValue', '%2', 'E', '%3.nm'], true));
  FOnGroupmousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnHeaderclick(Value: TExtGridGridPanelOnHeaderclick);
begin
  if Assigned(FOnHeaderclick) then
    JSCode(JSName + '.events ["headerclick"].listeners=[];');
  if Assigned(Value) then
    on('headerclick', Ajax('headerclick', ['This', '%0.nm', 'ColumnIndex', '%1', 'E',
      '%2.nm'], true));
  FOnHeaderclick := Value;
end;

procedure TExtGridGridPanel.SetFOnHeadercontextmenu
  (Value: TExtGridGridPanelOnHeadercontextmenu);
begin
  if Assigned(FOnHeadercontextmenu) then
    JSCode(JSName + '.events ["headercontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('headercontextmenu', Ajax('headercontextmenu', ['This', '%0.nm', 'ColumnIndex',
      '%1', 'E', '%2.nm'], true));
  FOnHeadercontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnHeaderdblclick
  (Value: TExtGridGridPanelOnHeaderdblclick);
begin
  if Assigned(FOnHeaderdblclick) then
    JSCode(JSName + '.events ["headerdblclick"].listeners=[];');
  if Assigned(Value) then
    on('headerdblclick', Ajax('headerdblclick', ['This', '%0.nm', 'ColumnIndex', '%1',
      'E', '%2.nm'], true));
  FOnHeaderdblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnHeadermousedown
  (Value: TExtGridGridPanelOnHeadermousedown);
begin
  if Assigned(FOnHeadermousedown) then
    JSCode(JSName + '.events ["headermousedown"].listeners=[];');
  if Assigned(Value) then
    on('headermousedown', Ajax('headermousedown', ['This', '%0.nm', 'ColumnIndex', '%1',
      'E', '%2.nm'], true));
  FOnHeadermousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnKeydown(Value: TExtGridGridPanelOnKeydown);
begin
  if Assigned(FOnKeydown) then
    JSCode(JSName + '.events ["keydown"].listeners=[];');
  if Assigned(Value) then
    on('keydown', Ajax('keydown', ['E', '%0.nm'], true));
  FOnKeydown := Value;
end;

procedure TExtGridGridPanel.SetFOnKeypress(Value: TExtGridGridPanelOnKeypress);
begin
  if Assigned(FOnKeypress) then
    JSCode(JSName + '.events ["keypress"].listeners=[];');
  if Assigned(Value) then
    on('keypress', Ajax('keypress', ['E', '%0.nm'], true));
  FOnKeypress := Value;
end;

procedure TExtGridGridPanel.SetFOnMousedown(Value: TExtGridGridPanelOnMousedown);
begin
  if Assigned(FOnMousedown) then
    JSCode(JSName + '.events ["mousedown"].listeners=[];');
  if Assigned(Value) then
    on('mousedown', Ajax('mousedown', ['E', '%0.nm'], true));
  FOnMousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnMouseout(Value: TExtGridGridPanelOnMouseout);
begin
  if Assigned(FOnMouseout) then
    JSCode(JSName + '.events ["mouseout"].listeners=[];');
  if Assigned(Value) then
    on('mouseout', Ajax('mouseout', ['E', '%0.nm'], true));
  FOnMouseout := Value;
end;

procedure TExtGridGridPanel.SetFOnMouseover(Value: TExtGridGridPanelOnMouseover);
begin
  if Assigned(FOnMouseover) then
    JSCode(JSName + '.events ["mouseover"].listeners=[];');
  if Assigned(Value) then
    on('mouseover', Ajax('mouseover', ['E', '%0.nm'], true));
  FOnMouseover := Value;
end;

procedure TExtGridGridPanel.SetFOnMouseup(Value: TExtGridGridPanelOnMouseup);
begin
  if Assigned(FOnMouseup) then
    JSCode(JSName + '.events ["mouseup"].listeners=[];');
  if Assigned(Value) then
    on('mouseup', Ajax('mouseup', ['E', '%0.nm'], true));
  FOnMouseup := Value;
end;

procedure TExtGridGridPanel.SetFOnRowbodyclick(Value: TExtGridGridPanelOnRowbodyclick);
begin
  if Assigned(FOnRowbodyclick) then
    JSCode(JSName + '.events ["rowbodyclick"].listeners=[];');
  if Assigned(Value) then
    on('rowbodyclick', Ajax('rowbodyclick', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowbodyclick := Value;
end;

procedure TExtGridGridPanel.SetFOnRowbodycontextmenu
  (Value: TExtGridGridPanelOnRowbodycontextmenu);
begin
  if Assigned(FOnRowbodycontextmenu) then
    JSCode(JSName + '.events ["rowbodycontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('rowbodycontextmenu', Ajax('rowbodycontextmenu', ['This', '%0.nm', 'RowIndex',
      '%1', 'E', '%2.nm'], true));
  FOnRowbodycontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnRowbodydblclick
  (Value: TExtGridGridPanelOnRowbodydblclick);
begin
  if Assigned(FOnRowbodydblclick) then
    JSCode(JSName + '.events ["rowbodydblclick"].listeners=[];');
  if Assigned(Value) then
    on('rowbodydblclick', Ajax('rowbodydblclick', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowbodydblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnRowbodymousedown
  (Value: TExtGridGridPanelOnRowbodymousedown);
begin
  if Assigned(FOnRowbodymousedown) then
    JSCode(JSName + '.events ["rowbodymousedown"].listeners=[];');
  if Assigned(Value) then
    on('rowbodymousedown', Ajax('rowbodymousedown', ['This', '%0.nm', 'RowIndex', '%1',
      'E', '%2.nm'], true));
  FOnRowbodymousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnRowclick(Value: TExtGridGridPanelOnRowclick);
begin
  if Assigned(FOnRowclick) then
    JSCode(JSName + '.events ["rowclick"].listeners=[];');
  if Assigned(Value) then
    on('rowclick', Ajax('rowclick', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowclick := Value;
end;

procedure TExtGridGridPanel.SetFOnRowcontextmenu
  (Value: TExtGridGridPanelOnRowcontextmenu);
begin
  if Assigned(FOnRowcontextmenu) then
    JSCode(JSName + '.events ["rowcontextmenu"].listeners=[];');
  if Assigned(Value) then
    on('rowcontextmenu', Ajax('rowcontextmenu', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowcontextmenu := Value;
end;

procedure TExtGridGridPanel.SetFOnRowdblclick(Value: TExtGridGridPanelOnRowdblclick);
begin
  if Assigned(FOnRowdblclick) then
    JSCode(JSName + '.events ["rowdblclick"].listeners=[];');
  if Assigned(Value) then
    on('rowdblclick', Ajax('rowdblclick', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowdblclick := Value;
end;

procedure TExtGridGridPanel.SetFOnRowmousedown(Value: TExtGridGridPanelOnRowmousedown);
begin
  if Assigned(FOnRowmousedown) then
    JSCode(JSName + '.events ["rowmousedown"].listeners=[];');
  if Assigned(Value) then
    on('rowmousedown', Ajax('rowmousedown', ['This', '%0.nm', 'RowIndex', '%1', 'E',
      '%2.nm'], true));
  FOnRowmousedown := Value;
end;

procedure TExtGridGridPanel.SetFOnSortchange(Value: TExtGridGridPanelOnSortchange);
begin
  if Assigned(FOnSortchange) then
    JSCode(JSName + '.events ["sortchange"].listeners=[];');
  if Assigned(Value) then
    on('sortchange', Ajax('sortchange', ['This', '%0.nm', 'SortInfo', '%1.nm'], true));
  FOnSortchange := Value;
end;

procedure TExtGridGridPanel.SetFOnViewready(Value: TExtGridGridPanelOnViewready);
begin
  if Assigned(FOnViewready) then
    JSCode(JSName + '.events ["viewready"].listeners=[];');
  if Assigned(Value) then
    on('viewready', Ajax('viewready', ['This', '%0.nm'], true));
  FOnViewready := Value;
end;

class function TExtGridGridPanel.JSClassName: string;
begin
  Result := 'Ext.grid.Panel';
end;

procedure TExtGridGridPanel.InitDefaults;
begin
  inherited;
  FCm := TExtObject.CreateInternal(Self, 'cm');
  FColumns := TExtObjectList.CreateInternal(Self, 'columns');
  FFeatures := TExtObjectList.CreateInternal(Self, 'features');
  FLoadMask := TExtObject.CreateInternal(Self, 'loadMask');
  FSelModel := TExtObject.CreateInternal(Self, 'selModel');
  FSm := TExtObject.CreateInternal(Self, 'sm');
  FStateEvents := TExtObjectList.CreateInternal(Self, 'stateEvents');
  FStore := TExtDataStore.CreateInternal(Self, 'store');
  FView := TExtObject.CreateInternal(Self, 'view');
  FViewConfig := TExtObject.CreateInternal(Self, 'viewConfig');
  DisableSelection := False;
end;

function TExtGridGridPanel.GetColumnModel: TExtFunction;
begin
  JSCode(JSName + '.getColumnModel();', 'TExtGridGridPanel');
  Result := Self;
end;

function TExtGridGridPanel.GetDragDropText: TExtFunction;
begin
  JSCode(JSName + '.getDragDropText();', 'TExtGridGridPanel');
  Result := Self;
end;

function TExtGridGridPanel.GetGridEl: TExtFunction;
begin
  JSCode(JSName + '.getGridEl();', 'TExtGridGridPanel');
  Result := Self;
end;

function TExtGridGridPanel.GetObjectNamePrefix: string;
begin
  Result := 'gridpnl';
end;

function TExtGridGridPanel.GetSelectionModel: TExtFunction;
begin
  JSCode(JSName + '.getSelectionModel();', 'TExtGridGridPanel');
  Result := Self;
end;

function TExtGridGridPanel.GetStore: TExtFunction;
begin
  JSCode(JSName + '.getStore();', 'TExtGridGridPanel');
  Result := Self;
end;

function TExtGridGridPanel.GetView: TExtFunction;
begin
  JSCode(JSName + '.getView();', 'TExtGridGridPanel');
  Result := Self;
end;

procedure TExtGridGridPanel.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'bodyscroll') and Assigned(FOnBodyscroll) then
    FOnBodyscroll(ParamAsInteger('ScrollLeft'), ParamAsInteger('ScrollTop'))
  else if (AEvtName = 'cellclick') and Assigned(FOnCellclick) then
    FOnCellclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'cellcontextmenu') and Assigned(FOnCellcontextmenu) then
    FOnCellcontextmenu(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ParamAsInteger('CellIndex'), ExtEventObject)
  else if (AEvtName = 'celldblclick') and Assigned(FOnCelldblclick) then
    FOnCelldblclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'cellmousedown') and Assigned(FOnCellmousedown) then
    FOnCellmousedown(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'click') and Assigned(FOnClick) then
    FOnClick(ExtEventObject)
  else if (AEvtName = 'columnmove') and Assigned(FOnColumnmove) then
    FOnColumnmove(ParamAsInteger('OldIndex'), ParamAsInteger('NewIndex'))
  else if (AEvtName = 'columnresize') and Assigned(FOnColumnresize) then
    FOnColumnresize(ParamAsInteger('ColumnIndex'), ParamAsInteger('NewSize'))
  else if (AEvtName = 'containerclick') and Assigned(FOnContainerclick) then
    FOnContainerclick(TExtGridGridPanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containercontextmenu') and Assigned(FOnContainercontextmenu) then
    FOnContainercontextmenu(TExtGridGridPanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containerdblclick') and Assigned(FOnContainerdblclick) then
    FOnContainerdblclick(TExtGridGridPanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'containermousedown') and Assigned(FOnContainermousedown) then
    FOnContainermousedown(TExtGridGridPanel(ParamAsObject('This')), ExtEventObject)
  else if (AEvtName = 'contextmenu') and Assigned(FOnContextmenu) then
    FOnContextmenu(ExtEventObject)
  else if (AEvtName = 'dblclick') and Assigned(FOnDblclick) then
    FOnDblclick(ExtEventObject)
  else if (AEvtName = 'groupchange') and Assigned(FOnGroupchange) then
    FOnGroupchange(TExtGridGridPanel(ParamAsObject('This')), ParamAsString('GroupField'))
  else if (AEvtName = 'groupclick') and Assigned(FOnGroupclick) then
    FOnGroupclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsString('GroupField'),
      ParamAsString('GroupValue'), ExtEventObject)
  else if (AEvtName = 'groupcontextmenu') and Assigned(FOnGroupcontextmenu) then
    FOnGroupcontextmenu(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsString('GroupField'), ParamAsString('GroupValue'), ExtEventObject)
  else if (AEvtName = 'groupdblclick') and Assigned(FOnGroupdblclick) then
    FOnGroupdblclick(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsString('GroupField'), ParamAsString('GroupValue'), ExtEventObject)
  else if (AEvtName = 'groupmousedown') and Assigned(FOnGroupmousedown) then
    FOnGroupmousedown(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsString('GroupField'), ParamAsString('GroupValue'), ExtEventObject)
  else if (AEvtName = 'headerclick') and Assigned(FOnHeaderclick) then
    FOnHeaderclick(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'headercontextmenu') and Assigned(FOnHeadercontextmenu) then
    FOnHeadercontextmenu(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'headerdblclick') and Assigned(FOnHeaderdblclick) then
    FOnHeaderdblclick(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'headermousedown') and Assigned(FOnHeadermousedown) then
    FOnHeadermousedown(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('ColumnIndex'), ExtEventObject)
  else if (AEvtName = 'keydown') and Assigned(FOnKeydown) then
    FOnKeydown(ExtEventObject)
  else if (AEvtName = 'keypress') and Assigned(FOnKeypress) then
    FOnKeypress(ExtEventObject)
  else if (AEvtName = 'mousedown') and Assigned(FOnMousedown) then
    FOnMousedown(ExtEventObject)
  else if (AEvtName = 'mouseout') and Assigned(FOnMouseout) then
    FOnMouseout(ExtEventObject)
  else if (AEvtName = 'mouseover') and Assigned(FOnMouseover) then
    FOnMouseover(ExtEventObject)
  else if (AEvtName = 'mouseup') and Assigned(FOnMouseup) then
    FOnMouseup(ExtEventObject)
  else if (AEvtName = 'rowbodyclick') and Assigned(FOnRowbodyclick) then
    FOnRowbodyclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ExtEventObject)
  else if (AEvtName = 'rowbodycontextmenu') and Assigned(FOnRowbodycontextmenu) then
    FOnRowbodycontextmenu(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ExtEventObject)
  else if (AEvtName = 'rowbodydblclick') and Assigned(FOnRowbodydblclick) then
    FOnRowbodydblclick(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ExtEventObject)
  else if (AEvtName = 'rowbodymousedown') and Assigned(FOnRowbodymousedown) then
    FOnRowbodymousedown(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ExtEventObject)
  else if (AEvtName = 'rowclick') and Assigned(FOnRowclick) then
    FOnRowclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ExtEventObject)
  else if (AEvtName = 'rowcontextmenu') and Assigned(FOnRowcontextmenu) then
    FOnRowcontextmenu(TExtGridGridPanel(ParamAsObject('This')),
      ParamAsInteger('RowIndex'), ExtEventObject)
  else if (AEvtName = 'rowdblclick') and Assigned(FOnRowdblclick) then
    FOnRowdblclick(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ExtEventObject)
  else if (AEvtName = 'rowmousedown') and Assigned(FOnRowmousedown) then
    FOnRowmousedown(TExtGridGridPanel(ParamAsObject('This')), ParamAsInteger('RowIndex'),
      ExtEventObject)
  else if (AEvtName = 'sortchange') and Assigned(FOnSortchange) then
    FOnSortchange(TExtGridGridPanel(ParamAsObject('This')),
      TExtObject(ParamAsObject('SortInfo')))
  else if (AEvtName = 'viewready') and Assigned(FOnViewready) then
    FOnViewready(TExtGridGridPanel(ParamAsObject('This')));
end;

procedure TExtGridPropertyGrid.SetFCustomEditors(Value: TExtObject);
begin
  FCustomEditors := Value;
  JSCode('customEditors:' + VarToJSON([Value, false]));
end;

procedure TExtGridPropertyGrid.SetFCustomRenderers(Value: TExtObject);
begin
  FCustomRenderers := Value;
  JSCode('customRenderers:' + VarToJSON([Value, false]));
end;

procedure TExtGridPropertyGrid.SetFPropertyNames(Value: TExtObject);
begin
  FPropertyNames := Value;
  JSCode('propertyNames:' + VarToJSON([Value, false]));
end;

procedure TExtGridPropertyGrid._SetSource(const AValue: TExtObject);
begin
  FSource := SetConfigItem('source', AValue);
end;

procedure TExtGridPropertyGrid.SetFOnBeforepropertychange
  (Value: TExtGridPropertyGridOnBeforepropertychange);
begin
  if Assigned(FOnBeforepropertychange) then
    JSCode(JSName + '.events ["beforepropertychange"].listeners=[];');
  if Assigned(Value) then
    on('beforepropertychange', Ajax('beforepropertychange', ['Source', '%0.nm',
      'RecordId', '%1', 'Value', '%2', 'OldValue', '%3'], true));
  FOnBeforepropertychange := Value;
end;

procedure TExtGridPropertyGrid.SetFOnPropertychange
  (Value: TExtGridPropertyGridOnPropertychange);
begin
  if Assigned(FOnPropertychange) then
    JSCode(JSName + '.events ["propertychange"].listeners=[];');
  if Assigned(Value) then
    on('propertychange', Ajax('propertychange', ['Source', '%0.nm', 'RecordId', '%1',
      'Value', '%2', 'OldValue', '%3'], true));
  FOnPropertychange := Value;
end;

class function TExtGridPropertyGrid.JSClassName: string;
begin
  Result := 'Ext.grid.PropertyGrid';
end;

procedure TExtGridPropertyGrid.InitDefaults;
begin
  inherited;
  FCustomEditors := TExtObject.CreateInternal(Self, 'customEditors');
  FCustomRenderers := TExtObject.CreateInternal(Self, 'customRenderers');
  FPropertyNames := TExtObject.CreateInternal(Self, 'propertyNames');
  FSource := TExtObject.CreateInternal(Self, 'source');
end;

function TExtGridPropertyGrid.GetSource: TExtFunction;
begin
  JSCode(JSName + '.getSource();', 'TExtGridPropertyGrid');
  Result := Self;
end;

function TExtGridPropertyGrid.RemoveProperty(Prop: string): TExtFunction;
begin
  JSCode(JSName + '.removeProperty(' + VarToJSON([Prop]) + ');', 'TExtGridPropertyGrid');
  Result := Self;
end;

function TExtGridPropertyGrid.SetProperty(Prop: string; Value: string;
  Create: Boolean = false): TExtFunction;
begin
  JSCode(JSName + '.setProperty(' + VarToJSON([Prop, Value, Create]) + ');',
    'TExtGridPropertyGrid');
  Result := Self;
end;

function TExtGridPropertyGrid.SetSource(const ASource: TExtObject): TExtFunction;
begin
  FSource := ASource;
  Result := CallMethod('setSource', ASource);
end;

procedure TExtGridPropertyGrid.HandleEvent(const AEvtName: string);
begin
  inherited;
  if (AEvtName = 'beforepropertychange') and Assigned(FOnBeforepropertychange) then
    FOnBeforepropertychange(TExtObject(ParamAsObject('Source')),
      ParamAsString('RecordId'), ParamAsString('Value'), ParamAsString('OldValue'))
  else if (AEvtName = 'propertychange') and Assigned(FOnPropertychange) then
    FOnPropertychange(TExtObject(ParamAsObject('Source')), ParamAsString('RecordId'),
      ParamAsString('Value'), ParamAsString('OldValue'));
end;

{ TExtGridView }

class function TExtGridView.JSClassName: string;
begin
  Result := 'Ext.grid.View';
end;

{ TExtGridGroupingFeature }

procedure TExtGridGroupingFeature.InitDefaults;
begin
  inherited;
  FStartCollapsed := False;
  FEnableGroupingMenu := True;
  FEnableNoGroups := True;
  FHideGroupedHeader := False;
  FShowSummaryRow := False;
end;

class function TExtGridGroupingFeature.JSClassName: string;
begin
  Result := 'Ext.grid.feature.Grouping';
end;

procedure TExtGridGroupingFeature.SetEnableGroupingMenu(const AValue: Boolean);
begin
  FEnableGroupingMenu := AValue;
  SetConfigItem('enableGroupingMenu', AValue);
end;

procedure TExtGridGroupingFeature.SetEnableNoGroups(const AValue: Boolean);
begin
  FEnableNoGroups := AValue;
  SetConfigItem('enableNoGroups', AValue);
end;

procedure TExtGridGroupingFeature.SetHideGroupedHeader(const AValue: Boolean);
begin
  FHideGroupedHeader := AValue;
  SetConfigItem('hideGroupedHeader', AValue);
end;

procedure TExtGridGroupingFeature.SetShowSummaryRow(const AValue: Boolean);
begin
  FShowSummaryRow := AValue;
  SetConfigItem('showSummaryRow', AValue);
end;

procedure TExtGridGroupingFeature.SetStartCollapsed(const AValue: Boolean);
begin
  FStartCollapsed := AValue;
  SetConfigItem('startCollapsed', AValue);
end;

{ TExtGridPluginCellEditing }

class function TExtGridPluginCellEditing.JSClassName: string;
begin
  Result := 'Ext.grid.plugin.CellEditing';
end;

procedure TExtGridPluginCellEditing.SetClicksToEdit(const AValue: Integer);
begin
  FClicksToEdit := AValue;
  SetConfigItem('clicksToEdit', AValue);
end;

{ TExtGridPluginRowEditing }

class function TExtGridPluginRowEditing.JSClassName: string;
begin
  Result := 'Ext.grid.plugin.RowEditing';
end;

end.
