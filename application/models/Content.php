<?php

/**
 * Description of Content 
 *
 * @author Marcus
 */
class Content extends CI_Model{
    
    function _construct(){
        parent::_construct();
        // we initialise values manually but should really
        // populate this from the content_type table
        $this->contentTypes = array(
            'general' => 1,
            'news' => 2,
            'email' => 3,
            'facebook' => 4);
    }
    
    function getNews() {
        $this->db->where('content_typeId',2 ); // bad I know but will refactor
        $query = $this->db->get('site_content');
        return $query->result_array();                
    }
    
    function getContent($id, $contentTypeId) {
        $this->db->where('id', $id);
        $this->db->where('content_typeId', $contentTypeId);
        $query = $this->db->get('site_content');
        return $query->result_array();                
    }
}
