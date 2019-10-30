/* ============================================================
 * DataTables
 * Generate advanced tables with sorting, export options using
 * jQuery DataTables plugin
 * ============================================================
 */

//= require pages-plugins/jquery-datatable/media/js/jquery.dataTables.min
//= require pages-plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min
//= require pages-plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap
//= require pages-plugins/datatables-responsive/js/datatables.responsive
//= require pages-plugins/datatables-responsive/js/lodash.min

(function($) {
  var responsiveHelper = void 0;
  var breakpointDefinition = {
    tablet: 1024,
    phone: 480
  };
  window.initTableWithSearch = function(tableSel, searchSel) {
    var table = $(tableSel);
    var settings = {
      'sDom': "<'table-responsive't><'row'<p i>>",
      'sPaginationType': 'bootstrap',
      'destroy': true,
      'scrollCollapse': true,
      'iDisplayLength': 25
    };
    table.dataTable(settings);
    return $(searchSel).keyup(function() {
      return table.fnFilter($(this).val());
    });
  };
  return initTableWithSearch('#tableWithSearch', '#search-table');
})(window.jQuery);
