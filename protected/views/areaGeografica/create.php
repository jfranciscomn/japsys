<?php
$this->pageCaption='Crear Area Geografica';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo area geografica';
$this->breadcrumbs=array(
	'Area Geografica'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Areas Geograficas', 'url'=>array('index')),
	array('label'=>'Administrar Areas Geograficas', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>