<?php 
namespace App\Http\Requests;

class ItemCreateRequest extends Request {
    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {
        return [];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|max:255|unique:items',
            'description' => 'max:500'
        ];
    }

}