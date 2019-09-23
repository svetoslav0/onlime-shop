<?php

/**
 * Class productsModel
 * @property CI_DB_query_builder $db
 */

class productsModel extends CI_Model
{
    public function getAll(): array
    {
        $this->db->select('p.id, p.name AS product_name, p.price, p.picture, c.name AS category_name');
        $this->db->from('products AS p');
        $this->db->join('categories AS c', 'p.category_id = c.id');

        $result = $this->db->get()->result();

        return $result;
    }

    public function getOneById(int $id)
    {
        $this->db->select('p.id, p.name AS product_name, p.price, p.description, p.picture, c.name AS category_name');
        $this->db->from('products AS p');
        $this->db->join('categories AS c', 'p.category_id = c.id');
        $this->db->where('p.id', $id);

        $result = $this->db->get()->row();

        return $result;
    }


    public function getProductsForCategory(int $categoryId): array
    {
        $this->db->select('p.id, p.name AS product_name, p.price, p.picture, c.id AS category_id, c.name AS category_name');
        $this->db->from('products AS p');
        $this->db->join('categories AS c', 'p.category_id = c.id');
        $this->db->where('c.id', $categoryId);

        $result = $this->db->get()->result();

        return $result;
    }
}