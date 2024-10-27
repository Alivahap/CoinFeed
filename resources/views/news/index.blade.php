@extends('layouts.app')

@section('content')
<style>
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #f9f9f9;
    }
    h2 {
        text-align: center;
    }
    form {
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        font-weight: bold;
    }
    select, input[type="date"], button {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    button {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
        cursor: pointer;
        border: none;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a, .pagination span {
        margin: 0 5px;
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-decoration: none;
        color: #007BFF;
    }
    .pagination a:hover {
        background-color: #f0f0f0;
    }
    .pagination .active {
        background-color: #4CAF50;
        color: white;
    }
</style>

<div class="container">
    <h2>Haber Akışını Görüntüle</h2>
    <form action="{{ route('news.filter') }}" method="GET">
        <div class="form-group">
            <label for="currency">Coin Seçimi:</label>
            <select name="currency" id="currency">
                @foreach($currencies as $currency)
                    <option value="{{ $currency->currency_code }}">{{ $currency->currency_title }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="start_date">Başlangıç Tarihi:</label>
            <input type="date" name="start_date" id="start_date" required>
        </div>
        <div class="form-group">
            <label for="end_date">Bitiş Tarihi:</label>
            <input type="date" name="end_date" id="end_date" required>
        </div>
        <button type="submit">Ara</button>
    </form>

    @if(isset($news) && $news->count())
        <table>
            <thead>
                <tr>
                    <th>Başlık</th>
                    <th>Yayın Tarihi</th>
                    <th>Coin</th>
                </tr>
            </thead>
            <tbody>
                @foreach($news as $item)
                    <tr>
                        <td><a href="{{ $item->url }}" target="_blank" style="text-decoration: none; color: #007BFF;">{{ $item->title }}</a></td>
                        <td>{{ \Carbon\Carbon::parse($item->published_at)->format('d/m/Y H:i') }}</td>
                        <td>
                            @foreach($item->currencies as $currency)
                                {{ $currency->currency_title .", " }} 
                            @endforeach
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        
    @else
        <p style="text-align: center;">Hiç haber bulunamadı.</p>
    @endif
</div>
@endsection
