<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Le styles -->
	<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/application.min.css" rel="stylesheet">
	<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap-responsive.css" rel="stylesheet">

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.ico">
	<link rel="apple-touch-icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-114x114.png">

</head>

<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="<?php echo $this->createAbsoluteUrl('//'); ?>"><?php echo CHtml::encode(Yii::app()->name); ?></a>
				<?php 
				$items=array();
			
				if(!Yii::app()->user->isGuest)
				{
					$items[]=array('label'=>'Informe Anual',
				      'url'=>array('informeAnual/index'),
				      /*'itemOptions'=>array('class'=>'dropdown','id'=>'opcion',),
				      'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>'dropdown'),
				      'submenuOptions'=>array('class'=>'dropdown-menu'),
					  'items'=> array(array('label'=>'Ambitos', 'url'=>array('/ambito/index'),),
										array('label'=>'Areas Geograficas', 'url'=>array('/areaGeografica/index'), 'itemOptions'=>array()),
										array('label'=>'Instituciones', 'url'=>array('/institucion/index'), 'itemOptions'=>array()),
										),*/
					);
				
			
				}
				if(!Yii::app()->user->isGuest && in_array(Yii::app()->user->name,Usuario::model()->getSuperUsers()))
				{
					$items[]=array('label'=>'Presupuesto',
				      'url'=>'#',
				      'itemOptions'=>array('class'=>'dropdown','id'=>'opcion',),
				      'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>'dropdown'),
				      'submenuOptions'=>array('class'=>'dropdown-menu'),
					  'items'=> array(
										array('label'=>'Ingresos por Cuotas de Recuperacion', 'url'=>array('/ingresoPorCuotasdeRecuperacion/index'),),
										array('label'=>'Ingresos por Donativos', 'url'=>array('/ingresoPorDonativo/index'), 'itemOptions'=>array()),
										array('label'=>'Ingresos por Eventos', 'url'=>array('/ingresoPorEventos/index'), 'itemOptions'=>array()),
										array('label'=>'Ingresos por Venta', 'url'=>array('/ingresoPorVenta/index'), 'itemOptions'=>array()),
										array('label'=>'Ingresos por Venta de Detalle', 'url'=>array('/ingresoPorVenta/index'), 'itemOptions'=>array()),
										
										array('label'=>'Gastos Operativos', 'url'=>array('/gastoOperativos/index'), 'itemOptions'=>array()),
										array('label'=>'Gastos de Administracion', 'url'=>array('/gastoDeAdministracion/index'), 'itemOptions'=>array()),
										
										),
				
					);
					
					$items[]=array('label'=>'Administracion',
				      'url'=>'#',
				      'itemOptions'=>array('class'=>'dropdown','id'=>'opcion',),
				      'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>'dropdown'),
				      'submenuOptions'=>array('class'=>'dropdown-menu'),
					  'items'=> array(array('label'=>'Ambitos', 'url'=>array('/ambito/index'),),
										array('label'=>'Areas Geograficas', 'url'=>array('/areaGeografica/index'), 'itemOptions'=>array()),
										array('label'=>'Instituciones', 'url'=>array('/institucion/index'), 'itemOptions'=>array()),
										array('label'=>'Ejercicios', 'url'=>array('/ejercicioFiscal/index'), 'itemOptions'=>array()),
										
										array('label'=>'Estados', 'url'=>array('/estado/index'), 'itemOptions'=>array()),
										array('label'=>'Municipios', 'url'=>array('/municipio/index'), 'itemOptions'=>array()),
										
										array('label'=>'Usuarios', 'url'=>array('/usuario/index'), 'itemOptions'=>array()),
										),
					);
				}
				$items[]=array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest);
				
				$this->widget('ext.custom.widgets.BMenu',array(
					'items'=>$items,
			
					'htmlOptions'=>array('class'=>'nav nav-pills'),
					'activateParents'=>true,
					'activeCssClass'=>'',
				)); ?>
				<?php $this->widget('zii.widgets.CMenu',array(
					'items'=>array(
						array('label'=>Yii::app()->user->name, 'url'=>array('site/profile'), 'visible'=>!Yii::app()->user->isGuest),
						array('label'=>'Logout', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest, 'htmlOptions'=>array('class'=>'btn'))
					),
					'htmlOptions'=>array(
						'class'=>'nav pull-right',
					),
				)); ?>
			</div>
		</div>
	</div>
	
	<div class="container">
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('BBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
			'separator'=>' / ',
		)); ?><!-- breadcrumbs -->
	<?php endif?>
	</div>
	
	<?php echo $content; ?>
	
	<footer class="footer">
		<div class="container">
			<p>Copyright &copy; <?php echo date('Y'); ?> by My Company.<br/>
			All Rights Reserved.<br/>
			<?php echo Yii::powered(); ?></p>
		</div>
	</footer>
	
</body>
</html>








