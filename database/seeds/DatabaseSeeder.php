<?php

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'User1',
            'email' => 'user1@gmail.com',
            'password' => bcrypt('ijinmasuk'),
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('users')->insert([
            'name' => 'User2',
            'email' => 'user2@gmail.com',
            'password' => bcrypt('ijinmasuk'),
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'PHP',
            'slug' => 'php',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'Javascript',
            'slug' => 'javascript',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'Phyton',
            'slug' => 'phyton',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'Java',
            'slug' => 'java',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'C#',
            'slug' => 'c#',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('tags')->insert([
            'name' => 'Html',
            'slug' => 'html',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('forums')->insert([
            'user_id' => '1',
            'title' => 'Siapa  yang cita2nya menjadi anak soleh?',
            'slug' => 'siapa-yang-cita2nya-menjadi-anak-soleh',
            'description' => '<p>Anak soleh dan pintar yang pintar php dan phyton</p>',
            'image' => '',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('forums')->insert([
            'user_id' => '1',
            'title' => 'PHP tutorial',
            'slug' => 'php-tutorial',
            'description' => '<p>bang ajarin saya php dong</p>',
            'image' => '',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('forum_tag')->insert([
            'forum_id' => '1',
            'tag_id' => '3',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);

        DB::table('forum_tag')->insert([
            'forum_id' => '2',
            'tag_id' => '1',
            'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
        ]);
    }
}
