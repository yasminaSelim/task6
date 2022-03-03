<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;


class StoreProductRequest extends FormRequest
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    { // validation
        return
        [
            'name_en'=>['required','max:50'],
            'name_ar'=>['required','max:50'],
            'price'=>['required','numeric','max:99999.99','min:1'],
            'quantity'=>['required','integer','max:999','min:1'],
            'status'=>['required','integer','min:0','max:1'],
            'desc_en'=>['required','string'],
            'desc_ar'=>['required','string'],
            'brand_fk_id'=>['nullable','integer','exists:brands,id'],
            'subcatergories_fk_id'=>['required','integer','exists:subcategories,id'],
            'image'=>['required','max:1000','mimes:png,jpg,jpeg']
        ];

    }
}
