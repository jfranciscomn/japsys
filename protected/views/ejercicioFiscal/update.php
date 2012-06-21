<?php
$this->pageCaption='Actualizar EjercicioFiscal '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ejercicio Fiscal'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ejercicio Fiscal', 'url'=>array('index')),
	array('label'=>'Crear EjercicioFiscal', 'url'=>array('create')),
	array('label'=>'Ver EjercicioFiscal', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ejercicio Fiscal', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>