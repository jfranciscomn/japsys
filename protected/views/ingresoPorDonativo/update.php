<?php
$this->pageCaption='Actualizar IngresoPorDonativo '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Donativo'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Donativo', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorDonativo', 'url'=>array('create')),
	array('label'=>'Ver IngresoPorDonativo', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ingreso Por Donativo', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>