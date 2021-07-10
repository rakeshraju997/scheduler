// @codekit-prepend "os-time.js"
// @codekit-prepend "os-shared.js"
// @codekit-prepend "os-notifications.js";
// @codekit-prepend "os-actions.js"



  function latepoint_init_payment_method_actions($booking_form_element, payment_method){
    var callbacks_list = [];
    var is_last_step = $booking_form_element.data('next-submit-is-last') == 'yes';
    $booking_form_element.trigger('latepoint:initPaymentMethod', [{ payment_method: payment_method, 
                                                                    callbacks_list: callbacks_list, 
                                                                    is_last_step: is_last_step }]);
    $booking_form_element.removeClass('step-content-loaded').addClass('step-content-loading');
    jQuery.when(...callbacks_list.map(callback => callback.action()))
      .done(() => {
        $booking_form_element.removeClass('step-content-loading').addClass('step-content-loaded').find('.lp-payment-method-content[data-payment-method="' + payment_method + '"]').show();
    });
  }

  function latepoint_show_next_btn($booking_form_element){
    $booking_form_element.find('.latepoint-next-btn').removeClass('disabled');
    $booking_form_element.removeClass('hidden-buttons');
  }

  function clear_step_services($booking_form_element){
    latepoint_update_summary_field($booking_form_element, 'service', '');
    clear_sub_step_attendies($booking_form_element);
  }

  function clear_sub_step_attendies($booking_form_element){
    $booking_form_element.find('.latepoint_total_attendies').val(1);
    latepoint_update_summary_field($booking_form_element, 'total-attendies', '');
    clear_sub_step_duration($booking_form_element);
  }

  function clear_sub_step_duration($booking_form_element){
    $booking_form_element.find('.latepoint_duration').val('');
    latepoint_update_summary_field($booking_form_element, 'duration', '');
  }

  function clear_step_service_extras($booking_form_element){
    latepoint_update_summary_field($booking_form_element, 'service-extras', '');
  }

  function clear_step_locations($booking_form_element){
    latepoint_update_summary_field($booking_form_element, 'location', '');
  }

  function clear_step_agents($booking_form_element){
    latepoint_update_summary_field($booking_form_element, 'agent', '');
  }

  function clear_step_datepicker($booking_form_element){
    latepoint_update_summary_field($booking_form_element, 'time', '');
    latepoint_update_summary_field($booking_form_element, 'date', '');
  }

  function latepoint_hide_next_btn($booking_form_element){
    $booking_form_element.find('.latepoint-next-btn').addClass('disabled');
    if($booking_form_element.find('.latepoint-prev-btn.disabled').length) $booking_form_element.addClass('hidden-buttons');
  }


  function latepoint_show_prev_btn($booking_form_element){
    $booking_form_element.find('.latepoint-prev-btn').removeClass('disabled');
    $booking_form_element.removeClass('hidden-buttons');
  }

  function latepoint_hide_prev_btn($booking_form_element){
    $booking_form_element.find('.latepoint-prev-btn').addClass('disabled');
    if($booking_form_element.find('.latepoint-next-btn.disabled').length) $booking_form_element.addClass('hidden-buttons');
  }


function latepoint_show_capacity_selector($item){
  var $booking_form_element = $item.closest('.latepoint-booking-form-element');
  var max_capacity = $item.data('max-capacity');
  var min_capacity = $item.data('min-capacity');
  $booking_form_element.find('.sta-sub-label span').text(max_capacity);
  $booking_form_element.find('.step-services-w').removeClass('selecting-service-duration');
  $booking_form_element.find('.total-attendies-selector-w').data('max-capacity', max_capacity);
  $booking_form_element.find('.total-attendies-selector-w').data('min-capacity', min_capacity);
  $item.closest('.step-services-w').addClass('selecting-total-attendies');
  $booking_form_element.find('.total-attendies-selector-input').val(min_capacity);
  latepoint_show_prev_btn($booking_form_element);
  latepoint_show_next_btn($booking_form_element);
}


function latepoint_show_durations($item){
  var $booking_form_element = $item.closest('.latepoint-booking-form-element');
  $item.closest('.step-services-w').addClass('selecting-service-duration');
  latepoint_show_prev_btn($booking_form_element);
  latepoint_hide_next_btn($booking_form_element);
}

function latepoint_apply_coupon($elem){
  var $booking_form_element = $elem.closest('.latepoint-booking-form-element');

  var $coupon_input = $elem;
  $coupon_input.closest('.coupon-code-input-w').addClass('os-loading');
  var form_params = $booking_form_element.find('.latepoint-form').serialize();
  var data = { action: 'latepoint_route_call', route_name: $elem.data('route'), params: form_params, layout: 'none', return_format: 'json' }
  jQuery.ajax({
    type : "post",
    dataType : "json",
    url : latepoint_helper.ajaxurl,
    data : data,
    success: function(data){
      $coupon_input.closest('.coupon-code-input-w').removeClass('os-loading');
      if(data.status === "success"){
        $booking_form_element.find('input[name="booking[coupon_code]"]').val($coupon_input.val());
        latepoint_show_message_inside_element(data.message, $booking_form_element.find('.latepoint-body'), 'success');
        $booking_form_element.find('.step-payment-w input[name="booking[payment_method]"]').val('');
        $booking_form_element.find('input[name="booking[payment_token]"]').val('');
        $booking_form_element.find('input[name="booking[payment_portion]"]').val('');
        latepoint_reload_step($booking_form_element);
      }else{
        latepoint_show_message_inside_element(data.message, $booking_form_element.find('.latepoint-body'), 'error');
      }
    }
  });
}

function latepoint_remove_coupon($elem){
  $elem.closest('.applied-coupon-code').fadeOut();
  var $booking_form_element = $elem.closest('.latepoint-booking-form-element');
  $booking_form_element.find('input[name="booking[coupon_code]"]').val('');
  latepoint_reload_step($booking_form_element);
}

function latepoint_reload_step($booking_form_element, step_name = false){

  if(step_name){
    $booking_form_element.find('.latepoint_current_step').val(step_name);
    $booking_form_element.removeClass(function (index, className) { return (className.match (/(^|\s)current-step-\S+/g) || []).join(' '); }).addClass('current-step-' + step_name);
    if($booking_form_element.find('.latepoint-step-content[data-step-name="'+ step_name +'"]')){
      $booking_form_element.find('.latepoint-step-content[data-step-name="'+ step_name +'"]').nextAll('.latepoint-step-content').remove();
      $booking_form_element.find('.latepoint-step-content[data-step-name="'+ step_name +'"]').remove();
    }
  }

  $booking_form_element.find('.latepoint_step_direction').val('specific');
  $booking_form_element.find('.latepoint-form').submit();

  return false;
}

function latepoint_get_payment_sub_step($booking_form_element, current_sub_step, prev = false){
  var offset = prev ? -1 : 1;
  var payment_sub_steps = [];
  if($booking_form_element.find('.step-payment-w .lp-payment-times-w').length) payment_sub_steps.push('payment-times');
  if($booking_form_element.find('.step-payment-w .lp-payment-methods-w').length) payment_sub_steps.push('payment-methods');
  if($booking_form_element.find('.step-payment-w .lp-payment-portions-w').length) payment_sub_steps.push('payment-portions');

  var selected_payment_method = $booking_form_element.find('input[name="booking[payment_method]"]').val();
  if(selected_payment_method) payment_sub_steps.push('payment-method-content');

  var index = payment_sub_steps.indexOf(current_sub_step) + offset;
  if(index >= 0 && index < payment_sub_steps.length){
    var sub_step = payment_sub_steps[index];
    if(sub_step == 'payment-method-content'){
      latepoint_init_payment_method_actions($booking_form_element, selected_payment_method);
      // if no content exists for payment method - do not change sub step
      if(!$booking_form_element.find('.lp-payment-method-content[data-payment-method="' + selected_payment_method + '"]').length) sub_step = current_sub_step;
    }
    return sub_step;
  }else{
    return current_sub_step;
  }
}


function latepoint_reset_password_from_booking_init(){
  jQuery('.os-step-existing-customer-login-w').hide();
  jQuery('.os-password-reset-form-holder').on('click', '.password-reset-back-to-login', function(){
    jQuery('.os-password-reset-form-holder').html('');
    jQuery('.os-step-existing-customer-login-w').show();
    return false;
  });
}

