<?php

namespace App\Products;

class CategoryRepository
{
    public function getCategories($args=[])
    {
        $categories = Category::paginate(20);
            
        return $categories;
    }

    public function findCategory($id)
    {
        $category = Category::find($id);
            
        return $category;
    }

    public function createOrUpdateCategory($id, $input)
    {
        if (!empty($id)) {
            $category = $this->findCategory($id);

            if (is_null($category)) {
                abort(404);
            }
        }
        
        if (!isset($category)) {
            $category = Category::create($input);
        }
        else {
            $category->update($input);
        }

        return $category;
    }

    public function deleteCategory(Category $category)
    {
        $category->delete();
    }
}