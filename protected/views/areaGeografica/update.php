<?php
$this->pageCaption='Actualizar Area Geografica '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Areas Geograficas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar Areas Geograficas', 'url'=>array('index')),
	array('label'=>'Crear Area Geografica', 'url'=>array('create')),
	array('label'=>'Ver Area Geografica', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Areas Geograficas', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>