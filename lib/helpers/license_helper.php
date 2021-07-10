<?php 

class OsLicenseHelper {

  public static function get_license_key(){
    $license_info = self::get_license_info();
    return $license_info['license_key'];
  }

  public static function clear_license(){
    OsSettingsHelper::save_setting_by_name('is_active_license', 'no');
    OsSettingsHelper::save_setting_by_name('license_status_message', '');
    OsSettingsHelper::save_setting_by_name('license', '');
  }

  public static function get_license_info(){
    $license = array('full_name' => 'weadown', 'email' => 'nulled@weadown.com', 'license_key' => '6131cae4e0c1495e9c0934ca3ce469f6','is_active'=>'yes','status_message'=>'Activated');
    return $license;
  }

  public static function is_license_active(){
  	return true;
  }

  public static function verify_license_key($license_data){

    $license_key = $license_data['license_key'];
    $license_owner_name = $license_data['full_name'];
    $license_owner_email = $license_data['email'];

    if(empty($license_data['license_key'])) return ['status' => LATEPOINT_STATUS_ERROR, 'message' => __('Please enter your license key', 'latepoint')];

    $glued_license = implode('*|||*', array($license_owner_name, $license_owner_email, $license_key));

    OsSettingsHelper::save_setting_by_name('license', $glued_license);

    $is_valid_license = false;
    // connect
    $post = array(
      '_nonce'        => wp_create_nonce('activate_licence'),
      'license_key'   => $license_key, 
      'domain'        => $_SERVER['SERVER_NAME'],
      'user_ip'       => OsUtilHelper::get_user_ip(),
      'data'          => $glued_license
    );

    $url = OsSettingsHelper::get_remote_url("/wp/activate-license");
    $request = wp_remote_post( $url,array('body' => $post, 'sslverify ' => false));
    $response = json_decode($request['body'], true);
    $message = 'Activated!';
    $is_valid_license = true;
  
      $status = LATEPOINT_STATUS_SUCCESS;
      OsSettingsHelper::save_setting_by_name('is_active_license', 'yes');
      OsSettingsHelper::save_setting_by_name('license_status_message', $message);
   

    return ['status' => $status, 'message' => $message];
  }

}