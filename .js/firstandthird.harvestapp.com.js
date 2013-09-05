
var url = window.location.href;

var formatToCurrency = function(num) {
  num = num.toString().replace(/\$|\,/g,'');
  if(isNaN(num)) {
    num = "0";
  }
  sign = (num == (num = Math.abs(num)));
  num = Math.floor(num*100+0.50000000001);
  cents = num%100;
  num = Math.floor(num/100).toString();
  if(cents < 10) {
    cents = "0" + cents;
  }
  for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++) {
    num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));
  }
  return (((sign)?'':'-') + '$' + num + '.' + cents);
}

var addColumns = function(columns) {
  var head = $('#users-table thead tr');
  var subhead = $('#users-table .r2-sub-header tr');

  for (var i = 0, c = columns.length; i < c; i++) {
    var item = columns[i];
    head.append('<th class="td-billable-amount">'+item+'</th>');
    subhead.append('<td class="td-category">&nbsp;</td>');
  }

}

if (url.indexOf('reports') != -1 && url.indexOf('#users') != -1) {

  addColumns(['Paid', 'Revenue', 'Personal Paid']);

  var r = { 'user-539189': 32, 'user-539188': 75, 'user-562949': 65, 'user-539190': 65, 'user-539185': 80, 'user-334881': 0 }

  var users = $('.r2-sort-row');
  var totalPaid = 0;
  var totalRev = 0;
  var totalPersonalPaid = 0;
  users.each(function(index, item) {

    var el = $(item);
    var id = el.attr('id');
    var tr = el.find('tr');
    var hours = parseFloat(tr.find('.td-hours a').text());
    var billableHours = parseFloat(tr.find('.td-billable-hours').text());
    var billableAmount = parseFloat(tr.find('.td-billable-amount').text().replace(/\$/g, '').replace(/,/g, ''));

    var paid = hours * r[id];
    var rev = billableAmount - paid;
    var personalPaid = (hours - billableHours) * r[id];
    totalPaid += paid;
    totalRev += rev;
    totalPersonalPaid += personalPaid;
    tr.append('<td class="td-billable-amount">'+formatToCurrency(paid)+'</td>');
    tr.append('<td class="td-billable-amount">'+formatToCurrency(rev)+'</td>');
    tr.append('<td class="td-billable-amount">'+formatToCurrency(personalPaid)+'</td>');

  });

  var footer = $('#users-table tfoot tr');

  footer.append('<td class="td-billable-amount">'+formatToCurrency(totalPaid)+'</td>');
  footer.append('<td class="td-billable-amount">'+formatToCurrency(totalRev)+'</td>');
  footer.append('<td class="td-billable-amount">'+formatToCurrency(totalPersonalPaid)+'</td>');
}
