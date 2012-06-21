<?php
$this->pageCaption='Actualizar GastoDeAdministracion '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Gasto De Administracion'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar Gasto De Administracion', 'url'=>array('index')),
	array('label'=>'Crear GastoDeAdministracion', 'url'=>array('create')),
	array('label'=>'Ver GastoDeAdministracion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Gasto De Administracion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>