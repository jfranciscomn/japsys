<?php
$this->pageCaption='Create Ambito';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ambito';
$this->breadcrumbs=array(
	'Ambito'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Ambito', 'url'=>array('index')),
	array('label'=>'Administrar Ambito', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>