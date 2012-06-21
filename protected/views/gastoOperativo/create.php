<?php
$this->pageCaption='Create GastoOperativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo gastooperativo';
$this->breadcrumbs=array(
	'Gasto Operativo'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Gasto Operativo', 'url'=>array('index')),
	array('label'=>'Administrar Gasto Operativo', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>