<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class CloverController extends Controller
{
    public function authorization()
    {
        $response = Http::withBasicAuth('rivasrivas506@gmail.com', 'S@muel456')->withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer afe76dfc-7723-8ea3-9cf8-374a854f4b50',
            'Content-Type' => 'application/json',
        ])->post('https://sandbox.dev.clover.com/v3/merchants/QFZ20WHQZX651/authorizations', [           
                "payment"=>[
                    "offline"=>"false",
                    "transactionSettings"=> [
                        "disableCashBack"=>"false",
                        "cloverShouldHandleReceipts"=>"true",
                        "forcePinEntryOnSwipe"=>"false",
                        "disableRestartTransactionOnFailure"=>"false",
                        "allowOfflinePayment"=>"false",
                        "approveOfflinePaymentWithoutPrompt"=>"false",
                        "forceOfflinePayment"=>"false",
                        "disableReceiptSelection"=>"false",
                        "disableDuplicateCheck"=>"false",
                        "autoAcceptPaymentConfirmations"=>"false",
                        "autoAcceptSignature"=>"false",
                        "returnResultOnTransactionComplete"=>"false",
                        "disableCreditSurcharge"=>"false"
                    ],
                    "transactionInfo"=> [
                        "isTokenBasedTx"=>"false",
                        "emergencyFlag"=>"false"
                    ]
                ],
                "closingPayment"=>[
                    "offline"=>"false",
                    "transactionSettings"=>[
                        "disableCashBack"=>"false",
                        "cloverShouldHandleReceipts"=>"true",
                        "forcePinEntryOnSwipe"=>"false",
                        "disableRestartTransactionOnFailure"=>"false",
                        "allowOfflinePayment"=>"false",
                        "approveOfflinePaymentWithoutPrompt"=>"false",
                        "forceOfflinePayment"=>"false",
                        "disableReceiptSelection"=>"false",
                        "disableDuplicateCheck"=>"false",
                        "autoAcceptPaymentConfirmations"=>"false",
                        "autoAcceptSignature"=>"false",
                        "returnResultOnTransactionComplete"=>"false",
                        "disableCreditSurcharge"=>"false"
                    ],
                    "transactionInfo"=>[
                        "isTokenBasedTx"=>"false",
                        "emergencyFlag"=>"false"
                    ]
                ]
        ]);

        return $response;

    }
}
