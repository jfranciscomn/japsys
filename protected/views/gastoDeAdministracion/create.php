<?php
$this->pageCaption='Create GastoDeAdministracion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo gastodeadministracion';
$this->breadcrumbs=array(
	'Gasto De Administracion'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Gasto De Administracion', 'url'=>array('index')),
	array('label'=>'Administrar Gasto De Administracion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>