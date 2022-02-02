<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateTodoListRequest;
use App\Models\TodoList;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class TodoListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TodoList  $todoList
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Http\Response
     */
    public function show(TodoList $todoList)
    {
        $todoList->load([
            'users'
        ]);

        return view('todolist.show', compact('todoList'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TodoList  $todoList
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Http\Response
     */
    public function edit(TodoList $todoList)
    {
        return view('todolist.edit', compact('todoList'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateTodoListRequest $request
     * @param \App\Models\TodoList $todoList
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(UpdateTodoListRequest $request, TodoList $todoList)
    {
        $validated = $request->validated();

        $todoList->name = $validated['name'];
        $todoList->description = $validated['description'];
        $todoList->is_done = isset($validated['description']);

        $todoList->save();

        return response()->redirectToRoute('todo-lists.show', $todoList);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TodoList  $todoList
     * @return \Illuminate\Http\Response
     */
    public function destroy(TodoList $todoList)
    {
        //
    }
}
