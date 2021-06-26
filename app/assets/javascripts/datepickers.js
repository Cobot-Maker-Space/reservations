function load_datepicker() {

  $.datetimepicker.setDateFormatter({
    parseDate: function (date, format) {
      var d = moment(date, format);
      return d.isValid() ? d.toDate() : false;
    },

    formatDate: function (date, format) {
      return moment(date).format(format);
    },

    // Optional if using mask input
    formatMask: function (format) {
      return format
        .replace(/Y{4}/g, '9999')
        .replace(/Y{2}/g, '99')
        .replace(/M{2}/g, '19')
        .replace(/D{2}/g, '39')
        .replace(/H{2}/g, '29')
        .replace(/m{2}/g, '59')
        .replace(/s{2}/g, '59');
    }
  });

  /*$('.date_start').datepicker({
    altField: '#date_start_alt',
    altFormat: 'yy-mm-dd',
    minDate: 0,
    onClose: function (dateText, inst) {
      var start_date = $('.date_start').datepicker("getDate");
      var end_date = $('.date_end').datepicker("getDate");
      if (start_date > end_date) {
        var new_date = new Date(start_date.getTime() + 86400000);
        $('.date_end').datepicker("setDate", new_date);
      }
      $('.date_end').datepicker("option", "minDate", start_date);
    }
  });*/

  $('.date_start').datetimepicker({
    lang: 'en-GB',
    format: 'DD/MM/YYYY HH:mm',
    formatTime: 'HH:mm',
    formatDate: 'DD/MM/YYYY',
    step: 30,
    minDate: 0,
    onChangeDateTime: function (dt, inst) {
      var start_date = $('.date_start').datetimepicker("getValue");
      var end_date = $('.date_end').datetimepicker("getValue");
      if (start_date > end_date) {
        var new_date = moment(start_date).add(1, 'days').format('DD/MM/YYYY HH:mm');
        $('.date_end').datetimepicker({value: new_date});
      }
      $('.date_end').datetimepicker({'minDate': start_date});
    }
  });

  /*$('.date_end').datepicker({
    altField: '#date_end_alt',
    altFormat: 'yy-mm-dd',
    minDate: 0
  });*/

  $('.date_end').datetimepicker({
    lang: 'en-GB',
    format: 'DD/MM/YYYY HH:mm',
    formatTime: 'HH:mm',
    formatDate: 'DD/MM/YYYY',
    step: 30,
    minDate: 0
  });

  /*$('.date_start_no_min').datepicker({
    altField: '#date_start_alt',
    altFormat: 'yy-mm-dd',
    onClose: function (dateText, inst) {
      var start_date = $('.date_start_no_min').datepicker("getDate");
      var end_date = $('.date_end_no_min').datepicker("getDate");
      if (start_date > end_date) {
        var new_date = new Date(start_date.getTime() + 86400000);
        $('.date_end_no_min').datepicker("setDate", new_date);
      }
      $('.date_end_no_min').datepicker("option", "minDate", start_date);
    }
  });*/

  $('.date_start_no_min').datetimepicker({
    lang: 'en-GB',
    format: 'DD/MM/YYYY HH:mm',
    formatTime: 'HH:mm',
    formatDate: 'DD/MM/YYYY',
    step: 30,
    minDate: 0,
    onChangeDateTime: function (dt, inst) {
      var start_date = $('.date_start_no_min').datetimepicker("getValue");
      var end_date = $('.date_start_no_min').datetimepicker("getValue");
      if (start_date > end_date) {
        var new_date = moment(start_date).add(1, 'days').format('DD/MM/YYYY HH:mm');
        $('.date_end_no_min').datetimepicker({value: new_date});
      }
      $('.date_end_no_min').datetimepicker({'minDate': start_date});
    }
  });

  /*$('.date_end_no_min').datepicker({
    altField: '#date_end_alt',
    altFormat: 'yy-mm-dd',
    onClose: function (dateText, inst) {
      var start_date = $('.date_start_no_min').datepicker("getDate");
      var end_date = $('.date_end_no_min').datepicker("getDate");
      if (start_date > end_date) {
        var new_date = new Date(start_date.getTime() + 86400000);
        $('.date_end_no_min').datepicker("setDate", new_date);
      }
      $('.date_end_no_min').datepicker("option", "minDate", start_date);
    }
  });*/

  $('.date_end_no_min').datepicker({
    lang: 'en-GB',
    format: 'DD/MM/YYYY HH:mm',
    formatTime: 'HH:mm',
    formatDate: 'DD/MM/YYYY',
    step: 30,
    minDate: 0,
    onChangeDateTime: function (dt, inst) {
      var start_date = $('.date_start_no_min').datetimepicker("getValue");
      var end_date = $('.date_start_no_min').datetimepicker("getValue");
      if (start_date > end_date) {
        var new_date = moment(start_date).add(1, 'days').format('DD/MM/YYYY HH:mm');
        $('.date_end_no_min').datetimepicker({value: new_date});
      }
      $('.date_end_no_min').datetimepicker({'minDate': start_date});
    }
  });
};


