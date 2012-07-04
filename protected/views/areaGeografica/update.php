<?php
$this->pageCaption='Actualizar AreaGeografica '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Area Geografica'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar Area Geografica', 'url'=>array('index')),
	array('label'=>'Crear AreaGeografica', 'url'=>array('create')),
	array('label'=>'Ver AreaGeografica', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Area Geografica', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>