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
			$institucion->estatus=1;
			$usuario->estatus=1;
			$usuario->tipousuario_id=1;
			

			if($institucion->save())
			{
				if($usuario->save())
				{
					$this->redirect(array('site/login'));
				}
				else
				{
					$instituto->delete();
					
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