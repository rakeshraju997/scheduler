<?php 

class OsUpdatesHelper {

  public static function is_update_available(){
    $latest_version = get_option('latepoint_latest_available_version', LATEPOINT_VERSION);
    return (version_compare($latest_version, LATEPOINT_VERSION) > 0);
  }

  public static function check_plugin_latest_version(){
    // connect
    $vars = array(
      '_nonce'            => wp_create_nonce('check_version_number'),
      'version'           => LATEPOINT_VERSION, 
      'domain'            => $_SERVER['SERVER_NAME'],
      'license_key'       => OsSettingsHelper::get_settings_value('license')
    );

    $url = OsSettingsHelper::get_remote_url("/wp/latest-version-number.json");

    $args = array(
      'timeout' => 15,
      'headers' => array(),
      'body' => $vars,
      'sslverify ' => false
    );
   
    $request = wp_remote_post( $url, $args);
    
    if( !is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200){
      $version_info = json_decode($request['body'], true);
      if(!isset($version_info['version'])) return;
      update_option('latepoint_latest_available_version', $version_info['version']);
    }
  }

}