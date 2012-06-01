<?php
$this->pageCaption='Actualizar Institucion '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Institucion'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Institucion', 'url'=>array('index')),
	array('label'=>'Crear Institucion', 'url'=>array('create')),
	array('label'=>'Ver Institucion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Institucion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>