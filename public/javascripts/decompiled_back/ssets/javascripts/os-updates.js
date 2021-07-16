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