function latepoint_update_summary_field($form, field_name, value = ''){
  var $summary_holder = $form.closest('.latepoint-with-summary');
  if(!$summary_holder.length) return;
  value = value ? String(value).trim() : false;
  if(value){
    $form.find('.os-summary-value-'+field_name).html(value).closest('.os-summary-line').addClass('os-has-value');
    if($summary_holder.hasClass('latepoint-summary-is-open')){
      $form.find('.os-summary-line.os-has-value').slideDown(150);
    }else{
      $form.find('.os-summary-line.os-has-value').fadeIn(200);
    }
    $summary_holder.addClass('latepoint-summary-is-open');
  }else{
    $form.find('.os-summary-value-'+field_name).text('').closest('.os-summary-line').slideUp(150).removeClass('os-has-value');
  }
}

function latepoint_password_changed_show_login(response){
  jQuery('.os-step-existing-customer-login-w').show();
  jQuery('.os-password-reset-form-holder').html('');
  latepoint_show_message_inside_element(response.message, jQuery('.os-step-existing-customer-login-w'), 'success');
}

function latepoint_hide_message_inside_element($elem = jQuery('.latepoint-body')){
  if($elem.length && $elem.find('.latepoint-message').length){
    $elem.find('.latepoint-message').remove();
  }
}

function latepoint_show_message_inside_element(message, $elem = jQuery('.latepoint-body'), message_type = 'error'){
  if($elem.length){
    if($elem.find('.latepoint-message').length){
      $elem.find('.latepoint-message').removeClass('latepoint-message-success').removeClass('latepoint-message-error').addClass('latepoint-message-'+ message_type +'').html(message).show();
    }else{
      $elem.prepend('<div class="latepoint-message latepoint-message-'+ message_type +'">' + message + '</div>');
    }
  }
}

function latepoint_add_action(callbacks_list, action, priority = 10){
  callbacks_list.push({priority: priority, action: action});
  callbacks_list.sort((a,b) => a.priority - b.priority);
  return callbacks_list;
}


