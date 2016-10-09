<?php 

namespace App\Repositories;

use App\Models\Item;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ItemRepository extends BaseRepository {

    /**
     * Create a new ItemRepository instance.
     *
     * @param  App\Models\Item $item
     * @return void
     */
    public function __construct(Item $item)
    {
        $this->model = $item;
    }

    /**
     * Get Books collection.
     *
     * @param  int  $n
     * @return Illuminate\Support\Collection
     */
    public function index($n, $search = null)
    {
        if($search){
            return $this->model->where("title", "LIKE", "%{$request->get('search')}%")
                ->orderBy('created_at', 'desc')
                ->paginate($n);      
        }else{
          return $this->model->orderBy('created_at', 'desc')->paginate($n);
        }
    }

    /**
     * Store a Book.
     *
     * @param  App\Http\Requests\BookCreateRequest  $request
     * @param  int   $user_id
     * @return App\Models\Book
     */
    public function store($request)
    {   
        $inputs = $request->all();

        //Log::info('Save entry ', $inputs);
        //Log::info('Authenticated user ', (array) $user);
        //
        $model_item = new $this->model;    

        $user = Auth::guard('api')->user();
        $model_item->user_id = $user->id;
        $model_item->title = $inputs['title'];
        $model_item->description = $inputs['description'];

        $model_item->save();
        
        return $model_item;
    }


    /**
     * Get Book collection.
     *
     * @param  App\Models\Book $item
     * @return array
     */
    public function edit($item)
    {
        return compact('item');
    }

    /**
     * Update a Book.
     *
     * @param  App\Http\Requests\BookEditRequest  $request
     * @param  App\Models\Book $item
     * @return void
     */
    public function update($request, $item)
    {   
        $inputs = $request->all();

        $user = Auth::guard('api')->user();


        $item->title = $inputs['title'];
        $item->description = $inputs['description'];
        $item->save();
 
    }

    /**
     * Destroy a post.
     *
     * @param  App\Models\Book $item
     * @return void
     */
    public function destroy($item) 
    {
        $item->delete();
    } 
   
}