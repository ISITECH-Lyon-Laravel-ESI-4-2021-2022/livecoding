<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TodoListFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->sentence(3),
            'description' => $this->faker->sentence,
            'due_date' => $this->faker->dateTimeBetween(
                now(),
                now()->addHour()
            ),
            'priority' => $this->faker->numberBetween(1,3),
            'is_done' => $this->faker->boolean(30),
        ];
    }
}
