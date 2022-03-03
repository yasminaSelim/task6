@extends('layouts.dashboard')
@section('title', 'Create Product')
@section('css')

@endsection
@section('content')
    <div class="col-12">
        <form method="POST" action="{{ route('dashboard.products.store') }}" enctype="multipart/form-data">
            @csrf
            <div class="card-body">
                <div class="form-row">
                    <div class="col-6">
                        <label>Name EN</label>
                        <input type="text" class="form-control" name="name_en">
                        @error('name_en')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-6">
                        <label>Name AR</label>
                        <input type="text" class="form-control" name="name_ar">
                        @error('name_ar')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-6">
                        <label>Price</label>
                        <input type="number" class="form-control" name="price">
                        @error('price')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-6">
                        <label>Quantity</label>
                        <input type="number" class="form-control" name="quantity">
                        @error('quantity')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-6">
                        <label>Description EN</label>
                        <textarea class="form-control" name="desc_en"></textarea>
                    </div>
                    <div class="col-6">
                        <label>Description EN</label>
                        <textarea class="form-control" name="desc_ar"></textarea>
                    </div>
                </div>
                <div class="form-row mt-3">
                    <div class="col-4">
                        <label>Status</label>
                        <select class="form-control" name="status">
                            <option value="1">Active</option>
                            <option value="0">Not Active</option>
                        </select>
                        @error('status')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label>Brand</label>
                        <select class="form-control" name="brand_fk_id">
                            @foreach ($brands as $brand)
                                <option value="{{ $brand->id }}">{{ $brand->name_en }}</option>
                            @endforeach

                        </select>
                        @error('brand_fk_id')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label>Subcategories</label>
                        <select class="form-control" name="subcatergories_fk_id">
                            @foreach ($subcategories as $subcategory)
                                <option value="{{ $subcategory->id }}">{{ $subcategory->name_en }}</option>
                            @endforeach
                        </select>
                        @error('subcatergories_fk_id')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-group">
                    <label>File input</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="exampleInputFile" name="image">
                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                        </div>
                    </div>
                    @error('image')
                    <div class="alert alert-danger">{{ $message }}</div>
                 @enderror
                </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <button type="submit" name="page" value="index" class="btn btn-primary">Create</button>
                <button type="submit" name="page" value="back" class="btn btn-primary">Create & Return</button>
            </div>
        </form>
    </div>
@endsection
@section('js')
@endsection