( function( $ ) {
  "use strict";

  function latepoint_init_step(step_name, $booking_form_element){
    latepoint_init_step_selectable_items();
    switch(step_name){
      case 'datepicker':
        latepoint_init_step_datepicker();
      break;
      case 'contact':
        latepoint_init_step_contact();
      break;
      case 'agents':
        latepoint_init_step_agents();
      break;
      case 'locations':
        latepoint_init_step_locations();
      break;
      case 'services':
        latepoint_init_step_services();
      break;
      case 'payment':
        latepoint_init_step_payment($booking_form_element);
      break;
      case 'verify':
        latepoint_init_step_verify($booking_form_element);
      break;
      case 'confirmation':
        latepoint_init_step_confirmation();
      break;
    }

    $booking_form_element.trigger("latepoint:initStep", [{step_name: step_name}]);
    $booking_form_element.trigger("latepoint:initStep:" + step_name);
  }



  function day_timeslots($day){
    var $booking_form_element = $day.closest('.latepoint-booking-form-element');
    $day.addClass('selected');

    var service_duration = $day.data('service-duration');
    var interval = $day.data('interval');
    var work_start_minutes = $day.data('work-start-time');
    var work_end_minutes = $day.data('work-end-time');
    var total_work_minutes = $day.data('total-work-minutes');
    var available_minutes = $day.attr('data-available-minutes') ? $day.data('available-minutes').toString().split(',').map(Number) : false;
    var day_minutes = $day.data('day-minutes').toString().split(',').map(Number);

    var $timeslots = $booking_form_element.find('.timeslots');
    $timeslots.html('');

    if(total_work_minutes > 0 && available_minutes.length && day_minutes.length){
      var prev_minutes = false;
      day_minutes.forEach(function(current_minutes){
        if((current_minutes + service_duration) > work_end_minutes) return;
        var ampm = latepoint_am_or_pm(current_minutes);
        
        var timeslot_class = 'dp-timepicker-trigger';
        if(latepoint_helper.time_pick_style == 'timeline'){
          timeslot_class+= ' dp-timeslot';
        }else{
          timeslot_class+= ' dp-timebox';
        }

        if(prev_minutes !== false && ((current_minutes - prev_minutes) > service_duration)){
          // show interval that is off between two work periods
          var off_label = latepoint_minutes_to_hours_and_minutes(prev_minutes + service_duration)+' '+ latepoint_am_or_pm(prev_minutes + service_duration) + ' - ' + latepoint_minutes_to_hours_and_minutes(current_minutes)+' '+latepoint_am_or_pm(current_minutes);
          var off_width = (((current_minutes - prev_minutes - service_duration) / (total_work_minutes + service_duration)) * 100);
          $timeslots.append('<div class="'+ timeslot_class +' is-off" style="max-width:'+ off_width +'%; width:'+ off_width +'%"><span class="dp-label">' + off_label + '</span></div>');
        }

        if(!available_minutes.includes(current_minutes)){
          timeslot_class+= ' is-booked';
        }
        var tick_html = '';
        if(((current_minutes % 60) == 0) || (interval >= 60)){
          timeslot_class+= ' with-tick';
          tick_html = '<span class="dp-tick"><strong>'+latepoint_minutes_to_hours_preferably(current_minutes)+'</strong>'+' '+ampm+'</span>';
        }
        var timeslot_label = latepoint_minutes_to_hours_and_minutes(current_minutes)+' '+ampm;
        if(latepoint_show_booking_end_time()){
          var end_minutes = current_minutes + service_duration;
          var end_minutes_ampm = latepoint_am_or_pm(end_minutes);
          timeslot_label+= ' - <span class="dp-label-end-time">' + latepoint_minutes_to_hours_and_minutes(end_minutes)+' '+end_minutes_ampm + '</span>';
        }
        timeslot_label = timeslot_label.trim();
        $timeslots.removeClass('slots-not-available').append('<div class="'+timeslot_class+'" data-minutes="' + current_minutes + '"><span class="dp-label">'+ timeslot_label +'</span>'+tick_html+'</div>');
        prev_minutes = current_minutes;
      });
    }else{
      // No working hours this day
      $timeslots.addClass('slots-not-available').append('<div class="not-working-message">' + latepoint_helper.msg_not_available + "</div>");
    }
    $('.times-header-label span').text($day.data('nice-date'));
    $booking_form_element.find('.time-selector-w').slideDown(200, function(){
      var $scrollable_wrapper = $booking_form_element.find('.latepoint-body');
      $scrollable_wrapper.stop().animate({
        scrollTop: $scrollable_wrapper[0].scrollHeight
      }, 200);
    });
  }




  function os_init_timeslots(){
    $('.dp-timepicker-trigger').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      if($(this).hasClass('is-booked') || $(this).hasClass('is-off')){
        // Show error message that you cant select a booked period
      }else{
        if($(this).hasClass('selected')){
          $(this).removeClass('selected');
          $(this).find('.dp-success-label').remove();
          $booking_form_element.find('.latepoint_start_time').val('');
          latepoint_hide_next_btn($booking_form_element);
          latepoint_update_summary_field($booking_form_element, 'time', '');
        }else{
          $booking_form_element.find('.dp-timepicker-trigger.selected').removeClass('selected').find('.dp-success-label').remove();
          var selected_timeslot_time = $(this).find('.dp-label').html();
          $(this).addClass('selected').find('.dp-label').html('<span class="dp-success-label">' + $booking_form_element.find('.latepoint-form').data('selected-label') + '</span>' + selected_timeslot_time);
          $booking_form_element.find('.latepoint_start_time').val($(this).data('minutes'));
          latepoint_show_next_btn($booking_form_element);
          latepoint_update_summary_field($booking_form_element, 'time', selected_timeslot_time);
        }
      }
      return false;
    });
  }

  function os_init_monthly_calendar_navigation(){
    $('.os-month-next-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var next_month_route_name = $(this).data('route');
      if($booking_form_element.find('.os-monthly-calendar-days-w.active + .os-monthly-calendar-days-w').length){
        $booking_form_element.find('.os-monthly-calendar-days-w.active').removeClass('active').next('.os-monthly-calendar-days-w').addClass('active');
        latepoint_calendar_set_month_label($booking_form_element);
      }else{
        // TODO add condition to check maximum number months to call into the future
        if(true){
          var $btn = $(this);
          $btn.addClass('os-loading');
          var $calendar_element = $booking_form_element.find('.os-monthly-calendar-days-w').last();
          var calendar_year = $calendar_element.data('calendar-year');
          var calendar_month = $calendar_element.data('calendar-month');
          if(calendar_month == 12){
            calendar_year = calendar_year + 1;
            calendar_month = 1;
          }else{
            calendar_month = calendar_month + 1;
          }
          var booking_info = { target_date_string: calendar_year + '-' + calendar_month + '-1', 
                                location_id: $booking_form_element.find('.latepoint_location_id').val(), 
                                agent_id: $booking_form_element.find('.latepoint_agent_id').val(), 
                                service_id: $booking_form_element.find('.latepoint_service_id').val(),
                                duration: $booking_form_element.find('input[name="booking[duration]"]').val(),
                                total_attendies: $booking_form_element.find('input[name="booking[total_attendies]"]').val() };
          var data = { action: 'latepoint_route_call', route_name: next_month_route_name, params: booking_info, layout: 'none', return_format: 'json' }
          $.ajax({
            type : "post",
            dataType : "json",
            url : latepoint_helper.ajaxurl,
            data : data,
            success: function(data){
              $btn.removeClass('os-loading');
              if(data.status === "success"){
                $booking_form_element.find('.os-months').append(data.message);
                $booking_form_element.find('.os-monthly-calendar-days-w.active').removeClass('active').next('.os-monthly-calendar-days-w').addClass('active');
                latepoint_calendar_set_month_label($booking_form_element);
              }else{
                // console.log(data.message);
              }
            }
          });
        }
      }
      latepoint_calendar_show_or_hide_prev_next_buttons($booking_form_element);
      return false;
    });
    $('.os-month-prev-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      if($booking_form_element.find('.os-monthly-calendar-days-w.active').prev('.os-monthly-calendar-days-w').length){
        $booking_form_element.find('.os-monthly-calendar-days-w.active').removeClass('active').prev('.os-monthly-calendar-days-w').addClass('active');
        latepoint_calendar_set_month_label($booking_form_element);
      }
      latepoint_calendar_show_or_hide_prev_next_buttons($booking_form_element);
      return false;
    });
  }

  function latepoint_calendar_set_month_label($booking_form_element){
    $booking_form_element.find('.os-current-month-label .current-year').text($booking_form_element.find('.os-monthly-calendar-days-w.active').data('calendar-year'));
    $booking_form_element.find('.os-current-month-label .current-month').text($booking_form_element.find('.os-monthly-calendar-days-w.active').data('calendar-month-label'));
  }


  function latepoint_calendar_show_or_hide_prev_next_buttons($booking_form_element){
    $booking_form_element.find('.os-current-month-label .current-year').text($booking_form_element.find('.os-monthly-calendar-days-w.active .os-monthly-calendar-days').data('calendar-year'));
    $booking_form_element.find('.os-current-month-label .current-month').text($booking_form_element.find('.os-monthly-calendar-days-w.active .os-monthly-calendar-days').data('calendar-month-label'));

    if($booking_form_element.find('.os-monthly-calendar-days-w.active').prev('.os-monthly-calendar-days-w').length){
      $booking_form_element.find('.os-month-prev-btn').removeClass('disabled');
    }else{
      $booking_form_element.find('.os-month-prev-btn').addClass('disabled');
    }
  }

  function latepoint_format_minutes_to_time(minutes, service_duration){
    var ampm = latepoint_am_or_pm(minutes);
    var formatted_time = latepoint_minutes_to_hours_and_minutes(minutes)+' '+ampm;
    if(latepoint_show_booking_end_time()){
      var end_minutes = minutes + service_duration;
      var end_minutes_ampm = latepoint_am_or_pm(end_minutes);
      formatted_time+= ' - ' + latepoint_minutes_to_hours_and_minutes(end_minutes)+' '+end_minutes_ampm;
    }
    formatted_time = formatted_time.trim();
    return formatted_time;
  }

  function latepoint_init_step_datepicker(){
    os_init_timeslots();
    os_init_monthly_calendar_navigation();
    $('.os-months').on('click', '.os-day', function(){
      if($(this).hasClass('os-day-passed')) return false;
      if($(this).hasClass('os-not-in-allowed-period')) return false;
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      if($(this).closest('.os-monthly-calendar-days-w').hasClass('hide-if-single-slot')){

        // HIDE TIMESLOT IF ONLY ONE TIMEPOINT
        if($(this).hasClass('os-not-available')){
          // clicked on a day that has no available timeslots
          // do nothing
        }else{
          $booking_form_element.find('.os-day.selected').removeClass('selected');
          $(this).addClass('selected');
          // set date
          $booking_form_element.find('.latepoint_start_date').val($(this).data('date'));
          latepoint_update_summary_field($booking_form_element, 'date', $(this).data('nice-date'));
          if($(this).hasClass('os-one-slot-only')){
            // clicked on a day that has only one slot available
            var selected_timeslot_time = latepoint_format_minutes_to_time($(this).data('available-minutes'), $(this).data('service-duration'));
            $booking_form_element.find('.latepoint_start_time').val($(this).data('available-minutes'));
            latepoint_show_next_btn($booking_form_element);
            latepoint_update_summary_field($booking_form_element, 'time', selected_timeslot_time);
          }else{
            // regular day with more than 1 timeslots available
            // build timeslots
            day_timeslots($(this));
            // initialize timeslots events
            os_init_timeslots();
            // clear time and hide next btn
            $booking_form_element.find('.latepoint_start_time').val('');
            latepoint_hide_next_btn($booking_form_element);
          }
        }
      }else{
        
        // SHOW TIMESLOTS EVEN IF ONLY ONE TIMEPOINT
        $booking_form_element.find('.latepoint_start_date').val($(this).data('date'));
        latepoint_update_summary_field($booking_form_element, 'date', $(this).data('nice-date'));
        $booking_form_element.find('.os-day.selected').removeClass('selected');
        $(this).addClass('selected');

        // build timeslots
        day_timeslots($(this));
        // initialize timeslots events
        os_init_timeslots();
        // clear time and hide next btn
        latepoint_update_summary_field($booking_form_element, 'time', '');
        $booking_form_element.find('.latepoint_start_time').val('');
        latepoint_hide_next_btn($booking_form_element);
      }


      return false;
    });
  }


  function latepoint_init_step_verify($booking_form_element = false){
    if(!$booking_form_element) return;

    $booking_form_element.closest('.latepoint-summary-is-open').removeClass('latepoint-summary-is-open');
  }


  function latepoint_init_step_payment($booking_form_element = false){
    if($booking_form_element.find('.step-payment-w').data('full-amount') > 0){
      latepoint_update_summary_field($booking_form_element, 'price', latepoint_format_price(($booking_form_element.find('.step-payment-w').data('full-amount') * 100 / 100).toFixed(2)));
    }
    if($booking_form_element && ($booking_form_element.find('.step-payment-w').data('default-portion') == 'deposit')){
      $booking_form_element.find('input[name="booking[payment_portion]"]').val('deposit');
    }

    // activate payment method content if method and portion are set and no selection is needed
    var selected_payment_method = $booking_form_element.find('input[name="booking[payment_method]"]').val();
    if(selected_payment_method && !$('.lp-payment-times-w').length && !$('.lp-payment-methods-w').length && !$('.lp-payment-portions-w').length){
      latepoint_init_payment_method_actions($booking_form_element, selected_payment_method);
    }

    $('.latepoint-booking-form-element .coupon-code-input-submit').on('click', function(e){
      latepoint_apply_coupon($(this).closest('.coupon-code-input-w').find('.coupon-code-input'));
      return false;
    });

    $('.latepoint-booking-form-element .coupon-code-clear').on('click', function(e){
      latepoint_remove_coupon($(this));
      return false;
    });

    $('.latepoint-booking-form-element input.coupon-code-input').on('keyup', function(e){
      if(e.which === 13){
        latepoint_apply_coupon($(this));
        return false;
      }
    });


    $('.latepoint-booking-form-element .coupon-code-trigger-w a').on('click', function(e){
      $(this).closest('.payment-total-info').addClass('entering-coupon').find('.coupon-code-input').focus();
      return false;
    });


    // Pay later button click
    $('.latepoint-booking-form-element .lp-payment-trigger-later').on('click', function(e){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      $booking_form_element.find('input[name="booking[payment_method]"]').val($(this).data('method'));
      $booking_form_element.find('input[name="booking[payment_portion]"]').val('');
      $booking_form_element.find('.latepoint-form').submit();
    });


    // Selecting Payment Time
    $('.latepoint-booking-form-element .lp-payment-trigger-payment-time-selector').on('click', function(e){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var $payment_step = $booking_form_element.find('.step-payment-w');

      latepoint_hide_next_btn($booking_form_element);
      latepoint_show_prev_btn($booking_form_element);
      $payment_step.attr('data-sub-step', latepoint_get_payment_sub_step($booking_form_element, $payment_step.attr('data-sub-step')));
      return false;
    });

    // Selecting Payment Method
    $('.latepoint-booking-form-element .lp-payment-trigger-payment-method-selector').on('click', function(e){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var selected_payment_method = $(this).data('method');
      $booking_form_element.find('input[name="booking[payment_method]"]').val(selected_payment_method);

      var $payment_step = $booking_form_element.find('.step-payment-w');
      latepoint_hide_next_btn($booking_form_element);
      latepoint_show_prev_btn($booking_form_element);
      $payment_step.attr('data-sub-step', latepoint_get_payment_sub_step($booking_form_element, $payment_step.attr('data-sub-step')));
    });

    $('.latepoint-booking-form-element .lp-payment-trigger-payment-portion-selector').on('click', function(e){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var portion = jQuery(this).data('portion');
      $booking_form_element.find('input[name="booking[payment_portion]"]').val(portion);
      if(portion == 'deposit'){
        $booking_form_element.find('.payment-total-info').addClass('paying-deposit');
      }else{
        $booking_form_element.find('.payment-total-info').removeClass('paying-deposit');
      }

      var $payment_step = $booking_form_element.find('.step-payment-w');
      latepoint_hide_next_btn($booking_form_element);
      latepoint_show_prev_btn($booking_form_element);
      $payment_step.attr('data-sub-step', latepoint_get_payment_sub_step($booking_form_element, $payment_step.attr('data-sub-step')));
    });


  }


  function latepoint_init_step_selectable_items(){
    $('.os-selectable-items .os-selectable-item').off('click', latepoint_selectable_item_clicked);
    $('.os-selectable-items .os-selectable-item').on('click', latepoint_selectable_item_clicked);

    $('.os-selectable-items .os-selectable-item .item-quantity-selector-input').off('keyup', latepoint_selectable_item_quantity_keyup);
    $('.os-selectable-items .os-selectable-item .item-quantity-selector-input').on('keyup', latepoint_selectable_item_quantity_keyup);
  }


  function latepoint_calculate_total_price($booking_form_element){
    $booking_form_element.find('.os-summary-value.os-summary-value-price').addClass('os-loading');
    var $booking_form = $booking_form_element.find('.latepoint-form');
    var form_data = $booking_form.serialize();
    var data = { action: 'latepoint_route_call', route_name: latepoint_helper.calculate_price_route, params: form_data, layout: 'none', return_format: 'json'}
    $.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(data){
        if(data.status === "success"){
          latepoint_update_summary_field($booking_form_element, 'price', data.price);
          $booking_form_element.find('.os-summary-value.os-summary-value-price').removeClass('os-loading');
        }
      }
    });
    return;
  }

  function latepoint_update_quantity_for_selectable_items($item){
      var ids = $item.closest('.os-selectable-items')
                        .find('.os-selectable-item.selected')
                        .map(function(){ 
                          if($(this).hasClass('has-quantity')){
                            return $(this).data('item-id') + ':' + $(this).find('input.item-quantity-selector-input').val();
                          }else{
                            return $(this).data('item-id');
                          }
                        }).get();
      $item.closest('.latepoint-booking-form-element').find($item.data('id-holder')).val(ids);
  }

  function latepoint_selectable_item_quantity_keyup(event){
    var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
    var $item = $(this).closest('.os-selectable-item');
    var new_value = $(this).val();
    if(new_value && new_value.match(/^\d+$/)){
      var max_quantity = $item.data('max-quantity');
      if(max_quantity && (new_value > max_quantity)) new_value = max_quantity;
    }else{
      new_value = 0;
    }
    $(this).val(new_value);

    if(( $item.hasClass('selected') && (new_value > 0) ) || (!$item.hasClass('selected') && (new_value == 0))){
      latepoint_update_quantity_for_selectable_items($item);
      latepoint_calculate_total_price($booking_form_element);
      return false;
    }else{
      $item.trigger('click');
    }
  }

  function latepoint_selectable_item_clicked(event){
    event.stopPropagation();
    event.stopImmediatePropagation();
    var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
    if($(this).hasClass('has-quantity')){
      if($(event.target).hasClass('item-quantity-selector')){
        var current_value = parseInt($(this).find('input.item-quantity-selector-input').val());
        var new_value = ($(event.target).data('sign') == 'minus') ? current_value - 1 : current_value + 1;
        var max_quantity = $(this).data('max-quantity');
        if(new_value < 0) new_value = 0;
        if(max_quantity && (new_value > max_quantity)) new_value = max_quantity;
        $(this).find('input.item-quantity-selector-input').val(new_value);
        if(( $(this).hasClass('selected') && (new_value > 0) ) || (!$(this).hasClass('selected') && (new_value == 0))){
          latepoint_update_quantity_for_selectable_items($(this));
          latepoint_calculate_total_price($booking_form_element);
          return false;
        }
      }
      if($(event.target).hasClass('item-quantity-selector-input')){
        latepoint_update_quantity_for_selectable_items($(this));
        latepoint_calculate_total_price($booking_form_element);
        return false;
      }
    }
    var summary_value = '';
    if($(this).hasClass('os-allow-multiselect')){
      if($(this).hasClass('selected')){
        $(this).removeClass('selected');
        if($(this).hasClass('has-quantity')) $(this).find('input.item-quantity-selector-input').val(0);
      }else{
        $(this).addClass('selected');
        if($(this).hasClass('has-quantity') && !($(this).find('input.item-quantity-selector-input').val() > 0)){
          $(this).find('input.item-quantity-selector-input').val(1);
        }
      }
      latepoint_update_quantity_for_selectable_items($(this));
      summary_value = String($(this).closest('.os-selectable-items').find('.os-selectable-item.selected').map(function(){ return (' ' + $(this).data('summary-value')); }).get()).trim();
      latepoint_show_next_btn($booking_form_element);
    }else{
      if(!$(this).hasClass('os-duration-item')) $(this).closest('.os-service-categories-main-parent').find('.os-selectable-item.selected').removeClass('selected');
      $(this).closest('.os-selectable-items').find('.os-selectable-item.selected').removeClass('selected');
      $(this).addClass('selected');
      $booking_form_element.find($(this).data('id-holder')).val($(this).data('item-id'));
      summary_value = $(this).data('summary-value');
      if($(this).data('os-call-func')){
        window[$(this).data('os-call-func')]($(this));
      }
      if($(this).data('activate-sub-step')){
        window[$(this).data('activate-sub-step')]($(this));
      }else{
        latepoint_trigger_next_btn($booking_form_element);
      }
    }
    latepoint_update_summary_field($booking_form_element, $(this).data('summary-field-name'), summary_value);
    if($(this).hasClass('os-priced-item')){
      latepoint_calculate_total_price($booking_form_element);
    }
  }


  function latepoint_format_price(price){
    return latepoint_helper.currency_symbol_before + String(price) + latepoint_helper.currency_symbol_after;
  }


  function latepoint_init_step_services(){
    $('.total-attendies-selector-input').on('change', function(){
      var max_capacity = $(this).closest('.total-attendies-selector-w').data('max-capacity');
      var min_capacity = $(this).closest('.total-attendies-selector-w').data('min-capacity');
      var new_value = $(this).val();
      new_value = Math.min(Number(max_capacity), Number(new_value));
      new_value = Math.max(Number(min_capacity), Number(new_value));
      $(this).val(new_value);

      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      latepoint_update_summary_field($booking_form_element, 'total-attendies', new_value);
      latepoint_calculate_total_price($booking_form_element);
    });
    $('.total-attendies-selector').on('click', function(){
      var add_value = ($(this).hasClass('total-attendies-selector-plus')) ? 1 : -1;
      var max_capacity = $(this).closest('.total-attendies-selector-w').data('max-capacity');
      var min_capacity = $(this).closest('.total-attendies-selector-w').data('min-capacity');
      var current_value = $(this).closest('.total-attendies-selector-w').find('input.total-attendies-selector-input').val();
      var new_value = (Number(current_value) > 0) ? Math.max((Number(current_value) + add_value), 1) : 1;
      new_value = Math.min(Number(max_capacity), new_value);
      new_value = Math.max(Number(min_capacity), new_value);
      $(this).closest('.total-attendies-selector-w').find('input').val(new_value).trigger('change');
      return false;
    });
    $('.os-service-category-info').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      latepoint_show_prev_btn($booking_form_element);
      $(this).closest('.step-services-w').addClass('selecting-service-category');
      var $category_wrapper = $(this).closest('.os-service-category-w');
      var $main_parent = $(this).closest('.os-service-categories-main-parent');
      if($category_wrapper.hasClass('selected')){
        $category_wrapper.removeClass('selected');
        if($category_wrapper.parent().closest('.os-service-category-w').length){
          $category_wrapper.parent().closest('.os-service-category-w').addClass('selected');
        }else{
          $main_parent.removeClass('show-selected-only');
        }
      }else{
        $main_parent.find('.os-service-category-w.selected').removeClass('selected');
        $main_parent.addClass('show-selected-only');
        $category_wrapper.addClass('selected');
      }
      return false;
    });
  }


  function latepoint_trigger_next_btn($booking_form_element){
    $booking_form_element.find('.latepoint_step_direction').val('next');
    $booking_form_element.find('.latepoint-form').submit();
  }

  function latepoint_init_step_locations(){
  }

  function latepoint_init_step_agents(){
    $('.os-items .os-item-details-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var agent_id = $(this).data('agent-id');
      $booking_form_element.find('.os-agent-bio-popup.active').removeClass('active');
      $booking_form_element.find('#osAgentBioPopup' + agent_id).addClass('active');
      return false;
    });
    $('.os-agent-bio-close').on('click', function(){
      $(this).closest('.os-agent-bio-popup').removeClass('active');
      return false;
    });
  }


  function latepoint_init_step_confirmation(){

    $('.latepoint-booking-form-element').on('click', '.set-customer-password-btn', function(){
      var $btn = $(this);
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');

      $btn.addClass('os-loading');
      var params = { account_nonse: $('input[name="account_nonse"]').val(), password: $('input[name="customer[password]"]').val(), password_confirmation: $('input[name="customer[password_confirmation]"]').val()}
      var data = { action: 'latepoint_route_call', route_name: $(this).data('btn-action'), params: $.param(params), layout: 'none', return_format: 'json' }
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $btn.removeClass('os-loading');
          if(data.status === "success"){
            $booking_form_element.find('.step-confirmation-set-password').html('').hide();
            $booking_form_element.find('.confirmation-cabinet-info').show();
          }else{
            latepoint_show_message_inside_element(data.message, $booking_form_element.find('.step-confirmation-set-password'), 'error');
          }
        }
      });
      return false;
    });

    $('.latepoint-booking-form-element').on('click', '.qr-show-trigger', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      $booking_form_element.find('.qr-code-on-confirmation').addClass('show-vevent-qr-code');
      return false;
    });

    $('.latepoint-booking-form-element').on('click', '.show-set-password-fields', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');

      $booking_form_element.find('.step-confirmation-set-password').show();
      $booking_form_element.find('#customer_password').focus();
      $(this).closest('.info-box').hide();
      return false;
    });
  }


  function latepoint_init_customer_dashboard_login(){
    if($('.latepoint-login-form-w #facebook-signin-btn').length && $('.latepoint-login-form-w').length){
      $('.latepoint-login-form-w #facebook-signin-btn').on('click', function(){
        var $login_form_wrapper = $(this).closest('.latepoint-login-form-w');
        FB.login(function(response){
          if (response.status === 'connected' && response.authResponse) {
            var params = { token: response.authResponse.accessToken};
            var data = { action: 'latepoint_route_call', route_name: $login_form_wrapper.find('#facebook-signin-btn').data('login-action'), params: $.param(params), layout: 'none', return_format: 'json' };
            latepoint_step_content_change_start($login_form_wrapper);
            $.ajax({
              type : "post",
              dataType : "json",
              url : latepoint_helper.ajaxurl,
              data : data,
              success: function(data){
                if(data.status === "success"){
                  location.reload();
                }else{
                  latepoint_show_message_inside_element(data.message, $login_form_wrapper);
                  latepoint_step_content_change_end(false, $login_form_wrapper);
                }
              }
            });
          } else {
            
          }
        }, {scope: 'public_profile,email'});
      });
    }

    if($('.latepoint-login-form-w #google-signin-btn').length && $('.latepoint-login-form-w').length && typeof gapi !== 'undefined'){
      // INIT GOOGLE LOGIN
      var googleUser = {};

      var $login_form_wrappers = $('.latepoint-login-form-w');
      $login_form_wrappers.each(function(){
        var $login_form_wrapper = $(this);
        gapi.load('auth2', function(){
          // Retrieve the singleton for the GoogleAuth library and set up the client.
          var auth2 = gapi.auth2.init({
            client_id: $login_form_wrapper.find('meta[name=google-signin-client_id]').attr("content"),
            cookiepolicy: 'single_host_origin',
            // Request scopes in addition to 'profile' and 'email'
            //scope: 'additional_scope'
          });

          auth2.attachClickHandler($login_form_wrapper.find('#google-signin-btn')[0], {},
            function(googleUser) {
              var params = { token: googleUser.getAuthResponse().id_token};
              var data = { action: 'latepoint_route_call', route_name: $login_form_wrapper.find('#google-signin-btn').data('login-action'), params: $.param(params), layout: 'none', return_format: 'json' };
              latepoint_step_content_change_start($login_form_wrapper);
              $.ajax({
                type : "post",
                dataType : "json",
                url : latepoint_helper.ajaxurl,
                data : data,
                success: function(data){
                  if(data.status === "success"){
                    location.reload();
                  }else{
                    latepoint_show_message_inside_element(data.message, $login_form_wrapper);
                    latepoint_step_content_change_end(false, $login_form_wrapper);
                  }
                }
              });
            }, function(error) {
              // console.log(JSON.stringify(error, undefined, 2));
            });
        });
      });
    }
  }

  function get_customer_name($wrapper){
    var customer_name = '';
    var first_name = $wrapper.find('input[name="customer[first_name]"]').val();
    var last_name = $wrapper.find('input[name="customer[last_name]"]').val();
    if(first_name) customer_name+= first_name;
    if(last_name) customer_name+= ' ' + last_name;
    return customer_name.trim();
  }

  function latepoint_init_step_contact(){
    latepoint_init_facebook_login();
    latepoint_init_google_login();
    latepoint_init_form_masks();

    $('.step-contact-w').each(function(){
      latepoint_update_summary_field($(this).closest('.latepoint-booking-form-element'), 'customer', get_customer_name($(this)));
    });

    $('.step-contact-w').on('keyup', 'input[name="customer[first_name]"], input[name="customer[last_name]"]', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      latepoint_update_summary_field($booking_form_element, 'customer', get_customer_name($booking_form_element));
    });

    $('.step-contact-w').on('keyup', '.os-form-control.required', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      if(latepoint_validate_fields($booking_form_element.find('.step-contact-w .os-form-control.required'))){
      }else{
      }
    });

    // Init Logout button
    $('.step-customer-logout-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var data = { action: 'latepoint_route_call', route_name: $(this).data('btn-action'), layout: 'none', return_format: 'json' }
      latepoint_step_content_change_start($booking_form_element);
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          latepoint_reload_step($booking_form_element);
        }
      });
      return false;
    });

    // Init Login Existing Customer Button
    $('.step-login-existing-customer-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      var params = { email: $booking_form_element.find('.os-step-existing-customer-login-w input[name="customer_login[email]"]').val(), password: $booking_form_element.find('.os-step-existing-customer-login-w input[name="customer_login[password]"]').val()}
      var data = { action: 'latepoint_route_call', route_name: $(this).data('btn-action'), params: $.param(params), layout: 'none', return_format: 'json' }
      latepoint_step_content_change_start($booking_form_element);
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
            if(data.status === "success"){
              latepoint_reload_step($booking_form_element);
            }else{
              latepoint_show_message_inside_element(data.message, $booking_form_element.find('.os-step-existing-customer-login-w'));
              latepoint_step_content_change_end(false, $booking_form_element);
            }
        }
      });
      return false;
    });
  }

  function latepoint_step_content_change_start($booking_form_element){
    $booking_form_element.removeClass('step-content-loaded').addClass('step-content-loading');
  }

  // TODO
  function latepoint_step_content_change_end(new_content, $booking_form_element){
    if(new_content) $booking_form_element.find('.latepoint-body .latepoint-step-content').replaceWith(new_content);
    $booking_form_element.removeClass('step-content-loading').addClass('step-content-mid-loading');
    setTimeout(function(){
      $booking_form_element.removeClass('step-content-mid-loading').addClass('step-content-loaded');
    }, 50);
  }

  function latepoint_init_facebook_login(){
    if(!$('#facebook-signin-btn').length || !$('.latepoint-booking-form-element').length) return;
    $('#facebook-signin-btn').on('click', function(){
      var $booking_form_element = $(this).closest('.latepoint-booking-form-element');
      FB.login(function(response){
        if (response.status === 'connected' && response.authResponse) {
          var params = { token: response.authResponse.accessToken};
          var data = { action: 'latepoint_route_call', route_name: $booking_form_element.find('#facebook-signin-btn').data('login-action'), params: $.param(params), layout: 'none', return_format: 'json' };
          latepoint_step_content_change_start($booking_form_element);
          $.ajax({
            type : "post",
            dataType : "json",
            url : latepoint_helper.ajaxurl,
            data : data,
            success: function(data){
              if(data.status === "success"){
                latepoint_reload_step($booking_form_element);
              }else{
                latepoint_show_message_inside_element(data.message, $booking_form_element.find('.os-step-existing-customer-login-w '));
                latepoint_step_content_change_end(false, $booking_form_element);
              }
            }
          });
        } else {
          
        }
      }, {scope: 'public_profile,email'});
    });
  }

  function latepoint_init_google_login(){
    if(!$('#google-signin-btn').length || !$('.latepoint-booking-form-element').length || typeof gapi === 'undefined') return;
    var googleUser = {};

    var $booking_form_elements = $('.latepoint-booking-form-element');
    $booking_form_elements.each(function(){
      var $booking_form_element = $(this);
      gapi.load('auth2', function(){
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        var auth2 = gapi.auth2.init({
          client_id: $booking_form_element.find('meta[name=google-signin-client_id]').attr("content"),
          cookiepolicy: 'single_host_origin',
          // Request scopes in addition to 'profile' and 'email'
          //scope: 'additional_scope'
        });

        auth2.attachClickHandler($booking_form_element.find('#google-signin-btn')[0], {},
          function(googleUser) {
            var params = { token: googleUser.getAuthResponse().id_token};
            var data = { action: 'latepoint_route_call', route_name: $booking_form_element.find('#google-signin-btn').data('login-action'), params: $.param(params), layout: 'none', return_format: 'json' };
            latepoint_step_content_change_start($booking_form_element);
            $.ajax({
              type : "post",
              dataType : "json",
              url : latepoint_helper.ajaxurl,
              data : data,
              success: function(data){
                if(data.status === "success"){
                  latepoint_reload_step($booking_form_element);
                }else{
                  latepoint_show_message_inside_element(data.message, $booking_form_element.find('.os-step-existing-customer-login-w '));
                  latepoint_step_content_change_end(false, $booking_form_element);
                }
              }
            });
          }, function(error) {
            // console.log(JSON.stringify(error, undefined, 2));
          });
      });
    });
  }

  function latepoint_change_step_desc($booking_form_element, step_name){
    $booking_form_element.removeClass('step-changed').addClass('step-changing');
    setTimeout(function(){
      // Progress bar
      var $step_progress = $booking_form_element.find('.latepoint-progress li[data-step-name="' + step_name + '"]');
      $step_progress.addClass('active').addClass('complete').prevAll().addClass('complete').removeClass('active');
      $step_progress.nextAll().removeClass('complete').removeClass('active');
      // Side panel
      var side_panel_desc = $booking_form_element.find('.latepoint-step-desc-library[data-step-name="' + step_name + '"]').html();
      $booking_form_element.find('.latepoint-step-desc').html(side_panel_desc);

      // Top header
      var top_header_desc = $booking_form_element.find('.os-heading-text-library[data-step-name="' + step_name + '"]').html();
      $booking_form_element.find('.os-heading-text').html(top_header_desc);
      setTimeout(function(){
          $booking_form_element.removeClass('step-changing').addClass('step-changed');
      }, 50);
    }, 500);
  }


  function latepoint_progress_prev($booking_form_element, step_name){
    var $step_progress = $booking_form_element.find('.latepoint-progress li[data-step-name="' + step_name + '"]');
    $step_progress.addClass('active').addClass('complete').prevAll().addClass('complete').removeClass('active');
    $step_progress.nextAll().removeClass('complete').removeClass('active');
  }


  function latepoint_progress_next($booking_form_element, step_name){
    var $step_progress = $booking_form_element.find('.latepoint-progress li[data-step-name="' + step_name + '"]');
    $step_progress.addClass('active').addClass('complete').prevAll().addClass('complete').removeClass('active');
    $step_progress.nextAll().removeClass('complete').removeClass('active');
  }


  function latepoint_next_step_description($booking_form_element, step_name){
    $booking_form_element.removeClass('step-changed').addClass('step-changing');
    setTimeout(function(){
      $booking_form_element.find('.latepoint-step-desc').html($booking_form_element.find('.latepoint-step-desc-library.active').removeClass('active').next('.latepoint-step-desc-library').addClass('active').html());
      $booking_form_element.find('.os-heading-text').html($booking_form_element.find('.os-heading-text-library.active').removeClass('active').next('.os-heading-text-library').addClass('active').html());
      setTimeout(function(){
        $booking_form_element.removeClass('step-changing').addClass('step-changed');
      }, 50);
    }, 500);
  }
  function latepoint_prev_step_description($booking_form_element, step_name){
    $booking_form_element.removeClass('step-changed').addClass('step-changing');
    setTimeout(function(){
      $booking_form_element.find('.latepoint-step-desc').html($booking_form_element.find('.latepoint-step-desc-library.active').removeClass('active').prev('.latepoint-step-desc-library').addClass('active').html());
      $booking_form_element.find('.os-heading-text').html($booking_form_element.find('.os-heading-text-library.active').removeClass('active').prev('.os-heading-text-library').addClass('active').html());
      setTimeout(function(){
        $booking_form_element.removeClass('step-changing').addClass('step-changed');
      }, 50);
    }, 500);
  }


  function latepoint_validate_fields($fields){
    var is_valid = true;
    $fields.each(function(index){
      if($(this).val() == ''){
        is_valid = false;
        return false;
      }
    });
    return is_valid;
  }

  function latepoint_submit_booking_form($booking_form){
    var $booking_form_element = $booking_form.closest('.latepoint-booking-form-element');
    var form_data = $booking_form.serialize();
    var data = { action: 'latepoint_route_call', route_name: $booking_form.data('route-name'), params: form_data, layout: 'none', return_format: 'json'}
    $booking_form_element.removeClass('step-content-loaded').addClass('step-content-loading');
    $.ajax({
      type : "post",
      dataType : "json",
      url : latepoint_helper.ajaxurl,
      data : data,
      success: function(data){
        if(data.status === "success"){
          latepoint_hide_message_inside_element($booking_form_element.find('.latepoint-body'));
          if($booking_form_element.data('flash-error')){
            latepoint_show_message_inside_element($booking_form_element.data('flash-error'), $booking_form_element.find('.latepoint-body'));
            $booking_form_element.data('flash-error', '');
          }
          $booking_form_element.find('.latepoint_current_step').val(data.step_name);
          $booking_form_element.removeClass(function (index, className) { return (className.match (/(^|\s)current-step-\S+/g) || []).join(' '); }).addClass('current-step-' + data.step_name);
          setTimeout(function(){
            $booking_form_element.removeClass('step-content-loading').addClass('step-content-mid-loading');
            $booking_form_element.find('.latepoint-body').find('.latepoint-step-content').addClass('is-hidden');
            if($booking_form_element.find('.latepoint-step-content[data-step-name="'+ data.step_name +'"]')){
              $booking_form_element.find('.latepoint-step-content[data-step-name="'+ data.step_name +'"]').remove();
            }
            $booking_form_element.find('.latepoint-body').append(data.message);

            latepoint_init_step(data.step_name, $booking_form_element);
            setTimeout(function(){
              $booking_form_element.removeClass('step-content-mid-loading').addClass('step-content-loaded');
              $booking_form_element.find('.latepoint-next-btn, .latepoint-prev-btn').removeClass('os-loading');
            }, 50);
          }, 500);

          if(data.is_pre_last_step){
            $booking_form_element.data('next-submit-is-last', 'yes');
            $booking_form_element.find('.latepoint-next-btn span').text($booking_form_element.find('.latepoint-next-btn').data('pre-last-step-label'));
          }else{
            $booking_form_element.data('next-submit-is-last', 'no');
            $booking_form_element.find('.latepoint-next-btn span').text($booking_form_element.find('.latepoint-next-btn').data('label'));
          }
          if(data.is_last_step){
            $booking_form_element.addClass('hidden-buttons').find('.latepoint-footer').remove();
            $booking_form_element.find('.latepoint-progress').css( 'opacity', 0 );
            $booking_form_element.closest('.latepoint-summary-is-open').removeClass('latepoint-summary-is-open');
            $booking_form_element.addClass('is-final-step');
          }else{
            if(data.show_next_btn === true){
              latepoint_show_next_btn($booking_form_element);
            }else{
              latepoint_hide_next_btn($booking_form_element);
            }
            if(data.show_prev_btn === true){
              latepoint_show_prev_btn($booking_form_element);
            }else{
              latepoint_hide_prev_btn($booking_form_element);
            }
          }
          latepoint_change_step_desc($booking_form_element, data.step_name);
        }else{
          $booking_form_element.removeClass('step-content-loading').addClass('step-content-loaded');
          $booking_form_element.find('.latepoint-next-btn, .latepoint-prev-btn').removeClass('os-loading');
          if(data.send_to_step && $booking_form_element.find('.latepoint-step-content[data-step-name="'+ data.send_to_step +'"]').length){
            $booking_form_element.data('flash-error', data.message);
            latepoint_reload_step($booking_form_element, data.send_to_step);
          }else{
            latepoint_show_message_inside_element(data.message, $booking_form_element.find('.latepoint-body'));
            latepoint_show_prev_btn($booking_form_element);
          }
        }
        $booking_form.find('.latepoint_step_direction').val('next');
      }
    });
  }

  function latepoint_init_booking_form(){

    $('.latepoint-booking-form-element .latepoint-form').on('submit', function(e){
      e.preventDefault();
      var $booking_form = $(this);
      var $booking_form_element = $booking_form.closest('.latepoint-booking-form-element');
      latepoint_hide_prev_btn($booking_form_element);
      var current_step = $booking_form_element.find('.latepoint_current_step').val();
      var callbacks_list = [];
      $booking_form_element.trigger('latepoint:submitBookingForm', [{ current_step: current_step, 
                                                                      callbacks_list: callbacks_list, 
                                                                      is_final_submit: $booking_form_element.data('next-submit-is-last') == 'yes',
                                                                      direction: $booking_form_element.find('.latepoint_step_direction').val()}]);
      jQuery.when(...callbacks_list.map(callback => callback.action()))
        .done(() => {
                      latepoint_submit_booking_form($booking_form);
                    })
        .fail((error) => {
          if(error.send_to_step && $booking_form_element.find('.latepoint-step-content[data-step-name="'+ error.send_to_step +'"]').length){
            latepoint_reload_step($booking_form_element, error.send_to_step);
          }
          $booking_form_element.removeClass('step-content-loading').addClass('step-content-loaded');
          latepoint_show_message_inside_element(error.message, $booking_form_element.find('.latepoint-body'), 'error');
          $booking_form_element.find('.latepoint-next-btn').removeClass('os-loading');
          if($booking_form_element.find('.latepoint-step-content:last-child').prev('.latepoint-step-content').length) latepoint_show_prev_btn($booking_form_element);
        });
    });

    $('.latepoint-lightbox-close').on('click', function(){
      $('body').removeClass('latepoint-lightbox-active');
      $('.latepoint-lightbox-w').remove();
      return false;
    });



    $('.latepoint-customer-timezone-selector-w select').on('change', function(e){
      var $select_box = $(this);
      $select_box.closest('.latepoint-customer-timezone-selector-w').addClass('os-loading');
      var data = { action: 'latepoint_route_call', route_name: $(this).closest('.latepoint-customer-timezone-selector-w').data('route-name'), params: { timezone_name: $(this).val()}, layout: 'none', return_format: 'json'}
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $select_box.closest('.latepoint-customer-timezone-selector-w').removeClass('os-loading');
          if(data.status === "success"){
            location.reload();
          }else{

          }
        }
      });
    });

    $('.latepoint-timezone-selector-w select').on('change', function(e){
      var $select_box = $(this);
      $select_box.closest('.latepoint-timezone-selector-w').addClass('os-loading');
      var data = { action: 'latepoint_route_call', route_name: $(this).closest('.latepoint-timezone-selector-w').data('route-name'), params: { timezone_name: $(this).val()}, layout: 'none', return_format: 'json'}
      var $booking_form_element = $select_box.closest('.latepoint-booking-form-element');
      $booking_form_element.removeClass('step-content-loaded').addClass('step-content-loading');
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          $select_box.closest('.latepoint-timezone-selector-w').removeClass('os-loading');
          $booking_form_element.removeClass('step-content-loading');
          if(data.status === "success"){
            // reload datepicker if its the step
            if($select_box.closest('.latepoint-booking-form-element').hasClass('current-step-datepicker')){
              latepoint_reload_step($select_box.closest('.latepoint-booking-form-element'));
            }
          }else{

          }
        }
      });
    });

    if(!latepoint_helper.is_timezone_selected){
      const tzid = Intl.DateTimeFormat().resolvedOptions().timeZone;
      if(tzid){
        if(tzid != $('.latepoint-timezone-selector-w select').val()) $('.latepoint-timezone-selector-w select').val(tzid).change();
      }
    }

    

    $('.latepoint-booking-form-element').on('click', '.lp-option', function(){
      $(this).closest('.lp-options').find('.lp-option.selected').removeClass('selected');
      $(this).addClass('selected');
    });




    // Next Step button Click
    $('.latepoint-booking-form-element .latepoint-next-btn').on('click', function(e){
      if($(this).hasClass('disabled') || $(this).hasClass('os-loading')) return false;
      var $next_btn = $(this); 
      $next_btn.addClass('os-loading');
      var $booking_form = $(this).closest('.latepoint-form');
      var $booking_form_element = $booking_form.closest('.latepoint-booking-form-element');

      var current_step = $booking_form_element.find('.latepoint_current_step').val();

      $booking_form.find('.latepoint_step_direction').val('next');
      var callbacks_list = [];
      $booking_form_element.trigger('latepoint:nextStepClicked', [{current_step: current_step, callbacks_list: callbacks_list}]);
      latepoint_hide_prev_btn($booking_form_element);
      jQuery.when(...callbacks_list.map(callback => callback.action()))
        .done(() => {
                      $booking_form.submit();
                    })
        .fail((error) => {
          latepoint_show_message_inside_element(error.message, $booking_form_element.find('.latepoint-body'), 'error');
          $next_btn.removeClass('os-loading');
          // if previous step exists - show prev button
          if($booking_form_element.find('.latepoint-step-content:last-child').prev('.latepoint-step-content').length) latepoint_show_prev_btn($booking_form_element);
        });
      return false;
    });


    // Previous Step button Click
    $('.latepoint-booking-form-element .latepoint-prev-btn').on('click', function(e){
      if($(this).hasClass('disabled') || $(this).hasClass('os-loading')) return false;
      var $booking_form = $(this).closest('.latepoint-form');
      var $booking_form_element = $booking_form.closest('.latepoint-booking-form-element');

      var current_step = $booking_form_element.find('.latepoint_current_step').val();

      if(current_step == 'locations'){
      }
      if(current_step == 'agents'){
      }
      if(current_step == 'payment'){
        var $payment_step = $booking_form_element.find('.step-payment-w');
        if($payment_step.length){
          $payment_step.find('.lp-option.selected').removeClass('selected');
          var new_sub_step = latepoint_get_payment_sub_step($booking_form_element, $payment_step.attr('data-sub-step'), true);
          // hide all payment method content blocks
          if(new_sub_step != $payment_step.attr('data-sub-step')){
            $payment_step.find('.lp-payment-method-content').hide();
            $payment_step.attr('data-sub-step', new_sub_step);
            latepoint_hide_next_btn($booking_form_element);
            return false;
          }
        }
      }
      if(current_step == 'services'){
        var $services_step = $booking_form_element.find('.step-services-w');
        if($services_step.hasClass('selecting-service-duration')){
          $services_step.removeClass('selecting-service-duration');
          $services_step.find('.os-services > .os-item.selected').removeClass('selected');
          clear_sub_step_duration($booking_form_element);
          if(($booking_form_element.find('.latepoint-step-content').length <= 1) && !$services_step.hasClass('selecting-service-category')){
            latepoint_hide_prev_btn($booking_form_element)
          }
          latepoint_calculate_total_price($booking_form_element);
          return false;
        }
        if($services_step.hasClass('selecting-total-attendies')){
          $services_step.removeClass('selecting-total-attendies');
          if($services_step.find('.os-services > .os-item.selected').hasClass('has-multiple-durations')){
            // multiple durations
            $services_step.find('.os-services > .os-item.selected .os-service-durations .os-selectable-item.selected').removeClass('selected');
            $services_step.addClass('selecting-service-duration');
            latepoint_hide_next_btn($booking_form_element);
          }else{
            $services_step.find('.os-services > .os-item.selected').removeClass('selected');
          }
          clear_sub_step_attendies($booking_form_element);
          if(($booking_form_element.find('.latepoint-step-content').length <= 1) && !$services_step.hasClass('selecting-service-category')){
            latepoint_hide_prev_btn($booking_form_element)
          }
          latepoint_calculate_total_price($booking_form_element);
          return false;
        }
        if($services_step.hasClass('selecting-service-category')){
          if($services_step.find('.os-service-category-w .os-service-category-w.selected').length){
            $services_step.find('.os-service-category-w .os-service-category-w.selected').parents('.os-service-category-w').addClass('selected').find('.os-service-category-w.selected').removeClass('selected');
          }else{
            $services_step.removeClass('selecting-service-category').find('.os-service-category-w.selected').removeClass('selected');
            $services_step.removeClass('selecting-service-category').find('.os-service-categories-holder.show-selected-only').removeClass('show-selected-only');
          }
          if(($booking_form_element.find('.latepoint-step-content').length <= 1) && !$services_step.hasClass('selecting-service-category')){
            latepoint_hide_prev_btn($booking_form_element);
          }
          latepoint_calculate_total_price($booking_form_element);
          return false;
        }
      }

      var $current_active_step = $booking_form_element.find('.latepoint-step-content:last-child');
      if($current_active_step.data('clear-action')){
        window[$current_active_step.data('clear-action')]($booking_form_element);
      }

      var $back_btn = $(this);
      $back_btn.addClass('os-loading');
      $booking_form_element.removeClass('step-content-loaded').addClass('step-content-loading');
      var $new_current_step = $booking_form_element.find('.latepoint-step-content.is-hidden').last();
      var new_current_step_name = $new_current_step.data('step-name');
      latepoint_change_step_desc($booking_form_element, new_current_step_name);
      setTimeout(function(){
        $new_current_step.removeClass('is-hidden');
        $current_active_step.remove();
        $booking_form_element.find('.latepoint_current_step').val(new_current_step_name);
        $booking_form_element.find('.latepoint-next-btn span').text($booking_form_element.find('.latepoint-next-btn').data('label'));
        $booking_form_element.data('next-submit-is-last', 'no');
        latepoint_show_next_btn($booking_form_element);
        $back_btn.removeClass('os-loading');
        if($booking_form_element.find('.latepoint-step-content').length <= 1){
          if(new_current_step_name == 'services'){
            var $services_step = $booking_form_element.find('.step-services-w');
            if($services_step.hasClass('selecting-service-duration') || $services_step.hasClass('selecting-total-attendies') || $services_step.hasClass('selecting-service-category')){
              if($services_step.find('.os-services > .os-item.selected').hasClass('is-preselected')){
                // if service is preselected check if there are both multiple duraitons and quantity selector and only then show prev button
                if($services_step.hasClass('selecting-total-attendies') && $services_step.find('.os-services > .os-item.selected').hasClass('has-multiple-durations')){
                  // if selecting attendies and there are multiple durations - show prev button
                  latepoint_show_prev_btn($booking_form_element);
                }else{
                  latepoint_hide_prev_btn($booking_form_element);
                }
              }else{
                latepoint_show_prev_btn($booking_form_element);
              }
            }else{
              latepoint_hide_prev_btn($booking_form_element);
            }
          }else{
            latepoint_hide_prev_btn($booking_form_element);
          }
        }
        $booking_form_element.removeClass('step-content-loading').addClass('step-content-mid-loading');
        setTimeout(function(){
          $booking_form_element.removeClass('step-content-mid-loading').addClass('step-content-loaded');
          latepoint_hide_message_inside_element($booking_form_element.find('.latepoint-body'));
          latepoint_calculate_total_price($booking_form_element);
        }, 150);
      }, 700);
      return false;
    });
  }

  // DOCUMENT READY
  $( function() {

    latepoint_init_customer_dashboard_login();

    if($('.latepoint-booking-form-element').length){
      latepoint_init_booking_form();
      $('.latepoint-booking-form-element').each(function(){
        latepoint_init_step($(this).find('.latepoint_current_step').val(), $(this));
      });
    }

    $('.latepoint-request-booking-cancellation').on('click', function(){
      if(!confirm(latepoint_helper.cancel_booking_prompt)) return false;
      var $this = $(this);
      var $booking_box = $this.closest('.customer-booking');

      var route = $(this).data('route');
      var params = {id: $booking_box.data('id')};

      var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' }
      $this.addClass('os-loading');
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          if(data.status === "success"){
            location.reload();
            $this.remove();
          }else{
            $this.removeClass('os-loading');
          }
        }
      });
      return false;
    });


    $('body').on('click', '.os-step-tabs .os-step-tab', function(){
      $(this).closest('.os-step-tabs').find('.os-step-tab').removeClass('active');
      $(this).addClass('active');
      var target = $(this).data('target');
      $(this).closest('.os-step-tabs-w').find('.os-step-tab-content').hide();
      $(target).show();
    });

    $('body').on('keyup', '.os-form-group .os-form-control', function(){
      if($(this).val()){
        $(this).closest('.os-form-group').addClass('has-value');
      }else{
        $(this).closest('.os-form-group').removeClass('has-value');
      }
    });

    $('.latepoint-tab-triggers').on('click', '.latepoint-tab-trigger', function(){
      var $tabs_wrapper = $(this).closest('.latepoint-tabs-w')
      $tabs_wrapper.find('.latepoint-tab-trigger.active').removeClass('active');
      $tabs_wrapper.find('.latepoint-tab-content').removeClass('active');
      $(this).addClass('active');
      $tabs_wrapper.find('.latepoint-tab-content' + $(this).data('tab-target')).addClass('active');
      return false;
    });


    // Main Button to trigger lightbox opening
    $('.latepoint-book-button, .os_trigger_booking').on('click', function(){
      var $this = $(this);
      var $booking_form_element = $this.closest('.latepoint-booking-form-element');
      var route = latepoint_helper.booking_button_route;
      var params = {};
      var restrictions = {};
      if($this.data('show-service-categories')) restrictions.show_service_categories = $this.data('show-service-categories');
      if($this.data('show-locations')) restrictions.show_locations = $this.data('show-locations');
      if($this.data('show-services')) restrictions.show_services = $this.data('show-services');
      if($this.data('show-agents')) restrictions.show_agents = $this.data('show-agents');
      if($this.data('selected-location')) restrictions.selected_location = $this.data('selected-location');
      if($this.data('selected-agent')) restrictions.selected_agent = $this.data('selected-agent');
      if($this.data('selected-service')) restrictions.selected_service = $this.data('selected-service');
      if($this.data('selected-service-category')) restrictions.selected_service_category = $this.data('selected-service-category');
      if($this.data('selected-start-date')) restrictions.selected_start_date = $this.data('selected-start-date');
      if($this.data('selected-start-time')) restrictions.selected_start_time = $this.data('selected-start-time');
      if($this.data('calendar-start-date')) restrictions.calendar_start_date = $this.data('calendar-start-date');

      if($.isEmptyObject(restrictions) == false) params.restrictions = restrictions;

      var data = { action: 'latepoint_route_call', route_name: route, params: params, layout: 'none', return_format: 'json' }
      $this.addClass('os-loading');
      $.ajax({
        type : "post",
        dataType : "json",
        url : latepoint_helper.ajaxurl,
        data : data,
        success: function(data){
          if(data.status === "success"){
            var lightbox_class = '';
            if($this.data('hide-summary') != 'yes') lightbox_class+= ' latepoint-with-summary';
            if($this.data('hide-side-panel') == 'yes') lightbox_class+= ' latepoint-hide-side-panel';
            latepoint_show_data_in_lightbox(data.message, lightbox_class);
            latepoint_init_booking_form();
            latepoint_init_step(data.step, $booking_form_element);
            $('body').addClass('latepoint-lightbox-active');
            $this.removeClass('os-loading');
            
          }else{
            $this.removeClass('os-loading');
            // console.log(data.message);
          }
        }
      });

      return false;
    });



  });


} )( jQuery );
