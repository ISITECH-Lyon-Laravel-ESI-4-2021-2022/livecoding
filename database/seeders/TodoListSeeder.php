<?php

namespace Database\Seeders;

use App\Models\Task;
use App\Models\TodoList;
use App\Models\User;
use Illuminate\Database\Seeder;

class TodoListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $todoLists = TodoList::factory(3)
            ->has(
                Task::factory()
                    ->count(6)
            )
            ->create();

        $users = User::all();
        /** @var TodoList $todoList */
        foreach ($todoLists as $todoList) {
            $todoList->users()
                ->saveMany($users->random(3));
        }


//        $todoLists = TodoList::factory(3)->create();
//
//        foreach ($todoLists as $todoList) {
//            Task::factory()
//                ->for($todoList)
//                ->create(6);
//
//            for ($i = 0; $i < 6; $i++) {
//                Task::query()->create([
//                    'name' => 'machin',
//                    'is_done' => true,
//                    'todo_list_id' => $todoList->id
//                ]);
//            }
//        }
    }
}
