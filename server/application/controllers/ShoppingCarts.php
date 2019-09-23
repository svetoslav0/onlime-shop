<?php

/**
 * Class ShoppingCarts
 * @property shoppingCartsModel $shoppingCartsModel
 * @property productsModel $productsModel
 */

class ShoppingCarts extends CI_Controller
{
    // Assuming the task doesn't require to register and login users, the user that uses this system will be the same
    const USER_ID = 1;
    const PRODUCT_NOT_ADDED_MESSAGE = 'Something went wrong when the system tried to add the product in your shopping cart. Please try again or contact us.';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('shoppingCartsModel');
        $this->load->model('productsModel');
    }

    public function addProduct($id)
    {
        $product = $this->productsModel->getOneById($id);
        $message = '';

        if ($product) {
            $result = $this->shoppingCartsModel->insertProductInShoppingCart(self::USER_ID, $id);
        } else {
            $result = false;
            $message = self::PRODUCT_NOT_ADDED_MESSAGE;
        }

        echo json_encode([
            'productAdded' => $result,
            'message' => $message
        ]);
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

    public function finishOrder()
    {
        // Save the order and show it in the admin panel or somewhere else
        // $this->shoppingCartsModel->saveOrder($this->input->post()); ...

        $this->emptyShoppingCart();
    }

    public function emptyShoppingCart()
    {
        $result = $this->shoppingCartsModel->emptyShoppingCartForUser(self::USER_ID);

        echo json_encode($result);
    }
}