<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends MY_Controller{

	public function index(){
            
	}
        
        public function show($id)
        {
            $this->load->model('units_m');
            $this->load->model('user_m');
            $this->load->model('series_m');
            $page = new Page('user');
            $page->Data('user', $this->user_m->get_user_with_id($id));
            $page->Data('series', $this->series_m->get_all_series_with_user_id($id));
            $page->Data('unit', $this->units_m->get_all_units_with_user_id($id));
            $page->show();
        }
        
        public function login(){
            $this->load->library('Fbconnect');	
            $this->load->library('Gconnect');
            // get login urls
            $fb_url = $this->fbconnect->getLoginUrl(array('redirect_uri' => 'http://localhost/skilljoy/users/fb_login','scope' => 'email'));
            $g_url = $this->gconnect->createAuthUrl();
            $page = new Page('login');
            $page->Data('fb_url',$fb_url);
            $page->Data('g_url',$g_url);
            $page->show();
        }
	
        public function fb_login(){
            $this->load->library('Fbconnect');
            // if facebook login
            if($this->fbconnect->getUser()){
                // get user info
                $user_profile = $this->fbconnect->api('/me','GET');
                $this->user->login_fb($user_profile);
                $redirect = $this->session->userdata('last_page')?$this->session->userdata('last_page'):base_url();
                header('Location:'.$redirect);
                exit();
            }else{
                // handle error
            }
        }
        
        public function g_login(){
            $this->load->library('Gconnect');
            if (isset($_GET['code'])) { // we received the positive auth callback, get the token and store it in session
                $this->gconnect->my_authenticate($_GET['code']);
                // get user info	
                $user_profile = $this->gconnect->get_userinfo();
                
//                            $friends = $this->gconnect->get_friends_list();
//                            
//                            $this->smrke->debug($friends);
                $this->user->login_g($user_profile);
                $redirect = $this->session->userdata('last_page')?$this->session->userdata('last_page'):base_url();
                header('Location:'.$redirect);
                exit();
            }else{
                // handle error
            }
        }
        
        public function logout(){
            $this->session->sess_destroy();
            // logout fb		
            $this->load->library('Fbconnect');
            $this->fbconnect->destroySession(null);
            header("Location: ".base_url());  exit;
        }
}