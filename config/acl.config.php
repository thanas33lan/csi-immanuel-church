<?php
return array (
  'ADM' => 
  array (
    'Admin\\Controller\\Index' => 
    array (
      'index' => 'allow',
    ),
    'Admin\\Controller\\User' => 
    array (
      'index' => 'allow',
      'add' => 'allow',
      'edit' => 'allow',
    ),
    'Admin\\Controller\\Role' => 
    array (
      'index' => 'allow',
      'add' => 'allow',
      'edit' => 'allow',
    ),
  ),
  'WRK' => 
  array (
    'Admin\\Controller\\Index' => 
    array (
      'index' => 'allow',
    ),
    'Admin\\Controller\\User' => 
    array (
      'index' => 'allow',
      'add' => 'deny',
      'edit' => 'deny',
    ),
    'Admin\\Controller\\Role' => 
    array (
      'index' => 'allow',
      'add' => 'deny',
      'edit' => 'deny',
    ),
  ),
);
