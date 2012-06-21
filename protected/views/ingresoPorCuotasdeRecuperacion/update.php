<?php
$this->pageCaption='Actualizar IngresoPorCuotasdeRecuperacion '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Cuotasde Recuperacion'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Cuotasde Recuperacion', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorCuotasdeRecuperacion', 'url'=>array('create')),
	array('label'=>'Ver IngresoPorCuotasdeRecuperacion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ingreso Por Cuotasde Recuperacion', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>