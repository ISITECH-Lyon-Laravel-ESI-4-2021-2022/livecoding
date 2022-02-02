<x-app-layout>
    <form method="post" action="{{ route('todo-lists.update', $todoList) }}">
        @csrf
        @method('PUT')

        <div>
            <span>Titre :</span>
            <input name="name" type="text" value="{{ $todoList->name }}">
        </div>
        <div>
            <span>Description :</span>
            <input name="description" type="text" value="{{ $todoList->description }}">
        </div>
        <div>
            <span>Priorité :</span>
            <input name="priority" type="number" value="{{ $todoList->priority }}">
        </div>
        <div>
            <span>Fini :</span>
            {{ Form::checkbox('done', 'Finie ?', $todoList->is_done) }}
        </div>

        @if ($errors->any())
            <div style="color: red">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <button type="submit" style="margin-top: 10px">VALIDER</button>
    </form>
</x-app-layout>
