<?php

/**
 * This is the model class for table "Usuario".
 *
 * The followings are the available columns in table 'Usuario':
 * @property integer $id
 * @property string $usuario
 * @property string $password
 * @property integer $tipousuario_did
 * @property integer $institucion_aid
 * @property integer $estatus_did
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 * @property Institucion $institucion
 * @property TipoUsuario $tipousuario
 */
class Usuario extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Usuario the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Usuario';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('usuario, password, tipousuario_did, estatus_did', 'required'),
			array('tipousuario_did, institucion_aid, estatus_did', 'numerical', 'integerOnly'=>true),
			array('usuario', 'length', 'max'=>45),
			array('password', 'length', 'max'=>150),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, usuario, password, tipousuario_did, institucion_aid, estatus_did', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_aid'),
			'tipousuario' => array(self::BELONGS_TO, 'TipoUsuario', 'tipousuario_did'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'usuario' => 'Usuario',
			'password' => 'Password',
			'tipousuario_did' => 'Tipousuario',
			'institucion_aid' => 'Institucion',
			'estatus_did' => 'Estatus',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('usuario',$this->usuario,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('tipousuario_did',$this->tipousuario_did);
		$criteria->compare('institucion_aid',$this->institucion_aid);
		$criteria->compare('estatus_did',$this->estatus_did);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	public function getSuperUsers()
		{
			$criteria = new CDbCriteria;

			$tipoUsuario= TipoUsuario::model()->find('nombre=:nombre', array(':nombre'=>'Administracion'));
			//$criteria->select='usuario';
			$criteria->compare('tipousuario_did',$tipoUsuario->id);

			$superusers = $this->findAll($criteria);
			$susers = array();
			foreach($superusers as $suser){
				$susers[] = $suser->usuario;
			}
			return $susers;
		}
}