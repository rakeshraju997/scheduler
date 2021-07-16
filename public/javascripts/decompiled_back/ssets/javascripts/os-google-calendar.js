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