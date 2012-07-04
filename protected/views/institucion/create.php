<?php
$this->pageCaption='Create Institucion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo institucion';
$this->breadcrumbs=array(
	'Institucion'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Institucion', 'url'=>array('index')),
	array('label'=>'Administrar Institucion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>