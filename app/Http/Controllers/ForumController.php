<?php

namespace App\Http\Controllers;

use App\forum;
use App\Tag;
use Illuminate\Http\Request;
use Auth;
use DB;
use Storage;

class ForumController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth')->except('index','show');
  }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $forums = Forum::paginate(2);
        return view('forum.index', compact('forums'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $forums = Forum::orderBy('id','desc')->paginate(1);
        $tags = Tag::all();
        return view('forum.create', compact('tags','forums'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
          'tittle' => 'required',
          'description' => 'required',
          'tags' => 'required',
          'image' => 'image|mimes:jpg,jpeg,png,gif|max:1024',
        ]);

        $forums = New Forum;
        $forums->user_id = Auth::user()->id;
        $forums->tittle = $request->tittle;
        $forums->slug = str_slug ($request->tittle);
        $forums->description = $request->description;
        if ($request->file('image')){
          $file = $request->file('image');
          $filename = time().'.'.$file->getClientOriginalExtension();
          $location = public_path('/images');
          $file->move($location, $filename);
          $forums->image = $filename;
        }
        $forums->save();
        $forums->tags()->sync($request->tags);
        return back()->withInfo('Pertanyaan berhasil di kirim.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $forums = Forum::where('id', $slug)
                      ->orWhere('slug', $slug)
                      ->firstOrFail();

        return view('forum.show', compact('forums'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function edit($slug)
    {
          $tags = Tag::all();
          $forum = Forum::where('id', $slug)
                        ->orWhere('slug', $slug)
                        ->firstOrFail();
        return view('forum.edit', compact('forum','tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
      $request->validate([
        'tittle' => 'required',
        'description' => 'required',
        'tags' => 'required',
        'image' => 'image|mimes:jpg,jpeg,png,gif|max:1024',
      ]);

      $forums = Forum::find($id);
      $forums->user_id = Auth::user()->id;
      $forums->tittle = $request->tittle;
      $forums->slug = str_slug ($request->tittle);
      $forums->description = $request->description;
      if ($request->file('image')){
        $file = $request->file('image');
        $filename = time().'.'.$file->getClientOriginalExtension();
        $location = public_path('/images');
        $file->move($location, $filename);

        $oldImage = $forums->image;
        \Storage::delete($oldImage);

        $forums->image = $filename;
      }
      $forums->save();
      $forums->tags()->sync($request->tags);
      return view('forum.show', compact ('forums'))->withInfo('Pertanyaan berhasil di ubah');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $forum = Forum::find($id);
        Storage::delete($forum->image);
        $forum->tags()->detach();
        $forum->delete();
        return back()->withInfo('Pertanyaan berhasil dihapus');
    }
}
