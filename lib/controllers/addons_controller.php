<?php
if ( ! defined( 'ABSPATH' ) ) {
  exit; // Exit if accessed directly.
}


if ( ! class_exists( 'OsAddonsController' ) ) :


  class OsAddonsController extends OsController {



    function __construct(){
      parent::__construct();

      $this->views_folder = LATEPOINT_VIEWS_ABSPATH . 'addons/';
      $this->vars['page_header'] = __('Available Add-ons', 'latepoint');
    }

    function delete_addon(){
      if(!isset($this->params['addon_name']) || empty($this->params['addon_name'])) return;
      delete_plugins($this->params['addon_name']);
      if($this->get_return_format() == 'json'){
        $this->send_json(array('status' => $status, 'code' => $code, 'message' => $response_html));
      }
    }


    function deactivate_addon(){
      if(!isset($this->params['addon_name']) || empty($this->params['addon_name'])) return;

      $result = OsAddonsHelper::deactivate_addon( $this->params['addon_path'] );
      $status = is_wp_error( $result ) ? LATEPOINT_STATUS_ERROR : LATEPOINT_STATUS_SUCCESS;
      $response_html = is_wp_error($result) ? $result->get_error_message() : __('Addon deactivated', 'latepoint');

      if($this->get_return_format() == 'json'){
        $this->send_json(array('status' => $status, 'code' => $code, 'message' => $response_html));
      }
    }

    function activate_addon(){
      if(!isset($this->params['addon_path']) || empty($this->params['addon_path'])) return;

      $result = OsAddonsHelper::activate_addon( $this->params['addon_path'] );
      $status = is_wp_error( $result ) ? LATEPOINT_STATUS_ERROR : LATEPOINT_STATUS_SUCCESS;
      $response_html = is_wp_error($result) ? $result->get_error_message() : __('Addon activated', 'latepoint');
      if($this->get_return_format() == 'json'){
        $this->send_json(['status' => $status, 'code' => $code, 'message' => $response_html]);
      }
    }

    function install_addon(){
      if(!isset($this->params['addon_name']) || empty($this->params['addon_name'])) return;

      $addon_name = $this->params['addon_name'];

      $license = OsLicenseHelper::get_license_info();

      
        $addon_info = OsAddonsHelper::get_addon_download_info($addon_name);
        $result = OsAddonsHelper::install_addon($addon_info);
        if(is_wp_error( $result )){
          $status = LATEPOINT_STATUS_ERROR;
          $response_html = $result->get_error_message();
          $code = '500';
        }else{
          $status = LATEPOINT_STATUS_SUCCESS;
          $code = '200';
          $response_html = __('Addon installed successfully.', 'latepoint');
        }
     

      if($this->get_return_format() == 'json'){
        $this->send_json(array('status' => $status, 'code' => $code, 'message' => $response_html));
      }

    }


    function index(){

      $this->format_render(__FUNCTION__);
    }

    function load_addons_list(){

      // connect
      $vars = array(
        '_nonce'            => wp_create_nonce('activate_licence'),
        'version'           => LATEPOINT_VERSION, 
        'domain'            => $_SERVER['SERVER_NAME'],
        'marketplace'       => LATEPOINT_MARKETPLACE,
        'license_key'       => OsLicenseHelper::get_license_key(),
        'user_ip'           => OsUtilHelper::get_user_ip(),
      );

      $url = OsSettingsHelper::get_remote_url("/wp/addons/load_addons_list");

     
      
      $request = wp_remote_post( $url,array('body' => $vars, 'sslverify ' => false));
      $this->vars['addons'] = false;
      if( !is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200){ 
        $this->vars['addons'] = json_decode($request['body']);
      }else{
        error_log('Error! '.$request->get_error_message());
      }
      $this->format_render(__FUNCTION__);
    }
	}



endif;