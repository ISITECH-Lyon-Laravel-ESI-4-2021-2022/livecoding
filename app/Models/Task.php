<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'is_done'
    ];

    public function todoList()
    {
        return $this->belongsTo(TodoList::class);
    }

    public function scopeDone($query)
    {
        $query->where('is_done', '=', 1);
    }

    public function scopeToDo($query)
    {
        $query->where('is_done', '=', 0);
    }
}
