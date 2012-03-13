// Dynamically adds a style rule. Used to add icons
// through CSS in async responses.
function addStyleRule(rule) {
  var head = document.getElementsByTagName('head')[0],
      style = document.createElement('style'),
      rules = document.createTextNode(rule);
  style.type = 'text/css';
  if (style.styleSheet)
    style.styleSheet.cssText = rules.nodeValue;
  else
    style.appendChild(rules);
  head.appendChild(style);
};

// Used by TKExtForceCamelCaps.
String.prototype.capitalize = function(){
   return this.replace( /(^|\s)([a-z])/g , function(m,p1,p2){ return p1+p2.toUpperCase(); } );
};

// Additional form vtypes.
var
  codice_fiscale_re = /^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$/,
  partita_iva_re = /^[0-9]{11}$/,
  alpha_space_re = /^[a-zA-Z_ ]+$/;
  phone_number_re = /^\+[0-9]+\-[0-9]+$/
Ext.apply(Ext.form.VTypes, {
    codice_fiscale: function(val, field) {
      return codice_fiscale_re.test(val) || partita_iva_re.test(val);
    },
    codice_fiscaleText: 'Codice Fiscale non formalmente corretto.',
    codice_fiscaleMask: /[a-zA-Z0-9]/i,
    
    alpha_space: function(val, field) {
      return alpha_space_re.test(val);
    },
    alpha_spaceText: 'This field only accepts letters and spaces.',
    alpha_spaceMask: /[a-z ]/i,

    phone_number: function(val, field) {
      return phone_number_re.test(val);
    },
    phone_numberText: 'Invalid phone number.',
    phone_numberMask: /[a-z0-9\-\+]/
});

// Additional formats and renderers.
Ext.apply(Ext.util.Format, {
  checkboxRenderer: function(val) {
    return String.format('<div class="x-grid3-check-col{0}"></div>', val ? "-on" : '');
  }
});

// Fires change event if the object value is at least
// minChars characters long. Also fires the event when the
// value is empty. Used in filters.
function fireChangeAfterNChars(obj, minChars)
{
  var v = obj.getValue();
  if (v.length >= minChars || v.length == 0)
    obj.fireEvent("change", v, v);
};

// Calls an Ajax method if buttonId is "yes". The method to
// call is specified in obj.params.methodURL. The selection model
// specified in obj.params.selModel is used to get all values specified
// in obj.params.fieldNames from the first selected record and pass
// them in the Selection param to the Ajax method.
// This function should be used as a message box handler.
// All params specified above should be passed in the message
// box opt config, inside an object called params.
function ajaxSingleSelection(buttonId, text, obj)
{
  if (buttonId == "yes")
  {
    var
      selValues = [],
      selRecord = obj.params.selModel.getSelected(),
      fieldNames = obj.params.fieldNames.split(',');
    for (var i = 0; i < fieldNames.length; i++)
      selValues.push(fieldNames[i] + "=" + selRecord.get(fieldNames[i]));
    return Ext.Ajax.request({
      url: obj.params.methodURL,
      params: "Ajax=1&" + selValues.toString(),
      success: AjaxSuccess,
      failure: AjaxFailure
    });
  }
};

// Calls an Ajax method if buttonId is "yes". The method to
// call is specified in obj.params.methodURL.
// This function should be used as a message box handler.
// All params specified above should be passed in the message
// box opt config, inside an object called params.
function ajaxSimple(buttonId, text, obj)
{
  if (buttonId == "yes")
  {
    return Ext.Ajax.request({
      url: obj.params.methodURL,
      params: "Ajax=1",
      success: AjaxSuccess,
      failure: AjaxFailure
    });
  }
};

// Asks a confirmation message and calls a specified function
// when the dialog box is dismissed. Used together with ajaxSingleSelection
// and ajaxSimple.
function confirmCall(title, question, functionToCall, functionParams)
{
  Ext.Msg.show({
    title: title,
    msg: question,
    buttons: Ext.MessageBox.YESNO,
    icon: Ext.MessageBox.QUESTION,
    fn: functionToCall,
    params: functionParams
  });
};

// Formats a time specified as a "hh:mm:ss" string
// according to the specified format.
// Note: currently this function only decides whether to cut off the seconds
// part or not depending on the presence of "s" in the format string, which is
// just what we need now. It should be rewritten to support true formatting.
function formatTime(time, format)
{
  if (format.indexOf("s") > -1)
    return time;
  else
    return time.substring(0, 5);
};

// Renders an image with a value.
// Patterns is an array of arrays of two elements: image URL and regexp.
// Patterns are searched in order.
// An image is rendered if v matches its regexp. Set includeValue to false
// to display only the image and not the value (if there's no matching image,
// the value is always displayed).
// Note: v is always used as the image tooltip (ext:qtip) and alt value.
function formatWithImage(v, patterns, includeValue)
{
  var image = null;
  var customValue = "";
  for (var i = 0; i < patterns.length; i++)
  {
    var re = new RegExp(patterns[i][1]);
    if (re.test(v)) {
      image = patterns[i][0];
      if (patterns[i].length >= 3)
        customValue = patterns[i][2];
      break;
    }
  }
  if (customValue != "")
    v = customValue.replace('{value}', v);
  if (image != null)
    // TODO: center image vertically?
    return '<img src="' + image + '" alt="' + v + '" ext:qtip="' + v + '">' + (includeValue ? '&nbsp;' + v : '');
  else
    return v;
};