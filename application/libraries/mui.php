<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Mui {

    function __construct() {
        
    }

    function material_check($input) {
        $output = array();
        if ($this->is_valid_url($input)) { // does true/false url test, 
            if ($this->is_valid_pdf($input)) {  // then tests if it ends in pdf
                return array('content' => $input, 'content_type' => 2);
            } else if ($output = $this->is_valid_vimeo($input)) {  // checks if it's a valid vimeo format
                return array('content' => $output, 'content_type' => 3);
            } else if ($output = $this->is_valid_youtube($input)) {    // returns extracted video code if it's valid youtube
                return array('content' => $output, 'content_type' => 1);
            } else if ($output = $this->is_valid_slideshare($input)) {
                return array('content' => $output, 'content_type' => 5);
            } else {
                return array('content' => $input, 'content_type' => 4); // flag as URL, but not a recognized type
            }
        } else { // assuming no match was found      // using this to check if material type can be added
            return array('content_type' => 0);
        }
    }

    // --- Functions for testing various formats ---
    function is_valid_youtube($input) {
        $pattern = '#^(?:https?://)?(?:www\.)?(?:youtu\.be/|youtube\.com(?:/embed/|/v/|/watch\?v=|/watch\?.+&v=))([\w-]{11})(?:.+)?$#x';
        preg_match($pattern, $input, $result);
        return (isset($result[1])) ? $result[1] : false;
    }

    function is_valid_pdf($input) {
        $url = parse_url($input);
        if ( isset($url['path']))   // check that the url contains a 'path' portion
        {
            if (preg_match('/\.pdf$/', $url['path'])) // look for pdf extension at the end
                {
                    return $input;  // send back the entire URL
                }
        } else {
            return false;
        }
    }

    function is_valid_vimeo($input) {
        $pattern = '#(http://vimeo.com)/([0-9]+)#i';
        preg_match($pattern, $input, $result);
        return (isset($result[2])) ? $result[2] : false;
    }

    function is_valid_url($input) {
        $url = $input;
        if (preg_match("/^(http|https):\/\/([A-Z0-9][A-Z0-9_-]*(?:\.[A-Z0-9][A-Z0-9_-]*)+):?(\d+)?\/?/i", $url)) {
            if (filter_var($url, FILTER_VALIDATE_URL)) {  // double checking by running through validation filter
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }
    
    function is_valid_slideshare($input)
    {
        if (preg_match('#(http://www.slideshare.net/+)#i', $input)) {   // if it starts with slideshare.net
            $url = "http://www.slideshare.net/api/oembed/2?url=".$input."&format=json";
            if($this->get_http_response_code($url) != "404"){       // if server doesn't give a 404 response
                $response = file_get_contents($url);
                $decode = json_decode($response);
                if (isset($decode->html)) {         // extracts just the html code with links
                    return $decode->html;
                } else {
                    return FALSE;
                }
            }
            else
            {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }
    
    function is_alphanumeric($input)
    {
        return ( ! preg_match("/^([-a-z0-9_])+$/i", $input)) ? FALSE : TRUE;
    }
    
    function get_http_response_code($url){
        $headers = get_headers($url);
        return substr($headers[0], 9, 3);
    }
}
