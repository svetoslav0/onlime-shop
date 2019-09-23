<?php

/**
 * Class Products
 * @property productsModel productsModel
 */

class Products extends CI_Controller
{
    const NON_EXISTING_PRODUCT_MESSAGE = 'The product you are looking for does not exist!';
    const NON_EXISTING_CATEGORY_MESSAGE = 'The category you are looking for does not exist!';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('productsModel');
    }

    public function findAll()
    {
        $products = $this->productsModel->getAll();

        echo json_encode($products);
    }

    public function findById($id)
    {
        $product = $this->productsModel->getOneById($id);

        if ($product) {
            echo json_encode([
                'found' => true,
                'data' => $product
            ]);
        } else {
            echo json_encode([
                'found' => false,
                'message' => self::NON_EXISTING_PRODUCT_MESSAGE
            ]);
        }
    }

    public function findAllForCategory($category_id)
    {
        $products = $this->productsModel->getProductsForCategory($category_id);

        if ($products) {
            echo json_encode([
                'found' => true,
                'data' => $products
            ]);
        } else {
            echo json_encode([
                'found' => false,
                'message' => self::NON_EXISTING_CATEGORY_MESSAGE
            ]);
        }
    }
}