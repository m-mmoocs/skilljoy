<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// the library download had messed up paths.  this is needed for includes to work
set_include_path(str_replace('index.php','application/libraries',$_SERVER['SCRIPT_FILENAME']));
require_once("Google/Client.php");
require_once("Google/Service/Oauth2.php");
require_once("Google/Service/Plus.php");

class Gconnect extends Google_Client{
	private $ci;
	public $oauth2, $plus;
	
	public function __construct(){
		parent::__construct();
		$this->ci = &get_instance();
		// Skilljoy
		$this->setApplicationName('Skilljoy');
		$this->setClientId('556580795356-eu27kaa22q22fgmf3g7qqfkns5cev0s1.apps.googleusercontent.com');
		$this->setClientSecret('Yu4bk2U77YDJL9MlJmzYUcc2');
		$this->setRedirectUri('http://localhost/skilljoy/users/g_login');
		$this->setDeveloperKey('AIzaSyBKMBFyPpOrtFaelZnsknU373eKRV1GbSw');
                $this->addScope(array( 'https://www.googleapis.com/auth/plus.me',
                                        'https://www.googleapis.com/auth/plus.login',
                                        'https://www.googleapis.com/auth/userinfo.email',
                                        'https://www.googleapis.com/auth/plus.circles.read'));
		$this->setApprovalPrompt('auto');
                
                $this->plus = new Google_Service_Plus($this);
		$this->oauth2 = new Google_Service_Oauth2($this);
	}
	
	public function getLoginUrl($args){
		$this->setRedirectUri($args['redirect_uri']);
		return $this->createAuthUrl();
	} 
        
        public function my_authenticate($code=NULL){
            $this->authenticate($code);
            $this->ci->session->set_userdata('google_access_token',$this->getAccessToken());
        }
        
        public function get_userinfo(){
            $this->setAccessToken($this->ci->session->userdata('google_access_token'));
            $user = $this->oauth2->userinfo->get();
            return $user;
        }// end get_userinfo()
        
        public function get_plusinfo(){
            $this->setAccessToken($this->ci->session->userdata('google_access_token'));
            $user = $this->plus->people->get('me');
            return $user;
        }// end get_plusinfo()
        
        public function get_friends_list(){
            $this->setAccessToken($this->ci->session->userdata('google_access_token'));
            $people = $this->plus->people->listPeople('me','visible');
            $friends = array();
            foreach($people->getItems() as $p){
                $friends[] = array(
                    'name'=>$p->displayName,
                    'id'=>$p->id
                );
            }
            while(isset($people->nextPageToken)){
                $people = $this->plus->people->listPeople('me','visible',array('pageToken'=>$people->nextPageToken));
                foreach($people->getItems() as $p){
                    $friends[] = array(
                        'name'=>$p->displayName,
                        'id'=>$p->id
                    );
                }
            }
            return $friends;
        }// end get_friends_list()
}
