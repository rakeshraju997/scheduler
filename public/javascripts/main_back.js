// @codekit-prepend "os-time.js";
// @codekit-prepend "os-select.js";
// @codekit-prepend "os-actions.js";
// @codekit-prepend "os-notifications.js";
// @codekit-prepend "os-shared.js";
// @codekit-prepend "os-updates.js";
// @codekit-prepend "os-google-calendar.js";


function latepoint_init_side_menu(){
    jQuery('.menu-toggler').on('click', function(){
      var layout_style = 'full';
      if(jQuery('.latepoint-side-menu-w').hasClass('side-menu-full')){
        layout_style = 'compact';
        jQuery('.latepoint-side-menu-w').addClass('side-menu-compact').removeClass('side-menu-full');
      }else{
        jQuery('.latepoint-side-menu-w').addClass('side-menu-full').removeClass('side-menu-compact');
      }
      var route_name = jQuery(this).data('route');
      var data = { action: 'latepoint_route_call', route_name: route_name, params: { menu_layout_style: layout_style }, layout: 'none', return_format: 'json' }
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
        }
      });
      return false;
    });
  }
  
  function latepoint_init_grouped_bookings_form(){
    
  }
  
  function latepoint_quick_booking_customer_selected(){
    jQuery('.customer-info-w').removeClass('selecting').addClass('selected');
  }
    
  function latepoint_custom_day_removed($elem){
    $elem.closest('.custom-day-work-period').fadeOut(300, function(){ jQuery(this).remove()});
  }
  
  function latepoint_booking_synced($elem){
    $elem.closest('.os-booking-tiny-box').removeClass('not-synced').addClass('is-synced');
    latepoint_sync_update_progress(false);
  }
  
  function latepoint_gcal_event_deleted($elem){
    $elem.closest('.os-booking-tiny-box').remove();
  }
  
  function latepoint_booking_unsynced($elem){
    $elem.closest('.os-booking-tiny-box').addClass('not-synced').removeClass('is-synced');
    latepoint_sync_update_progress(true);
  }
  
  
  function latepoint_count_active_connections($connection_wrapper){
    var connected_services_count = $connection_wrapper.find('.connection-children-list li.active').length;
    var all_services_count = $connection_wrapper.find('.connection-children-list li').length;
    if(connected_services_count == all_services_count){
      connected_services_count = jQuery('.selected-connections').data('all-text');
      jQuery('.selected-connections').removeClass('not-all-selected');
    }else{
      connected_services_count = connected_services_count + '/' + all_services_count;
      jQuery('.selected-connections').addClass('not-all-selected');
      $connection_wrapper.closest('.white-box').find('.os-select-all-toggler').prop('checked', false);
    }
    $connection_wrapper.find('.selected-connections strong').text(connected_services_count);
  }
  
  function latepoint_custom_field_removed($elem){
    $elem.closest('.os-custom-field-form').remove();
  }
  
  function latepoint_coupon_removed($elem){
    $elem.closest('.os-coupon-form').remove();
  }
  
  function latepoint_init_custom_fields_form(){
    jQuery('.latepoint-content-w').on('click', '.os-custom-field-form-info', function(){
      jQuery(this).closest('.os-custom-field-form').toggleClass('os-is-editing');
      return false;
    });
    jQuery('.latepoint-content-w').on('change', 'select.os-custom-field-type-select', function(){
      if(jQuery(this).val() == 'select'){
        jQuery(this).closest('.os-custom-field-form').find('.os-custom-field-select-values').show();
      }else{
        jQuery(this).closest('.os-custom-field-form').find('.os-custom-field-select-values').hide();
      }
    });
    jQuery('.latepoint-content-w').on('keyup', '.os-custom-field-name-input', function(){
      jQuery(this).closest('.os-custom-field-form').find('.os-custom-field-name').text(jQuery(this).val());
    });
  }
  
  
  function latepoint_init_coupons_form(){
    jQuery('.latepoint-content-w').on('click', '.os-coupon-form-info', function(){
      jQuery(this).closest('.os-coupon-form').toggleClass('os-is-editing');
      return false;
    });
    jQuery('.latepoint-content-w').on('change', 'select.os-coupon-medium-select', function(){
      if(jQuery(this).val() == 'email'){
        jQuery(this).closest('.os-coupon-form').find('.os-coupon-email-subject').show();
      }else{
        jQuery(this).closest('.os-coupon-form').find('.os-coupon-email-subject').hide();
      }
    });
    jQuery('.latepoint-content-w').on('keyup', '.os-coupon-name-input', function(){
      jQuery(this).closest('.os-coupon-form').find('.os-coupon-name').text(jQuery(this).val());
    });
    jQuery('.latepoint-content-w').on('keyup', '.os-coupon-code-input', function(){
      jQuery(this).closest('.os-coupon-form').find('.os-coupon-code').text(jQuery(this).val());
    });
  }
  
  function latepoint_init_reminders_form(){
    jQuery('.latepoint-content-w').on('click', '.os-reminder-form-info', function(){
      jQuery(this).closest('.os-reminder-form').toggleClass('os-is-editing');
      return false;
    });
    jQuery('.latepoint-content-w').on('change', 'select.os-reminder-medium-select', function(){
      if(jQuery(this).val() == 'email'){
        jQuery(this).closest('.os-reminder-form').find('.os-reminder-email-subject').show();
      }else{
        jQuery(this).closest('.os-reminder-form').find('.os-reminder-email-subject').hide();
      }
    });
    jQuery('.latepoint-content-w').on('keyup', '.os-reminder-name-input', function(){
      jQuery(this).closest('.os-reminder-form').find('.os-reminder-name').text(jQuery(this).val());
    });
  }
  
  function latepoint_custom_field_saved($elem){
  }
  
  function latepoint_init_custom_day_schedule(){
    jQuery('#custom_day_calendar_month, #custom_day_calendar_year').on('change', function(){
      var $calendar = jQuery('.custom-day-calendar-month');
      var route_name = $calendar.data('route');
      $calendar.addClass('os-loading');
      var target_date_string = jQuery('#custom_day_calendar_year').val() + '-' + jQuery('#custom_day_calendar_month').val() + '-01';
      var data = { action: 'latepoint_route_call', route_name: route_name, params: { target_date_string: target_date_string }, layout: 'none', return_format: 'json' }
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $calendar.removeClass('os-loading');
          if(data.status === "success"){
            $calendar.html(data.message);
          }else{
            // console.log(data.message);
          }
        }
      });
    });
    jQuery('.custom-day-calendar').on('click', '.os-day', function(){
      var $this = jQuery(this);
      jQuery('.custom-day-calendar .os-day.selected').removeClass('selected');
      $this.addClass('selected');
      jQuery('.latepoint-lightbox-footer').slideDown(200);
      if(jQuery('.custom-day-calendar').data('show-schedule') == 'yes') jQuery('.latepoint-lightbox-w').removeClass('hide-schedule');
      jQuery('.custom_day_schedule_date').val($this.data('date'));
      return false;
    });
  }
  
  function latepoint_init_updates_page(){
    
  }
  
  function latepoint_init_monthly_calendar_navigation(){
    jQuery('.calendar-location-selector').on('change', function(){
      latepoint_reload_daily_agents_page();
    });
  
    jQuery('.os-month-next-btn').on('click', function(){
      // check if next month is already loaded
      if(jQuery('.os-monthly-calendar-days-w.active + .os-monthly-calendar-days-w').length){
        jQuery('.os-monthly-calendar-days-w.active').removeClass('active').next('.os-monthly-calendar-days-w').addClass('active');
        latepoint_calendar_set_month_label();
      }else{
        var $btn = jQuery(this);
        $btn.addClass('os-loading');
        var load_month_route_name = jQuery(this).data('route');
        var $calendar_element = jQuery('.os-monthly-calendar-days-w.active');
        var calendar_layout = $calendar_element.data('calendar-layout');
        var calendar_year = $calendar_element.data('calendar-year');
        var calendar_month = $calendar_element.data('calendar-month');
        if(calendar_month == 12){
          calendar_year = calendar_year + 1;
          calendar_month = 1;
        }else{
          calendar_month = calendar_month + 1;
        }
        var selected_agent_id = jQuery('.agent-select').val();
        var selected_service_id = jQuery('.service-select').val();
        var booking_info = {  target_date_string: calendar_year + '-' + calendar_month + '-1', 
                              agent_id: selected_agent_id, 
                              service_id: selected_service_id, 
                              allow_full_access: true, 
                              calendar_layout: calendar_layout 
                            };
        if(jQuery('.cc-location-selector select').length && jQuery('.cc-location-selector select').val()){
          booking_info.location_id = jQuery('.cc-location-selector select').val();
        }
        var data = {  action: 'latepoint_route_call', 
                      route_name: load_month_route_name, 
                      params: booking_info, 
                      layout: 'none', 
                      return_format: 'json' 
                    };
        jQuery.ajax({
          type : "post",
          dataType : "json",
          url : latepoint_helper.ajaxurl,
          data : data,
          success: function(data){
  
            $btn.removeClass('os-loading');
            if(data.status === "success"){
              jQuery('.os-months').append(data.message);
              jQuery('.os-monthly-calendar-days-w.active').removeClass('active').next('.os-monthly-calendar-days-w').addClass('active');
              latepoint_calendar_set_month_label();
            }else{
              // console.log(data.message);
            }
          }
        });
      }
      return false;
    });
    jQuery('.os-month-prev-btn').on('click', function(){
      // check if prev month is already loaded
      if(jQuery('.os-monthly-calendar-days-w.active').prev('.os-monthly-calendar-days-w').length){
        jQuery('.os-monthly-calendar-days-w.active').removeClass('active').prev('.os-monthly-calendar-days-w').addClass('active');
        latepoint_calendar_set_month_label();
      }else{
        var $btn = jQuery(this);
        $btn.addClass('os-loading');
        var load_month_route_name = jQuery(this).data('route');
        var $calendar_element = jQuery('.os-monthly-calendar-days-w.active').last();
        var calendar_layout = $calendar_element.data('calendar-layout');
        var calendar_year = $calendar_element.data('calendar-year');
        var calendar_month = $calendar_element.data('calendar-month');
        if(calendar_month == 1){
          calendar_year = calendar_year - 1;
          calendar_month = 12;
        }else{
          calendar_month = calendar_month - 1;
        }
        var selected_agent_id = jQuery('.agent-select').val();
        var selected_service_id = jQuery('.service-select').val();
        var booking_info = {  target_date_string: calendar_year + '-' + calendar_month + '-1', 
                              agent_id: selected_agent_id, 
                              service_id: selected_service_id, 
                              allow_full_access: true, 
                              calendar_layout: calendar_layout 
                            };
        if(jQuery('.cc-location-selector select').length && jQuery('.cc-location-selector select').val()){
          booking_info.location_id = jQuery('.cc-location-selector select').val();
        }
        var data = {  action: 'latepoint_route_call', 
                      route_name: load_month_route_name, 
                      params: booking_info, 
                      layout: 'none', 
                      return_format: 'json' 
                    };
        jQuery.ajax({
          type : "post",
          dataType : "json",
          url : latepoint_helper.ajaxurl,
          data : data,
          success: function(data){
            $btn.removeClass('os-loading');
            if(data.status === "success"){
              jQuery('.os-months').prepend(data.message);
              jQuery('.os-monthly-calendar-days-w.active').removeClass('active').prev('.os-monthly-calendar-days-w').addClass('active');
              latepoint_calendar_set_month_label();
            }else{
              // console.log(data.message);
            }
          }
        });
      }
      return false;
    });
  }
  
  function latepoint_calendar_set_month_label(){
    jQuery('.os-current-month-label .current-month').text(jQuery('.os-monthly-calendar-days-w.active').data('calendar-month-label'));
    jQuery('.os-current-month-label .current-year').text(jQuery('.os-monthly-calendar-days-w.active').data('calendar-year'));
  }
  
  
  function latepoint_init_element_togglers(){
    jQuery('[data-toggle-element]').on('click', function(){
      var $this = jQuery(this);
      $this.closest('.os-form-checkbox-group').toggleClass('is-checked');
      jQuery($this.data('toggle-element')).toggle();
    });
  }
  
  
  function latepoint_init_color_picker(){
    if(jQuery('.latepoint-color-picker').length){
      jQuery('.latepoint-color-picker').each(function(){
        var color = jQuery(this).data('color');
        var picker = jQuery(this)[0];
        var $picker_wrapper = jQuery(this).closest('.latepoint-color-picker-w');
        Pickr.create({
          el: picker,
          default: color,
          comparison: false,
          useAsButton: true,
          components: {
  
              // Main components
              preview: true,
              opacity: false,
              hue: true,
  
              // Input / output Options
              interaction: {
                  input: false,
                  clear: false,
                  save: true
              }
          },
          onChange(hsva, instance) {
            $picker_wrapper.find('.os-form-control').val(hsva.toHEX().toString());
          },
        });
      });
    }
  }
  
  
  function latepoint_lightbox_close(){
    jQuery('body').removeClass('latepoint-lightbox-active');
    jQuery('.latepoint-lightbox-w').remove();
  }
  
  function latepoint_reload_select_service_categories(){
    jQuery('.service-selector-adder-field-w').each(function(){
      var $trigger_elem = jQuery(this);
      var route = jQuery('.service-selector-adder-field-w').find('select').data('select-source');
      var data = { action: 'latepoint_route_call', route_name: route, params: '', return_format: 'json' }
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $trigger_elem.removeClass('os-loading');
          if(response.status === "success"){
            latepoint_lightbox_close();
            $trigger_elem.find('select').html(response.message);
            $trigger_elem.find('select option:last').attr('selected', 'selected');
          }else{
            alert(response.message, 'error');
          }
        }
      });
    });
  }
  
  function latepoint_wizard_item_editing_cancelled(){
    jQuery('.os-wizard-setup-w').removeClass('is-sub-editing');
    jQuery('.os-wizard-footer').show();
    jQuery('.os-wizard-footer .os-wizard-next-btn').show();
  }
  
  function latepoint_load_quick_availability($trigger_elem, custom_agent_id = false, start_date = false, load_more_days = false, load_prev_days = false){
    $trigger_elem.addClass('os-loading');
    var route = jQuery('.trigger-quick-availability').data('route');
    var $quick_booking_form = jQuery('.quick-booking-form-w');
  
    if(custom_agent_id) $quick_booking_form.find('select[name="booking[agent_id]"]').val(custom_agent_id);
    if(!$quick_booking_form.find('input[name="booking[service_id]"]').val()){
      $quick_booking_form.find('.os-services-select-field-w .service-option:first').click();
    }
  
    var form_data = $quick_booking_form.find('form').serialize();
    if(start_date) form_data+= '&start_date='+start_date;
    if(load_more_days || load_prev_days) form_data+= '&show_days_only=true';
    if(load_prev_days) form_data+= '&previous_days=true';
    var data = { action: 'latepoint_route_call', route_name: route, params: form_data, return_format: 'json' }
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        $trigger_elem.removeClass('os-loading');
        if(response.status === "success"){
          if(load_more_days){
            $trigger_elem.parent('.os-availability-next-w').remove();
            jQuery('.latepoint-side-panel-w .os-availability-days').append(response.message);
          }else if(load_prev_days){
            $trigger_elem.parent('.os-availability-prev-w').remove();
            jQuery('.latepoint-side-panel-w .os-availability-days').prepend(response.message);
            jQuery('.latepoint-side-panel-w .os-availability-days').scrollTop(30);
          }else{
            if(jQuery('.latepoint-side-panel-w .side-sub-panel').length){
              jQuery('.latepoint-side-panel-w .side-sub-panel').replaceWith(response.message);
            }else{
              jQuery('.latepoint-side-panel-w').append(response.message);
            }
            jQuery('.latepoint-side-panel-w .os-availability-days').scrollTop(30);
            latepoint_init_quick_availability_form();
          }
        }else{
          alert(response.message, 'error');
        }
      }
    });
  }
  
  function latepoint_init_quick_availability_form(){
    var selected_start_date = jQuery('.quick-booking-form-w input#booking_start_date').val();
    var selected_start_time = jQuery('.quick-booking-form-w input[name="booking[start_time][formatted_value]"]').val();
    var selected_start_time_ampm = jQuery('.quick-booking-form-w input[name="booking[start_time][ampm]"]').val();
    var selected_start_time_minutes = latepoint_hours_and_minutes_to_minutes(selected_start_time, selected_start_time_ampm);
    jQuery('.quick-availability-per-day-w .os-availability-days').find('.agent-timeslot[data-formatted-date="'+ selected_start_date +'"][data-minutes="' + selected_start_time_minutes + '"]').addClass('selected');
    jQuery('.quick-availability-per-day-w').on('click', '.load-more-quick-availability', function(){
      latepoint_load_quick_availability(jQuery(this), false, jQuery(this).data('start-date'), true);
      return false;
    });
    jQuery('.quick-availability-per-day-w').on('click', '.load-prev-quick-availability', function(){
      latepoint_load_quick_availability(jQuery(this), false, jQuery(this).data('start-date'), false, true);
      return false;
    });
    jQuery('.quick-availability-per-day-w select[name="booking[agent_id]"]').on('change', function(){
      latepoint_load_quick_availability(jQuery('.trigger-quick-availability'), jQuery(this).val());
    });
    jQuery('.os-time-group label').on('click', function(){
      jQuery(this).closest('.os-time-group').find('.os-form-control').focus();
    });
    jQuery('.quick-availability-per-day-w').on('click', '.fill-booking-time', function(){
      jQuery('.os-availability-days .agent-timeslot.selected').removeClass('selected');
      jQuery(this).addClass('selected');
      var date = jQuery(this).data('date');
      var formatted_date = jQuery(this).data('formatted-date');
      var minutes = jQuery(this).data('minutes');
      var service_duration = jQuery('.os-services-select-field-w .service-option-selected').data('duration');
      var $form_w = jQuery('.quick-booking-form-w');
      $form_w.find('input[name="booking[start_date]"]').val(formatted_date);
      var start_minutes = minutes;
      var start_hours_and_minutes = latepoint_minutes_to_hours_and_minutes(start_minutes);
  
      if(start_minutes >= 720){
        $form_w.find('.quick-start-time-w .time-pm').click();
      }else{
        $form_w.find('.quick-start-time-w .time-am').click();
      }
  
      $form_w.find('input[name="booking[start_time][formatted_value]"]').val(start_hours_and_minutes);
      latepoint_set_booking_end_time();
      $form_w.find('.ws-period').addClass('animate-filled-in');
      setTimeout(function(){
        $form_w.find('.ws-period').removeClass('animate-filled-in');
      }, 500)
    });
  }
  
  
  function latepoint_init_work_period_form(){
    latepoint_mask_timefield(jQuery('.os-time-input-w .os-mask-time'));
  }
  
  function latepoint_close_side_panel(){
    jQuery('.latepoint-side-panel-w').remove();
  }
  
  function latepoint_reload_after_booking_save(){
    jQuery('.bookings-daily-agents .os-day-current.selected').first().click();
    if(jQuery('.calendar-week-agent-w').length) latepoint_load_calendar(jQuery('.calendar-start-date').val(), jQuery('.calendar-agent-selector').val(), jQuery('.calendar-location-selector').val());
    jQuery('.os-widget').each(function(){
      latepoint_reload_widget(jQuery(this));
    });
    if(jQuery('table.os-reload-on-booking-update').length) latepoint_filter_table(jQuery('table.os-reload-on-booking-update'), jQuery('table.os-reload-on-booking-update'));
    latepoint_close_side_panel();
  }
  
  function latepoint_init_quick_booking_form(){
    latepoint_lightbox_close();
  
    jQuery('.os-late-select').lateSelect();
    jQuery('.save-transaction-btn').on('click', function(){
      var $save_transaction_btn = jQuery(this);
      var $transaction_box = $save_transaction_btn.closest('.quick-add-transaction-box-w');
      var params = { amount: $transaction_box.find('input[name="transaction[amount]"]').val(), 
                  date: $transaction_box.find('input[name="transaction[created_at]"]').val(), 
                  token: $transaction_box.find('input[name="transaction[token]"]').val(), 
                  processor: $transaction_box.find('select[name="transaction[processor]"]').val(), 
                  payment_method: $transaction_box.find('select[name="transaction[payment_method]"]').val(),
                  booking_id: jQuery('.quick-booking-form-w').find('input[name="booking[id]"]').val(),
                  customer_id: jQuery('.quick-booking-form-w').find('input[name="booking[customer_id]"]').val()};
  
      var data = { action: 'latepoint_route_call', route_name: $transaction_box.data('route'), params: params, return_format: 'json' } 
      $save_transaction_btn.addClass('os-loading');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $save_transaction_btn.removeClass('os-loading');
          if(response.status === "success"){
            jQuery('.quick-transactions-list-w').append(response.message);
            $transaction_box.hide();
            jQuery('.trigger-add-transaction-btn').show();
          }else{
            alert(response.message);
          }
        }
      });
      return false;
    });
  
    jQuery('.trigger-price-recalculate').on('click', function(){
      latepoint_recalculate_booking_price(jQuery(this));
      return false;
    });
  
    jQuery('.trigger-add-transaction-btn').on('click', function(){
      jQuery('.quick-add-transaction-box-w').show().find('input[name="transaction[amount]"]').focus();
      jQuery('.trigger-add-transaction-btn').hide();
      return false;
    });
  
    jQuery('.trigger-cancel-add-transaction-btn').on('click', function(){
      jQuery('.quick-add-transaction-box-w').hide();
      jQuery('.trigger-add-transaction-btn').show();
      return false;
    });
  
    jQuery('.trigger-quick-availability').on('click', function(){
      latepoint_load_quick_availability(jQuery('.open-quick-availability-btn'));
      return false;
    });
    jQuery('.quick-booking-form-w input[name="booking[start_time][formatted_value]"]').on('change', function(){
      latepoint_set_booking_end_time();
    });
  
  
  
    latepoint_mask_timefield(jQuery('.latepoint-side-panel-w .os-mask-time'));
    latepoint_mask_phone(jQuery('.latepoint-side-panel-w .os-mask-phone'));
  
    jQuery('.customers-selector-search-input').keyup(function(){
      var $queryInput = jQuery(this);
      var query = $queryInput.val().toLowerCase();
      if(query == $queryInput.data('current-query')) return;
  
      // Search 
      $queryInput.closest('.customers-selector-search-w').addClass('os-loading');
      $queryInput.data('searching-query', query);
      setTimeout(function(){
        if(query != jQuery('.customers-selector-search-input').data('searching-query')) return;
        var data = { action: 'latepoint_route_call', route_name: $queryInput.data('route'), params: {query: query}, return_format: 'json' } 
        jQuery.ajax({
          type : "post",
          dataType : "json",
          url : latepoint_helper.ajaxurl,
          data : data,
          success: function(response){
            if($queryInput.data('searching-query') != query) return;
            $queryInput.closest('.customers-selector-search-w').removeClass('os-loading');
            if(response.status === "success"){
              $queryInput.data('current-query', query);
              jQuery('.quick-booking-form-w .customers-options-list').html(response.message);
            }else{
              console.log(response.message);
            }
          }
        });
      }, 300, query, $queryInput);
   });
  
  
    
    jQuery('.latepoint-side-panel-w').on('change', '.agent-selector', function(){
      latepoint_apply_agent_selector_change();
    });
    jQuery('.latepoint-side-panel-w').on('change', 'select[name="booking[location_id]"]', function(){
      latepoint_apply_agent_selector_change();
    });
    jQuery('.latepoint-side-panel-w').on('change', 'select[name="booking[total_attendies]"]', function(){
      latepoint_apply_agent_selector_change();
    });
  
    jQuery('.latepoint-side-panel-w').on('change', '.os-affects-duration', function(){
      latepoint_set_booking_end_time();
      if(jQuery('.quick-availability-per-day-w').length){
        latepoint_load_quick_availability(jQuery('.trigger-quick-availability'));
      }
    });
  
  
    jQuery('.latepoint-side-panel-w').on('click', '.services-options-list .service-option', function(){
      var selected_option_html = jQuery(this).html();
      var $selected_option = jQuery(this).closest('.os-services-select-field-w').find('.service-option-selected');
      $selected_option.html(selected_option_html)
                      .data('id', jQuery(this).data('id'))
                      .data('duration', jQuery(this).data('duration'))
                      .data('buffer-before', jQuery(this).data('buffer-before'))
                      .data('buffer-after', jQuery(this).data('buffer-after'))
                      .data('capacity-min', jQuery(this).data('capacity-min'))
                      .data('capacity-max', jQuery(this).data('capacity-max'))
                      .data('extra-durations', jQuery(this).data('extra-durations'));
      jQuery(this).closest('.os-services-select-field-w').find('.service-option.selected').removeClass('selected');
      jQuery(this).addClass('selected').closest('.os-services-select-field-w').removeClass('active');
      latepoint_apply_service_selector_change();
      return false;
    });
  
  }
  
  
  function latepoint_reload_widget($widget_elem){
    var form_data = $widget_elem.find('select, input').serialize();
    var data = { action: 'latepoint_route_call', route_name: $widget_elem.data('os-reload-action'), params: form_data, return_format: 'json' } 
    $widget_elem.addClass('os-loading');
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        $widget_elem.removeClass('os-loading');
        if(response.status === "success"){
          var $updated_widget_elem = jQuery(response.message);
          $updated_widget_elem.removeClass('os-widget-animated');
          $widget_elem = $widget_elem.replaceWith($updated_widget_elem);
          latepoint_init_daterangepicker($updated_widget_elem.find('.os-date-range-picker'));
          if($widget_elem.hasClass('os-widget-top-agents')) latepoint_init_circles_charts();
          if($widget_elem.hasClass('os-widget-daily-bookings')){
            latepoint_init_daily_bookings_chart();
            latepoint_init_donut_charts();
          }
        }else{
          alert(response.message);
        }
      }
    });
  }
  
  function latepoint_load_calendar(target_date, agent_id, location_id = false){
    var route_name = jQuery('.calendar-week-agent-w').data('calendar-action');
    jQuery('.calendar-week-agent-w').addClass('os-loading');
    var params_arr = {target_date: target_date, agent_id: agent_id};
    if(location_id) params_arr.location_id = location_id;
    var data = { action: 'latepoint_route_call', route_name: route_name, params: jQuery.param(params_arr), return_format: 'json' }
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        if(response.status === "success"){
          jQuery('.calendar-week-agent-w').html(response.message).removeClass('os-loading');
          jQuery('.calendar-load-target-date.os-loading').removeClass('os-loading');
        }else{
          alert(response.message);
        }
      }
    });
  }
  
  
  function latepoint_recalculate_booking_price($trigger){
    $trigger.addClass('os-loading');
    var $quick_edit_form = $trigger.closest('form.booking-quick-edit-form');
    var form_data = $quick_edit_form.serialize();
    
    var data = { action: 'latepoint_route_call', route_name: 'bookings__calculate_full_price', params: form_data, return_format: 'json' }
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        $trigger.removeClass('os-loading');
        if(response.status === "success"){
          $quick_edit_form.find('input[name="booking[price]"]').val(response.message);
        }else{
          alert(response.message);
        }
      }
    });
  }
  
  function latepoint_complex_selector_select($connection_wrappers){
    $connection_wrappers.each(function(){
      jQuery(this).addClass('active');
      jQuery(this).find('.connection-children-list li').addClass('active');
      jQuery(this).find('.connection-child-is-connected').val('yes');
      latepoint_count_active_connections(jQuery(this));
    });
  }
  
  function latepoint_complex_selector_deselect($connection_wrappers){
    $connection_wrappers.each(function(){
      jQuery(this).removeClass('active');
      jQuery(this).removeClass('show-customize-box');
      jQuery(this).find('.connection-children-list li.active').removeClass('active');
      jQuery(this).find('.connection-child-is-connected').val('no');
      latepoint_count_active_connections(jQuery(this));
    });
  }
  
  
  function latepoint_apply_agent_selector_change(){
    if(jQuery('.quick-availability-per-day-w').length){
      latepoint_load_quick_availability(jQuery('.trigger-quick-availability'));
    }
  }
  
  function latepoint_set_booking_end_time(){
    var $quick_edit_form = jQuery('form.booking-quick-edit-form');
    var booking_duration = 0;
    var service_duration = $quick_edit_form.find('.os-service-durations select').val();
    booking_duration = booking_duration + service_duration;
    if($quick_edit_form.find('select[name="temp_service_extras_ids"] option:selected').length){
      $quick_edit_form.find('select[name="temp_service_extras_ids"] option:selected').each(function(){
        var extra_duration = Number(jQuery(this).data('duration'));
        var $extra_quantity_input = jQuery(this).closest('.lateselect-w').find('.ls-item[data-value="' + jQuery(this).val() + '"]').find('.os-late-quantity-selector-input');
        if($extra_quantity_input.length) extra_duration = Number(extra_duration) * Number($extra_quantity_input.val());
        booking_duration = Number(booking_duration) + Number(extra_duration);
      });
    }
  
    var start_time = $quick_edit_form.find('input[name="booking[start_time][formatted_value]"]').val();
  
    if(start_time){
      var start_time_ampm = $quick_edit_form.find('input[name="booking[start_time][ampm]"]').val();
      var start_time_minutes = latepoint_hours_and_minutes_to_minutes(start_time, start_time_ampm);
      var end_time_minutes = parseInt(start_time_minutes) + parseInt(booking_duration);
      var end_time_ampm = (end_time_minutes >= 720) ? 'pm' : 'am';
      var end_hours_and_minutes = latepoint_minutes_to_hours_and_minutes(end_time_minutes);
  
      $quick_edit_form.find('input[name="booking[end_time][formatted_value]"]').val(end_hours_and_minutes);
      $quick_edit_form.find('.quick-end-time-w .time-ampm-select.time-' + end_time_ampm).click();
      $quick_edit_form.find('input[name="booking[end_time][formatted_value]"]').closest('.os-form-group').addClass('has-value');
    }
  }
  
  function latepoint_apply_service_selector_change(){
  
    var $selected_service = jQuery('.os-services-select-field-w .service-option-selected');
    var service_id = $selected_service.data('id');
    var buffer_before = $selected_service.data('buffer-before');
    var buffer_after = $selected_service.data('buffer-after');
    var default_duration = $selected_service.data('duration');
    var min_capacity = $selected_service.data('capacity-min');
    var max_capacity = $selected_service.data('capacity-max');
  
    var extra_durations = $selected_service.data('extra-durations');
  
    var $quick_edit_form = jQuery('form.booking-quick-edit-form');
    $quick_edit_form.find('input[name="booking[buffer_before]"]').val(buffer_before).closest('.os-form-group').addClass('has-value');
    $quick_edit_form.find('input[name="booking[buffer_after]"]').val(buffer_after).closest('.os-form-group').addClass('has-value');
    $quick_edit_form.find('input[name="booking[service_id]"]').val(service_id).closest('.os-form-group').addClass('has-value');
  
    var options = '<option value="'+ default_duration +'">' + default_duration + ' ' + latepoint_helper.string_minutes + '</option>';
    if(extra_durations.length){
      jQuery.each(extra_durations, function(index, value){
        options+= '<option value="'+ value.duration +'">' + value.duration + ' ' + latepoint_helper.string_minutes + '</option>';
      });
      $quick_edit_form.find('.os-service-durations').show();
    }else{
      $quick_edit_form.find('.os-service-durations').hide();
    }
  
    jQuery('.booking-total-attendies-selector-w .capacity-info strong').text(max_capacity);
    var attendies_options_html = '';
    for(var i=1;i<=max_capacity;i++){
      attendies_options_html+= '<option value="' + i + '">' + i + '</option>';
    }
    var selected_attendies = Math.min(jQuery('.booking-total-attendies-selector-w select').val(), max_capacity);
    jQuery('.booking-total-attendies-selector-w select').html(attendies_options_html).val(selected_attendies);
    if(max_capacity > 1){
      jQuery('.booking-total-attendies-selector-w').show();
    }else{
      jQuery('.booking-total-attendies-selector-w').hide();
    }
  
    $quick_edit_form.find('.os-service-durations select').html(options);
  
    latepoint_set_booking_end_time();
    if(jQuery('.quick-availability-per-day-w').length){
      latepoint_load_quick_availability(jQuery('.trigger-quick-availability'));
    }
    
  }
  
  
  function latepoint_init_daily_bookings_chart(){
    if(typeof Chart !== 'undefined' && jQuery('#chartDailyBookings').length){
  
      var $dailyBookingsChart = jQuery('#chartDailyBookings');
      var dailyBookingsLabels = $dailyBookingsChart.data('chart-labels').toString().split(',');
      var dailyBookingsValues = $dailyBookingsChart.data('chart-values').toString().split(',').map(Number);
      var dailyBookingsChartMax = Math.max.apply(Math, dailyBookingsValues) + 5;
  
  
  
      var fontFamily = latepoint_helper.font_family;
      // set defaults
      Chart.defaults.global.defaultFontFamily = fontFamily;
      Chart.defaults.global.defaultFontSize = 18;
      Chart.defaults.global.defaultFontStyle = '400';
  
      Chart.defaults.global.tooltips.titleFontFamily = fontFamily;
      Chart.defaults.global.tooltips.titleFontSize = 14;
      Chart.defaults.global.tooltips.titleFontColor = 'rgba(255,255,255,0.6)';
      Chart.defaults.global.tooltips.backgroundColor = '#000';
      Chart.defaults.global.tooltips.titleFontStyle = '400';
      Chart.defaults.global.tooltips.titleMarginBottom = 1;
      Chart.defaults.global.tooltips.bodyFontFamily = fontFamily;
      Chart.defaults.global.tooltips.bodyFontSize = 24;
      Chart.defaults.global.tooltips.bodyFontStyle = '500';
      Chart.defaults.global.tooltips.displayColors = false;
      Chart.defaults.global.tooltips.xPadding = 10;
      Chart.defaults.global.tooltips.yPadding = 8;
      Chart.defaults.global.tooltips.yAlign = 'bottom';
      Chart.defaults.global.tooltips.xAlign = 'center';
      Chart.defaults.global.tooltips.cornerRadius = 0;
      Chart.defaults.global.tooltips.intersect = false;
  
      var ctx = $dailyBookingsChart[0].getContext("2d");
      var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
      gradientStroke.addColorStop(0, '#587ef8');
      gradientStroke.addColorStop(1, '#1e4fef');
  
      var gradientFill = ctx.createLinearGradient(0, 200, 0, 50);
      gradientFill.addColorStop(0, "rgba(163, 165, 243, 0)");
      gradientFill.addColorStop(1, "rgba(163, 165, 243, 0.1)");
  
      // line chart data
      var chartDailyBookingsData = {
        labels: dailyBookingsLabels,
        datasets: [{
            label: "",
            fill: true,
            lineTension: 0.3,
            backgroundColor: gradientFill,
            // backgroundColor: "transparent",
            borderColor: "#0937ff",
            borderWidth: 2,
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "#fbfcff",
            borderColor: gradientStroke,
            pointBackgroundColor: "#0937ff",
            pointRadius: 0,
            pointBorderWidth: 2,
            pointHoverRadius: 5,
            pointHoverBorderWidth: 2,
            pointHoverBackgroundColor: "#0937ff",
            pointHoverBorderColor: "#fff",
            pointHitRadius: 15,
            data: dailyBookingsValues,
            spanGaps: false
          }]
      };
  
      // line chart init
      var chartDailyBookings = new Chart($dailyBookingsChart, {
        type: 'line',
        data: chartDailyBookingsData,
        options: {
          layout: {
            padding: {
              top: 20,
              left: 20,
              right: 20,
              bottom: 20
            }
          },
          responsive: true,
          maintainAspectRatio: false,
          legend: {
              display: false
          },
          scales: {
            xAxes: [{
              display: false,
              ticks: {
                fontSize: '10',
                fontColor: '#8894AF',
              },
              gridLines: {
                  color: 'rgba(0,0,0,0)',
                  zeroLineColor: 'rgba(0,0,0,0)'
              }
            }],
            yAxes: [{
              gridLines: {
                  color: 'rgba(0,0,0,0.0)',
                  zeroLineColor: 'rgba(0,0,0,0.0)'
              },
              display: false,
              ticks: {
                beginAtZero: false,
                suggestedMax: dailyBookingsChartMax,
                fontSize: '10',
                fontColor: '#8894AF',
              }
            }]
          }
        }
      });
    }
  }
  
  function latepoint_reload_daily_agents_page(){
    jQuery('.bookings-daily-agents').addClass('os-loading');
    var selected_agent_id = jQuery('.agent-select').val();
    var selected_service_id = jQuery('.service-select').val();
    var target_date = jQuery('.daily-agent-monthly-calendar-w .os-day.selected').data('date');
    var route = jQuery('.bookings-daily-agents').data('route');
  
    var params_arr = {target_date: target_date};
    if(selected_agent_id) params_arr.selected_agent_id = selected_agent_id;
    if(selected_service_id) params_arr.selected_service_id = selected_service_id;
    if(jQuery('.cc-location-selector select').length && jQuery('.cc-location-selector select').val()) params_arr.location_id = jQuery('.cc-location-selector select').val();
    var data = {  action: 'latepoint_route_call', 
                  route_name: route, 
                  params: jQuery.param(params_arr), 
                  layout: 'none', 
                  return_format: 'json' };
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(data){
        if(data.status === "success"){
          jQuery('.bookings-daily-agents').replaceWith(data.message);
          latepoint_init_donut_charts();
          latepoint_init_daily_agent_calendar();
          latepoint_init_monthly_calendar_navigation();
        }else{
          // console.log(data.message);
        }
        jQuery('.bookings-daily-agents').removeClass('os-loading');
      }
    });
  }
  
  
  function latepoint_init_daily_agent_calendar(){
    jQuery('select.agent-select, select.service-select').on('change', function(){
      latepoint_reload_daily_agents_page();
    });
    jQuery('.daily-agent-monthly-calendar-w').on('click', '.os-day', function(){
      var $calendar = jQuery(this).closest('.daily-agent-monthly-calendar-w');
  
      jQuery('.daily-agent-monthly-calendar-w .os-day.selected').removeClass('selected');
      jQuery(this).addClass('selected');
      if($calendar.hasClass('horizontal-calendar')){
        $calendar.find('.current-month').text(jQuery(this).data('nice-date'));
      }
      latepoint_reload_daily_agents_page();
    });
  }
  
  
  
  function latepoint_init_donut_charts(){
    if(typeof Chart !== 'undefined' && jQuery('.os-donut-chart').length){
      var fontFamily = latepoint_helper.font_family;
      // set defaults
      Chart.defaults.global.defaultFontFamily = fontFamily;
      Chart.defaults.global.defaultFontSize = 18;
      Chart.defaults.global.defaultFontStyle = '400';
  
      Chart.defaults.global.tooltips.titleFontFamily = fontFamily;
      Chart.defaults.global.tooltips.titleFontSize = 14;
      Chart.defaults.global.tooltips.titleFontColor = 'rgba(255,255,255,0.6)';
      Chart.defaults.global.tooltips.backgroundColor = '#000';
      Chart.defaults.global.tooltips.titleFontStyle = '400';
      Chart.defaults.global.tooltips.titleMarginBottom = 1;
      Chart.defaults.global.tooltips.bodyFontFamily = fontFamily;
      Chart.defaults.global.tooltips.bodyFontSize = 24;
      Chart.defaults.global.tooltips.bodyFontStyle = '500';
      Chart.defaults.global.tooltips.displayColors = false;
      Chart.defaults.global.tooltips.xPadding = 10;
      Chart.defaults.global.tooltips.yPadding = 8;
      Chart.defaults.global.tooltips.yAlign = 'bottom';
      Chart.defaults.global.tooltips.xAlign = 'center';
      Chart.defaults.global.tooltips.cornerRadius = 0;
      Chart.defaults.global.tooltips.intersect = false;
      jQuery('.os-donut-chart').each(function(index){
        var chart_colors = jQuery(this).data('chart-colors').toString().split(',');
        var chart_labels = jQuery(this).data('chart-labels').toString().split(',');
        var chart_values = jQuery(this).data('chart-values').toString().split(',').map(Number);
        var $chart_canvas = jQuery(this);
        var chartDonut = new Chart($chart_canvas, {
            type: 'doughnut',
            data: {
              labels: chart_labels,
              datasets: [{
                data: chart_values,
                backgroundColor: chart_colors,
                hoverBackgroundColor: chart_colors,
                borderWidth: 0,
                hoverBorderColor: 'transparent'
              }]
            },
            options: {
              layout: {
                padding: {
                  top: 40
                }
              },
              tooltips: {
                callbacks: {
                  title: function(tooltipItem, data) {
                    return data['labels'][tooltipItem[0]['index']];
                  },
                  label: function(tooltipItem, data) {
                    return data['datasets'][0]['data'][tooltipItem['index']];
                  },
                }
              },
              legend: {
                  display: false
              },
              animation:{
                  animateScale:true
              },
              cutoutPercentage: 80,
              responsive: false,
              maintainAspectRatio: true, 
            }
        });
      });
    }
  }
  
  
  function latepoint_init_circles_charts(){
    jQuery('.circle-chart').each(function(index){
      var chart_elem_id = jQuery(this).prop('id');
      var max_value = jQuery(this).data('max-value');
      var chart_value = jQuery(this).data('chart-value');
      var chart_color = jQuery(this).data('chart-color');
      var chart_color_fade = jQuery(this).data('chart-color-fade');
      var myCircle = Circles.create({
        id:                  chart_elem_id,
        radius:              25,
        value:               chart_value,
        maxValue:            max_value,
        width:               2,
        text:                function(value){return Math.round(value);},
        colors:              [chart_color, chart_color_fade],
        duration:            200,
        wrpClass:            'circles-wrp',
        textClass:           'circles-text',
        valueStrokeClass:    'circles-valueStroke',
        maxValueStrokeClass: 'circles-maxValueStroke',
        styleWrapper:        true,
        styleText:           true
      });
  
    });
  
  
  }
  
  
  function latepoint_random_text(length){
     var result           = '';
     var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
     var charactersLength = characters.length;
     for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
     }
     return result;
  }
  
  function latepoint_get_order_for_service_categories(){
  
  }
  
  
  function latepoint_init_daterangepicker($elem){
    $elem.each(function(){
      // DATERANGEPICKER
      var picker_start_time = jQuery(this).find('input[name="date_from"], .os-datepicker-date-from').val();
      var picker_end_time = jQuery(this).find('input[name="date_to"], .os-datepicker-date-to').val();
      var locale = {};
      if(jQuery(this).data('can-be-cleared')) locale = { cancelLabel: jQuery(this).data('clear-btn-label')};
  
  
      moment.locale(latepoint_helper.wp_locale);
  
      jQuery(this).daterangepicker({
        opens: 'left',
        singleDatePicker: (jQuery(this).data('single-date') == 'yes'),
        startDate: (picker_start_time) ? moment(picker_start_time) : moment(),
        endDate: (picker_end_time) ? moment(picker_end_time) : moment(),
        locale: locale
      });
    });
  
    $elem.on('cancel.daterangepicker', function(ev, picker) {
      if(picker.element.data('can-be-cleared')){
        picker.element.find('input[name="date_from"], .os-datepicker-date-from').val('');
        picker.element.find('input[name="date_to"], .os-datepicker-date-to').val('');
        picker.element.find('span.range-picker-value').text(picker.element.data('no-value-label'));
        if(picker.element.hasClass('os-table-filter-datepicker')){
          latepoint_filter_table(picker.element.closest('table'), picker.element.closest('.os-form-group'));
        }
      }
    });
  
    $elem.on('apply.daterangepicker', function(ev, picker) {
      if(picker.element.data('single-date') == 'yes'){
        picker.element.find('.range-picker-value').text(picker.startDate.format('ll'));
      }else{
        picker.element.find('.range-picker-value').text(picker.startDate.format('ll') + ' - ' + picker.endDate.format('ll'));
      }
      picker.element.find('input[name="date_from"], .os-datepicker-date-from').attr('value', picker.startDate.format('YYYY-MM-DD'));
      picker.element.find('input[name="date_to"], .os-datepicker-date-to').attr('value', picker.endDate.format('YYYY-MM-DD'));
      if(picker.element.closest('.os-widget').length){
        latepoint_reload_widget(picker.element.closest('.os-widget'));
      }
      if(picker.element.hasClass('os-table-filter-datepicker')){
        latepoint_filter_table(picker.element.closest('table'), picker.element.closest('.os-form-group'));
      }
    });
  }
  
  function latepoint_recalculate_services_count_in_category(){
    jQuery('.os-category-services-count').each(function(){
      var number_of_services = jQuery(this).closest('.os-category-parent-w').find('.service-in-category-w').length;
      jQuery(this).find('span').text(number_of_services);
    });
  }
  
  function latepoint_remove_agent_box($remove_btn){
    var $agent_box = $remove_btn.closest('.agent-box-w');
    $agent_box.fadeOut(300, function(){ jQuery(this).remove(); });
  }
  
  function latepoint_remove_service_box($remove_btn){
    var $service_box = $remove_btn.closest('.service-box-w');
    $service_box.fadeOut(300, function(){ jQuery(this).remove(); });
  }
  
  function latepoint_init_monthly_view(){
    if(!jQuery('.calendar-month-agents-w').length) return;
    if(jQuery('.ma-days-with-bookings-w').length){
      // var ps = new PerfectScrollbar(jQuery('.ma-days-with-bookings-w')[0]);
    }
  
    jQuery('#monthly_calendar_month_select, #monthly_calendar_year_select, #monthly_calendar_location_select').on('change', function(){
      var $calendar = jQuery('.calendar-month-agents-w');
      var route_name = $calendar.data('route');
      $calendar.addClass('os-loading');
      var params = { month: jQuery('#monthly_calendar_month_select').val(), year: jQuery('#monthly_calendar_year_select').val() };
      if(jQuery('#monthly_calendar_location_select').length && jQuery('#monthly_calendar_location_select').val()) params.location_id = jQuery('#monthly_calendar_location_select').val();
      var data = { action: 'latepoint_route_call', route_name: route_name, params: params, layout: 'none', return_format: 'json' }
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $calendar.removeClass('os-loading');
          if(data.status === "success"){
            $calendar.html(data.message);
          }else{
            // console.log(data.message);
          }
        }
      });
    });
    jQuery('.custom-day-calendar').on('click', '.os-day', function(){
      var $this = jQuery(this);
      jQuery('.custom-day-calendar .os-day.selected').removeClass('selected');
      $this.addClass('selected');
      jQuery('.latepoint-lightbox-footer').slideDown(200);
      if(jQuery('.custom-day-calendar').data('show-schedule') == 'yes') jQuery('.latepoint-lightbox-w').removeClass('hide-schedule');
      jQuery('.custom_day_schedule_date').val($this.data('date'));
      return false;
    });
  }
  
  
  function latepoint_init_copy_on_click_elements(){
    
    jQuery('.os-click-to-copy').mouseenter(function() {
      var position_info = jQuery(this).position();
      var width = jQuery(this).outerWidth();
      var position_left = position_info.left + width + 5;
      var position_top = position_info.top + 3;
      jQuery(this).after('<div class="os-click-to-copy-prompt" style="top: '+position_top+'px; left: '+position_left+'px;">' + latepoint_helper.click_to_copy_prompt + '</div>');
    }).mouseleave(function() {
      jQuery(this).nextAll('.os-click-to-copy-prompt').remove();
    });
    jQuery('.os-click-to-copy').on('click', function(){
      var $this = jQuery(this);
      $this.nextAll('.os-click-to-copy-prompt').hide();
      var $tempElement = jQuery("<input>");
      jQuery("body").append($tempElement);
      $tempElement.val($this.text()).select();
      document.execCommand("Copy");
      $tempElement.remove();
  
      var position_info = $this.position();
      var width = $this.outerWidth();
      var position_left = position_info.left + width + 5;
      var position_top = position_info.top + 3;
      var $done_prompt = jQuery('<div class="os-click-to-copy-done" style="top: '+position_top+'px; left: '+position_left+'px;">' + latepoint_helper.click_to_copy_done + '</div>');
      $done_prompt.insertAfter($this).animate({
        opacity: 0,
        left: (position_left + 20),
      }, 600);
      setTimeout(function(){
        $this.nextAll('.os-click-to-copy-done').remove();
        $this.nextAll('.os-click-to-copy-prompt').show();
      }, 800);
    });
  }
  
  function latepoint_sync_update_progress(is_removed){
    var synced_total = jQuery('.os-sync-stat-tiles .os-tile-value span').text();
    if(is_removed){
      synced_total = parseInt(synced_total) - 1;
    }else{
      synced_total = parseInt(synced_total) + 1;
    }
    jQuery('.os-sync-stat-tiles .os-tile-value span').text(synced_total);
    jQuery('.os-tile-hor-progress-chart').data('value', synced_total);
    var chart_total = jQuery('.os-tile-hor-progress-chart').data('total');
    var chart_value = jQuery('.os-tile-hor-progress-chart').data('value');
    if(chart_total > 0){
      var percent = Math.round(chart_value / chart_total * 100);
      jQuery('.os-tile-hor-progress-chart-value').css('width', percent + '%');
    }
  }
  
  function latepoint_remove_first_synced_booking_with_google(){
    var $trigger = jQuery('.os-booking-tiny-box.is-synced:first .os-booking-sync-google-trigger');
    if(!$trigger.length || jQuery('.remove-all-bookings-from-google-trigger').hasClass('stop-removing')){
      jQuery('.remove-all-bookings-from-google-trigger').removeClass('os-removing').removeClass('stop-removing').find('span').text(jQuery('.remove-all-bookings-from-google-trigger').data('label-remove'));
      return false;
    }
  
    var route = $trigger.data('os-remove-action');
    var params = $trigger.data('os-params');
    var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' };
    $trigger.addClass('os-loading');
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        if(response.status === "success"){
          $trigger.closest('.os-booking-tiny-box').removeClass('is-synced').addClass('not-synced');
          $trigger.removeClass('os-loading');
          latepoint_sync_update_progress(true);
          latepoint_remove_first_synced_booking_with_google();
        }
      }
    });
  }
  
  
  function latepoint_sync_next_booking_with_google(){
    var $trigger = jQuery('.os-booking-tiny-box.not-synced:first .os-booking-sync-google-trigger');
    if(!$trigger.length || jQuery('.sync-all-bookings-to-google-trigger').hasClass('stop-syncing')){
      jQuery('.sync-all-bookings-to-google-trigger').removeClass('os-syncing').removeClass('stop-syncing').find('span').text(jQuery('.sync-all-bookings-to-google-trigger').data('label-sync'));
      return false;
    }
  
    var route = $trigger.data('os-action');
    var params = $trigger.data('os-params');
    var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' };
    $trigger.addClass('os-loading');
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(response){
        if(response.status === "success"){
          $trigger.closest('.os-booking-tiny-box').removeClass('not-synced').addClass('is-synced');
          $trigger.removeClass('os-loading');
          latepoint_sync_update_progress(false);
          latepoint_sync_next_booking_with_google();
        }
      }
    });
  }
  
  function latepoint_init_reminder_form(){
    if(typeof tinymce !== 'undefined' && jQuery('.os-reminder-form:last-child textarea').length) tinymce.execCommand( 'mceAddEditor', true, jQuery('.os-reminder-form:last-child textarea').attr('id') );
  }
  
  function latepoint_filter_table($table, $filter_elem, reset_page = true){
    $filter_elem.addClass('os-loading');
    var filter_params = $table.find('.os-table-filter').serialize();
    var $table_w = $table.closest('.table-with-pagination-w');
    if(reset_page){
      $table_w.find('select.pagination-page-select').val(1);
    }else{
      filter_params+= '&page_number='+$table_w.find('select.pagination-page-select').val();
    }
    var route = $table.data('route');
    var data = { action: 'latepoint_route_call', route_name: route, params: filter_params, layout: 'none', return_format: 'json' };
    jQuery.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(data){
        $filter_elem.removeClass('os-loading');
        if(data.status === "success"){
          $table.find('tbody').html(data.message);
          if(data.total_pages && reset_page){
            var options = '';
            for(var i = 1; i <= data.total_pages; i++){
              options+= '<option>'+ i +'</option>';
            }
            $table_w.find('select.pagination-page-select').html(options);
          }
          $table_w.find('.os-pagination-from').text(data.showing_from);
          $table_w.find('.os-pagination-to').text(data.showing_to);
          $table_w.find('.os-pagination-total').text(data.total_records);
        }else{
          // console.log(data.message);
        }
      }
    });
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // DOCUMENT READY
  jQuery(document).ready(function( $ ) {
  
    // Google calendar
    if(latepoint_helper.google_calendar_is_enabled && jQuery('.os-google-cal-authorize-btn').length){
      latepoint_helper.google_calendar = new OsGoogleCalendar();
      latepoint_helper.google_calendar.init();
    }
  
    // DASHBOARD
    latepoint_init_daily_agent_calendar();
    latepoint_init_circles_charts();
    latepoint_init_donut_charts();
    latepoint_init_daily_bookings_chart();
    latepoint_init_element_togglers();
    latepoint_init_daterangepicker(jQuery('.os-date-range-picker'));
    latepoint_init_monthly_calendar_navigation();
    latepoint_init_monthly_view();
    latepoint_init_custom_fields_form();
    latepoint_init_reminders_form();
    latepoint_init_coupons_form();
    latepoint_init_copy_on_click_elements();
    latepoint_init_side_menu();
    latepoint_init_color_picker();
  
    jQuery('.os-select-all-toggler').on('change', function(){
      var $connection_wrappers = jQuery(this).closest('.white-box').find('.os-complex-connections-selector .connection');
      if($(this).is(':checked')){
        latepoint_complex_selector_select($connection_wrappers);
      }else{
        latepoint_complex_selector_deselect($connection_wrappers);
      }
      return false;
    });
  
  
    jQuery('.os-main-location-selector').on('change', function(){
      var route = jQuery(this).data('route');
      var params = 'id=' + jQuery(this).val();
      var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' };
      jQuery('.latepoint-content-w').addClass('os-loading');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          location.reload();
        }
      });
    });
  
    $('.os-service-durations-w').on('click', '.os-remove-duration', function(){
      $(this).closest('.duration-box').slideUp(300, function(){
        $(this).remove();
      });
      return false;
    });
  
  
    $('.menu-color-toggler').on('click', function(){
      $('.latepoint-side-menu-w').toggleClass('dark');
      return false;
    });
  
  
    $('.latepoint-mobile-top-menu-trigger').on('click', function(){
      $(this).closest('.latepoint-all-wrapper').toggleClass('os-show-mobile-menu');
      if($(this).closest('.latepoint-all-wrapper').hasClass('os-show-mobile-menu')){
        $('.latepoint-side-menu-w ul.side-menu > li.has-children > a').on('click', function(){
          $(this).closest('li').toggleClass('menu-item-sub-open-mobile');
          return false;
        });
      }else{
        $('.latepoint-side-menu-w ul.side-menu > li.has-children > a').off('click');
      }
      return false;
    });
  
    $('.latepoint-mobile-top-search-trigger-cancel').on('click', function(){
      $(this).closest('.latepoint-all-wrapper').removeClass('os-show-mobile-search');
      return false;
    });
  
    $('.latepoint-mobile-top-search-trigger').on('click', function(){
      $(this).closest('.latepoint-all-wrapper').toggleClass('os-show-mobile-search');
      if($(this).closest('.latepoint-all-wrapper').hasClass('os-show-mobile-search')){
        $('.latepoint-top-search').focus();
      }
      return false;
    });
  
    $('.latepoint-content').on('click', '.os-widget-header-actions-trigger', function(){
      $(this).closest('.os-widget-header').toggleClass('os-show-actions');
      return false;
    });
  
  
    $('.sync-all-bookings-to-google-trigger').on('click', function(){
      if($(this).hasClass('os-syncing')){
        $(this).addClass('stop-syncing');
        $(this).find('span').text($(this).data('label-sync'));
      }else{
        $(this).find('span').text($(this).data('label-cancel-sync'));
        $(this).addClass('os-syncing');
        latepoint_sync_next_booking_with_google();
      }
      return false;
    });
  
  
    $('.remove-all-bookings-from-google-trigger').on('click', function(){
  
      if($(this).hasClass('os-removing')){
        $(this).addClass('stop-removing');
        $(this).find('span').text($(this).data('label-remove'));
      }else{
        if(!confirm($(this).data('os-prompt'))) return false;
        $(this).find('span').text($(this).data('label-cancel-remove'));
        $(this).addClass('os-removing');
        latepoint_remove_first_synced_booking_with_google();
      }
      return false;
    });
  
    
  
  
    jQuery('.download-csv-with-filters').on('click', function(){
      var filter_params = jQuery(this).closest('table').find('.os-table-filter').serialize();
      filter_params+= '&download=csv';
      jQuery(this).attr('href', this.href + '&' + filter_params);
    });
  
    $('select.pagination-page-select').on('change', function(){
      latepoint_filter_table(jQuery(this).closest('.table-with-pagination-w').find('table'), jQuery(this).closest('.pagination-page-select-w'), false);
    });
  
    $('select.os-table-filter').on('change', function(){
      latepoint_filter_table(jQuery(this).closest('table'), jQuery(this).closest('.os-form-group'));
    });
  
    $('input.os-table-filter').on('keyup', function(){
      latepoint_filter_table(jQuery(this).closest('table'), jQuery(this).closest('.os-form-group'));
    });
  
  
    jQuery('.customize-connection-btn').on('click', function(){
      jQuery(this).closest('.connection').toggleClass('show-customize-box');
      return false;
    });
  
    jQuery('.connection-children-list').on('click', 'li', function(){
      if(jQuery(this).hasClass('active')){
        jQuery(this).removeClass('active');
        jQuery(this).find('input.connection-child-is-connected').val('no');
      }else{
        jQuery(this).addClass('active');
        jQuery(this).find('input.connection-child-is-connected').val('yes');
      }
      latepoint_count_active_connections(jQuery(this).closest('.connection'));
      return false;
    });
  
    jQuery('.add-service-category-trigger').on('click', function(){
      $('.add-service-category-box').toggle();
      $('.os-new-service-category-form-w').toggle();
      return false;
    });
  
    jQuery('.latepoint-top-search').on('keyup', function(event){
      var $wrapper = jQuery(this).closest('.latepoint-top-search-w');
      $wrapper.addClass('os-loading');
      var query = jQuery(this).val();
      if(event.keyCode == 27){
        $wrapper.removeClass('typing');
        jQuery('.latepoint-top-search-results-w').html('');
        jQuery(this).val('');
        $wrapper.removeClass('os-loading');
        return;
      }
      if(query == ''){
        $wrapper.removeClass('typing');
        jQuery('.latepoint-top-search-results-w').html('');
        $wrapper.removeClass('os-loading');
        return;
      }
      var route = jQuery(this).data('route');
      var params = 'query=' + query;
      var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' };
      $wrapper.addClass('typing');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          if(!$wrapper.hasClass('typing')) return;
          $wrapper.removeClass('os-loading');
          if(data.status === "success"){
            jQuery('.latepoint-top-search-results-w').html(data.message);
          }else{
            // console.log(data.message);
          }
        }
      });
    });
  
  
  
    jQuery('.add-custom-step-btn').on('click', function(e){
      var $step = jQuery('.empty-step-w .step-w').clone();
      var step_name = 'step_' + latepoint_random_text(6);
      var step_order_number = $('.steps-ordering-w .step-w').length;
      $step.find('input[name="step[name]"]').val(step_name);
      $step.find('input[name="step[order_number]"]').val(step_order_number);
  
      $step.addClass('editing').attr('data-step-name', step_name);
      jQuery('.steps-ordering-w').append($step);
      return false;
    });
  
  
  
    jQuery('.appointment-status-selector').on('click', function(e){
      e.stopPropagation();
    });
  
    jQuery('.latepoint-show-license-details').on('click', function(e){
      jQuery(this).closest('.active-license-info').find('.license-form-w').slideToggle(200);
      return false;
    });
  
    jQuery('.aba-button-w').on('click', function(e){
      e.stopPropagation();
      var confirm_message = (jQuery(this).hasClass('aba-approve')) ? latepoint_helper.approve_confirm : latepoint_helper.reject_confirm;
      if(confirm(confirm_message)){
        var $box = jQuery(this).closest('.appointment-box-large');
        $box.find('.appointment-status-selector select').val(jQuery(this).data('status')).change();
      }
      return false;
    });
  
  
    jQuery('select.agent_google_calendar_selector').on('change', function(e){
      var route = $(this).data('route');
      var calendar_id = $(this).val();
      var agent_id = $(this).data('agent-id');
      var data = { action: 'latepoint_route_call', 
                    route_name: route, 
                    params: {calendar_id: calendar_id, agent_id: agent_id}, 
                    layout: 'none', 
                    return_format: 'json' }
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          if(data.status === "success"){
            latepoint_add_notification(data.message);
          }else{
            // console.log(data.message);
          }
        }
      });
    });
  
  
    jQuery('.appointment-status-selector select').on('change', function(e){
      var $wrapper = jQuery(this).closest('.appointment-status-selector');
      var route = $wrapper.data('route');
      var booking_id = $wrapper.data('booking-id');
      var status = jQuery(this).val();
      jQuery(this).closest('.appointment-box-large').attr('class', 'appointment-box-large status-' + status);
      var params = 'id=' + booking_id + '&status=' + status;
      var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' };
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          if(data.status === "success"){
            latepoint_add_notification(data.message);
          }else{
            // console.log(data.message);
          }
        }
      });
    });
  
    jQuery('body').on('click', '.open-template-variables-panel', function(){
      jQuery('.latepoint-template-variables').toggleClass('is-visible');
      return false;
    });
  
    jQuery('body').on('click', '.close-template-variables-panel', function(){
      jQuery('.latepoint-template-variables').removeClass('is-visible');
      return false;
    });
  
    jQuery('body').on('click', '.os-notifications .os-notification-close', function(){
      jQuery(this).closest('.item').remove();
      return false;
    });
  
  
    jQuery('body').on('keyup', '.os-form-group .os-form-control', function(){
      if(jQuery(this).val()){
        jQuery(this).closest('.os-form-group').addClass('has-value');
      }else{
        jQuery(this).closest('.os-form-group').removeClass('has-value');
      }
    });
  
  
  
    jQuery('.os-wizard-setup-w, .latepoint-settings-w, .custom-schedule-wrapper').on('click', '.ws-head', function(){
      var $schedule_wrapper = jQuery(this).closest('.weekday-schedule-w');
      $schedule_wrapper.toggleClass('is-editing').removeClass('day-off');
      $schedule_wrapper.find('.os-toggler').removeClass('off');
      $schedule_wrapper.find('input.is-active').val(1);
    });
  
  
    latepoint_mask_timefield(jQuery('.os-mask-time'));
    latepoint_mask_phone(jQuery('.os-mask-phone'));
  
    jQuery('.latepoint').on('click', '.wizard-add-edit-item-trigger', function(e){
      jQuery(this).addClass('os-loading');
      var add_item_route_name = jQuery(this).data('route');
      var item_info = {  };
      if(jQuery(this).data('id')){
        item_info.id = jQuery(this).data('id');
      }
      var data = { action: 'latepoint_route_call', route_name: add_item_route_name, params: item_info, layout: 'none', return_format: 'json' };
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          jQuery('.wizard-add-edit-item-trigger.os-loading').removeClass('os-loading');
          if(data.status === "success"){
            jQuery('.os-wizard-step-content-i').html(data.message);
            jQuery('.os-wizard-setup-w').addClass('is-sub-editing');
            jQuery('.os-wizard-footer').hide();
          }else{
            // console.log(data.message);
          }
        }
      });
    });
  
  
  
  
    // WIZARD NEXT BUTTON CLICK LOGIC
    jQuery('.latepoint').on('click', '.os-wizard-next-btn', function(){
      var $next_btn = jQuery(this);
      $next_btn.addClass('os-loading');
      var current_step = jQuery('#wizard_current_step').val();
      var params = 'current_step='+current_step;
      if(jQuery('.os-wizard-setup-w form.weekday-schedules-w').length){
        params+= '&'+ jQuery('.os-wizard-setup-w form.weekday-schedules-w .weekday-schedule-w:not(.day-off) input').serialize();
      }
      var data = { action: 'latepoint_route_call', route_name: jQuery(this).data('route-name'), params: params, layout: 'none', return_format: 'json'};
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $next_btn.removeClass('os-loading');
          if(data.status === "success"){
            jQuery('#wizard_current_step').val(data.step_name);
            jQuery('.os-wizard-setup-w').attr('class', 'os-wizard-setup-w step-' + data.step_name);
            jQuery('.os-wizard-step-content').html(data.message);
            if(data.show_prev_btn){
              jQuery('.os-wizard-prev-btn').show();
            }else{
              jQuery('.os-wizard-prev-btn').hide();
            }
            if(data.show_next_btn){
              jQuery('.os-wizard-next-btn').show();
            }else{
              jQuery('.os-wizard-next-btn').hide();
            }
            if(!data.show_next_btn && !data.show_prev_btn){
              jQuery('.os-wizard-footer').hide();
            }else{
              jQuery('.os-wizard-footer').show();
            }
          }
        }
      });
      return false;
    });
  
    // WIZARD PREV BUTTON CLICK LOGIC
    jQuery('.latepoint').on('click', '.os-wizard-prev-btn', function(){
      var $prev_btn = jQuery(this);
      $prev_btn.addClass('os-loading');
      var current_step = jQuery('#wizard_current_step').val();
      var params = 'current_step='+current_step;
      var data = { action: 'latepoint_route_call', route_name: jQuery(this).data('route-name'), params: params, layout: 'none', return_format: 'json'};
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $prev_btn.removeClass('os-loading');
          if(data.status === "success"){
            jQuery('#wizard_current_step').val(data.step_name);
            jQuery('.os-wizard-setup-w').attr('class', 'os-wizard-setup-w step-' + data.step_name);
            jQuery('.os-wizard-step-content').html(data.message);
            if(data.show_prev_btn){
              jQuery('.os-wizard-prev-btn').show();
            }else{
              jQuery('.os-wizard-prev-btn').hide();
            }
            if(data.show_next_btn){
              jQuery('.os-wizard-next-btn').show();
            }else{
              jQuery('.os-wizard-next-btn').hide();
            }
            if(!data.show_next_btn && !data.show_prev_btn){
              jQuery('.os-wizard-footer').hide();
            }else{
              jQuery('.os-wizard-footer').show();
            }
          }
        }
      });
      return false;
    });
  
    jQuery('.latepoint-content-w').on('change', '.os-widget .os-trigger-reload-widget', function(){
      latepoint_reload_widget(jQuery(this).closest('.os-widget'));
    });
  
  
    dragula([].slice.apply(document.querySelectorAll('.os-categories-ordering-w .os-category-children')), {
      moves: function (el, container, handle) {
        return (handle.classList.contains('os-category-drag') || handle.classList.contains('os-category-service-drag'));
      },
    }).on('drop', function(el){
      var $categories_wrapper = jQuery('.os-categories-ordering-w');
      var category_datas = [];
      var service_datas = [];
  
      $categories_wrapper.find('.os-category-parent-w').each(function(index){
        var order_number = jQuery(this).index() + 1;
        var parent_id = jQuery(this).parent().closest('.os-category-parent-w').data('id') || 0;
        category_datas.push({id: jQuery(this).data('id'), order_number: order_number, parent_id: parent_id});
      });
      $categories_wrapper.find('.service-in-category-w').each(function(index){
        var service_order_number = jQuery(this).index() + 1;
        var category_id = jQuery(this).closest('.os-category-parent-w').data('id') || 0;
        service_datas.push({id: jQuery(this).data('id'), order_number: service_order_number, category_id: category_id});
      });
      latepoint_recalculate_services_count_in_category();
      var data = { action: 'latepoint_route_call', route_name: $categories_wrapper.data('category-order-update-route'), params: {category_datas: category_datas, service_datas: service_datas}, return_format: 'json' } 
      $categories_wrapper.addClass('os-loading');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $categories_wrapper.removeClass('os-loading');
          if(response.status === "success"){
            // latepoint_add_notification(response.message);
          }else{
            alert(response.message);
          }
        }
      });
    });
  
  
    // Custom Fields Order Dragging
    dragula([jQuery('.os-custom-fields-ordering-w')[0]], {
      moves: function (el, container, handle) {
        return handle.classList.contains('os-custom-field-drag');
      },
    }).on('drop', function(el){
      var custom_fields_order_data = {};
      var $custom_fields_wrapper = jQuery('.os-custom-fields-ordering-w');
      $custom_fields_wrapper.find('.os-custom-field-form').each(function(index){
        var new_order_number = jQuery(this).index() + 1;
        var $field_id = jQuery(this).find('.os-custom-field-id');
        if($field_id.length && $field_id.val()) custom_fields_order_data[$field_id.val()] = new_order_number;
      });
      var data = { action: 'latepoint_route_call', 
                    route_name: $custom_fields_wrapper.data('order-update-route'), 
                    params: {ordered_fields: custom_fields_order_data, 
                    fields_for: $custom_fields_wrapper.data('fields-for')}, 
                    return_format: 'json' } 
      $custom_fields_wrapper.addClass('os-loading');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $custom_fields_wrapper.removeClass('os-loading');
        }
      });
    });
  
    // Steps Order Dragging
    dragula([jQuery('.steps-ordering-w')[0]], {
      moves: function (el, container, handle) {
        return handle.classList.contains('step-drag');
      },
    }).on('drop', function(el){
      var step_order_data = {};
      var $steps_wrapper = jQuery('.steps-ordering-w');
      $steps_wrapper.find('.step-w').each(function(index){
        var new_order_number = jQuery(this).index() + 1;
        jQuery(this).data('step-order-number', new_order_number);
        jQuery(this).find('input[name="step[order_number]"]').val(new_order_number);
        step_order_data[jQuery(this).data('step-name')] = new_order_number;
      });
      var data = { action: 'latepoint_route_call', route_name: $steps_wrapper.data('step-order-update-route'), params: {steps: step_order_data}, return_format: 'json' } 
      $steps_wrapper.addClass('os-loading');
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $steps_wrapper.removeClass('os-loading');
        }
      });
    });
  
    jQuery('body.latepoint-admin').on('click', '.os-category-edit-btn, .os-category-edit-cancel-btn, .os-category-w .os-category-name', function(){
      jQuery(this).closest('.os-category-w').toggleClass('editing');
      return false;
    });
  
    jQuery('body.latepoint-admin').on('click', '.step-edit-btn, .step-edit-cancel-btn, .step-w .step-name', function(){
      jQuery(this).closest('.step-w').toggleClass('editing');
      return false;
    });
      
    jQuery('body.latepoint-admin').on('click', '.agent-info-change-agent-btn', function(){
      jQuery(this).closest('.agent-info-w').removeClass('selected').addClass('selecting');
      return false;
    });
    
    jQuery('body.latepoint-admin').on('click', '.agent-info-change-agent-btn', function(){
      jQuery(this).closest('.agent-info-w').removeClass('selected').addClass('selecting');
      return false;
    });
    
  
    jQuery('body.latepoint-admin').on('click', '.customer-info-create-btn', function(){
      jQuery(this).closest('.customer-info-w').removeClass('selecting').addClass('selected');
      return false;
    });
  
    jQuery('body.latepoint-admin').on('click', '.customer-info-load-btn', function(){
      jQuery(this).closest('.customer-info-w').removeClass('selected').addClass('selecting').find('.customers-selector-search-input').focus();
      return false;
    });
  
    jQuery('body.latepoint-admin').on('click', '.customers-selector-cancel', function(){
      jQuery(this).closest('.customer-info-w').removeClass('selecting').addClass('selected ');
      jQuery('.customers-options-list .customer-option').show();
      jQuery('.customers-selector-search-input').val('');
      return false;
    });
  
    // CUSTOMER SELECTOR
  
    // SERVICES SELECTOR
    jQuery('body.latepoint-admin').on('click', '.os-services-select-field-w .service-option-selected', function(){
      var $select = jQuery(this).closest('.os-services-select-field-w');
      if($select.hasClass('active')){
        $select.removeClass('active');
      }else{
        $select.addClass('active').find('input').focus();
      }
      return false;
    });
  
    jQuery('body.latepoint-admin').on('click', '.os-services-select-field-w service-option-selected', function(){
  
      return false;
    });
  
  
    jQuery('body.latepoint-admin').on('keyup', '.service-options-filter-input', function(){
      var $list = jQuery(this).closest('.services-options-list');
      var text = jQuery(this).val().toLowerCase();
      $list.find('.service-option').hide();
  
      // Search 
      $list.find('.service-option').each(function(){
  
        if(jQuery(this).text().toLowerCase().indexOf(""+text+"") != -1 ){
         jQuery(this).show();
        }
      });
      return false;
    });
  
  
    jQuery('.calendar-week-agent-w').on('click', '.calendar-load-target-date', function(event){
      jQuery(this).addClass('os-loading');
      latepoint_load_calendar(jQuery(this).data('target-date'), jQuery('.calendar-agent-selector').val(), jQuery('.calendar-location-selector').val());
      return false;
    });
  
    jQuery('.calendar-week-agent-w').on('change', '.calendar-agent-selector', function(event){
      latepoint_load_calendar(jQuery('.calendar-start-date').val(), jQuery('.calendar-agent-selector').val(), jQuery('.calendar-location-selector').val());
      return false;
    });
  
    jQuery('.calendar-week-agent-w').on('change', '.calendar-location-selector', function(event){
      latepoint_load_calendar(jQuery('.calendar-start-date').val(), jQuery('.calendar-agent-selector').val(), jQuery('.calendar-location-selector').val());
      return false;
    });
  
    jQuery('.latepoint-admin').on('click', '.os-complex-connections-selector .selector-trigger', function(){
      var $connection_wrapper = jQuery(this).closest('.connection');
      if($connection_wrapper.hasClass('active')){
        latepoint_complex_selector_deselect($connection_wrapper);
        jQuery(this).closest('.white-box').find('.os-select-all-toggler').prop('checked', false);
      }else{
        latepoint_complex_selector_select($connection_wrapper);
      }
      return false;
    });
  
    jQuery('.latepoint-admin').on('click', '.os-agents-selector .agent', function(){
      if(jQuery(this).hasClass('active')){
        jQuery(this).removeClass('active');
        jQuery(this).find('.connection-child-is-connected').val('no');
      }else{
        jQuery(this).addClass('active');
        jQuery(this).find('.connection-child-is-connected').val('yes');
      }
      return false;
    });
  
    jQuery('.latepoint-admin').on('click', '.os-services-selector .service', function(){
      if(jQuery(this).hasClass('active')){
        jQuery(this).removeClass('active');
        jQuery(this).find('.connection-child-is-connected').val('no');
      }else{
        jQuery(this).addClass('active');
        jQuery(this).find('.connection-child-is-connected').val('yes');
      }
      return false;
    });
  
    jQuery('#wpcontent').on( 'click', '.os-toggler', function( event ){
      jQuery(this).toggleClass('off');
      if(jQuery(this).data('for')){
        if(jQuery(this).data('is-string-value')){
          $('input[name="' + jQuery(this).data('for') + '"]').val(jQuery(this).hasClass('off') ? 'off' : 'on');
        }else{
          $('input[name="' + jQuery(this).data('for') + '"]').val(jQuery(this).hasClass('off') ? 0 : 1);
        }
      }
      if(jQuery(this).data('controlled-toggle-id')){
        if(jQuery(this).hasClass('off')){
          $('#' + jQuery(this).data('controlled-toggle-id')).hide();
        }else{
          $('#' + jQuery(this).data('controlled-toggle-id')).show();
        }
      }
      jQuery(this).trigger('ostoggler:toggle');
      return false;
    });
  
  
  
    // UPLOAD/REMOVE IMAGE LINK LOGIC
    jQuery('#wpcontent').on( 'click', '.os-image-selector-trigger', function( event ){
      var frame;
  
      event.preventDefault();
  
      var $image_uploader_trigger = jQuery(this);
      var $image_selector_w = jQuery(this).closest('.os-image-selector-w');
      var $image_container = $image_selector_w.find('.os-image-container');
      var $image_id_holder = $image_selector_w.find('.os-image-id-holder');
  
      var image_exists = $image_container.find('img').length;
  
      if(image_exists){
        $image_id_holder.val('');
        $image_container.removeClass('has-image');
        $image_container.html('');
        $image_uploader_trigger.find('.os-text-holder').text($image_uploader_trigger.data('label-set-str'));
      }else{
        // If the media frame already exists, reopen it.
        if ( frame ) {
          frame.open();
          return false;
        }
        
        // Create a new media frame
        frame = wp.media({
          title: 'Select or Upload Media',
          button: { text: 'Use this media' },
          multiple: false
        });
  
        frame.on( 'select', function() {
          var attachment = frame.state().get('selection').first().toJSON();
          $image_container.append( '<img src="'+attachment.url+'" alt=""/>' );
          $image_id_holder.val( attachment.id );
          $image_container.addClass('has-image');
          $image_uploader_trigger.find('.os-text-holder').text($image_uploader_trigger.data('label-remove-str'));
        });
  
        frame.open();
      }
      
      return false;
    });
  
  
  
    jQuery('body').on('click', '.latepoint-lightbox-close', function(){
      latepoint_lightbox_close();
      return false;
    });
  
  
    jQuery('body').on('click', '.latepoint-side-panel-close-trigger', function(){
      jQuery('.latepoint-side-panel-w').remove();
      return false;
    });
  
  
    jQuery('body').on('click', '.latepoint-quick-availability-close', function(){
      jQuery('.quick-availability-per-day-w').remove();
      return false;
    });
    
  
  
    jQuery('body.latepoint-admin').on('click', '.time-ampm-select', function(){
      jQuery(this).closest('.time-ampm-w').find('.active').removeClass('active');
      jQuery(this).addClass('active');
      var ampm_value = jQuery(this).data('ampm-value');
      jQuery(this).closest('.os-time-group').find('.ampm-value-hidden-holder').val(ampm_value);
      return false;
    });
  
  
    jQuery('body.latepoint-admin').on('click', '.latepoint-lightbox-shadow', function(){
      latepoint_lightbox_close();
      return false;
    });
  
    jQuery('body.latepoint-admin').on('click', '.latepoint-side-panel-shadow', function(){
      jQuery('.latepoint-side-panel-w').remove();
      return false;
    });
  
    // SCHEDULE
  
    jQuery('body.latepoint-admin').on('click', '.ws-period-remove', function(e){
      jQuery(this).closest('.ws-period').remove();
      return false;
    });
  
  
    jQuery('#wpcontent').on( 'click', '.weekday-schedule-w .os-toggler', function( event ){
      if(jQuery(this).hasClass('off')){
        jQuery(this).closest('.weekday-schedule-w').addClass('day-off').removeClass('is-editing').find('input.is-active').val(0);
      }else{
        jQuery(this).closest('.weekday-schedule-w').removeClass('day-off').addClass('is-editing').find('input.is-active').val(1);
      }
      return false;
    });
  
    
  
  });

  //os-time

  function latepoint_is_timeframe_in_periods(timeframe_start, timeframe_end, periods_arr) {
    var is_inside = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : false;
  
    for (var i = 0; i < periods_arr.length; i++) {
  
      var period_start = 0;
      var period_end = 0;
      var buffer_before = 0;
      var buffer_after = 0;
  
      var period_info = periods_arr[i].split(':');
      if (period_info.length == 2) {
        period_start = period_info[0];
        period_end = period_info[1];
      } else {
        buffer_before = period_info[2];
        buffer_after = period_info[3];
        period_start = parseFloat(period_info[0]) - parseFloat(buffer_before);
        period_end = parseFloat(period_info[1]) + parseFloat(buffer_after);
      }
      if (is_inside) {
        if (latepoint_is_period_inside_another(timeframe_start, timeframe_end, period_start, period_end)) {
          return true;
        }
      } else {
        if (latepoint_is_period_overlapping(timeframe_start, timeframe_end, period_start, period_end)) {
          return true;
        }
      }
    };
    return false;
  }
  
  function latepoint_is_period_overlapping(period_one_start, period_one_end, period_two_start, period_two_end) {
    // https://stackoverflow.com/questions/325933/determine-whether-two-date-ranges-overlap/
    return period_one_start < period_two_end && period_two_start < period_one_end;
  }
  function latepoint_is_period_inside_another(period_one_start, period_one_end, period_two_start, period_two_end) {
    return period_one_start >= period_two_start && period_one_end <= period_two_end;
  }
  
  
  // Converts time in minutes to hours if possible, if minutes also exists - shows minutes too
  function latepoint_minutes_to_hours_preferably(time) {
    var army_clock = latepoint_is_army_clock();
  
    var hours = Math.floor(time / 60);
    if (!army_clock && hours > 12) hours = hours - 12;
  
    var minutes = time % 60;
    if(minutes > 0) hours = hours + ':' + minutes;
    return hours;
  }
  
  
  function latepoint_minutes_to_hours(time) {
    var army_clock = latepoint_is_army_clock();
  
    var hours = Math.floor(time / 60);
    if (!army_clock && hours > 12) hours = hours - 12;
    return hours;
  }
  
  
  function latepoint_am_or_pm(minutes) {
    if(latepoint_is_army_clock()) return '';
    return (minutes < 720) ? 'am' : 'pm';
  }
  
  function latepoint_hours_and_minutes_to_minutes(hours_and_minutes, ampm) {
    var hours_and_minutes_arr = hours_and_minutes.split(':');
    var hours = hours_and_minutes_arr[0];
    var minutes = hours_and_minutes_arr[1];
    if(ampm == "pm" && hours<12) hours = parseInt(hours)+12;
    if(ampm == "am" && hours==12) hours = 0;
    minutes = parseInt(minutes) + (hours * 60);
    return minutes;
  }
  
  function latepoint_get_time_system(){
    return latepoint_helper.time_system;
  }
  
  function latepoint_is_army_clock(){
    return (latepoint_get_time_system() == '24');
  }
  
  function latepoint_minutes_to_hours_and_minutes(time) {
    var army_clock = latepoint_is_army_clock();
    var format = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '%02d:%02d';
  
    var hours = Math.floor(time / 60);
    if(!army_clock && (hours > 12)) hours = hours - 12;
    var minutes = time % 60;
    return sprintf(format, hours, minutes);
  }

  //os-selected

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

