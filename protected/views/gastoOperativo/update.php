<?php
$this->pageCaption='Actualizar GastoOperativo '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Gasto Operativo'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Gasto Operativo', 'url'=>array('index')),
	array('label'=>'Crear GastoOperativo', 'url'=>array('create')),
	array('label'=>'Ver GastoOperativo', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Gasto Operativo', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>