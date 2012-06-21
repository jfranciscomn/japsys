<?php
$this->pageCaption='Actualizar IngresoPorEvento '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Evento'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Evento', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorEvento', 'url'=>array('create')),
	array('label'=>'Ver IngresoPorEvento', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ingreso Por Evento', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>