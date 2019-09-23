<?php

/**
 * Class Products
 * @property productsModel productsModel
 */

class Products extends CI_Controller
{
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

        if ($product !== null) {
            echo json_encode([
                'found' => true,
                'data' => $product
            ]);
        } else {
            echo json_encode([
                'found' => false,
                'message' => 'The product you are looking for does not exist!'
            ]);
        }
    }

    public function findAllForCategory($category_id)
    {
        $products = $this->productsModel->getProductsForCategory($category_id);

        echo json_encode($products);
    }
}