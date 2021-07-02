<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Inventario</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<div style="display:flex; width:100vw" class="row">
	<div class="col-2" style="margin-bottom:1vh; margin-top:1vh">
                {!! QrCode::size(160)->generate($codigo); !!}
	</div>
</div>
</body>
<style>
	body{
		font-family: 'Keep Calm'!important;
	}
	@font-face {
    font-family: "Keep Calm";
    src: url(../fonts/KeepCalm-Medium.ttf);
	}
</style>
</html>