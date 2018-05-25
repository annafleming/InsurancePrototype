<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class QuestionController extends Controller
{
	private $questions = [
		1 => [
			'contents' => 'Do you have a disability insurance?',
			'options' => [
				'Yes' => 2,
				'No' => 3,
			]
		],
		2 => [
			'contents' => 'Great!',
		],
		3 => [
			'contents' => 'Are you currently disabled?',
			'options' => [
				'Yes' => 4,
				'No' => 5,
			]
		],
		4 => [
			'contents' => 'Being disabled, you will not be able to qualify for disability income insurance.'
		],
		5 => [
			'contents' => 'Are you currently employed?',
			'options' => [
				'Yes' => 6,
				'No' => 7,
			]
		],
		6 => [
			'contents' => 'What is your gross (pretax) annual income?',
			'options' => [
				'*' => 8
			]
		],
		7 => [
			'contents' => 'In order to apply for disability insurance, you must be working and have an earned income.'
		],
		8 => [
			'contents' => 'What is zipcode?',
			'options' => [
				'*' => 9
			]
		],
		9 => [
			'contents' => 'We will email our recommendations'
		]
	];
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	// loading vue components
	    // displaying first question
	
	    return view('question.index');
    }

    
    /**
     * Show the form for getting next question.
     *
     * @return \Illuminate\Http\Response
     */
    public function next(Request $request)
    {
	    return response()->json($this->questions[1]);
        // params: question_id, answer
	    // respond with json: contents, options
    }
    
}
