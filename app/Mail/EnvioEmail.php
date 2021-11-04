<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EnvioEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $customers_phone;
    public $customers_address;
    public $array;
    public $total_bussines;
    public $sales_payment_date;

    public function __construct($customers_phone,$customers_address,$array,
                $total_bussines, $sales_payment_date)
    {
        $this->customers_phone = $customers_phone;
        $this->customers_address = $customers_address;
        $this->array = $array;
        $this->total_bussines = $total_bussines;
        $this->sales_payment_date = $sales_payment_date;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('boleta');
    }
}
