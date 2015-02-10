<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Gallery
 *
 * @author Marcus
 */
class Gallery extends Application{
    public function index()
    {
        // get the images from the images model, which has been autoloaded
        $pix = $this->images->all();
        
        // build an array of the fromatted cells to hold each picture
        foreach ($pix as $picture)
        {
            $cells[] = $this->parser->parse('_cell', (array)$picture, true);
            
        }
        $this->load->library('table');
        $parms = array(
            'table_open' => '<table class="gallery">',
            'cell_start' => '<td class="oneimage">',
            'cell_alt_start' => '<td class="oneimage">');
        $this->table->set_template($parms);
        
        // now we generate the table
        $rows = $this->table->make_columns($cells,3);
        $this->data['thetable']= $this->table->generate($rows);
        
        $this->data['pagebody'] = 'gallery';
        $this->render();            
    }
}
