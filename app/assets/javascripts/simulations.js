// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

class SimulationTable {
  constructor(node) {
    this.table = node.querySelector('tbody');
    this.setRowsDeletable(false);
  }

  setRowsDeletable(deletable) {
    if (deletable) {
      $(`#${this.table.id}`).find('.simulation-delete-row').removeClass('disabled');
    } else {
      $(`#${this.table.id}`).find('.simulation-delete-row').addClass('disabled');
    }
  }

  addTableRow() {
    var row = this.table.children[this.table.children.length - 1];
    var rowCopy = row.cloneNode(true);
    var id = _.now();
    _.map(rowCopy.children, function(element) {
      var selectElement = element.querySelector('select') ||
        element.querySelector('input') ||
        element.querySelector('button');
      selectElement.name = selectElement.name.replace(/\d+/g, id);
      selectElement.id = selectElement.id.replace(/\d+/g, id);
    });
    rowCopy.id = rowCopy.id.replace(/\d+/, id);
    this.table.appendChild(rowCopy);
    this.setRowsDeletable(true);
    Twine.bind(rowCopy);
  }

  deleteTableRow(target) {
    var id = target.id.replace('delete_', '');
    var row = document.getElementById(id);
    if (row.parentElement.children.length <= 2) {
      this.setRowsDeletable(false);
    }
    row.parentElement.removeChild(row);
  }
}
