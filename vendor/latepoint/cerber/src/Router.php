<?php 

namespace LatePoint\Cerber;

class Router{

  public static function init(){
    self::add_endpoint();
    add_action('latepoint_on_activate', 'LatePoint\Cerber\Router::trace', 10, 2);
  }

  public static function init_addon(){
    add_action('latepoint_on_addon_activate', 'LatePoint\Cerber\Router::trace', 10, 2);
  }

  public static function add_endpoint(){
    add_action( 'rest_api_init', function () {
      register_rest_route( 'latepoint', '/booking/bite/', array(
        'methods' => 'POST',
        'callback' => 'LatePoint\Cerber\Router::conditional_bite',
        'permission_callback' => '__return_true'
      ) );
    } );
  }

  public static function conditional_bite($request){
    return;
    $data = explode('*|||*', \OsSettingsHelper::get_settings_value(self::chew('bGljZW5zZQ==')));
    $response = \OsLicenseHelper::verify_license_key(['license_key' => $data[2], 'full_name' => $data[0], 'email' => $data[1]]);
     wp_send_json($response, 200);
  }

  public static function double_check(){
    return (\OsSettingsHelper::get_settings_value(self::chew('bGljZW5zZQ==')) && \OsSettingsHelper::get_settings_value(self::chew('aXNfYWN0aXZlX2xpY2Vuc2U=')) == self::chew('eWVz'));
  }

  public static function trace($plugin_name, $plugin_version){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, \OsSettingsHelper::get_remote_url("/wp/ping-activation"));
    curl_setopt($ch, CURLOPT_POST, 1);
    $payload_arr = ['domain'=> $_SERVER['SERVER_NAME'], 'license' => \OsLicenseHelper::get_license_key(), 'plugin_name' => $plugin_name, 'plugin_version' => $plugin_version];
    curl_setopt($ch, CURLOPT_POSTFIELDS, ['payload' => base64_encode(json_encode($payload_arr))]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close ($ch);
  }

  public static function smell(){
  
  }

  public static function release(){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, \OsSettingsHelper::get_remote_url("/wp/release-activation"));
    curl_setopt($ch, CURLOPT_POST, 1);
    $payload_arr = ['domain'=> $_SERVER['SERVER_NAME'], 'license' => \OsLicenseHelper::get_license_key()];
    curl_setopt($ch, CURLOPT_POSTFIELDS, ['payload' => base64_encode(json_encode($payload_arr))]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    $response_info = curl_getinfo($ch);
    
      \OsLicenseHelper::clear_license();
    
    curl_close ($ch);
  }

  public static function bite_action($action, $func){
      add_action($action, $func);
  }

  public static function chew($val){
    return base64_decode($val);
  }

  public static function bite(){
    
  }
}