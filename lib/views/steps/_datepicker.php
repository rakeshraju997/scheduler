<div class="step-datepicker-w latepoint-step-content" data-step-name="datepicker"  data-clear-action="clear_step_datepicker">
  <div class="os-dates-w">
    <?php OsBookingHelper::generate_monthly_calendar($calendar_start_date, ['total_attendies' => $booking->total_attendies, 
                                                                            'timeshift_minutes' => OsTimeHelper::get_timezone_shift_in_minutes(OsTimeHelper::get_timezone_name_from_session()),
                                                                            'service_id' => $booking->service_id, 
                                                                            'agent_id' => $booking->agent_id, 
                                                                            'location_id' => $booking->location_id, 
                                                                            'duration' => $booking->get_total_duration()]); ?>
  </div>
  <?php if($booking->service_id == '1'){
          $seats = 2;
        }else if($booking->service_id == '2'){  
          $seats = 3;echo '<style>.time-selector-w.with-end-time.time-system-12 .timeslots{grid-template-columns:repeat(1, 1fr)}';
        }else if($booking->service_id == '3'){
          $seats = OsBookingHelper::get_agent_seat_number($booking->agent_id)->number_of_seats;
          //echo '<style>.times-header{padding-bottom:0px}</style>';
          echo '<style>.time-selector-w.style-timebox .times-header{display:inherit;}</style>';
        }
  ?>
  <style>.times-header-label span{border-bottom:unset !important;}.mocktime{margin-bottom:15px;text-align: center;}.times-header {color:unset;font-weight:unset;/*margin-bottom:0px !important;*/}</style>
  <!-- *Note: Maximum Candidates Attending 1 to <?php //echo $seats;?> -->
  <div class="time-selector-w <?php echo 'time-system-'.OsTimeHelper::get_time_system(); ?> <?php echo (OsSettingsHelper::is_on('show_booking_end_time')) ? 'with-end-time' : 'without-end-time'; ?> style-<?php echo OsSettingsHelper::get_time_pick_style(); ?>">
    <div class="times-header">
      <?php if($booking->service_id == '3'){?>
        
        <div class="times-header-label" style="margin:0px;flex:unset;"><?php _e('Your Training Will be Scheduled for', 'latepoint'); ?><br> <span></span><?php echo ' From '?><span></span></div>
        </div>
        <div class="mocktime">Choose Your Mock Test Time Slot for <span style="color:#4b64e8"></span></div>
        <div class="th-line"></div>
      <?php }else{?>
        <div class="th-line"></div>
        <div class="times-header-label"><?php _e('Pick Appointment Time For', 'latepoint'); ?> <span></span></div>
        <div class="th-line"></div></div>
      <?php }?>
    
    <?php //session_start();var_dump(OsBookingHelper::mocktest_slot_checking('2021-08-28',$booking->agent_id));?>
    <div class="os-times-w">
      <div class="timeslots"></div>
    </div>
  </div>
  <input type="hidden" id="mocktime">
  <?php
  echo OsFormHelper::hidden_field('booking[start_date]', $booking->start_date, [ 'class' => 'latepoint_start_date', 'skip_id' => true]);
  echo OsFormHelper::hidden_field('booking[halfday_time]', $booking->start_time, [ 'class' => 'latepoint_halfday_time', 'skip_id' => true]);
	echo OsFormHelper::hidden_field('booking[start_time]', $booking->start_time, [ 'class' => 'latepoint_start_time', 'skip_id' => true]);
  ?>
</div>