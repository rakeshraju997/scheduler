(function($) {

    $.fn.lateSelect = function() {

      function os_build_selected_item($option){
        var quantity_html = '';
        if($option.data('quantity')) quantity_html = '<span class="os-late-quantity-selector-w"><span class="os-late-quantity-selector minus" data-sign="minus"></span><input class="os-late-quantity-selector-input" type="text" data-max-quantity="'+ $option.data('max-quantity') +'" value="' + $option.data('quantity') + '"/><span class="os-late-quantity-selector plus" data-sign="plus"></span></span>';
        return '<div class="ls-item" data-value="' + $option.val() + '"><span class="latepoint-icon latepoint-icon-x ls-item-remover"></span><span>' + $option.text() + '</span>' + quantity_html + '</div>'
      }

      this.each( function() {
          var lateselect_html = '';
          var all_items = '';
          var selected_items = '';
          var is_selected = '';
          $(this).hide();
          $(this).find('option').each(function(){
              if($(this).is(':selected')) selected_items+= os_build_selected_item($(this));
              is_selected = $(this).is(':selected') ? 'selected' : '';
              all_items+= '<div class="ls-item '+ is_selected +'" data-value="' + $(this).val() + '">' + $(this).text() + '</div>';
          });
          lateselect_html = $('<div class="lateselect-w"></div>');
          $(this).wrap(lateselect_html);
          var $lateselect_wrapper = $(this).closest('.lateselect-w');
          $lateselect_wrapper.append('<div class="ls-selected-items-w">' + selected_items + '</div>');
          $lateselect_wrapper.append('<div class="ls-all-items-w">' + all_items + '</div>');


          // ADD ITEM
          $lateselect_wrapper.on('click', '.ls-all-items-w .ls-item:not(.selected)', function(){
              var selected_value = $(this).data('value');
              $lateselect_wrapper.find('.ls-selected-items-w').append(os_build_selected_item($lateselect_wrapper.find('select option[value="'+ selected_value +'"]')));
              $(this).addClass('selected');
              $lateselect_wrapper.removeClass('ls-selecting');
              $lateselect_wrapper.find('select option[value="'+ selected_value +'"]').attr('selected', true);
              $lateselect_wrapper.find('select').trigger('change');
              return false;
          });

          // REMOVE ITEM
          $lateselect_wrapper.on('click', '.ls-selected-items-w .ls-item-remover', function(){
              var selected_value = $(this).closest('.ls-item').data('value');
              $(this).closest('.ls-item').remove();
              $lateselect_wrapper.find('.ls-all-items-w .ls-item.selected[data-value="' + selected_value + '"]').removeClass('selected');
              $lateselect_wrapper.find('select option[value="'+ selected_value +'"]').removeAttr('selected');
              $lateselect_wrapper.find('select').trigger('change');
              return false;
          });

          $lateselect_wrapper.on('click', '.ls-selected-items-w', function(){
              $lateselect_wrapper.toggleClass('ls-selecting');
              return false;
          });

          $lateselect_wrapper.on('click', '.os-late-quantity-selector', function(){
              var $input = $(this).closest('.ls-item').find('input.os-late-quantity-selector-input');
              var current_value = parseInt($input.val());
              var new_quantity = ($(this).data('sign') == 'minus') ? current_value - 1 : current_value + 1;
              var max_quantity = $input.data('max-quantity');
              if(new_quantity <= 0) new_quantity = 1;
              if(max_quantity && (new_quantity > max_quantity)) new_quantity = max_quantity;
              var selected_value = $(this).closest('.ls-item').data('value');
              $lateselect_wrapper.find('select option[value="'+ selected_value +'"]').data('quantity', new_quantity);
              $input.val(new_quantity);
              $lateselect_wrapper.find('select').trigger('change');
              return false;
          });

          $(this).on('change', function(){
              if($(this).data('hidden-connection')){
                  var formatted_ids = '';
                  if($(this).find('option:selected').length){
                      $(this).find('option:selected').each(function(){
                        var quantity = $(this).data('quantity') ? $(this).data('quantity') : 1;
                        formatted_ids+= $(this).val() + ':' + quantity + ',';
                      });
                  }else{
                    formatted_ids = '';
                  }
                  if(formatted_ids != '') formatted_ids = formatted_ids.slice(0, -1);
                  $($(this).data('hidden-connection')).val(formatted_ids);
              }
          });
      });
    }
}(jQuery));