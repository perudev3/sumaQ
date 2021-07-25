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

@foreach($product as $prod)
	<div class="col-md-3" style="margin-bottom:1vh; margin-top:1vh">
		<div class="row">
			<div class="col-3" style="border: 1px solid;
									width: 105px;
									margin: 5px;
									height: 134px;
									border-radius: 18px;">
				<div style="margin-top: 25px;padding: 10px;">
					{!! QrCode::size(60)->generate($prod->inventories_codigo); !!}
				</div>						
			</div>
			<div class="col-3" style="border: 1px solid;
									width: 105px;
									margin: 5px;
									height: 134px;
									border-radius: 18px;">
				<div style="margin-top: 25px;padding: 10px;">

				</div>
					{{ $prod->inventories_codigo }}
			</div>
			<div class="col-3" style="border: 1px solid;
									width: 105px;
									margin: 5px;
									height: 134px;
									border-radius: 18px;">
					<p>{{ $prod['products']['products_name'] }}
					<p>{{ $prod['sizes']['medidas'] }}
					<p>{{ $prod['products']['products_price'] }} $ 
			</div>
		</div>
	</div>
	
@endforeach
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