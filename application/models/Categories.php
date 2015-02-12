<?php

/**
 * Description of Categories
 *
 * @author Marcus
 */
class Categories extends CI_Model{
    function _construct(){
        parent::_construct();
    }
    
    // return all of the categories, in ascending order by name
    function all(){
        $this->db->order_by("name", "asc");
        $query = $this->db->get('category');
        return $query->result_array();
    }
}
