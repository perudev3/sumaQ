<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SumaQ</title>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta charset="UTF-8">
    <style media="all">
        *{
            margin: 0;
            padding: 0;
            line-height: 1.3;
            font-family: 'Roboto';
            color: #333542;
        }
        body{
            font-size: .875rem;
        }
        .gry-color *,
        .gry-color{
            color:#878f9c;
        }
        table{
            width: 100%;
        }
        table th{
            font-weight: normal;
        }
        table.padding th{
            padding: .5rem .7rem;
        }
        table.padding td{
            padding: .7rem;
        }
        table.sm-padding td{
            padding: .2rem .7rem;
        }
        .border-bottom td,
        .border-bottom th{
            border-bottom:1px solid #eceff4;
        }
        .text-left{
            text-align:left;
        }
        .text-right{
            text-align:right;
        }
        .small{
            font-size: .85rem;
        }
        .currency{

        }
    </style>
</head>
<body>
    <div>
        <div style="background: #eceff4;padding: 1.5rem;">
            <table>
                <tr>
                    <td>
                        <img loading="lazy"  src="{{ asset('img/logo-sumaq.png') }}" height="40" style="display:inline-block;">
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="gry-color small">Puerto Rico</td>
                </tr>
                <tr>
                    <td class="gry-color small">Telefono de Contacto: +4984848885</td>
                    <td class="text-right small"><span class="gry-color small">E-mail</span> <span class="strong">email@gmail.com</span></td>
                </tr>
                <tr>
                    <td class="gry-color small">Fecha: {{$fecha_actual}}</td>
                    <td class="text-right small"><span class="gry-color small">N° de Orden:</span> <span class=" strong">{{$numero_transaccion}}</span></td>
                </tr>
            </table>

        </div>

        <div style="padding: 1.5rem;padding-bottom: 0">
            <table>
                <tr><td class="strong small gry-color">Cliente:</td></tr>
                <tr><td class="strong">{{$listapedidos[0]->no_cliente}}</td></tr>
                <tr><td class="gry-color small">{{$listapedidos[0]->tx_direccion}}</td></tr>
                <tr><td class="gry-color small">Fecha de Compra: {{$fecha_actual}}</td></tr>
                <tr><td class="gry-color small">Telefono de Contacto: {{$listapedidos[0]->tl_cliente}}</td></tr>
            </table>
        </div>

        <div style="padding: 1.5rem;">
            <table class="padding text-left small border-bottom">
                <thead>
                    <tr class="gry-color" style="background: #eceff4;">
                        <th width="35%">Empresa</th>
                        <th width="15%">Producto</th>
                        <th width="10%">Cantidad</th>
                        <th width="15%">Precio Und</th>
                        <th width="10%">Sub-Total</th>
                    </tr>
                </thead>
                <tbody class="strong">
                    @foreach($listapedidos as $ped)
                            <tr class="">
                                <td>{{$ped->no_empresa}}</td>
                                <td>
                                    {{$ped->no_produto}}
                                </td>
                                <td class="gry-color">{{$ped->qt_producto}}</td>
                                <td class="gry-color currency">{{$ped->pt_producto}}</td>
                                <td class="gry-color currency">{{ $ped->qt_producto * $ped->pt_producto  }}</td>
                            </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div style="padding:0 1.5rem;">
            <table style="width: 40%;margin-left:auto;" class="text-right sm-padding small strong">
                <tbody>
                    <tr>
                        <th class="gry-color text-left">Total :</th>
                        <td class="currency">S/ {{$pagar}}</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</body>
</html>
