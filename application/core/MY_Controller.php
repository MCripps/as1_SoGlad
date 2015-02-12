<?php

/**
 * core/MY_Controller.php
 *
 * Default application controller
 */
class Application extends CI_Controller {

    protected $data;      // parameters for view components
    protected $id;		  // identifier for our content
    protected $choices;

    /**
     * Constructor.
     * Establish view parameters & load common helpers
     */
    function __construct()
    {
        /* _template.php parameters defined
         * pageTitle = the title of type page e.g. SoGlad
         * companySummary = summary of what the company makes and sells
         * 
         */
	parent::__construct();
	$this->data = array();
	$this->data['pageTitle'] = 'So Glad';
        $this->data['news']= "Load news story HTML here!";
    }

    /**
     * Render this page
     */
    function render()
    {
	$this->data['content'] = $this->parser->parse($this->data['pagebody'], $this->data, true);
	$this->parser->parse('_template', $this->data);
    }

}

/* End of file MY_Controller.php */
/* Location: application/core/MY_Controller.php */