<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $usersWithTodoLists = User::query()
            ->with([
                'todoLists',
                'todoLists.tasks',
            ])
            ->get();

//        return response()->json($usersWithTodoLists);
        return view('dashboard', [
            'users' => $usersWithTodoLists
        ]);
    }
}
