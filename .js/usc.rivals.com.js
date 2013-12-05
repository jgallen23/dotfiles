$('table.liquid:eq(0)').remove();
$('center').remove();
$('.headerALT').remove();

var nodes = document.querySelectorAll('.tdtopic');
for (var i = 0, c = nodes.length; i < c; i++) {
  var el = nodes[i];

  var snippet = el.getAttribute('title');
  el.removeAttribute('title');
  var p = document.createElement('p');
  p.innerHTML = snippet;
  el.appendChild(p);
}
