<?php

/**
 * Description of Products
 *
 * @author Marcus
 */
class Products extends CI_Model{
    function _construct(){
        parent::_construct();
    }
    
    // return all of the images, descending order by the date posted
    function all(){
        $this->db->order_by("id", "desc");
        $query = $this->db->get('products');
        return $query->result_array();
    }
    
    function getProductByCategory($categories) {
        $this->db->where_in('categoryId', $categories);
        $query = $this->db->get('products');
        return $query->result_array();                
    }
    
    function getProductByGender($genders) {
        $this->db->where_in('gender', $genders);
        $query = $this->db->get('products');
        return $query->result_array();                
    }
    
    function getProduct($id) {
        $this->db->where('id', $id);
        $query = $this->db->get('products');
        return $query->result_array();                
    }
    
    function getProductImages($productId) {
        $this->db->where('product_id', $productId);
        $query = $this->db->get('product_photos');
        return $query->result_array();                
    }
    
    // return the three most recently posted products
    function newest(){
        $this->db->order_by("last_modified", "desc");
        $this->db->limit(3);
        $query = $this->db->get('products');
        return $query->result_array();
    }
}
