<?php

/**
 * Class shoppingCartsModel
 * @property CI_DB_query_builder $db
 */

class shoppingCartsModel extends CI_Model
{
    public function insertProductInShoppingCart(int $userId, int $productId): bool
    {
        $data = [
            'user_id' => $userId,
            'product_id' => $productId
        ];

        $result = $this->db->insert('shopping_orders', $data);

        return $result;
    }

    public function getShoppingCartProducts(int $userId): array
    {
        $this->db->select('s.user_id, s.product_id, p.name, p.price, p.picture, c.name AS category_name');
        $this->db->from('shopping_orders AS s');
        $this->db->join('products AS p', 's.product_id = p.id');
        $this->db->join('categories AS c', 'p.category_id = c.id');
        $this->db->where('s.user_id', $userId);

        $result = $this->db->get()->result();

        return $result;
    }

    public function deleteProductFromShoppingCart(int $userId, int $productId)
    {
        $this->db->where('product_id', $productId);
        $this->db->where('user_id',$userId);
        $this->db->limit(1);

        $result = $this->db->delete('shopping_orders');

        return $result;
    }

    public function emptyShoppingCartForUser(int $userId)
    {
        $this->db->where('user_id', $userId);

        $result = $this->db->delete('shopping_orders');

        return $result;
    }
}