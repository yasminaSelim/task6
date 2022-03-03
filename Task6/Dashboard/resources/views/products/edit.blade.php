@extends('layouts.dashboard')
@section('title', 'Update Product')
@section('css')

@endsection
@section('content')
    <div class="col-12">
        <form method="post" enctype="multipart/form-data" action="{{ route('dashboard.products.update', $product->id) }}">
            @csrf
            @method('PUT')
            <div class="card-body">
                <div class="form-row">
                    <div class="col-6">
                        <label>Name EN</label>
                        <input type="text" class="form-control" name="name_en" value="{{ $product->name_en }}">
                    </div>
                    <div class="col-6">
                        <label>Name AR</label>
                        <input type="text" class="form-control" name="name_ar" value="{{ $product->name_ar }}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-6">
                        <label>Price</label>
                        <input type="number" class="form-control" name="price" value="{{ $product->price }}">
                    </div>
                    <div class="col-6">
                        <label>Quantity</label>
                        <input type="number" class="form-control" name="quantity" value="{{ $product->quantity }}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-6">
                        <label>Description EN</label>
                        <textarea class="form-control" name="desc_en">{{ $product->desc_en }}</textarea>
                    </div>
                    <div class="col-6">
                        <label>Description EN</label>
                        <textarea class="form-control" name="desc_ar">{{ $product->desc_ar }}</textarea>
                    </div>
                </div>
                <div class="form-row mt-3">
                    <div class="col-4">
                        <label>Status</label>
                        <select class="form-control" name="status">
                            <option {{ $product->status == 1 ? 'selected' : '' }} value="1">Active</option>
                            <option {{ $product->status == 0 ? 'selected' : '' }} value="0">Not Active</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <label>Brand</label>
                        <select class="form-control" name="brand_fk_id">
                            @foreach ($brands as $brand)
                                <option value="{{ $brand->id }}"
                                    {{ $brand->id == $product->brand_fk_id ? 'selected' : '' }}>{{ $brand->name_en }}
                                </option>
                            @endforeach

                        </select>
                    </div>
                    <div class="col-4">
                        <label>Subcategories</label>
                        <select class="form-control" name="subcatergories_fk_id">
                            @foreach ($subcategories as $subcategory)
                                <option value="{{ $subcategory->id }}"
                                    {{ $subcategory->id == $product->subcatergories_fk_id ? 'selected' : '' }}>
                                    {{ $subcategory->name_en }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="exampleInputFile" name="image">
                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                        </div>
                    </div>
                </div>
                <div class="form-group"><img src="{{ url('images/products/' . $product->img) }}"
                        alt="{{ $product->name_en }}"></div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <button type="submit" name="page" value="index" class="btn btn-dark">Update</button>
                <button type="submit" name="page" value="back" class="btn btn-dark">Update & Return</button>
            </div>
        </form>
    </div>
@endsection
@section('js')
@endsection