//os-actions

function latepoint_generate_form_message_html(messages, status){
    var message_html = '<div class="os-form-message-w status-' + status + '"><ul>';
    if(Array.isArray(messages)){
      messages.forEach(function(message){
        message_html+= '<li>' + message + '</li>';
      });
    }else{
      message_html+= '<li>' + messages + '</li>';
    }
    message_html+= '</ul></div>';
    return message_html;
  }
  
  function latepoint_clear_form_messages($form){
    $form.find('.os-form-message-w').remove();
  }
  
  function latepoint_show_data_in_lightbox(message, extra_classes = ''){
    jQuery('.latepoint-lightbox-w').remove();
    var lightbox_css_classes = 'latepoint-lightbox-w latepoint-w ';
    if(extra_classes) lightbox_css_classes+= extra_classes;
    jQuery('body').append('<div class="'+ lightbox_css_classes +'"><div class="latepoint-lightbox-i">' + message + '<a href="#" class="latepoint-lightbox-close"><i class="latepoint-icon latepoint-icon-x"></i></a></div><div class="latepoint-lightbox-shadow"></div></div>');
    jQuery('body').addClass('latepoint-lightbox-active');
  }
  
  
  
  // DOCUMENT READY
  jQuery(document).ready(function( $ ) {
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    /* 
      Ajax buttons action
    */
    $('.latepoint').on('click', 'button[data-os-action], a[data-os-action], div[data-os-action], span[data-os-action]', function(e){
      var $this = $(this);
      if($this.data('os-prompt') && !confirm($this.data('os-prompt'))) return false;
      var params = $(this).data('os-params');
      if($(this).data('os-source-of-params')){
        params = $($(this).data('os-source-of-params')).find('select, input, textarea').serialize();
      }
      var return_format = $this.data('os-return-format') ? $this.data('os-return-format') : 'json'
      var data = { action: 'latepoint_route_call', route_name: $(this).data('os-action'), params: params, return_format: return_format } 
      $this.addClass('os-loading');
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          if(response.status === "success"){
            if($this.data('os-output-target') == 'lightbox'){
              latepoint_show_data_in_lightbox(response.message, $this.data('os-lightbox-classes'));
            }else if($this.data('os-output-target') == 'side-panel'){
              $('.latepoint-side-panel-w').remove();
              $('body').append('<div class="latepoint-side-panel-w"><div class="latepoint-side-panel-i">' + response.message + '</div><div class="latepoint-side-panel-shadow"></div></div>');
            }else if($this.data('os-success-action') == 'reload'){
              latepoint_add_notification(response.message);
              location.reload();
              return;
            }else if($this.data('os-success-action') == 'redirect'){
              if($this.data('os-redirect-to')){
                latepoint_add_notification(response.message);
                window.location.replace($this.data('os-redirect-to'));
              }else{
                window.location.replace(response.message); 
              }
              return;
            }else if($this.data('os-output-target') && $($this.data('os-output-target')).length){
              if($this.data('os-output-target-do') == 'append'){
                $($this.data('os-output-target')).append(response.message);
              }else{
                $($this.data('os-output-target')).html(response.message);
              }
            }else{
              if($this.data('os-before-after') == 'before'){
                $this.before(response.message);
              }else if($this.data('os-before-after') == 'before'){
                $this.after(response.message);
              }else{
                latepoint_add_notification(response.message);
              }
            }
            if($this.data('os-after-call')){
              var func_name = $this.data('os-after-call');
              if($this.data('os-pass-this')){
                window[func_name]($this);
              }else if($this.data('os-pass-response')){
                window[func_name](response);
              }else{
                window[func_name]();
              }
            }
            $this.removeClass('os-loading');
          }else{
            $this.removeClass('os-loading');
            if($this.data('os-output-target') && $($this.data('os-output-target')).length){
              $($this.data('os-output-target')).prepend(latepoint_generate_form_message_html(response.message, 'error'));
            }else{
              alert(response.message);
            }
          }
        }
      });
      return false;
    });
  
  
    $('.latepoint').on('click', 'form[data-os-action] button[type="submit"]', function(e){
      $(this).addClass('os-loading');
    });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    /* 
      Form ajax submit action
    */
    $('.latepoint').on('submit', 'form[data-os-action]', function(e){
      e.preventDefault(); // prevent native submit
      var $form = $(this);
      var form_data = $form.serialize();
      var data = { action: 'latepoint_route_call', route_name: $(this).data('os-action'), params: form_data, return_format: 'json' }
      $form.find('button[type="submit"]').addClass('os-loading');
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $form.find('button[type="submit"].os-loading').removeClass('os-loading');
          latepoint_clear_form_messages($form);
          if(response.status === "success"){
            if($form.data('os-success-action') == 'reload'){
              latepoint_add_notification(response.message);
              location.reload();
              return;
            }else if($form.data('os-success-action') == 'redirect'){
              if($form.data('os-redirect-to')){
                latepoint_add_notification(response.message);
                window.location.replace($form.data('os-redirect-to'));
              }else{
                window.location.replace(response.message);
              }
              return;
            }else if($form.data('os-output-target') && $($form.data('os-output-target')).length){
              $($form.data('os-output-target')).html(response.message);
            }else{
              if(response.message == 'redirect'){
                window.location.replace(response.url);
              }else{
                latepoint_add_notification(response.message);
                $form.prepend(latepoint_generate_form_message_html(response.message, 'success'));
              }
            }
            if($form.data('os-record-id-holder') && response.record_id){
              $form.find('[name="' + $form.data('os-record-id-holder') + '"]').val(response.record_id)
            }
            if($form.data('os-after-call')){
              var func_name = $form.data('os-after-call');
              if($form.data('os-pass-response')){
                window[func_name](response);
              }else{
                window[func_name]();
              }
            }
            $('button.os-loading').removeClass('os-loading');
          }else{
            $('button.os-loading').removeClass('os-loading');
            if($form.data('os-show-errors-as-notification')){
              latepoint_add_notification(response.message, 'error');
            }else{
              $form.prepend(latepoint_generate_form_message_html(response.message, 'error'));
              $([document.documentElement, document.body]).animate({
                  scrollTop: ($form.find(".os-form-message-w").offset().top - 30)
              }, 200);
            }
          }
          if(response.form_values_to_update){
            $.each(response.form_values_to_update, function(name, value){
              $form.find('[name="'+ name +'"]').val(value);
            });
          }
        }
      });
      return false;
    });
  });

  //os-notifications

  function latepoint_add_notification(message, message_type = 'success'){
	var wrapper = jQuery('body').find('.os-notifications');
	if(!wrapper.length){
		jQuery('body').append('<div class="os-notifications"></div>');
		wrapper = jQuery('body').find('.os-notifications');
	}
	if(wrapper.find('.item').length > 0) wrapper.find('.item:first-child').remove();
	wrapper.append('<div class="item item-type-'+ message_type +'">' + message + '<span class="os-notification-close"><i class="latepoint-icon latepoint-icon-x"></i></span></div>');
}

