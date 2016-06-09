// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $('.simulation-next-row').on('click', function() {
    var tableBody = document.getElementById('simulation-table');
    var row = tableBody.children[tableBody.children.length - 1];
    var rowCopy = row.cloneNode(true);
    var id = _.now();
    _.map(rowCopy.children, function(element) {
      var selectElement = element.querySelector('select') || element.querySelector('input') || element.querySelector('button');
      selectElement.name = selectElement.name.replace(/\d+/g, id);
      selectElement.id = selectElement.id.replace(/\d+/g, id);
    });
    tableBody.appendChild(rowCopy);
    setRowsDeletable(true);
  });
  setRowsDeletable(false);
});

var setRowsDeletable = function(deletable) {
  $('.simulation-delete-row').prop('disabled', !deletable); // ! because the boolean is for disabled, not enabled.
};

var deleteRow = function(event) { // this gets called in the HTML by the onclick attribute
  var row = event.target.parentElement.parentElement;
  if(row.parentElement.children.length <= 2)
    setRowsDeletable(false);
  row.parentElement.removeChild(row);
};
