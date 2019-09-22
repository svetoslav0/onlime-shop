<?php

/**
 * Class ShoppingCarts
 * @property shoppingCartsModel $shoppingCartsModel
 */

class ShoppingCarts extends CI_Controller
{
    // Assuming the task doesn't require to register and login users, the user that uses this system will be the same
    const USER_ID = 1;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('shoppingCartsModel');
    }

    public function addProduct($id)
    {
        $result = $this->shoppingCartsModel->insertProductInShoppingCart(self::USER_ID, $id);

        echo json_encode($result);
    }

    public function removeProduct($productId)
    {
        $result = $this->shoppingCartsModel->deleteProductFromShoppingCart(self::USER_ID, $productId);

        echo json_encode($result);
    }

    public function findProductsInCart()
    {
        $products = $this->shoppingCartsModel->getShoppingCartProducts(self::USER_ID);

        echo json_encode($products);
    }
}