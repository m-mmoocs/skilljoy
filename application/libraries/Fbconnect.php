<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


require_once("fb_client/facebook.php");

class Fbconnect extends Facebook{
//            skilljoy facebook app
//            app id: 718847451488799
//            app secret: 26350cd534e6725f1c1d62ad1d30376a
	public function __construct(){
		$ci =& get_instance();
		$config = array('appId' => '718847451488799',
			'secret' => '26350cd534e6725f1c1d62ad1d30376a');
		
		parent::__construct($config);
	}
	
	public function get_friends_list($q=NULL){    
            // code below may be needed once the app is on public server
//            $my_access_token=$this->getAccessToken();
//            
//            try {
//                $friends = $this->api('/me/friends',array('access_token'=>$my_access_token));
//            } catch (FacebookApiException $e) { error_log($e); }
            
            try {
                $response = $this->api('/me/friends?'.$q);
            } catch (FacebookApiException $e) { error_log($e); }
            
            if(isset($response['paging']['next'])){
                // get query parameters
                preg_match('/\?(.*)$/', $response['paging']['next'], $matches);
                return array_merge($response['data'],$this->get_friends_list($matches[1]));
            }else{
                return $response['data'];
            }
        } // end function get_friends_list
	
	public function sendback($val){
		return strtoupper($val);
	}
	
}
