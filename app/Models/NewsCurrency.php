<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewsCurrency extends Model
{
    protected $fillable = [
        'news_id',
        'currency_code',
        'currency_title',
        'currency_url',
    ];

    public function news()
    {
        return $this->belongsTo(News::class);
    }
}
