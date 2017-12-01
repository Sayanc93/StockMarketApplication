// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  var companies = [{
    "code": "500114",
    "company_name": "TITAN"
  }, {
    "code": "540710",
    "company_name": "CAPACITE"
  }, {
    "code": "511447",
    "company_name": "SYLPH"
  }, {
    "code": "512161",
    "company_name": "8KMILES"
  }, {
    "code": "539807",
    "company_name": "INFIBEAM"
  }, {
    "code": "540704",
    "company_name": "MATRIMONY"
  }, {
    "code": "539012",
    "company_name": "MEGRISOFT"
  }, {
    "code": "532316",
    "company_name": "SKUMAR"
  }]

  var search = new Bloodhound({
    datumTokenizer: function(datum) {
      return Bloodhound.tokenizers.whitespace(datum.company_name);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: companies
  });

  search.initialize();

  function companiesWithDefaults(q, sync) {
    if (q === '') {
      sync(companies);
    } else {
      search.search(q, sync);
    }
  };

  document.addEventListener("turbolinks:load", function() {
    var sampleEntry = $('.entry:last');
    var clonedInput = sampleEntry.clone();

    $('.typeahead').typeahead({
      highlight: true,
      minLength: 0
    }, {
      name: 'company_name',
      display: 'company_name',
      limit: 10,
      source: companiesWithDefaults
    });

    $('.twitter-typeahead').addClass('widen');

    $('.btn-add').on('click', function(e) {
      e.preventDefault();

      var controlForm = $('.controls form:first');
      var newInput = clonedInput.clone();

      $(newInput).appendTo(controlForm.find('.container:first'));
      newInput.find('.typeahead').typeahead({
        highlight: true,
        minLength: 0
      }, {
        name: 'company_name',
        display: 'company_name',
        limit: 10,
        source: companiesWithDefaults
      })

      newInput.find('.twitter-typeahead').addClass('widen');
    });

    $('.btn-remove').on('click', function(e) {
      e.preventDefault();

      if ($('.entry').length > 2) {
        var lastEntry = $('.entry:last');
        lastEntry.remove();
      }
    });
  })
});
