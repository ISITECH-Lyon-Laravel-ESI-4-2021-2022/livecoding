<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TodoList extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'due_date',
        'priority',
        'is_done'
    ];

    public function tasks()
    {
        return $this->hasMany(Task::class);
    }

    public function scopeDone($query)
    {
        return $query->where('is_done', '=', 1);
    }

    public function scopeToDo($query)
    {
        return $query->where('is_done', '=', 0);
    }

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
}
