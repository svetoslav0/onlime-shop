<?php

/**
 * Class categoriesModel
 * @property CI_DB_query_builder $db
 */

class categoriesModel extends CI_Model
{
    public function getCategories()
    {
        $this->db->select('id, name');
        $this->db->from('categories');

        $result = $this->db->get()->result();

        return $result;
    }
}