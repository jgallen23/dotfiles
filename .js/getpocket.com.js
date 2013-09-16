var update = function() {
  var count = $('.item').not('.removed').length;
  var title = document.title.replace(/ \((\d+)\)/, '');
  document.title = title + ' ('+count+')';
  console.log('update');
}

setInterval(update, 1000);
