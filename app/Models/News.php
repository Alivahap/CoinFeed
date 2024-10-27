<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
     protected $fillable = [
        'title',
        'source',
        'published_at',
    ];

    public function currencies()
    {
        return $this->hasMany(NewsCurrency::class);
    }
}
