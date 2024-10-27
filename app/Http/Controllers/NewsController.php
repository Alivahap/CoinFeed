<?php

namespace App\Http\Controllers;

use App\Models\NewsCurrency;
use App\Models\News;
use Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use Carbon\Carbon;


class NewsController extends Controller
{
   public function index()
{
    // Tüm benzersiz para birimlerini almak için
    $currencies = NewsCurrency::select('currency_code', 'currency_title')->distinct()->get();

    return view('news.index', compact('currencies'));
}
public function filter(Request $request)
{
    $currencyCode = $request->input('currency');
    $startDate = $request->input('start_date');
    $endDate = $request->input('end_date');

    // Redis'ten haberleri al
    $redisKey = 'news_' . $currencyCode . '_' . $startDate . '_' . $endDate;
    $news = Redis::get($redisKey);

    if (!$news) {
        // Eğer Redis'te yoksa, veritabanından çek
        $news = News::whereHas('currencies', function ($query) use ($currencyCode) {
                $query->where('currency_code', $currencyCode);
            })
            ->whereBetween('published_at', [
                Carbon::parse($startDate)->startOfDay(),
                Carbon::parse($endDate)->endOfDay()
            ])
            ->with('currencies')
            ->get(); // Verileri çekiyoruz

        // Veriyi Redis'e 1 saatliğine kaydet
        Redis::setex($redisKey, 3600, serialize($news));

    } else {
        // Redis'ten alınan veriyi deserialize et
        $news = unserialize($news);
    }

    // Tüm benzersiz para birimlerini al
    $currencies = NewsCurrency::select('currency_code', 'currency_title')->distinct()->get();

    return view('news.index', compact('news', 'currencies'));
}


}
