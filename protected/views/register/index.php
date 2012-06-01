<?php
$this->pageCaption='Registrar Institucion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Registrar nuevo institucion';
$this->breadcrumbs=array(
	'Registrar',
);


echo $this->renderPartial('_form', array('institucion'=>$institucion,'usuario'=>$usuario)); ?>