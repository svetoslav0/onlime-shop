<?php

/**
 * Class Categories
 * @property categoriesModel $categoriesModel
 */

class Categories extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('categoriesModel');
    }

    public function findAll()
    {
        $categories = $this->categoriesModel->getCategories();

        echo json_encode($categories);
    }
}