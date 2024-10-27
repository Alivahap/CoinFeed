<?php

// app/Console/Commands/FetchCryptoNews.php
namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\News;
use App\Models\NewsCurrency;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;

class FetchCryptoNews extends Command
{
    protected $signature = 'fetch:crypto-news';
    protected $description = 'Fetch crypto news from CryptoPanic API';

    public function handle()
    {
        $response = Http::get('https://cryptopanic.com/api/free/v1/posts/', [
            'auth_token' => '84062745a26bae8c00d2e2780ccd94d33f135418',
            'public' => true,
        ]);

        if ($response->successful()) {
            $newsList = $response->json()['results'];

            foreach ($newsList as $newsItem) {
                // Haber kaydını oluştur veya güncelle
                $news = News::updateOrCreate(
                    ['title' => $newsItem['title']], // Duplicate kontrolü
                    [
                        'title' => $newsItem['title'],
                        'source' => $newsItem['source']['title'],
                        // Burada published_at değerini ayarlıyoruz
                        'published_at' => Carbon::parse($newsItem['published_at'])->toDateTimeString(),
                    ]
                );

                // Önceki para birimlerini temizle
                $news->currencies()->delete();

                // Yeni para birimlerini ekle
                if (!empty($newsItem['currencies'])) {
                    foreach ($newsItem['currencies'] as $currency) {
                        NewsCurrency::create([
                            'news_id' => $news->id,
                            'currency_code' => $currency['code'],
                            'currency_title' => $currency['title'],
                            'currency_url' => $currency['url'] ?? null,
                        ]);
                    }
                }
            }

            $this->info('Crypto news fetched successfully.');
        } else {
            $this->error('Failed to fetch crypto news.');
        }
    }
}
