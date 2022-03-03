<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Http\Requests\DeleteProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\traits\media;
class ProductController extends Controller
{
    use media;
    public function index()
    {
        $products = DB::table('products')->select('id', 'name_en', 'status', 'price', 'quantity', 'created_at')->get();
        return view('products.index', compact('products'));
    }
    public function create()
    {
        $brands = DB::table('brands')->select('id', 'name_en')->get();
        $subcategories = DB::table('subcategories')->select('id', 'name_en')->get();
        return view('products.create', compact('brands', 'subcategories'));
    }
    public function edit($id)
    {
        $product = DB::table('products')->where('id', $id)->first();
        $brands = DB::table('brands')->select('id', 'name_en')->get();
        $subcategories = DB::table('subcategories')->select('id', 'name_en')->get();
        return view('products.edit', compact('product', 'brands', 'subcategories'));
    }

    public function store(StoreProductRequest $request)
    {   //validation on inputs
        // $request->validate([
        //     'name_en'=>['required','max:50'],
        //     'name_ar'=>['required','max:50'],
        //     'price'=>['required','numeric','max:99999.99','min:1'],
        //     'quantity'=>['required','numeric','max:999','min:1'],
        //     'status'=>['required','integer','min:0','max:1'],
        //     'desc_en'=>['required','string'],
        //     'desc_ar'=>['required','string'],
        //     'brand_fk_id'=>['required','integer','exists:brands,id'],
        //     'subcatergories_fk_id'=>['required','integer','exists:subcategories,id'],
        //     'image'=>['nullable','max:1000','mimes:png,jpg,jpeg']
        // ]);
        // upload photo
        // insert product into db
        $data = $request->except('_token', 'image', 'page');
        $data['img'] = $this->upload($request->image, 'products');
        DB::table('products')->insert($data);
        return $this->returnBack($request);
    }
    public function update(UpdateProductRequest $request, $id)
    {
        //validation
        // $rules = [
        //     'name_en'=>['required','max:50'],
        //     'name_ar'=>['required','max:50'],
        //     'price'=>['required','numeric','max:99999.99','min:1'],
        //     'quantity'=>['required','integer','max:999','min:1'],
        //     'status'=>['required','integer','min:0','max:1'],
        //     'desc_en'=>['required','string'],
        //     'desc_ar'=>['required','string'],
        //     'brand_fk_id'=>['nullable','integer','exists:brands,id'],
        //     'subcatergories_fk_id'=>['required','integer','exists:subcategories,id'],
        //     'img'=>['nullable','max:1000','mimes:png,jpg,jpeg']
        // ];//upload img if exist
        // $request->validate($rules);
        $data = $request->except('_token', 'image', 'page', '_method');
       // dd( $data);
        if ($request->has('image')) {
            $data['img'] = $this->upload($request->image, 'products');
            $oldPhoto = DB::table('products')->select('img')->where('id', $id)->first()->img;
            $this->deleteImg($oldPhoto, 'products');
        }
        //update database
        DB::table('products')->where('id',$id)->update($data);
        return $this->returnBack($request);
    }
    public function delete(DeleteProductRequest $request)
    {
        //delete
        $oldPhoto = DB::table('products')->select('img')->where('id',$request->id)->first()->img;
        DB::table('products')->where('id', $request->id)->delete();
        //delete old image
        $this->deleteImg($oldPhoto, 'products');
        return redirect()->back()->with('success', 'Done Successfully');
    }
    public function returnBack(Request $request)
    {
        if ($request->page == 'back') {
            return redirect()->back()->with('success', 'Done Successfully');
        } else {
            return redirect()->route('dashboard.products.index')->with('success', 'Done Successfully');
        }
    }
}
