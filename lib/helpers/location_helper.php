<?php 

class OsLocationHelper {

  static $locations;
  static $selected_location = false;
  static $total_locations;

  public static function locations_selector_html(){
    return false;
  }

  public static function get_locations_for_service_and_agent($service_id = false, $agent_id = false, $active_only = true){
    $all_location_ids = OsConnectorHelper::get_connected_object_ids('location_id', ['service_id' => $service_id, 'agent_id' => $agent_id]);
    if($active_only){
      $locations = new OsLocationModel();
      $active_location_ids = $locations->select('id')->should_be_active()->get_results(ARRAY_A);
      if($active_location_ids){
        $active_location_ids = array_column($active_location_ids, 'id');
        $all_location_ids = array_intersect($active_location_ids, $all_location_ids);
      }else{
        $all_location_ids = [];
      }
    }
    return $all_location_ids;
  }

  public static function get_locations($agent_id = false){
    $locations = new OsLocationModel();
    if($agent_id) $locations->filter_by_agent_id($agent_id);
    $locations = $locations->get_results_as_models();
    return $locations;
  }

  public static function get_locations_list($agent_id = false){
    $locations = new OsLocationModel();
    if($agent_id) $locations->filter_by_agent_id($agent_id);
    $locations = $locations->get_results_as_models();
    $locations_list = [];
    if($locations){
      foreach($locations as $location){
        $locations_list[] = ['value' => $location->id, 'label' => $location->name];
      }
    }
    return $locations_list;
  }

  public static function count_locations($agent_id = false){
    if(self::$total_locations) return self::$total_locations;
    $locations = new OsLocationModel();
    if($agent_id) $locations->filter_by_agent_id($agent_id);
    $locations = $locations->get_results_as_models();
    self::$total_locations = $locations ? count($locations) : 0;
    return self::$total_locations;
  }

  public static function get_default_location(){
    $location_model = new OsLocationModel();
    $location = $location_model->set_limit(1)->get_results_as_models();
    return ($location && $location->id) ? $location : self::create_default_location();
  }

  public static function get_default_location_id(){
    $location = self::get_default_location();
    return $location->id;
  }

  public static function create_default_location(){
    $location_model = new OsLocationModel();
    $location_model->name = __('Main Location', 'latepoint');
    if($location_model->save()){
      $connector = new OsConnectorModel();
      $incomplete_connections = $connector->where(['location_id' => 'IS NULL'])->get_results_as_models();
      if($incomplete_connections){
        foreach($incomplete_connections as $incomplete_connection){
          $incomplete_connection->update_attributes(['location_id' => $location_model->id]);
        }
      }
      $bookings = new OsBookingModel();
      $incomplete_bookings = $bookings->where(['location_id' => 'IS NULL'])->get_results_as_models();
      if($incomplete_bookings){
        foreach($incomplete_bookings as $incomplete_booking){
          $incomplete_booking->update_attributes(['location_id' => $location_model->id]);
        }
      }
    }
    return $location_model;
  }
}