<?php
$this->pageCaption='Create AreaGeografica';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo areageografica';
$this->breadcrumbs=array(
	'Area Geografica'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Area Geografica', 'url'=>array('index')),
	array('label'=>'Administrar Area Geografica', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>