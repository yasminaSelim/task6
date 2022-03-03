<?php

namespace App\Http\traits;

trait media
{
    public function upload($image, $folder)
    {
        //upload img
        $photoName = time() . '.' . $image->extension();
        $image->move(public_path("images\\$folder\\"), $photoName);
        return $photoName;
    }
    public function deleteImg($imgName, $imgFolder)
    {
        //delete old image
        $oldPhotoPath = public_path("images\\$imgFolder\\$imgName");
        if (file_exists($oldPhotoPath)) {
            unlink($oldPhotoPath);
            return true;
        }
        return false;
    }
}
