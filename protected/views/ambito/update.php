<?php
$this->pageCaption='Actualizar Ambito '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ambito'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar Ambitos', 'url'=>array('index')),
	array('label'=>'Crear Ambito', 'url'=>array('create')),
	array('label'=>'Ver Ambito', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ambitos', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>