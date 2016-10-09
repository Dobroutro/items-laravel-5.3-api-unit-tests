<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

use App\Models\Item;

class ApiTest extends TestCase {

    /**
     * Server headers requrest array.
     *
     * @array 
     */
    protected $server_headers;

    /**
     * Server headers requrest array.
     *
     * @array 
     */
    protected $auth_parameters;

    public function __construct()
    {
        $headers = [];
        $headers['Content-Type'] = 'application/json';
        $headers['Accept'] = 'application/json';

        $this->server_headers = $this->transformHeadersToServerVars($headers);

        $this->auth_parameters = ['api_token' => 'aRVIU4E6JQ1cDK2YCJjiUzEwu5QvTsXmELTHgZqzR6qJ1esyHWX7FMKc8pm1'] ;
        

    }

    protected function parseJson($response)
    {
        return json_decode($response->getContent());
    }

    protected function assertIsJson($data)
    {
        $this->assertEquals(0, json_last_error());
    }

    public function setUp()
    {
        parent::setUp();
    }

    public function testUnauthorized()
    {
        $response = $this->call('GET', 'api/v1/items',[],[],[],$this->server_headers);
        $this->assertEquals(401, $response->status());
    }
    
    public function testProvidesErrorFeedback()
    {
        $response = $this->call('GET', 'api/v1/items',[],[],[],$this->server_headers);
        $data = $this->parseJson($response);
        $this->assertEquals('Unauthenticated.', $data->error);
    }

    public function testFetchesAllItems()
    {
        $parameters = 

        $response = $this->call('GET', 'api/v1/items', $this->auth_parameters ,[],[],$this->server_headers);
        $data = $this->parseJson($response);
        $this->assertIsJson($data);  
        $this->seeJsonStructure([
            'total',
            'per_page',
            'current_page',
            'last_page',
            'next_page_url',
            'prev_page_url',
            'from',
            'to',
            'data' => [
                '*' => [
                    'id', 'user_id','title', 'description', 'created_at', 'updated_at',
                ]
            ],
        ]);
    }
    
    public function testCreateItem()
    {   
        $headers = $this->server_headers;
        $headers['Authorization'] = 'Bearer ' . $this->auth_parameters['api_token'];

        $this->json('POST', 'api/v1/items', ['title' => 'test unit item', 'description' => 'test unit description'], $headers)
            ->seeJsonStructure([
                'id', 'user_id','title', 'description', 'created_at', 'updated_at',
            ]);
    }

    public function testDeleteItem()
    {   
        $headers = $this->server_headers;
        $headers['Authorization'] = 'Bearer ' . $this->auth_parameters['api_token'];
        
        $item = Item::orderBy('id', 'desc')->first();        

        $response = $this->delete('api/v1/items/' . $item->id, [], $headers);
     
        $this->assertEquals(200, $response->response->status());
    }

    /*
    public function testUpdateItem()
    {   
        $headers = $this->server_headers;
        $headers['Authorization'] = 'Bearer '  . $this->auth_parameters['api_token'];

        $response = $this->call('PUT', 'api/v1/items/15', ['title' => 'test unit item 2', 'description' => 'test unit description 2'], [], [], $headers);

        dd($response->status());

        $this->seeJsonStructure([
            'id', 'user_id','title', 'description', 'created_at', 'updated_at',
        ]);
    }
    */
}