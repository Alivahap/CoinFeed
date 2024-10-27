<?php
namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    protected $commands = [
        \App\Console\Commands\FetchCryptoNews::class,
    ];

    protected function schedule(Schedule $schedule)
    {
        // FetchCryptoNews komutunu her dakika çalıştır
        try {
        $schedule->command('fetch:crypto-news')->everyMinute();
    } catch (\Exception $e) {
        Log::error('Error scheduling fetch:crypto-news: ' . $e->getMessage());
    }
    }

    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
