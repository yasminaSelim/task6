<?php

namespace App\Http\Controllers\apis;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
   public function index()
   {
    $products = Product::all();
    return response()->json(['products'=>$products]);
   }
}
