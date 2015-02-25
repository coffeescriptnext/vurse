//= require cocoon
//= require ace/ace
//= require selectize

(function() {
  'use strict';

  window.editors = {};

  function toggleRemoveLinks() {
    if($('.snippet-piece').length === 1) {
      $('.remove-snippet-piece').hide();
    } else {
      $('.remove-snippet-piece').show();
    }
  }

  function toggleSelectize() {
    $('.language-select').selectize();
  }

  $(document).ready(function() {
    toggleRemoveLinks();
    toggleSelectize();

    $('.editor').each(function() {
      var textArea = $(this).parent().find('textarea');
      var editor = ace.edit(this);

      editor.setTheme('ace/theme/tomorrow');
      editor.getSession().setValue(textArea.val());

      window.editors[textArea.attr('id')] = editor;
    });

    $('.snippet-pieces').on('cocoon:after-insert', function(e, piece) {
      var textAreaID = $(piece).find('textarea').attr('id');
      var editorElement = $(piece).find('.editor')[0];
      var editor = ace.edit(editorElement);

      editor.setTheme('ace/theme/tomorrow');

      window.editors[textAreaID] = editor;
      toggleRemoveLinks();
    });

    $('.snippet-pieces').on('cocoon:after-remove', function(e, piece) {
      toggleRemoveLinks();
    });

    $('.snippet-form').on('submit', function(e) {
      $.each(window.editors, function(textAreaID, editor) {
        $('#' + textAreaID).val(editor.getSession().getValue());
      });
    });
  });
}());
