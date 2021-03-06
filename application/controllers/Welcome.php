<?php

/**
 * CodeIgniter
 *
 * An open source application development framework for PHP
 *
 * This content is released under the MIT License (MIT)
 *
 * Copyright (c) 2014 - 2015, British Columbia Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @package	CodeIgniter
 * @author	EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (http://ellislab.com/)
 * @copyright	Copyright (c) 2014 - 2015, British Columbia Institute of Technology (http://bcit.ca/)
 * @license	http://opensource.org/licenses/MIT	MIT License
 * @link	http://codeigniter.com
 * @since	Version 1.0.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends Application {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     * 	- or -
     * 		http://example.com/index.php/welcome/index
     * 	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function index() {
        // get the product images from the products model, which has been autoloaded (see config/autoload.php)
        $productList = $this->products->all();
        
        // build an array of the product html
        foreach ($productList as $product){
            // we also want the photos for this product. so get these too and
            // add them to our array before we perform the template substitution
            $product['product_photos']=  $this->products->getProductImages($product['id']);
            $productHTML[] = $this->parser->parse('_product', (array)$product, true);
        }

        // then convert the array into a single string using implode()
        $this->data['products']=implode($productHTML);
        
        // now get the news stories from the content table
        $newsList = $this->content->getNews();
    
        // build an array of the news html
        foreach ($newsList as $newsItem){
            // REFACTOR! - Is this really the best way to format a date?
            $newsItem['last_modified']= date("jS M Y", strtotime($newsItem['last_modified']));
            $newsHTML[] = $this->parser->parse('_news', (array)$newsItem, true);
        }

        // then convert the array into a single string using implode()
        $this->data['news']=implode($newsHTML);

        $this->data['pagebody'] = 'welcome';
        $this->render();        
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/Welcome.php */