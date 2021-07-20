<style>
	.calendar-month-agents-w .ma-days-with-bookings-w .ma-day .ma-day-agent-bookings .ma-day-booking{
		top : 0px !important;
		bottom : 0px !important;
	}
	.ma-day-booking{
		border : 0.5px solid #fff;
		border-radius : 3px;
	}
</style>
<?php 
if($agents){ ?>
	<?php if(!$calendar_only){ ?>
		<div class="page-header-main-actions">
			<?php if(count($locations) > 1){ ?>
				<div class="os-form-group os-form-select-group os-form-group-transparent size-small">
					<select name="" id="monthly_calendar_location_select" class="calendar-location-selector os-form-control">
						<?php if(OsSettingsHelper::is_on('one_location_at_time')) echo '<option value="">'.__('All Locations', 'latepoint').'</option>'; ?>
						<?php foreach($locations as $location){ ?>
							<option value="<?php echo $location->id; ?>" <?php if($selected_location && ($location->id == $selected_location->id)) echo 'selected'; ?>><?php echo $location->name; ?></option>
						<?php } ?>
					</select>
				</div>
			<?php } ?>
			<?php echo OsFormHelper::select_field('monthly_calendar_month_select', false, OsUtilHelper::get_months_for_select(), $calendar_start_date->format('n'), [], ['class' => 'os-form-group os-form-select-group os-form-group-transparent size-small']); ?>
			<?php echo OsFormHelper::select_field('monthly_calendar_year_select', false, [OsTimeHelper::today_date('Y') - 1, OsTimeHelper::today_date('Y'), OsTimeHelper::today_date('Y') + 1], $calendar_start_date->format('Y'), [], ['class' => 'os-form-group os-form-select-group os-form-group-transparent size-small']); ?>
		</div>
	<?php } ?>
	<?php
	$agents_head_html = '';
	foreach($agents as $agent){
		$agents_head_html.= 
			'<div class="ma-head-agent">
				<div class="ma-head-agent-avatar" style="background-image: url('.$agent->get_avatar_url().')"></div>
				<div class="ma-head-agent-name">'.$agent->full_name.'</div>
			</div>';
	}
	$calendar_not_scrollable_class = (count($agents) > 4) ? '' : 'calendar-month-not-scrollable';
	if(!$calendar_only) echo '<div class="calendar-month-agents-w '.$calendar_not_scrollable_class.'" data-route="'.OsRouterHelper::build_route_name('calendars', 'monthly_agents').'">';
		echo '<div class="ma-floated-days-w">';
			echo '<div class="ma-head-info"><span>'.__('Date', 'latepoint').'</span><span>'.__('Agent', 'latepoint').'</span></div>';
			$calendar_start_date = new OsWpDateTime($start_date_string);
			for($i = 0; $i < $calendar_start_date->format('d'); $i++){
		    list($work_start_minutes, $work_end_minutes) = OsBookingHelper::get_work_start_end_time_for_date(['custom_date' => $calendar_start_date->format('Y-m-d')]);
				$total_work_time = $work_end_minutes - $work_start_minutes;
				echo '<div class="ma-day ma-day-number-'.$calendar_start_date->format('N').'">';
					echo '<div class="ma-day-info">';
						echo '<span class="ma-day-number">'.$calendar_start_date->format('j').'</span>';
						echo '<span class="ma-day-weekday">'.OsUtilHelper::get_weekday_name_by_number($calendar_start_date->format('N'), true).'</span>';
					echo '</div>';
				echo '</div>';
		    $calendar_start_date->modify('+1 day');
			}
		echo '</div>';
		echo '<div class="ma-days-with-bookings-w">';
			echo '<div class="ma-days-with-bookings-i">';
				echo '<div class="ma-head">';
					echo $agents_head_html;
				echo '</div>';
				$calendar_start_date = new OsWpDateTime($start_date_string);
				$count = 0;
				for($i = 0; $i < $calendar_start_date->format('d'); $i++){
					echo '<div class="ma-day ma-day-number-'.$calendar_start_date->format('N').'">';
						foreach($agents as $agent){
					    list($work_start_minutes, $work_end_minutes) = OsBookingHelper::get_work_start_end_time_for_date(['custom_date' => $calendar_start_date->format('Y-m-d'), 'agent_id' => $agent->id]);
							$total_work_time = $work_end_minutes - $work_start_minutes;
							echo '<div class="ma-day-agent-bookings">';
								if($total_work_time > 0){
									$day_bookings = OsBookingHelper::get_bookings_for_date($calendar_start_date->format('Y-m-d'), ['agent_id' => $agent->id, 'location_id' => $selected_location_id]);							
									if($store[$agent->id]['count']>0){
										echo '<div class="ma-day-booking" style="left: 0%; width: 100%; background-color: '.$store[$agent->id]['color'].'" '.$action_html.'>';
										echo '</div>';$store[$agent->id]['count']--;
									}
								
									if($day_bookings){
										$overlaps_count = 1;
										$total_attendies_in_group = 0;
										$total_bookings_in_group = 0;
										$total_bookings = count($day_bookings);
										foreach($day_bookings as $index => $booking){
											$next_booking = (($index + 1) < $total_bookings) ? $day_bookings[$index + 1] : false;
											if(OsBookingHelper::check_if_group_bookings($booking, $next_booking)){
												// skip this output because multiple bookings in the same slot because next booking has the same start and end time 
												$total_attendies_in_group+= $booking->total_attendies;
												$total_bookings_in_group++;
												continue;
											}else{
												if($booking->service->id == 3 || $count > 0 ){
													$store[$agent->id]['count'] = intval($booking->service->id)-1;
													$store[$agent->id]['color'] = $booking->service->bg_color;
 												}
												if($booking->service->id == 1){
													$width = 50;
												}else{
													$width = 100;
												}
												echo '<div class="ma-day-booking" style="left: 0%; width: '.$width.'%; background-color: '.$booking->service->bg_color.'" '.$action_html.'>';
																$hide_agent_info = true;
																include(LATEPOINT_VIEWS_ABSPATH.'dashboard/_booking_info_box_small.php');
												echo '</div>';
												// time overlaps
												$overlaps_count = ($next_booking && ($next_booking->start_time < $booking->end_time)) ? $overlaps_count + 1 : 1;
												// reset
												$total_attendies_in_group = 0;
											}
										}
									}
								}else{
									echo '<div class="ma-day-off"><span>'.__('Day Off', 'latepoint').'</span></div>';
								}
							echo '</div>';
						}
					echo '</div>';
			    $calendar_start_date->modify('+1 day');
			}
			echo '</div>';
		echo '</div>';
	if(!$calendar_only) echo '</div>';
}else{ ?>
  <div class="no-results-w">
    <div class="icon-w"><i class="latepoint-icon latepoint-icon-grid"></i></div>
    <h2><?php _e('No Agents Created', 'latepoint'); ?></h2>
    <a href="<?php echo OsRouterHelper::build_link(OsRouterHelper::build_route_name('agents', 'new_form') ) ?>" class="latepoint-btn"><i class="latepoint-icon latepoint-icon-plus-square"></i><span><?php _e('Create Agent', 'latepoint'); ?></span></a>
  </div>
<?php } ?>
