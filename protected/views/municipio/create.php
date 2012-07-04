<?php
$this->pageCaption='Create Municipio';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo municipio';
$this->breadcrumbs=array(
	'Municipio'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Municipio', 'url'=>array('index')),
	array('label'=>'Administrar Municipio', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>