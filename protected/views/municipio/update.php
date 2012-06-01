<?php
$this->pageCaption='Actualizar Municipio '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Municipio'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Municipio', 'url'=>array('index')),
	array('label'=>'Crear Municipio', 'url'=>array('create')),
	array('label'=>'Ver Municipio', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Municipio', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>