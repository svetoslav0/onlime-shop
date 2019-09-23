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

    public function findAll(): void
    {
        $products = $this->productsModel->getAll();

        echo json_encode($products);
    }

    public function findById(int $id): void
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

    public function findAllForCategory(int $categoryId): void
    {
        $products = $this->productsModel->getProductsForCategory($categoryId);

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