//os-shared

function latepoint_mask_timefield($elem){
	if(jQuery().inputmask){
	  $elem.inputmask({
	      'mask': '99:99',
	      'placeholder': 'HH:MM'
	  });
	}
}

function latepoint_mask_phone($elem){
	if(latepoint_is_phone_masking_enabled() && jQuery().inputmask) $elem.inputmask(latepoint_get_phone_format());
}


function latepoint_get_phone_format(){
  return latepoint_helper.phone_format;
}

function latepoint_is_phone_masking_enabled(){
	return (latepoint_helper.enable_phone_masking == 'yes');
}

function latepoint_show_booking_end_time(){
	return (latepoint_helper.show_booking_end_time == 'yes');
}

function latepoint_init_form_masks(){
	if(latepoint_is_phone_masking_enabled()) latepoint_mask_phone(jQuery('.os-mask-phone'));
}

function latepoint_get_paypal_payment_amount($booking_form_element){
	var payment_portion = $booking_form_element.find('input[name="booking[payment_portion]"]').val();
	var payment_amount = (payment_portion == 'deposit') ? $booking_form_element.find('.lp-paypal-btn-trigger').data('deposit-amount') : $booking_form_element.find('.lp-paypal-btn-trigger').data('full-amount');
	return payment_amount;
}

