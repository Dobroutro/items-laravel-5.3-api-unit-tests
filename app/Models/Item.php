<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Item extends Model
{
    public $fillable = ['title','description'];
}