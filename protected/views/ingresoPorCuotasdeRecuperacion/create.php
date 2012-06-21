<?php
$this->pageCaption='Create IngresoPorCuotasdeRecuperacion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ingresoporcuotasderecuperacion';
$this->breadcrumbs=array(
	'Ingreso Por Cuotasde Recuperacion'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Cuotasde Recuperacion', 'url'=>array('index')),
	array('label'=>'Administrar Ingreso Por Cuotasde Recuperacion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>