<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use App\Console\Commands\FetchCryptoNews;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote')->hourly();


Artisan::command('fetch:crypto-news', function () {
    $this->call(FetchCryptoNews::class);
});

Schedule::command('fetch:crypto-news')->everyMinute();
