@extends('layouts.app')
@section('tittle','Forum')
@section('content')
<div class="container">
  <div class="jumbotron" id="tc_jumbotron">
    <div class="card-body" id="xx" style="color: #fff;     border:1px solid #fff;">
        <div class="text-center">
           <h1 style="    font-size: 3.5rem;">FORUM</h1>
        <p>Forum tanya jawab. Membantu, Mencari Solusi Selesaikan Masalah Coding Mu. </p>
          </div>
        </div>
      </div>
    </div>
        <div class="container">
            <div class="row">
             <div class="col-md-12" id="tc_container_wrap">
            <div class="card" id="tc_paneldefault">
                <div class="card-body" id="tc_panelbody"  style="background: #f9f9f9;">
               <div class="row">
               <div class="col-md-8" style="    padding-right: 0;"><br>
                <table class="table table-bordered">
              <thead id="tc_thead">
                <tr>
                  <th scope="col">Thread</th>
                  <th scope="col">Comments</th>
                  <th scope="col">Time</th>
                </tr>
              </thead>
              <tbody style="background: #f9f9f9;">
                @foreach($forums as $forum)
                <tr>
                <td width="453">
                <div class="forum_title">
                <h4> <a href="{{route('forum.show', $forum->slug)}}">{{ str_limit($forum->tittle, 30)}}</a></h4>
                <p>  {!! str_limit($forum->description, 40)!!}</p>
                @foreach($forum->tags as $tag)
                <a href="#" class="badge badge-success tag_label">#{{$tag->name}}</a>
                @endforeach
                @if(empty($forum->image))
                @else
                 <div class="badge badge-success tag_label_image"><i class="fa fa-image"></i></div>
                 @endif
                </div>
              </td>

              <td  style="text-align: center"><small> {{$forum->comments->count()}}  Comments</small></td>
              <td>
            <div class="forum_by">
            <small style="margin-bottom: 0; color: #666">{{$forum->created_at->diffForHumans()}}</small>
             <small>by <a href="#">{{$forum->user->name}}</a></small>
            </div>
            </td>
            </tr>
            @endforeach
              </tbody>
            </table>
            <div class="row justify-content-center">
              {!!$forums->links()!!}
            </div>
              </div>
                <div class="col-md-4">
                  <a href="{{route('forum.create')}}" class="btn btn-success btn-block">Buat Pertanyaan</a><br>

                </div>
                </div>
                <hr style="margin-top: 0;">
                <div class="card">
                <div class="card-header"></div>
                <div class="card-body" style="background: rgb(90, 90, 90)"></div>
                <div class="card-header"></div>
                </div>
            </div>
          </div>
        </div>
    </div>
</div><br><br>
@endsection
