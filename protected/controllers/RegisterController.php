<?php

class RegisterController extends Controller
{
	public function actionIndex()
	{
		$institucion=new Institucion;
		$usuario = new Usuario;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Institucion']) && isset($_POST['Usuario']))
		{
			$institucion->attributes=$_POST['Institucion'];
			$usuario->attributes =$_POST['Usuario'];
			$estatus = Estatus::model()->find('nombre=:nombre',array(':nombre'=>'Activo'));
			$tipousuario =TipoUsuario::model()->find('nombre=:nombre',array(':nombre'=>'Institucion'));
			$institucion->estatus=$estatus->id;
			$usuario->estatus=$estatus->id;
			$usuario->tipousuario_id=$tipousuario->id;
			

			if($institucion->save())
			{
				$usuario->institucion_id=$institucion->id;
				if($usuario->save())
				{
					$this->redirect(array('site/login'));
				}
				else
				{
					$institucion->delete();
					
				}
			}
		}

		$this->render('index',array(
			'institucion'=>$institucion,
			'usuario'=>$usuario,
		));
	}
	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($institucion,$usuario)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='registrar-form')
		{
			echo CActiveForm::validate($institucion);
			echo CActiveForm::validate($usuario);
			Yii::app()->end();
		}
	}

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}