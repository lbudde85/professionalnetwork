/* ============================================================
 * DataTables
 * Generate advanced tables with sorting, export options using
 * jQuery DataTables plugin
 * ============================================================
 */

(function($) {
  var responsiveHelper = void 0;
  var breakpointDefinition = {
    tablet: 1024,
    phone: 480
  };
  var initTable = function(tableSel, searchSel) {
    var table = $(tableSel);
    var settings = {
      sDom: "<'table-responsive't><'row'<p i>>",
      sPaginationType: 'bootstrap',
      destroy: true,
      scrollCollapse: true,
      oLanguage: {
        'sLengthMenu': '_MENU_ ',
        'sInfo': 'Showing <b>_START_ to _END_</b> of _TOTAL_ entries'
      },
      iDisplayLength: 25,
      columnDefs: [
        {
          orderable: false,
          targets: [2, 3]
        }, {
          width: "1%",
          targets: [0, 1]
        }
      ]
    };
    table.dataTable(settings);
    return $(searchSel).keyup(function() {
      return table.fnFilter($(this).val());
    });
  };
  return initTable('#contractorsTable', '#search-contractorsTable');
})(window.jQuery);