//os-update

function latepoint_load_addons_info(){
    var $addons_info_wrapper = jQuery('.addons-info-holder');
    $addons_info_wrapper.addClass('os-loading');
    var route = $addons_info_wrapper.data('route');
  
    var data = { action: 'latepoint_route_call', route_name: route, params: '', return_format: 'json' }
    jQuery.ajax({ type : "post", dataType : "json", url : latepoint_helper.ajaxurl, data : data,
      success: function(response){
        $addons_info_wrapper.removeClass('os-loading');
        if(response.status === "success"){
          if(response.message){
            $addons_info_wrapper.html(response.message);
          }else{
            $addons_info_wrapper.html('Something is wrong. Try refreshing the page.')
          }
        }else{
          alert(response.message, 'error');
        }
      }
    });
  }
  
  
  function latepoint_check_for_updates(){
    if(jQuery('.version-log-w').length){
      var $log_wrapper = jQuery('.version-log-w');
      $log_wrapper.addClass('os-loading');
      var route = $log_wrapper.data('route');
  
      var data = { action: 'latepoint_route_call', route_name: route, params: '', return_format: 'json' }
      jQuery.ajax({ type : "post", dataType : "json", url : latepoint_helper.ajaxurl, data : data,
        success: function(response){
          $log_wrapper.removeClass('os-loading');
          if(response.status === "success"){
            $log_wrapper.html(response.message);
          }else{
            alert(response.message, 'error');
          }
        }
      });
    }
    if(jQuery('.version-status-info').length){
  
      var $version_info_wrapper = jQuery('.version-status-info');
      $version_info_wrapper.addClass('os-loading');
      var route = $version_info_wrapper.data('route');
  
      var data = { action: 'latepoint_route_call', route_name: route, params: '', return_format: 'json' }
      jQuery.ajax({ type : "post", dataType : "json", url : latepoint_helper.ajaxurl, data : data,
        success: function(response){
          $version_info_wrapper.removeClass('os-loading');
          if(response.status === "success"){
            $version_info_wrapper.html(response.message);
          }else{
            alert(response.message, 'error');
          }
        }
      });
    }
    if(jQuery('.addons-info-holder').length){
      latepoint_load_addons_info();
    }
  }
  
  
  // DOCUMENT READY
  jQuery(document).ready(function( $ ) {
    latepoint_check_for_updates();
  
  
    // Install addon button click
    jQuery('.addons-info-holder').on('click', '.os-addon-action-btn', function(){
      var $install_btn = jQuery(this);
      $install_btn.addClass('os-loading');
  
      var data = { action: 'latepoint_route_call', route_name: $install_btn.data('route-name'), params: { addon_name: $install_btn.data('addon-name'), addon_path: $install_btn.data('addon-path') }, layout: 'none', return_format: 'json'};
      jQuery.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(response){
          $install_btn.removeClass('os-loading');
          if(response.status === "success"){
            latepoint_add_notification(response.message);
            latepoint_load_addons_info();
          }else{
            if(response.code == '404'){
              latepoint_show_data_in_lightbox(response.message);
            }else{
              alert(response.message);
            }
          }
        }
      });
      return false;
    });
  });

  //os-google-calendar

  class OsGoogleCalendar {
    constructor(){
    }
    /**
     *  On load, called to load the auth2 library and API client library.
     */
    init() {
      gapi.load('client:auth2', () => {
        gapi.client.init({
                      clientId: latepoint_helper.google_calendar_client_id,
                      discoveryDocs: ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"],
                      scope: "https://www.googleapis.com/auth/calendar"
                    }).then(() => {
                      jQuery('.os-google-cal-authorize-btn').on('click', () => {
                        try{
                          gapi.auth2.getAuthInstance().grantOfflineAccess().then(this.saveAuthCode);
                        }catch(err){
                          jQuery('.channel-watch-status').before(latepoint_generate_form_message_html(err.message, 'error'));
                        }
                        return false;
                      });
                    }, (err) => { jQuery('.channel-watch-status').before(latepoint_generate_form_message_html(err.details, 'error')); });
      });
    }
    saveAuthCode(authResult) {
  
      var params = {  code: authResult['code'], 
                      agent_id: jQuery('.os-google-cal-authorize-btn').data('agent-id') 
                    };
  
      var data = {  action: 'latepoint_route_call', 
                    route_name: jQuery('.os-google-cal-authorize-btn').data('route'), 
                    params: params, 
                    layout: 'none', 
                    return_format: 'json' 
                  };
  
      jQuery.ajax({
        type: 'POST',
        url: latepoint_helper.ajaxurl,
        dataType : "json",
        headers: { 'X-Requested-With': 'XMLHttpRequest' },
        data: data,
        success: function(response) {
          latepoint_add_notification(response.message);
          location.reload();
        }
      });
    }
  }
