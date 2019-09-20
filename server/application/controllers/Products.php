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

        echo json_encode($product);
    }

    public function findAllForCategory($category_id)
    {
        $products = $this->productsModel->getProductsForCategory($category_id);

        echo json_encode($products);
    }
}